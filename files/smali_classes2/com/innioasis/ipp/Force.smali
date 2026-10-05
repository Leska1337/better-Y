.class public final Lcom/innioasis/ipp/Force;
.super Ljava/lang/Object;
.source "Force.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Force$Boom;,
    Lcom/innioasis/ipp/Force$Down;,
    Lcom/innioasis/ipp/Force$Again;,
    Lcom/innioasis/ipp/Force$Boot;,
    Lcom/innioasis/ipp/Force$Ping;,
    Lcom/innioasis/ipp/Force$Pong;,
    Lcom/innioasis/ipp/Force$Restart;
  }
.end annotation

.field private final static H:Landroid/os/Handler;

.field private final static HOLD_MS:J = 3000L

.field private final static PING_MS:J = 2000L

.field private final static SHUTDOWN_DELAY_MS:I = 400

.field private final static STALE_MS:J = 8000L

.field private final static STUCK_MS:J = 20000L

.field private static armed:Z

.field private static volatile fired:Z

.field private static menuAt:J

.field private static pending:Lcom/innioasis/ipp/Force$Boom;

.field private static playAt:J

.field private static volatile pong:J

.field private static watching:Z

.method static constructor <clinit>()V
  .registers 2
  .line 45
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Force;->H:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 36
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100()V
  .registers 0
  .line 34
    invoke-static { }, Lcom/innioasis/ipp/Force;->cancel()V
    return-void
.end method

.method static synthetic access$1002(Z)Z
  .registers 1
  .line 34
    sput-boolean p0, Lcom/innioasis/ipp/Force;->fired:Z
    return p0
.end method

.method static synthetic access$1200()J
  .registers 2
  .line 34
    sget-wide v0, Lcom/innioasis/ipp/Force;->pong:J
    return-wide v0
.end method

.method static synthetic access$1202(J)J
  .registers 2
  .line 34
    sput-wide p0, Lcom/innioasis/ipp/Force;->pong:J
    return-wide p0
.end method

.method static synthetic access$200()V
  .registers 0
  .line 34
    invoke-static { }, Lcom/innioasis/ipp/Force;->reboot()V
    return-void
.end method

.method static synthetic access$600()Landroid/os/Handler;
  .registers 1
  .line 34
    sget-object v0, Lcom/innioasis/ipp/Force;->H:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$800(J)V
  .registers 2
  .line 34
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Force;->sleep(J)V
    return-void
.end method

.method static synthetic access$900()I
  .registers 1
  .line 34
    invoke-static { }, Lcom/innioasis/ipp/Force;->systemServer()I
    move-result v0
    return v0
.end method

.method private static cancel()V
  .registers 2
  .line 101
    sget-object v0, Lcom/innioasis/ipp/Force;->pending:Lcom/innioasis/ipp/Force$Boom;
    if-eqz v0, :L0
  .line 102
    sget-object v1, Lcom/innioasis/ipp/Force;->H:Landroid/os/Handler;
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 103
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Force;->pending:Lcom/innioasis/ipp/Force$Boom;
  :L0
  .line 105
    return-void
.end method

