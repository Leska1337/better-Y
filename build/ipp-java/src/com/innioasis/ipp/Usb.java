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
 * Replaces SystemUI's "USB connected" screen with {@code IppUsbActivity}. That screen can be
 * neither themed nor disabled (SystemUI dies on ActivityNotFoundException), so its start is refused
 * through an activity controller. Nothing is stored: the controller dies with our process.
 */
public final class Usb {

    private Usb() { }

    private static final ComponentName SCREEN = new ComponentName(
            "com.android.systemui", "com.android.systemui.usb.UsbStorageActivity");

    private static boolean done;
    private static Handler main;
    private static Context app;

    /** From {@code BaseActivity.onCreate}; once per process. */
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
     * The hidden {@code IActivityController}, its five AIDL transactions answered by hand.
     * ActivityManager waits on each answer holding its lock, so work is posted, never done here.
     * Nothing may escape {@code onTransact} — system_server catches only RemoteException — and every
     * path answers "carry on as usual".
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
            }
            try {
                reply.writeNoException();
                reply.writeInt(answer);
            } catch (Throwable t) {
            }
            return true;
        }
    }
}
