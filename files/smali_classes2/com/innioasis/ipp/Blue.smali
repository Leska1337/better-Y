.class public final Lcom/innioasis/ipp/Blue;
.super Ljava/lang/Object;
.source "Blue.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Blue$Pick;,
    Lcom/innioasis/ipp/Blue$Forget;,
    Lcom/innioasis/ipp/Blue$Rename;,
    Lcom/innioasis/ipp/Blue$Spin;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static CAPTION_PAD:I = 3

.field private final static CAPTION_SP:F = 13.0F

.field private final static CAP_END_DIP:I = 8

.field private final static CAP_START_DIP:I = 10

.field private final static HAIR_ALPHA:I = 520093696

.field private final static KEY:Ljava/lang/String; = "bt_name:"

.field private final static PLAIN:I = -1

.field private final static RULE_H:I = 2

.field private final static SPIN:F = 1.4F

.field private final static SPIN_RING:F = 0.16F

.method private constructor <init>()V
  .registers 1
  .line 51
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 2
  .line 49
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->forget(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 2
  .line 49
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->rename(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
  .registers 2
  .line 49
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->title(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .registers 1
  .line 49
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->repaint(Lcom/innioasis/y1/activity/BluetoothActivity;)V
    return-void
.end method

.method static synthetic access$400()Landroid/content/SharedPreferences;
  .registers 1
  .line 49
    invoke-static { }, Lcom/innioasis/ipp/Blue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v0
    return-object v0
.end method

.method private static band(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/view/View;)V
  .registers 12
  .line 289
    if-eqz p0, :L3
    if-nez p1, :L0
    goto/16 :L3
  :L0
  .line 290
    invoke-virtual { p0, p1 }, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I
    move-result v0
  .line 291
    if-gez v0, :L1
    return-void
  :L1
  .line 292
    invoke-virtual { p0, v0 }, Landroid/widget/LinearLayout;->removeViewAt(I)V
  .line 294
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 295
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
  .line 296
    const/high16 v3, 0x41500000
    invoke-virtual { p1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 299
    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v4, 1
    invoke-virtual { p1, v3, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 300
    const/4 v3, 0
    invoke-virtual { p1, v3 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 301
    const/16 v5, 16
    invoke-virtual { p1, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 302
    invoke-virtual { p1, v4 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 303
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v6 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 304
    invoke-virtual { p1, v3, v3, v3, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 305
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 306
    invoke-virtual { v1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v7
    const v8, 2131100252
    invoke-virtual { v7, v8 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v7
  .line 305
    invoke-virtual { v6, p1, v7, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 308
    new-instance v6, Landroid/widget/LinearLayout;
    invoke-direct { v6, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 309
    invoke-virtual { v6, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 310
    invoke-virtual { v6, v5 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 311
    invoke-virtual { v6, v3 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 312
    const/high16 v5, 0x41200000
    mul-float v5, v5, v2
    float-to-int v5, v5
    const/high16 v7, 0x41000000
    mul-float v2, v2, v7
    float-to-int v2, v2
    const/4 v7, 3
    invoke-virtual { v6, v5, v7, v2, v7 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 313
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -2
    invoke-direct { v2, v3, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 314
    const/high16 v3, 0x3F800000
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 315
    invoke-virtual { v6, p1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 316
    if-eqz p2, :L2
    invoke-virtual { v6, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
  :L2
  .line 318
    invoke-static { v1 }, Lcom/innioasis/ipp/Blue;->itemRgb(Landroid/content/Context;)I
    move-result p1
  .line 319
    new-instance p2, Landroid/widget/LinearLayout;
    invoke-direct { p2, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 320
    invoke-virtual { p2, v4 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 321
    const/high16 v2, 0x59000000
    invoke-static { v1, p1, v2 }, Lcom/innioasis/ipp/Blue;->rule(Landroid/content/Context;II)Landroid/view/View;
    move-result-object v3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v7, -1
    const/4 v8, 2
    invoke-direct { v4, v7, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p2, v3, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 322
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v7, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p2, v6, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 323
    invoke-static { v1, p1, v2 }, Lcom/innioasis/ipp/Blue;->rule(Landroid/content/Context;II)Landroid/view/View;
    move-result-object p1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v7, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p2, p1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 324
    invoke-static { v1 }, Lcom/innioasis/ipp/Blue;->washRgb(Landroid/content/Context;)I
    move-result p1
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v1
    or-int/2addr p1, v1
    invoke-virtual { p2, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 327
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p1, v7, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p0, p2, v0, p1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 328
    return-void
  :L3
  .line 289
    return-void
.end method

.method private static forget(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 8
  .line 114
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    const/4 v1, 1
    const v2, 2131886360
    invoke-direct { v0, p0, v1, v2 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 115
    const v1, 2131820607
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const-string v2, ""
    new-instance v3, Lcom/innioasis/ipp/Blue$Forget;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Blue$Forget;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    const/4 v4, 0
    const/4 v5, 1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 116
    return-void
.end method

.method private static itemRgb(Landroid/content/Context;)I
  .registers 4
  .line 457
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 458
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 459
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v2, 2131100252
    invoke-virtual { p0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p0
  .line 458
    const/4 v2, 0
    invoke-virtual { v1, v0, p0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 460
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    const v0, 16777215
    and-int/2addr p0, v0
    return p0
.end method

.method public static menu(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 5
  .line 79
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 80
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 81
    const v1, 2131821101
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 82
    const v1, 2131821102
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 83
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Blue$Pick;
    invoke-direct { v2, p0, p1 }, Lcom/innioasis/ipp/Blue$Pick;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 84
    return-void
  :L1
  .line 79
    return-void
.end method

.method public static name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 57
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 59
    invoke-static { }, Lcom/innioasis/ipp/Blue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 60
    invoke-virtual { p0 }, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v2
  .line 61
    if-eqz v1, :L2
    if-eqz v2, :L2
  .line 62
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
  .line 63
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
  :L1
    if-eqz v2, :L2
    return-object v1
  :L2
  .line 67
    goto :L4
  :L3
  .line 65
    move-exception v1
  :L4
  .line 68
    invoke-virtual { p0 }, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;
    move-result-object p0
  .line 69
    if-nez p0, :L5
    goto :L6
  :L5
    move-object v0, p0
  :L6
    return-object v0
.end method

.method public static paint(Landroid/view/View;)V
  .registers 2
  .line 486
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  .line 487
    return-void
.end method

.method private static plain(Landroid/widget/LinearLayout;)Landroid/widget/TextView;
  .registers 4
  .line 280
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
  .line 281
    invoke-virtual { p0, v0 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 282
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L1
    check-cast v1, Landroid/widget/TextView;
    return-object v1
  :L1
  .line 280
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 284
    const/4 p0, 0
    return-object p0
.end method

.method private static prefs()Landroid/content/SharedPreferences;
  .registers 3
  .line 547
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 548
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
  .line 218
    if-nez p0, :L0
    return-void
  :L0
  .line 219
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 220
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L1
  .line 221
    return-void
.end method

.method private static rename(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 5
  .line 154
    new-instance v0, Lcom/innioasis/ipp/Blue$Rename;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/ipp/Blue$Rename;-><init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .line 155
    new-instance v1, Lcom/innioasis/y1/utils/InputMethodDialog;
    const v2, 2131886361
    invoke-direct { v1, p0, v0, v2 }, Lcom/innioasis/y1/utils/InputMethodDialog;-><init>(Landroid/app/Activity;Lcom/innioasis/y1/utils/InputMethodDialog$Callback;I)V
  .line 156
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->show()V
  .line 157
    invoke-static { p1 }, Lcom/innioasis/ipp/Blue;->name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/ipp/Blue$Rename;->seed(Ljava/lang/String;)V
  .line 158
    invoke-static { p1 }, Lcom/innioasis/ipp/Blue;->name(Landroid/bluetooth/BluetoothDevice;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/utils/InputMethodDialog;->setEditText(Ljava/lang/String;)V
  .line 159
    return-void
.end method

.method private static repaint(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 209
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 210
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerMyDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Blue;->rebind(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 211
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerOtherDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->rebind(Landroidx/recyclerview/widget/RecyclerView;)V
  :L1
  .line 214
    goto :L3
  :L2
  .line 212
    move-exception p0
  :L3
  .line 215
    return-void
.end method

.method public static row(Landroid/view/View;Z)V
  .registers 2
  .line 499
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  .line 500
    return-void
.end method

.method public static row(Landroid/view/View;ZLcom/innioasis/y1/base/BaseBindingAdapter;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  .line 513
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->walk(Landroid/view/View;Z)V
  :L0
  .line 515
    move-object p1, p0
    check-cast p1, Landroid/view/ViewGroup;
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 516
    if-nez p1, :L1
    return-void
  :L1
  .line 517
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->itemRgb(Landroid/content/Context;)I
    move-result p0
    const/high16 v1, 0x1F000000
    or-int/2addr p0, v1
    invoke-virtual { p1, p0 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 518
    const/4 p0, 0
    if-eqz p2, :L2
    invoke-virtual { p2 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getDataListSize()I
    move-result p2
    sub-int/2addr p2, v0
    if-ne p3, p2, :L2
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 519
    if-eqz v0, :L4
    const/16 p0, 8
  :L4
    invoke-virtual { p1, p0 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 522
    goto :L7
  :L6
  .line 520
    move-exception p0
  :L7
  .line 523
    return-void
.end method

.method private static rule(Landroid/content/Context;II)Landroid/view/View;
  .registers 4
  .line 465
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 466
    or-int p0, p1, p2
    invoke-virtual { v0, p0 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 467
    return-object v0
.end method

.method public static searching(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  :L0
  .line 410
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 411
    invoke-virtual { p0 }, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->getRoot()Landroid/widget/LinearLayout;
    move-result-object v0
    const v1, 2131362560
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 412
    if-nez v0, :L1
    return-void
  :L1
  .line 413
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->loading:Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getVisibility()I
    move-result p0
    const/4 v1, 1
    const/4 v2, 0
    if-nez p0, :L2
    const/4 p0, 1
    goto :L3
  :L2
    const/4 p0, 0
  :L3
  .line 414
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v3
    if-nez v3, :L4
    goto :L5
  :L4
    const/4 v1, 0
  :L5
    if-ne p0, v1, :L6
    return-void
  :L6
  .line 415
    if-eqz p0, :L7
  .line 416
    invoke-virtual { v0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 417
    invoke-static { }, Lcom/innioasis/ipp/Blue;->turn()Landroid/view/animation/RotateAnimation;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    goto :L8
  :L7
  .line 419
    invoke-virtual { v0 }, Landroid/view/View;->clearAnimation()V
  .line 420
    const/4 p0, 4
    invoke-virtual { v0, p0 }, Landroid/view/View;->setVisibility(I)V
  :L8
  .line 424
    goto :L10
  :L9
  .line 422
    move-exception p0
  :L10
  .line 425
    return-void
.end method

.method private static spinner(Landroid/content/Context;)Landroid/view/View;
  .registers 6
  .line 341
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F
    const/high16 v1, 0x41500000
    mul-float v0, v0, v1
    const v1, 1068708659
    mul-float v0, v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 342
    new-instance v1, Lcom/innioasis/ipp/Blue$Spin;
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->itemRgb(Landroid/content/Context;)I
    move-result v2
    int-to-float v3, v0
    const v4, 1042536202
    mul-float v3, v3, v4
    const/high16 v4, 0x40000000
    invoke-static { v4, v3 }, Ljava/lang/Math;->max(FF)F
    move-result v3
    invoke-direct { v1, p0, v2, v3 }, Lcom/innioasis/ipp/Blue$Spin;-><init>(Landroid/content/Context;IF)V
  .line 343
    const p0, 2131362560
    invoke-virtual { v1, p0 }, Landroid/view/View;->setId(I)V
  .line 347
    const/4 p0, 4
    invoke-virtual { v1, p0 }, Landroid/view/View;->setVisibility(I)V
  .line 348
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p0, v0, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, p0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 349
    return-object v1
.end method

.method public static style(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 265
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 266
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->title:Landroid/widget/TextView;
  .line 267
    invoke-virtual { v0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/widget/LinearLayout;
  .line 268
    const/4 v2, 0
    invoke-static { v1, v0, v2 }, Lcom/innioasis/ipp/Blue;->band(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/view/View;)V
  .line 271
    invoke-static { v1 }, Lcom/innioasis/ipp/Blue;->plain(Landroid/widget/LinearLayout;)Landroid/widget/TextView;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->spinner(Landroid/content/Context;)Landroid/view/View;
    move-result-object v2
    invoke-static { v1, v0, v2 }, Lcom/innioasis/ipp/Blue;->band(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/view/View;)V
  .line 272
    invoke-static { p0 }, Lcom/innioasis/ipp/Blue;->searching(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  :L1
  .line 275
    goto :L3
  :L2
  .line 273
    move-exception p0
  :L3
  .line 276
    return-void
.end method

.method private static title(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  :L0
  .line 226
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 227
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->layoutTitle:Landroid/widget/LinearLayout;
  .line 228
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz p1, :L1
    const v1, 2131231050
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { v0, p0, v1, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 229
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Blue;->row(Landroid/view/View;Z)V
  :L3
  .line 232
    goto :L5
  :L4
  .line 230
    move-exception p0
  :L5
  .line 233
    return-void
.end method

.method private static turn()Landroid/view/animation/RotateAnimation;
  .registers 8
  .line 433
    new-instance v7, Landroid/view/animation/RotateAnimation;
    const/4 v1, 0
    const/high16 v2, 0x43B40000
    const/4 v3, 1
    const/high16 v4, 0x3F000000
    const/4 v5, 1
    const/high16 v6, 0x3F000000
    move-object v0, v7
    invoke-direct/range { v0 .. v6 }, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V
  .line 435
    const-wide/16 v0, 1500
    invoke-virtual { v7, v0, v1 }, Landroid/view/animation/RotateAnimation;->setDuration(J)V
  .line 436
    new-instance v0, Landroid/view/animation/LinearInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/LinearInterpolator;-><init>()V
    invoke-virtual { v7, v0 }, Landroid/view/animation/RotateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V
  .line 437
    const/4 v0, -1
    invoke-virtual { v7, v0 }, Landroid/view/animation/RotateAnimation;->setRepeatCount(I)V
  .line 438
    return-object v7
.end method

.method private static walk(Landroid/view/View;Z)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 527
    if-nez p0, :L0
    return-void
  :L0
  .line 528
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L3
  .line 529
    check-cast p0, Landroid/widget/TextView;
  .line 530
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
  .line 531
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, p0, v0, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 532
    return-void
  :L3
  .line 534
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L6
  .line 535
    check-cast p0, Landroid/view/ViewGroup;
  .line 536
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
  .line 540
    goto :L8
  :L7
  .line 538
    move-exception p0
  :L8
  .line 541
    return-void
.end method

.method private static washRgb(Landroid/content/Context;)I
  .registers 4
  .line 443
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 444
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v1, -12779554
    const/4 v2, 1
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 445
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    const v0, 16777215
    and-int/2addr p0, v0
    return p0
.end method