.method public static key(Landroid/view/KeyEvent;)Z
  .catchall { :L0 .. :L17 } :L18
  .registers 13
  .line 56
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 57
    invoke-static { }, Lcom/innioasis/ipp/Force;->watch()V
  .line 60
    sget-boolean v1, Lcom/innioasis/ipp/Force;->fired:Z
    const/4 v2, 1
    if-eqz v1, :L1
    return v2
  :L1
  .line 61
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v1
  .line 62
    sget-object v3, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v3 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v3
    if-ne v1, v3, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
  .line 63
    sget-object v4, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v4 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_PLAY()I
    move-result v4
    if-ne v1, v4, :L4
    const/4 v1, 1
    goto :L5
  :L4
    const/4 v1, 0
  :L5
  .line 64
    if-nez v3, :L6
    if-nez v1, :L6
    return v0
  :L6
  .line 66
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 67
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result p0
  .line 68
    const-wide/16 v6, 0
    if-nez p0, :L8
  .line 69
    if-eqz v3, :L7
    sget-wide v8, Lcom/innioasis/ipp/Force;->menuAt:J
    cmp-long p0, v8, v6
    if-nez p0, :L7
    sput-wide v4, Lcom/innioasis/ipp/Force;->menuAt:J
  :L7
  .line 70
    if-eqz v1, :L10
    sget-wide v8, Lcom/innioasis/ipp/Force;->playAt:J
    cmp-long p0, v8, v6
    if-nez p0, :L10
    sput-wide v4, Lcom/innioasis/ipp/Force;->playAt:J
    goto :L10
  :L8
  .line 71
    if-ne p0, v2, :L10
  .line 72
    if-eqz v3, :L9
    sput-wide v6, Lcom/innioasis/ipp/Force;->menuAt:J
  :L9
  .line 73
    if-eqz v1, :L10
    sput-wide v6, Lcom/innioasis/ipp/Force;->playAt:J
  :L10
  .line 75
    sget-wide v8, Lcom/innioasis/ipp/Force;->menuAt:J
    const-wide/16 v10, 8000
    cmp-long p0, v8, v6
    if-eqz p0, :L11
    sub-long v8, v4, v8
    cmp-long p0, v8, v10
    if-lez p0, :L11
    sput-wide v6, Lcom/innioasis/ipp/Force;->menuAt:J
  :L11
  .line 76
    sget-wide v8, Lcom/innioasis/ipp/Force;->playAt:J
    cmp-long p0, v8, v6
    if-eqz p0, :L12
    sub-long/2addr v4, v8
    cmp-long p0, v4, v10
    if-lez p0, :L12
    sput-wide v6, Lcom/innioasis/ipp/Force;->playAt:J
  :L12
  .line 78
    sget-wide v3, Lcom/innioasis/ipp/Force;->menuAt:J
    cmp-long p0, v3, v6
    if-eqz p0, :L13
    sget-wide v3, Lcom/innioasis/ipp/Force;->playAt:J
    cmp-long p0, v3, v6
    if-eqz p0, :L13
    const/4 p0, 1
    goto :L14
  :L13
    const/4 p0, 0
  :L14
  .line 79
    if-eqz p0, :L15
  .line 80
    sput-boolean v2, Lcom/innioasis/ipp/Force;->armed:Z
  .line 81
    sget-object p0, Lcom/innioasis/ipp/Force;->pending:Lcom/innioasis/ipp/Force$Boom;
    if-nez p0, :L16
  .line 82
    new-instance p0, Lcom/innioasis/ipp/Force$Boom;
    const/4 v1, 0
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Force$Boom;-><init>(Lcom/innioasis/ipp/Force$1;)V
    sput-object p0, Lcom/innioasis/ipp/Force;->pending:Lcom/innioasis/ipp/Force$Boom;
  .line 83
    sget-object v1, Lcom/innioasis/ipp/Force;->H:Landroid/os/Handler;
    const-wide/16 v2, 3000
    invoke-virtual { v1, p0, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    goto :L16
  :L15
  .line 86
    invoke-static { }, Lcom/innioasis/ipp/Force;->cancel()V
  .line 87
    sget-wide v1, Lcom/innioasis/ipp/Force;->menuAt:J
    cmp-long p0, v1, v6
    if-nez p0, :L16
    sget-wide v1, Lcom/innioasis/ipp/Force;->playAt:J
    cmp-long p0, v1, v6
    if-nez p0, :L16
  .line 88
    sget-boolean p0, Lcom/innioasis/ipp/Force;->armed:Z
  .line 89
    sput-boolean v0, Lcom/innioasis/ipp/Force;->armed:Z
  .line 90
    return p0
  :L16
  .line 93
    sget-boolean p0, Lcom/innioasis/ipp/Force;->armed:Z
  :L17
    return p0
  :L18
  .line 94
    move-exception p0
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Force;->reset()V
  .line 96
    return v0
.end method

.method private static pidOf(Ljava/lang/String;)I
  .catchall { :L0 .. :L2 } :L10
  .catch Ljava/lang/NumberFormatException; { :L2 .. :L3 } :L7
  .catchall { :L2 .. :L3 } :L10
  .catchall { :L4 .. :L6 } :L10
  .registers 6
  .line 267
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/proc"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 268
    const/4 v2, 0
  :L1
    if-eqz v1, :L9
    array-length v3, v1
    if-ge v2, v3, :L9
  .line 269
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
  :L2
  .line 272
    invoke-static { v3 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v3
  :L3
  .line 275
    nop
  :L4
  .line 276
    invoke-static { }, Landroid/os/Process;->myPid()I
    move-result v4
    if-ne v3, v4, :L5
    goto :L8
  :L5
  .line 277
    aget-object v4, v1, v2
    invoke-static { v4 }, Lcom/innioasis/ipp/Force;->readCmdline(Ljava/io/File;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
  :L6
    if-eqz v4, :L8
    return v3
  :L7
  .line 273
    move-exception v3
  .line 274
    nop
  :L8
  .line 268
    add-int/lit8 v2, v2, 1
    goto :L1
  :L9
  .line 280
    goto :L11
  :L10
  .line 279
    move-exception p0
  :L11
  .line 281
    return v0
.end method

.method public static postShutdown()V
  .registers 4
  .line 128
    sget-object v0, Lcom/innioasis/ipp/Force;->H:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/Force$Down;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Force$Down;-><init>(Lcom/innioasis/ipp/Force$1;)V
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 129
    return-void
.end method

.method private static readCmdline(Ljava/io/File;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L17
  .catchall { :L2 .. :L3 } :L16
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L10 .. :L12 } :L16
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L19 .. :L20 } :L21
  .registers 7
  .line 285
    nop
  .line 287
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileInputStream;
    new-instance v2, Ljava/io/File;
    const-string v3, "cmdline"
    invoke-direct { v2, p0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-direct { v1, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 288
    const/16 p0, 128
  :L2
    new-array p0, p0, [B
  .line 289
    invoke-virtual { v1, p0 }, Ljava/io/FileInputStream;->read([B)I
    move-result v2
  :L3
  .line 290
    if-gtz v2, :L8
  :L4
  .line 298
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L5
  .line 300
    goto :L7
  :L6
  .line 299
    move-exception p0
  :L7
  .line 290
    return-object v0
  :L8
  .line 291
    const/4 v3, 0
    const/4 v4, 0
  :L9
  .line 292
    if-ge v4, v2, :L11
  :L10
    aget-byte v5, p0, v4
    if-eqz v5, :L11
    add-int/lit8 v4, v4, 1
    goto :L9
  :L11
  .line 293
    new-instance v2, Ljava/lang/String;
    const-string v5, "UTF-8"
    invoke-direct { v2, p0, v3, v4, v5 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L12
  .line 298
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L13
  .line 300
    goto :L15
  :L14
  .line 299
    move-exception p0
  :L15
  .line 293
    return-object v2
  :L16
  .line 294
    move-exception p0
    goto :L18
  :L17
    move-exception p0
    move-object v1, v0
  :L18
  .line 295
    nop
  .line 298
    if-eqz v1, :L22
  :L19
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L20
    goto :L22
  :L21
  .line 299
    move-exception p0
    goto :L23
  :L22
  .line 300
    nop
  :L23
  .line 295
    return-object v0
.end method

.method private static reboot()V
  .registers 4
  .line 196
    sget-boolean v0, Lcom/innioasis/ipp/Force;->fired:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 197
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Force;->fired:Z
  .line 199
    const-string v1, "force reboot (top + bottom held)"
    const/4 v2, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Diag;->spill(Ljava/lang/String;Ljava/lang/Throwable;)V
  .line 200
    new-instance v1, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/Force$Boot;
    invoke-direct { v3, v2 }, Lcom/innioasis/ipp/Force$Boot;-><init>(Lcom/innioasis/ipp/Force$1;)V
    const-string v2, "ipp-force-boot"
    invoke-direct { v1, v3, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 201
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 202
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 203
    return-void
.end method

.method private static reset()V
  .registers 2
  .line 108
    invoke-static { }, Lcom/innioasis/ipp/Force;->cancel()V
  .line 109
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Force;->menuAt:J
  .line 110
    sput-wide v0, Lcom/innioasis/ipp/Force;->playAt:J
  .line 111
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Force;->armed:Z
  .line 112
    return-void
.end method

.method public static saveState()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 211
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 212
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->saveState()V
  :L1
  .line 214
    goto :L3
  :L2
  .line 213
    move-exception v0
  :L3
  .line 215
    return-void
.end method

.method public static settingsConfirm(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 9
  .line 155
    const v0, 2131821162
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
  .line 156
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 157
    new-instance v1, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getActivity()Landroid/app/Activity;
    move-result-object p1
    const v3, 2131886360
    invoke-direct { v1, p1, v0, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 158
    const p1, 2131821040
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    new-instance v4, Lcom/innioasis/ipp/Force$Again;
    const/4 p0, 0
    invoke-direct { v4, p0 }, Lcom/innioasis/ipp/Force$Again;-><init>(Lcom/innioasis/ipp/Force$1;)V
    const/4 v5, 0
    const/4 v6, 1
    invoke-virtual/range { v1 .. v6 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 159
    const/4 p0, 1
    return p0
.end method

.method public static settingsPanel(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 4
  .line 164
    const v0, 2131821162
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 165
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 166
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
    const v1, 2131230985
    invoke-virtual { p1, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 167
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 168
    const/4 p0, 1
    return p0
.end method

.method public static settingsRow(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .registers 7
  .line 142
    const v0, 2131820940
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 143
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
  .line 144
    const/4 v2, 0
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    const/4 v4, 1
    if-ge v2, v3, :L2
  .line 145
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L1
  .line 146
    add-int/lit8 v1, v2, 1
  .line 147
    goto :L2
  :L1
  .line 144
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 150
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    const v2, 2131821162
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    const-string v2, ""
    invoke-direct { v0, p0, v4, v2 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
    invoke-interface { p1, v1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 151
    return-void
.end method

.method private static sleep(J)V
  .catch Ljava/lang/InterruptedException; { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 254
    invoke-static { p0, p1 }, Ljava/lang/Thread;->sleep(J)V
  :L1
  .line 257
    goto :L3
  :L2
  .line 255
    move-exception p0
  .line 256
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/Thread;->interrupt()V
  :L3
  .line 258
    return-void
.end method

.method private static systemServer()I
  .registers 1
  .line 261
    const-string v0, "system_server"
    invoke-static { v0 }, Lcom/innioasis/ipp/Force;->pidOf(Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method private static watch()V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 309
    sget-boolean v0, Lcom/innioasis/ipp/Force;->watching:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 310
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Force;->watching:Z
  :L1
  .line 312
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Force;->pong:J
  .line 313
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Force$Ping;
    const/4 v3, 0
    invoke-direct { v2, v3 }, Lcom/innioasis/ipp/Force$Ping;-><init>(Lcom/innioasis/ipp/Force$1;)V
    const-string v3, "ipp-force"
    invoke-direct { v1, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 314
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 315
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  :L2
  .line 317
    goto :L4
  :L3
  .line 316
    move-exception v0
  :L4
  .line 318
    return-void
.end method
