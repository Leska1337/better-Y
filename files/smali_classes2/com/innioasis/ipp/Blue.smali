.class public final Lcom/innioasis/ipp/Blue;
.super Ljava/lang/Object;
.source "Blue.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Blue$Pick;,
    Lcom/innioasis/ipp/Blue$Forget;,
    Lcom/innioasis/ipp/Blue$Rename;
  }
.end annotation

.field private final static KEY:Ljava/lang/String; = "bt_name:"

.field private final static PLAIN:I = -1

.method private constructor <init>()V
  .registers 1
  .line 40
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 2
  .line 38
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->forget(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 2
  .line 38
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->rename(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
  .registers 2
  .line 38
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->title(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .registers 1
  .line 38
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->repaint(Lcom/innioasis/y1/activity/BluetoothActivity;)V
    return-void
.end method

.method static synthetic access$400()Landroid/content/SharedPreferences;
  .registers 1
  .line 38
    invoke-static { }, Lcom/innioasis/ipp/Blue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v0
    return-object v0
.end method

.method private static forget(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 8
  .line 103
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    const/4 v1, 1
    const v2, 2131886360
    invoke-direct { v0, p0, v1, v2 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 104
    const v1, 2131820607
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const-string v2, ""
    new-instance v3, Lcom/innioasis/ipp/Blue$Forget;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Blue$Forget;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    const/4 v4, 0
    const/4 v5, 1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 105
    return-void
.end method

.method public static menu(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 5
  .line 68
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 69
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 70
    const v1, 2131821101
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 71
    const v1, 2131821102
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 72
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Blue$Pick;
    invoke-direct { v2, p0, p1 }, Lcom/innioasis/ipp/Blue$Pick;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 73
    return-void
  :L1
  .line 68
    return-void
.end method

.method public static name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 46
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 48
    invoke-static { }, Lcom/innioasis/ipp/Blue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 49
    invoke-virtual { p0 }, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v2
  .line 50
    if-eqz v1, :L2
    if-eqz v2, :L2
  .line 51
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "bt_name:"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0
    invoke-interface { v1, v2, v3 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 52
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
  :L1
    if-eqz v2, :L2
    return-object v1
  :L2
  .line 56
    goto :L4
  :L3
  .line 54
    move-exception v1
  :L4
  .line 57
    invoke-virtual { p0 }, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;
    move-result-object p0
  .line 58
    if-nez p0, :L5
    goto :L6
  :L5
    move-object v0, p0
  :L6
    return-object v0
.end method

.method public static paint(Landroid/view/View;)V
  .registers 2
  .line 237
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  .line 238
    return-void
.end method

.method private static prefs()Landroid/content/SharedPreferences;
  .registers 3
  .line 275
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 276
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const-string v1, "innioasis_plus"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
  :L1
    return-object v0
.end method

.method private static rebind(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 207
    if-nez p0, :L0
    return-void
  :L0
  .line 208
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 209
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L1
  .line 210
    return-void
.end method

.method private static rename(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 5
  .line 143
    new-instance v0, Lcom/innioasis/ipp/Blue$Rename;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/ipp/Blue$Rename;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .line 144
    new-instance v1, Lcom/innioasis/y1/utils/InputMethodDialog;
    const v2, 2131886361
    invoke-direct { v1, p0, v0, v2 }, Lcom/innioasis/y1/utils/InputMethodDialog;-><init>(Landroid/app/Activity;Lcom/innioasis/y1/utils/InputMethodDialog$Callback;I)V
  .line 145
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->show()V
  .line 146
    invoke-static { p1 }, Lcom/innioasis/ipp/Blue;->name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/ipp/Blue$Rename;->seed(Ljava/lang/String;)V
  .line 147
    invoke-static { p1 }, Lcom/innioasis/ipp/Blue;->name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/utils/InputMethodDialog;->setEditText(Ljava/lang/String;)V
  .line 148
    return-void
.end method

.method private static repaint(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 198
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 199
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerMyDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Blue;->rebind(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 200
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerOtherDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->rebind(Landroidx/recyclerview/widget/RecyclerView;)V
  :L1
  .line 203
    goto :L3
  :L2
  .line 201
    move-exception p0
  :L3
  .line 204
    return-void
.end method

.method public static row(Landroid/view/View;Z)V
  .registers 2
  .line 250
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  .line 251
    return-void
.end method

.method private static title(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  :L0
  .line 215
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 216
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->layoutTitle:Landroid/widget/LinearLayout;
  .line 217
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz p1, :L1
    const v1, 2131231050
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { v0, p0, v1, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 218
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->row(Landroid/view/View;Z)V
  :L3
  .line 221
    goto :L5
  :L4
  .line 219
    move-exception p0
  :L5
  .line 222
    return-void
.end method

.method private static walk(Landroid/view/View;Z)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 255
    if-nez p0, :L0
    return-void
  :L0
  .line 256
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L3
  .line 257
    check-cast p0, Landroid/widget/TextView;
  .line 258
    if-eqz p1, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
    goto :L2
  :L1
    const/4 v0, -1
  :L2
  .line 259
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, p0, v0, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 260
    return-void
  :L3
  .line 262
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L6
  .line 263
    check-cast p0, Landroid/view/ViewGroup;
  .line 264
    const/4 v0, 0
  :L4
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L6
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  :L5
    add-int/lit8 v0, v0, 1
    goto :L4
  :L6
  .line 268
    goto :L8
  :L7
  .line 266
    move-exception p0
  :L8
  .line 269
    return-void
.end method
