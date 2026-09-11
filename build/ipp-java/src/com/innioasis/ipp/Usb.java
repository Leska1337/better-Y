package com.innioasis.ipp;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;

import com.innioasis.y1.activity.IppUsbActivity;

/**
 * The system's "USB connected" screen, replaced by ours ({@code IppUsbActivity}).
 *
 * The screen is {@code com.android.systemui/.usb.UsbStorageActivity}; its layout and text live in
 * {@code framework-res}, so none of it can be themed from here. It cannot be disabled either:
 * SystemUI starts it with a bare {@code startActivity} and dies on the ActivityNotFoundException.
 * So its START is refused instead, through the ActivityManager's activity controller — the caller
 * is told the start succeeded, and nothing is stored: the controller lives in memory and goes
 * away with our process or a reboot, which brings the system's screen back on its own.
 */
public final class Usb {

    private Usb() { }

    private static final ComponentName SCREEN = new ComponentName(
            "com.android.systemui", "com.android.systemui.usb.UsbStorageActivity");

    private static boolean done;
    private static Handler main;
    private static Context app;

    /** Called from {@code BaseActivity.onCreate}; the work is done once per process. */
    public static void boot(Context c) {
        if (done || c == null) return;
        done = true;
        try {
            app = c.getApplicationContext();
            if (app == null) app = c;
            main = new Handler(Looper.getMainLooper());
            Class amn = Class.forName("android.app.ActivityManagerNative");
            Object am = amn.getMethod("getDefault").invoke(null);
            Class ic = Class.forName("android.app.IActivityController");
            Class stub = Class.forName("android.app.IActivityController$Stub");
            Object ctl = stub.getMethod("asInterface", IBinder.class).invoke(null, new Watcher());
            am.getClass().getMethod("setActivityController", ic).invoke(am, ctl);
        } catch (Throwable t) {
            Diag.note("usb: setActivityController failed: " + t);
        }
    }

    /** Runs on the main thread, after the refused start has already been answered. */
    static final class Open implements Runnable {
        public void run() {
            try {
                Intent i = new Intent(app, IppUsbActivity.class);
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                app.startActivity(i);
            } catch (Throwable t) {
                Diag.note("usb: opening our screen failed: " + t);
            }
        }
    }

    /**
     * {@code IActivityController} by hand: the interface is hidden, so its five transactions are
     * answered here in the order of its AIDL (1..5). ActivityManager waits on every answer while
     * holding its own lock, so an answer decides and returns — anything more is posted.
     *
     * Nothing may escape {@code onTransact}: an exception is carried back to {@code system_server},
     * which catches only RemoteException. Every path writes the answer that means "carry on as
     * usual": allow the start, allow the resume, show the normal crash and ANR dialogs.
     */
    static final class Watcher extends Binder {
        static final String DESC = "android.app.IActivityController";

        Watcher() {
            attachInterface(null, DESC);
        }

        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (code < 1 || code > 5) {
                try {
                    return super.onTransact(code, data, reply, flags);
                } catch (Throwable t) {
                    return false;
                }
            }
            int answer = (code == 4 || code == 5) ? 0 : 1;
            try {
                data.enforceInterface(DESC);
                if (code == 1 && data.readInt() != 0) {
                    Intent i = (Intent) Intent.CREATOR.createFromParcel(data);
                    if (SCREEN.equals(i.getComponent())) {
                        answer = 0;
                        main.post(new Open());
                    }
                }
            } catch (Throwable t) {
                // the answer below still goes out
            }
            try {
                reply.writeNoException();
                reply.writeInt(answer);
            } catch (Throwable t) {
                // nothing more can be done from here
            }
            return true;
        }
    }
}
