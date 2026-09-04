package com.innioasis.ipp;

import android.app.Activity;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.LinearLayout;

import androidx.lifecycle.MutableLiveData;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.BluetoothActivity;
import com.innioasis.y1.databinding.ActivityBlutoothBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.BLUtils;
import com.innioasis.y1.utils.DialogUtil;
import com.innioasis.y1.utils.InputMethodDialog;

import java.util.ArrayList;

/**
 * The Bluetooth screen's paired devices: a long press on one opens a menu instead of going
 * straight to the unpair dialog, and the second entry renames it.
 *
 * The rename is OURS, not the system's: Android 4.2 has no public way to set a device's alias
 * ({@code BluetoothDevice.setAlias} is @hide on this platform), so the chosen name is kept in the
 * ipp preferences under the device's MAC address and applied wherever a row draws a name. That also
 * means it cannot be lost by the stack re-reading the device's advertised name, and unpairing the
 * device leaves it behind harmlessly (pairing it again shows the name the user gave it).
 */
public final class Blue {

    private Blue() {}

    private static final String KEY = "bt_name:";

    /** The name a row shows: the user's own if there is one, the device's otherwise. */
    public static String name(BluetoothDevice d) {
        if (d == null) return "";
        try {
            SharedPreferences p = prefs();
            String addr = d.getAddress();
            if (p != null && addr != null) {
                String mine = p.getString(KEY + addr, null);
                if (mine != null && mine.length() != 0) return mine;
            }
        } catch (Throwable t) {
            // fall through to the device's own name
        }
        String n = d.getName();
        return n == null ? "" : n;
    }

    // ------------------------------------------------------------------ the long-press menu

    /**
     * Long TOP on a paired device. Stock raised the unpair confirm straight away; it is the first
     * of two entries now. Dispatched by string, like every other menu the mod builds.
     */
    public static void menu(BluetoothActivity a, BluetoothDevice d) {
        if (a == null || d == null) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.ipp_bl_forget));
        l.add(a.getString(R.string.ipp_bl_rename));
        new SubMenuDialog(a, l, new Pick(a, d), R.style.Dialog_Common).show();
    }

    private static final class Pick implements SubMenuDialog.Callback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;

        Pick(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = item == null ? null : item.getString();
            if (s == null) return true;
            if (s.equals(a.getString(R.string.ipp_bl_forget))) forget(a, d);
            else if (s.equals(a.getString(R.string.ipp_bl_rename))) rename(a, d);
            return true;
        }
    }

    // ------------------------------------------------------------------ forget

    /**
     * The same confirm stock's {@code longConfirm} raised, kept word for word ({@code bl_unpair}),
     * and the same three things afterwards — unpair, put the cursor back on the On/Off row, repaint.
     * {@code showItemTips()} itself is private and reachable only through a synthetic accessor,
     * which Java cannot call, so its mark-0 branch is reproduced here: the title row takes the
     * highlight and both lists are rebound.
     */
    private static void forget(BluetoothActivity a, BluetoothDevice d) {
        new DialogUtil(a, true, R.style.Dialog_Common)
                .setDialogTitle(a.getString(R.string.bl_unpair), "", new Forget(a, d), false, true);
    }

    private static final class Forget extends DialogUtil.DialogCallback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;

        Forget(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public void cancel() {}

        public void confirm() {
            try {
                BLUtils.INSTANCE.unPairDevice(d);
            } catch (Throwable t) {
                // the stack refused; the list below still repaints from what it has
            }
            a.setMark(0);
            title(a, true);
            repaint(a);
        }
    }

    // ------------------------------------------------------------------ rename

    /**
     * Seeding the keyboard takes TWO calls, and that is not a detail: {@code setEditText} writes the
     * display box only, while every key the dialog handles works on {@code valueLiveData}. With the
     * model left empty, Delete ({@code inputChar("-")}) takes its early exit — "nothing to delete" —
     * and the name on screen can only be added to, never shortened, until a character has been
     * typed. Stock's own seeded input (SearchActivity) sets both for exactly this reason.
     *
     * The model is reachable only through {@code onInit}, which the dialog calls from
     * {@code onCreate}, i.e. inside the first {@code show()} — hence the order here.
     */
    private static void rename(BluetoothActivity a, BluetoothDevice d) {
        Rename cb = new Rename(a, d);
        InputMethodDialog dlg = new InputMethodDialog(a, cb, R.style.Dialog_Input_Method);
        dlg.show();
        cb.seed(name(d));
        dlg.setEditText(name(d));
    }

    /**
     * The keyboard dialog hands its live value out through {@code onInit} and calls {@code onBack}
     * when it closes — which is the only moment this screen needs, so no observer is registered:
     * the value is read once, at the end.
     *
     * An empty name means "no name of my own": the entry is removed and the row goes back to what
     * the device calls itself, which is also how a rename is undone.
     */
    private static final class Rename implements InputMethodDialog.Callback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;
        private MutableLiveData live;

        Rename(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public void onInit(MutableLiveData valueLiveData) {
            live = valueLiveData;
        }

        /** Put the current name into the dialog's own model, not just into its display box. */
        void seed(String s) {
            if (live != null) live.setValue(s);
        }

        public void onBack() {
            try {
                Object v = live == null ? null : live.getValue();
                String s = v == null ? "" : String.valueOf(v).trim();
                SharedPreferences p = prefs();
                String addr = d.getAddress();
                if (p == null || addr == null) return;
                if (s.length() == 0) p.edit().remove(KEY + addr).commit();
                else p.edit().putString(KEY + addr, s).commit();
                repaint(a);
            } catch (Throwable t) {
                // a rename that cannot be stored must not take the screen down
            }
        }
    }

    // ------------------------------------------------------------------ shared bits

    /** Rebind both device lists — the adapters are reached through the binding, not the Activity. */
    private static void repaint(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            rebind(vb.recyclerMyDevice);
            rebind(vb.recyclerOtherDevice);
        } catch (Throwable t) {
            // nothing to repaint
        }
    }

    private static void rebind(RecyclerView rv) {
        if (rv == null) return;
        RecyclerView.Adapter ad = rv.getAdapter();
        if (ad != null) ad.notifyDataSetChanged();
    }

    /** The On/Off row's highlight, the way {@code showItemTips} paints it for mark 0. */
    private static void title(BluetoothActivity a, boolean on) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            LinearLayout t = vb.layoutTitle;
            ThemeManager.INSTANCE.itemSetBackground(t, on ? R.drawable.item_selected_no_arrow : 0, on);
        } catch (Throwable t) {
            // the row keeps the look it had
        }
    }

    private static SharedPreferences prefs() {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? null : c.getSharedPreferences("innioasis_plus", 0);
    }
}
