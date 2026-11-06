.class public final Lcom/innioasis/ipp/Tone;
.super Ljava/lang/Object;
.source "Tone.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Tone$Seed;,
    Lcom/innioasis/ipp/Tone$Job;,
    Lcom/innioasis/ipp/Tone$Loaded;,
    Lcom/innioasis/ipp/Tone$Fit;,
    Lcom/innioasis/ipp/Tone$Blink;
  }
.end annotation

.field private final static BLINK_MS:J = 400L

.field private final static DEFAULT_PATH:Ljava/lang/String; = "/system/media/audio/ui/Effect_Tick.ogg"

.field private final static DIR:Ljava/lang/String; = "key-tone"

.field private final static EXT:[Ljava/lang/String;

.field private final static EXTRA:Ljava/lang/String; = "ipp_key_tone"

.field private final static GAIN:[F

.field private final static H:Landroid/os/Handler;

.field public final static KEY_ON:Ljava/lang/String; = "key_tone"

.field public final static KEY_SOUND:Ljava/lang/String; = "key_tone_sound"

.field public final static KEY_VOLUME:Ljava/lang/String; = "key_tone_volume"

.field private final static PLAY:I = 0

.field private final static PRELOAD:I = 2

.field private final static PREVIEW:I = 1

.field private final static PROFILE:Ljava/lang/String; = "mtk_audioprofile_general"

.field private final static P_MUTED:Ljava/lang/String; = "tone_muted"

.field private final static RETRY_MS:J = 2000L

.field private final static ROW_ON:I = 0

.field private final static ROW_SOUND:I = 2

.field private final static ROW_VOLUME:I = 1

.field private final static SEED:Ljava/lang/String; = "better-Y.mp3"

.field final static THEME:Ljava/lang/String; = "\u0001theme"

.field private final static THEME_FILE:Ljava/lang/String; = "key-tone"

.field public final static VOLUME_DEFAULT:I = 7

.field private static blink:Lcom/innioasis/ipp/Tone$Blink;

.field private static editRow:I

.field private static editVal:I

.field private static editing:Lcom/innioasis/y1/activity/SettingActivity;

.field private static fitted:Landroidx/recyclerview/widget/RecyclerView;

.field private final static ids:Ljava/util/HashMap;

.field private static lastDown:J

.field private static lastKey:I

.field private final static loaded:Ljava/util/HashMap;

.field private static missing:Z

.field private static options:[Ljava/lang/String;

.field private static path:Ljava/lang/String;

.field private static pending:I

.field private static pendingGain:F

.field private static pool:Landroid/media/SoundPool;

.field private static previewStream:I

.field private static volatile recheck:Z

.field private static soundFor:Ljava/lang/String;

.field private static started:Z

.field private static themeFor:Ljava/lang/String;

.field private static told:Z

.field private static triedAt:J

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 4
  .line 59
    const/16 v0, 10
    new-array v0, v0, [F
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Tone;->GAIN:[F
  .line 69
    const/4 v0, 3
    new-array v0, v0, [Ljava/lang/String;
    const-string v1, ".mp3"
    const/4 v2, 0
    aput-object v1, v0, v2
    const/4 v1, 1
    const-string v3, ".ogg"
    aput-object v3, v0, v1
    const/4 v1, 2
    const-string v3, ".wav"
    aput-object v3, v0, v1
    sput-object v0, Lcom/innioasis/ipp/Tone;->EXT:[Ljava/lang/String;
  .line 164
    const-wide/16 v0, -1
    sput-wide v0, Lcom/innioasis/ipp/Tone;->lastDown:J
  .line 190
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Tone;->ids:Ljava/util/HashMap;
  .line 191
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Tone;->loaded:Ljava/util/HashMap;
  .line 289
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Tone;->soundFor:Ljava/lang/String;
  .line 290
    sput-object v0, Lcom/innioasis/ipp/Tone;->themeFor:Ljava/lang/String;
  .line 611
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Tone;->H:Landroid/os/Handler;
  .line 616
    new-array v0, v2, [Ljava/lang/String;
    sput-object v0, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
    return-void
  :L0
  .array-data 4
      1027020633
      1031879315
      1035368976
      1040247790
      1043730740
      1048616265
      1052092504
      1056984741
      1060452591
      1065353216
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 49
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;F)V
  .registers 2
  .line 47
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->previewNow(Ljava/lang/String;F)V
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;F)V
  .registers 2
  .line 47
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->playNow(Ljava/lang/String;F)V
    return-void
.end method

.method static synthetic access$200()I
  .registers 1
  .line 47
    sget v0, Lcom/innioasis/ipp/Tone;->pending:I
    return v0
.end method

.method static synthetic access$202(I)I
  .registers 1
  .line 47
    sput p0, Lcom/innioasis/ipp/Tone;->pending:I
    return p0
.end method

.method static synthetic access$300()Ljava/util/HashMap;
  .registers 1
  .line 47
    sget-object v0, Lcom/innioasis/ipp/Tone;->loaded:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$402(I)I
  .registers 1
  .line 47
    sput p0, Lcom/innioasis/ipp/Tone;->previewStream:I
    return p0
.end method

.method static synthetic access$500()F
  .registers 1
  .line 47
    sget v0, Lcom/innioasis/ipp/Tone;->pendingGain:F
    return v0
.end method

.method static synthetic access$600()Lcom/innioasis/y1/activity/SettingActivity;
  .registers 1
  .line 47
    sget-object v0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    return-object v0
.end method

.method static synthetic access$602(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/activity/SettingActivity;
  .registers 1
  .line 47
    sput-object p0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    return-object p0
.end method

.method static synthetic access$700()Landroid/os/Handler;
  .registers 1
  .line 47
    sget-object v0, Lcom/innioasis/ipp/Tone;->H:Landroid/os/Handler;
    return-object v0
.end method

.method private static adapter(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/base/BaseBindingAdapter;
  .registers 2
  .line 592
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
  .line 593
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 594
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method private static audio(Ljava/lang/String;)Z
  .registers 5
  .line 414
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
  .line 415
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Tone;->EXT:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L2
    aget-object v2, v2, v1
    invoke-virtual { p0, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    const/4 p0, 1
    return p0
  :L1
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 416
    return v0
.end method

.method private static clicks(I)Z
  .registers 2
  .line 160
    const/4 v0, 3
    if-eq p0, v0, :L1
    const/16 v0, 82
    if-eq p0, v0, :L1
    const/4 v0, 4
    if-eq p0, v0, :L1
    const/16 v0, 19
    if-eq p0, v0, :L1
    const/16 v0, 20
    if-eq p0, v0, :L1
    const/16 v0, 21
    if-eq p0, v0, :L1
    const/16 v0, 22
    if-eq p0, v0, :L1
    const/16 v0, 88
    if-eq p0, v0, :L1
    const/16 v0, 87
    if-eq p0, v0, :L1
    const/16 v0, 85
    if-eq p0, v0, :L1
    const/16 v0, 66
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static currentSound(Landroid/content/Context;)Ljava/lang/String;
  .registers 4
  .line 456
    const-string v0, "key_tone_sound"
    const-string v1, ""
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 457
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-eqz v0, :L2
    const-string v0, "\u0001theme"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 458
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Tone;->dir()Ljava/io/File;
    move-result-object v2
    invoke-direct { v0, v2, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
    if-eqz v0, :L1
    move-object v1, p0
  :L1
    return-object v1
  :L2
  .line 457
    return-object p0
.end method

.method private static dir()Ljava/io/File;
  .registers 3
  .line 355
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "key-tone"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static enable(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  :L0
  .line 718
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "setSoundEffectEnabled"
    const/4 v2, 2
    new-array v3, v2, [Ljava/lang/Class;
    const-class v4, Ljava/lang/String;
    const/4 v5, 0
    aput-object v4, v3, v5
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v6, 1
    aput-object v4, v3, v6
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 719
    new-array v1, v2, [Ljava/lang/Object;
    const-string v2, "mtk_audioprofile_general"
    aput-object v2, v1, v5
    invoke-static { p1 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object p1
    aput-object p1, v1, v6
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 721
    goto :L3
  :L2
  .line 720
    move-exception p0
  :L3
  .line 722
    return-void
.end method

.method private static enabled(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 7
  .line 708
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "getSoundEffectEnabled"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Class;
    const-class v5, Ljava/lang/String;
    aput-object v5, v4, v0
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 709
    new-array v2, v3, [Ljava/lang/Object;
    const-string v4, "mtk_audioprofile_general"
    aput-object v4, v2, v0
    invoke-virtual { v1, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 710
    instance-of v1, p0, Ljava/lang/Boolean;
    if-eqz v1, :L2
    check-cast p0, Ljava/lang/Boolean;
    invoke-virtual { p0 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result p0
  :L1
    if-eqz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 711
    move-exception p0
  .line 712
    return v0
.end method

.method private static endEdit(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .registers 6
  .line 670
    sget-object v0, Lcom/innioasis/ipp/Tone;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Tone;->blink:Lcom/innioasis/ipp/Tone$Blink;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 671
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
    move-result-object v0
  .line 672
    if-eqz v0, :L0
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L0
  .line 673
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p1, :L3
  .line 674
    sget p1, Lcom/innioasis/ipp/Tone;->editRow:I
    if-ne p1, v0, :L1
    const-string p1, "key_tone_volume"
    sget v2, Lcom/innioasis/ipp/Tone;->editVal:I
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
    goto :L2
  :L1
  .line 675
    sget-object p1, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
    sget v2, Lcom/innioasis/ipp/Tone;->editVal:I
    aget-object p1, p1, v2
    const-string v2, "key_tone_sound"
    invoke-static { p0, v2, p1 }, Lcom/innioasis/ipp/Prefs;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
  :L2
  .line 676
    sput-object v1, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
  :L3
  .line 678
    sput-object v1, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
  .line 679
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->adapter(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/base/BaseBindingAdapter;
    move-result-object p1
  .line 680
    if-eqz p1, :L4
  .line 681
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 682
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getMark()I
    move-result v2
  .line 683
    if-ltz v2, :L4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 684
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
  .line 685
    sget v3, Lcom/innioasis/ipp/Tone;->editRow:I
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Tone;->value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->setText(Ljava/lang/String;)V
  .line 686
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->notifyItemChanged(I)V
  :L4
  .line 689
    sget p1, Lcom/innioasis/ipp/Tone;->editRow:I
    if-ne p1, v0, :L5
  .line 690
    const p1, 2131821163
    goto :L6
  :L5
    const p1, 2131821164
  :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
  .line 689
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  .line 691
    return-void
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 395
    if-nez p0, :L1
    if-nez p1, :L0
    const/4 p0, 1
    goto :L2
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
.end method

.method private static gain(Landroid/content/Context;I)F
  .registers 2
  .line 196
    if-ltz p1, :L0
    goto :L1
  :L0
    const-string p1, "key_tone_volume"
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p1
  :L1
  .line 197
    if-ltz p1, :L2
    sget-object p0, Lcom/innioasis/ipp/Tone;->GAIN:[F
    array-length p0, p0
    if-lt p1, p0, :L3
  :L2
    const/4 p1, 7
  :L3
  .line 198
    sget-object p0, Lcom/innioasis/ipp/Tone;->GAIN:[F
    aget p0, p0, p1
    return p0
.end method

.method public static key(Landroid/view/KeyEvent;)V
  .catchall { :L0 .. :L5 } :L8
  .registers 7
  :L0
  .line 173
    invoke-static { p0 }, Lcom/innioasis/ipp/Open;->key(Landroid/view/KeyEvent;)V
  .line 174
    if-eqz p0, :L7
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result v0
    if-nez v0, :L7
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v0
    if-eqz v0, :L1
    goto :L7
  :L1
  .line 175
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
  .line 176
    invoke-static { v0 }, Lcom/innioasis/ipp/Tone;->clicks(I)Z
    move-result v1
    if-nez v1, :L2
    return-void
  :L2
  .line 177
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getDownTime()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Tone;->lastDown:J
    cmp-long v5, v1, v3
    if-nez v5, :L3
    sget v1, Lcom/innioasis/ipp/Tone;->lastKey:I
    if-ne v0, v1, :L3
    return-void
  :L3
  .line 178
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getDownTime()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Tone;->lastDown:J
  .line 179
    sput v0, Lcom/innioasis/ipp/Tone;->lastKey:I
  .line 180
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 183
    if-eqz p0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v0, :L4
    goto :L6
  :L4
  .line 184
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->sound(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    const/4 v1, -1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Tone;->gain(Landroid/content/Context;I)F
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Tone;->play(Ljava/lang/String;F)V
  :L5
  .line 186
    goto :L9
  :L6
  .line 183
    return-void
  :L7
  .line 174
    return-void
  :L8
  .line 185
    move-exception p0
  :L9
  .line 187
    return-void
.end method

.method private static label(Lcom/innioasis/y1/activity/SettingActivity;)Ljava/lang/String;
  .registers 3
  .line 633
    sget v0, Lcom/innioasis/ipp/Tone;->editRow:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    sget p0, Lcom/innioasis/ipp/Tone;->editVal:I
    add-int/2addr p0, v1
    invoke-static { p0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
    sget v1, Lcom/innioasis/ipp/Tone;->editVal:I
    aget-object v0, v0, v1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Tone;->soundName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static manager(Landroid/content/Context;)Ljava/lang/Object;
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 698
    const/4 v0, 0
  :L0
    const-class v1, Landroid/content/Context;
    const-string v2, "AUDIOPROFILE_SERVICE"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 699
    invoke-virtual { v1, v0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 700
    instance-of v2, v1, Ljava/lang/String;
    if-eqz v2, :L1
    check-cast v1, Ljava/lang/String;
    invoke-virtual { p0, v1 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 701
    move-exception p0
  .line 702
    return-object v0
.end method

.method private static mirror(Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 148
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setRingtone(Z)V
  :L1
  .line 150
    goto :L3
  :L2
  .line 149
    move-exception p0
  :L3
  .line 151
    return-void
.end method

.method public static on(Landroid/content/Context;)Z
  .registers 2
  .line 125
    const-string v0, "key_tone"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static play(Ljava/lang/String;F)V
  .registers 5
  .line 243
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Tone;->worker()Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Tone$Job;
    const/4 v2, 0
    invoke-direct { v1, v2, p0, p1 }, Lcom/innioasis/ipp/Tone$Job;-><init>(ILjava/lang/String;F)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 244
    return-void
.end method

.method private static playNow(Ljava/lang/String;F)V
  .registers 12
  .line 259
    if-nez p0, :L0
    return-void
  :L0
  .line 260
    sget-object v0, Lcom/innioasis/ipp/Tone;->pool:Landroid/media/SoundPool;
    const/4 v1, 1
    if-nez v0, :L1
  .line 261
    new-instance v0, Landroid/media/SoundPool;
    const/4 v2, 4
    const/4 v3, 0
    invoke-direct { v0, v2, v1, v3 }, Landroid/media/SoundPool;-><init>(III)V
    sput-object v0, Lcom/innioasis/ipp/Tone;->pool:Landroid/media/SoundPool;
  .line 262
    new-instance v2, Lcom/innioasis/ipp/Tone$Loaded;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Tone$Loaded;-><init>()V
    invoke-virtual { v0, v2 }, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V
  :L1
  .line 264
    sget-object v0, Lcom/innioasis/ipp/Tone;->ids:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
  .line 265
    if-nez v2, :L2
  .line 266
    sget-object v2, Lcom/innioasis/ipp/Tone;->pool:Landroid/media/SoundPool;
    invoke-virtual { v2, p0, v1 }, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 267
    invoke-virtual { v0, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 269
    sget-object p0, Lcom/innioasis/ipp/Tone;->loaded:Ljava/util/HashMap;
    invoke-virtual { p0, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L3
  .line 270
    sget-object v3, Lcom/innioasis/ipp/Tone;->pool:Landroid/media/SoundPool;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    const/4 v7, 1
    const/4 v8, 0
    const/high16 v9, 0x3F800000
    move v5, p1
    move v6, p1
    invoke-virtual/range { v3 .. v9 }, Landroid/media/SoundPool;->play(IFFIIF)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Tone;->previewStream:I
    goto :L4
  :L3
  .line 272
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Tone;->pending:I
  .line 273
    sput p1, Lcom/innioasis/ipp/Tone;->pendingGain:F
  :L4
  .line 275
    return-void
.end method

.method private static preview(Ljava/lang/String;F)V
  .registers 5
  .line 247
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Tone;->worker()Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Tone$Job;
    const/4 v2, 1
    invoke-direct { v1, v2, p0, p1 }, Lcom/innioasis/ipp/Tone$Job;-><init>(ILjava/lang/String;F)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 248
    return-void
.end method

.method private static previewNow(Ljava/lang/String;F)V
  .registers 4
  .line 252
    sget-object v0, Lcom/innioasis/ipp/Tone;->pool:Landroid/media/SoundPool;
    if-eqz v0, :L0
    sget v1, Lcom/innioasis/ipp/Tone;->previewStream:I
    if-eqz v1, :L0
    invoke-virtual { v0, v1 }, Landroid/media/SoundPool;->stop(I)V
  :L0
  .line 253
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Tone;->previewStream:I
  .line 254
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->playNow(Ljava/lang/String;F)V
  .line 255
    return-void
.end method

.method private static rebuild(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 3
  .line 599
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->adapter(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/base/BaseBindingAdapter;
    move-result-object v0
  .line 600
    if-nez v0, :L0
    return-void
  :L0
  .line 601
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 602
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Tone;->settingsRows(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .line 603
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->setList(Ljava/util/Collection;)V
  .line 604
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->setMark(I)V
  .line 605
    const v0, 2131820926
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  .line 606
    return-void
.end method

.method static recheck()V
  .registers 1
  .line 299
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Tone;->recheck:Z
  .line 300
    return-void
.end method

.method private static resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 338
    nop
  .line 339
    const-string v0, "\u0001theme"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L3
  .line 340
    if-eqz p1, :L4
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L4
  .line 341
    new-instance p0, Ljava/io/File;
    const-string v0, "/storage/sdcard0/Themes"
    invoke-direct { p0, v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  .line 342
    const/4 p1, 0
  :L0
    sget-object v0, Lcom/innioasis/ipp/Tone;->EXT:[Ljava/lang/String;
    array-length v2, v0
    if-ge p1, v2, :L2
    if-nez v1, :L2
  .line 343
    new-instance v2, Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "key-tone"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v0, v0, p1
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-direct { v2, p0, v0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 344
    invoke-virtual { v2 }, Ljava/io/File;->isFile()Z
    move-result v0
    if-eqz v0, :L1
    move-object v1, v2
  :L1
  .line 342
    add-int/lit8 p1, p1, 1
    goto :L0
  :L2
  .line 346
    goto :L4
  :L3
  .line 347
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-lez p1, :L4
  .line 348
    new-instance p1, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Tone;->dir()Ljava/io/File;
    move-result-object v0
    invoke-direct { p1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 349
    invoke-virtual { p1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-eqz p0, :L4
    move-object v1, p1
  :L4
  .line 351
    if-eqz v1, :L5
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    goto :L6
  :L5
    const-string p0, "/system/media/audio/ui/Effect_Tick.ogg"
  :L6
    return-object p0
.end method

.method private static rowOf(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)I
  .registers 3
  .line 437
    const v0, 2131820926
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 438
    const v0, 2131821163
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 439
    const v0, 2131821164
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
    const/4 p0, 2
    return p0
  :L2
  .line 440
    const/4 p0, -1
    return p0
.end method

.method private static rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
  .registers 2
  .line 650
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
  .line 651
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getMark()I
    move-result p0
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 652
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    const v0, 2131362437
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
  :L1
    return-object p0
.end method

.method private static section(Lcom/innioasis/y1/activity/SettingActivity;)Z
  .registers 3
  .line 429
    const/4 v0, 0
    if-eqz p0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_key_tone"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
    if-eqz p0, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method static seed(Landroid/content/Context;)V
  .catchall { :L1 .. :L2 } :L16
  .catchall { :L2 .. :L3 } :L14
  .catchall { :L4 .. :L6 } :L13
  .catchall { :L8 .. :L9 } :L10
  .catchall { :L11 .. :L12 } :L25
  .catchall { :L17 .. :L18 } :L27
  .catchall { :L19 .. :L20 } :L21
  .catchall { :L23 .. :L24 } :L25
  .catchall { :L28 .. :L29 } :L30
  .catchall { :L32 .. :L33 } :L34
  .registers 6
  .line 367
    new-instance v0, Ljava/io/File;
    const-string v1, "/storage/sdcard0"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 368
    invoke-static { }, Lcom/innioasis/ipp/Tone;->dir()Ljava/io/File;
    move-result-object v1
  .line 369
    invoke-virtual { v0 }, Ljava/io/File;->canWrite()Z
    move-result v0
    if-eqz v0, :L36
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-nez v0, :L36
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
    move-result v0
    if-nez v0, :L0
    goto :L36
  :L0
  .line 370
    nop
  .line 371
    nop
  .line 372
    new-instance v0, Ljava/io/File;
    const-string v2, "better-Y.mp3"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 374
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object p0
    invoke-virtual { p0, v2 }, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object p0
  :L2
  .line 375
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 376
    const/16 v1, 8192
  :L4
    new-array v1, v1, [B
  :L5
  .line 377
    invoke-virtual { p0, v1 }, Ljava/io/InputStream;->read([B)I
    move-result v3
    if-lez v3, :L7
    const/4 v4, 0
    invoke-virtual { v2, v1, v4, v3 }, Ljava/io/OutputStream;->write([BII)V
  :L6
    goto :L5
  :L7
  .line 381
    if-eqz p0, :L11
  :L8
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L9
    goto :L11
  :L10
    move-exception p0
  :L11
  .line 382
    invoke-virtual { v2 }, Ljava/io/OutputStream;->close()V
  :L12
    goto :L26
  :L13
  .line 378
    move-exception v1
    goto :L15
  :L14
    move-exception v2
    move-object v2, v1
  :L15
    move-object v1, p0
    goto :L17
  :L16
    move-exception p0
    move-object v2, v1
  :L17
  .line 379
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L18
  .line 381
    if-eqz v1, :L22
  :L19
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception p0
  :L22
  .line 382
    if-eqz v2, :L26
  :L23
    invoke-virtual { v2 }, Ljava/io/OutputStream;->close()V
  :L24
    goto :L26
  :L25
    move-exception p0
  .line 383
    nop
  :L26
  .line 384
    return-void
  :L27
  .line 381
    move-exception p0
    if-eqz v1, :L31
  :L28
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L29
    goto :L31
  :L30
    move-exception v0
  :L31
  .line 382
    if-eqz v2, :L35
  :L32
    invoke-virtual { v2 }, Ljava/io/OutputStream;->close()V
  :L33
    goto :L35
  :L34
    move-exception v0
  :L35
  .line 383
    throw p0
  :L36
  .line 369
    return-void
.end method

.method public static setOn(Landroid/content/Context;Z)V
  .registers 3
  .line 130
    if-nez p0, :L0
    return-void
  :L0
  .line 131
    const-string v0, "key_tone"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 132
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->mirror(Landroid/content/Context;)V
  .line 133
    return-void
.end method

.method public static settingsConfirm(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 4
  .line 520
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->section(Lcom/innioasis/y1/activity/SettingActivity;)Z
    move-result v0
    const/4 v1, 1
    if-nez v0, :L1
  .line 521
    const v0, 2131820926
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 522
    new-instance p1, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-direct { p1, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v0, "ipp_key_tone"
    invoke-virtual { p1, v0, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->startActivity(Landroid/content/Intent;)V
  .line 523
    return v1
  :L1
  .line 525
    sget-object v0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-ne v0, p0, :L2
  .line 526
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Tone;->endEdit(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .line 527
    return v1
  :L2
  .line 529
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->rowOf(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)I
    move-result p1
  .line 530
    if-nez p1, :L3
  .line 531
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result p1
    xor-int/2addr p1, v1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->setOn(Landroid/content/Context;Z)V
  .line 532
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->rebuild(Lcom/innioasis/y1/activity/SettingActivity;)V
    goto :L5
  :L3
  .line 533
    if-eq p1, v1, :L4
    const/4 v0, 2
    if-ne p1, v0, :L5
  :L4
  .line 534
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->startEdit(Lcom/innioasis/y1/activity/SettingActivity;I)V
  :L5
  .line 536
    return v1
.end method

.method public static settingsPanel(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 6
  .line 541
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->section(Lcom/innioasis/y1/activity/SettingActivity;)Z
    move-result v0
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 542
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 543
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
  .line 544
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L1
    const v3, 2131230982
    goto :L2
  :L1
    const v3, 2131230981
  :L2
  .line 543
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 545
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->rowOf(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)I
    move-result p1
  .line 546
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    sget-object v1, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-ne v1, p0, :L3
    sget v1, Lcom/innioasis/ipp/Tone;->editRow:I
    if-ne p1, v1, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->label(Lcom/innioasis/y1/activity/SettingActivity;)Ljava/lang/String;
    move-result-object p0
    goto :L5
  :L3
    if-gez p1, :L4
    const-string p0, ""
    goto :L5
  :L4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object p0
  :L5
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 547
    const/4 p0, 1
    return p0
.end method

.method public static settingsResume(Lcom/innioasis/y1/activity/SettingActivity;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 574
    const v0, 2131820926
  :L0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 575
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->section(Lcom/innioasis/y1/activity/SettingActivity;)Z
    move-result v1
    if-eqz v1, :L1
  .line 576
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 577
    return-void
  :L1
  .line 579
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->adapter(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/base/BaseBindingAdapter;
    move-result-object v1
  .line 580
    if-nez v1, :L2
    return-void
  :L2
  .line 581
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 582
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getMark()I
    move-result v2
  .line 583
    if-ltz v2, :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 584
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 585
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L3
  .line 588
    goto :L5
  :L4
  .line 587
    move-exception p0
  :L5
  .line 589
    return-void
.end method

.method public static settingsRows(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .registers 7
  .line 466
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->section(Lcom/innioasis/y1/activity/SettingActivity;)Z
    move-result v0
    const v1, 2131820926
    const/4 v2, 1
    const/4 v3, 0
    if-nez v0, :L3
  .line 468
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 469
    nop
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v3, v0, :L2
  .line 470
    invoke-interface { p1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
  .line 471
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    const-string v1, ""
    invoke-direct { v0, p0, v2, v1 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
    invoke-interface { p1, v3, v0 }, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 469
    add-int/lit8 v3, v3, 1
    goto :L0
  :L2
  .line 474
    return-void
  :L3
  .line 476
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
  .line 477
    sget-object v4, Lcom/innioasis/ipp/Tone;->fitted:Landroidx/recyclerview/widget/RecyclerView;
    if-eq v0, v4, :L4
  .line 478
    sput-object v0, Lcom/innioasis/ipp/Tone;->fitted:Landroidx/recyclerview/widget/RecyclerView;
  .line 479
    new-instance v4, Lcom/innioasis/ipp/Tone$Fit;
    invoke-direct { v4, v0 }, Lcom/innioasis/ipp/Tone$Fit;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v4 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  :L4
  .line 481
    invoke-interface { p1 }, Ljava/util/List;->clear()V
  .line 482
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Tone;->value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object v4
    invoke-direct { v0, v1, v3, v4 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 483
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :L5
    return-void
  :L5
  .line 484
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    const v1, 2131821163
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Tone;->value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object v2
    invoke-direct { v0, v1, v3, v2 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 485
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    const v1, 2131821164
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 2
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Tone;->value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v0, v1, v3, p0 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 486
    return-void
.end method

.method public static settingsTop(Lcom/innioasis/y1/activity/SettingActivity;)Z
  .registers 3
  .line 563
    sget-object v0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eq v0, p0, :L0
    return v1
  :L0
  .line 564
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Tone;->endEdit(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .line 565
    const/4 p0, 1
    return p0
.end method

.method public static settingsWheel(Lcom/innioasis/y1/activity/SettingActivity;I)Z
  .registers 5
  .line 552
    sget-object v0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-eq v0, p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 553
    sget v0, Lcom/innioasis/ipp/Tone;->editRow:I
    const/4 v1, 1
    if-ne v0, v1, :L1
    sget-object v0, Lcom/innioasis/ipp/Tone;->GAIN:[F
    array-length v0, v0
    goto :L2
  :L1
    sget-object v0, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
    array-length v0, v0
  :L2
  .line 554
    sget v2, Lcom/innioasis/ipp/Tone;->editVal:I
    add-int/2addr v2, p1
    rem-int/2addr v2, v0
    add-int/2addr v2, v0
    rem-int/2addr v2, v0
    sput v2, Lcom/innioasis/ipp/Tone;->editVal:I
  .line 555
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->showCandidate(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 556
    sget p1, Lcom/innioasis/ipp/Tone;->editRow:I
    if-ne p1, v1, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->sound(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p1
    sget v0, Lcom/innioasis/ipp/Tone;->editVal:I
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Tone;->gain(Landroid/content/Context;I)F
    move-result p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Tone;->preview(Ljava/lang/String;F)V
    goto :L4
  :L3
  .line 557
    sget-object p1, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
    sget v0, Lcom/innioasis/ipp/Tone;->editVal:I
    aget-object p1, p1, v0
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Tone;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v0, -1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Tone;->gain(Landroid/content/Context;I)F
    move-result p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Tone;->preview(Ljava/lang/String;F)V
  :L4
  .line 558
    return v1
.end method

.method private static showCandidate(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 5
  .line 638
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->label(Lcom/innioasis/y1/activity/SettingActivity;)Ljava/lang/String;
    move-result-object v0
  .line 639
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object v1, v1, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 640
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
    move-result-object p0
  .line 641
    if-nez p0, :L0
    return-void
  :L0
  .line 642
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 643
    sget-object v0, Lcom/innioasis/ipp/Tone;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Tone;->blink:Lcom/innioasis/ipp/Tone$Blink;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 644
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 645
    new-instance v1, Lcom/innioasis/ipp/Tone$Blink;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Tone$Blink;-><init>(Landroid/widget/TextView;)V
    sput-object v1, Lcom/innioasis/ipp/Tone;->blink:Lcom/innioasis/ipp/Tone$Blink;
  .line 646
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 647
    return-void
.end method

.method private static sound(Landroid/content/Context;)Ljava/lang/String;
  .registers 9
  .line 312
    const-string v0, "key_tone_sound"
    const-string v1, ""
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 313
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v0
  .line 314
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 315
    sget-object v3, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
    if-eqz v3, :L1
    sget-object v3, Lcom/innioasis/ipp/Tone;->soundFor:Ljava/lang/String;
    invoke-virtual { p0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L1
    sget-object v3, Lcom/innioasis/ipp/Tone;->themeFor:Ljava/lang/String;
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Tone;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    sget-boolean v3, Lcom/innioasis/ipp/Tone;->recheck:Z
    if-nez v3, :L1
    sget-boolean v3, Lcom/innioasis/ipp/Tone;->missing:Z
    if-eqz v3, :L0
    sget-wide v3, Lcom/innioasis/ipp/Tone;->triedAt:J
    sub-long v3, v1, v3
    const-wide/16 v5, 2000
    cmp-long v7, v3, v5
    if-gez v7, :L1
  :L0
  .line 317
    sget-object p0, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
    return-object p0
  :L1
  .line 319
    sput-object p0, Lcom/innioasis/ipp/Tone;->soundFor:Ljava/lang/String;
  .line 320
    sput-object v0, Lcom/innioasis/ipp/Tone;->themeFor:Ljava/lang/String;
  .line 321
    sput-wide v1, Lcom/innioasis/ipp/Tone;->triedAt:J
  .line 322
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Tone;->recheck:Z
  .line 323
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Tone;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 324
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    const/4 v3, 1
    if-lez v2, :L2
    const-string v2, "/system/media/audio/ui/Effect_Tick.ogg"
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 325
    if-eqz v2, :L4
    invoke-static { }, Lcom/innioasis/ipp/Theme;->cardMounted()Z
    move-result v4
    if-nez v4, :L4
    const/4 v1, 1
  :L4
    sput-boolean v1, Lcom/innioasis/ipp/Tone;->missing:Z
  .line 326
    if-eqz v2, :L6
    sget-boolean v1, Lcom/innioasis/ipp/Tone;->told:Z
    if-nez v1, :L6
  .line 327
    sput-boolean v3, Lcom/innioasis/ipp/Tone;->told:Z
  .line 328
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "key tone: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\u0001theme"
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L5
    const-string p0, "theme's sound"
  :L5
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " not found, Default for now"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L6
  .line 330
    sget-object p0, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L7
  .line 331
    sput-object v0, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
  .line 332
    invoke-static { }, Lcom/innioasis/ipp/Tone;->worker()Landroid/os/Handler;
    move-result-object p0
    new-instance v0, Lcom/innioasis/ipp/Tone$Job;
    sget-object v1, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
    const/4 v2, 0
    const/4 v3, 2
    invoke-direct { v0, v3, v1, v2 }, Lcom/innioasis/ipp/Tone$Job;-><init>(ILjava/lang/String;F)V
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L7
  .line 334
    sget-object p0, Lcom/innioasis/ipp/Tone;->path:Ljava/lang/String;
    return-object p0
.end method

.method private static soundIds()[Ljava/lang/String;
  .registers 6
  .line 400
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 401
    const-string v1, ""
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 402
    const-string v1, "\u0001theme"
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 403
    invoke-static { }, Lcom/innioasis/ipp/Tone;->dir()Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v1
  .line 404
    if-eqz v1, :L2
  .line 405
    sget-object v2, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;
    invoke-static { v1, v2 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 406
    const/4 v2, 0
  :L0
    array-length v3, v1
    if-ge v2, v3, :L2
  .line 407
    aget-object v3, v1, v2
    invoke-static { v3 }, Lcom/innioasis/ipp/Tone;->audio(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    new-instance v3, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Tone;->dir()Ljava/io/File;
    move-result-object v4
    aget-object v5, v1, v2
    invoke-direct { v3, v4, v5 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L1
    aget-object v3, v1, v2
    invoke-interface { v0, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 406
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 410
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    new-array v1, v1, [Ljava/lang/String;
    invoke-interface { v0, v1 }, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/String;
    return-object v0
.end method

.method private static soundName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 420
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    const p1, 2131821165
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 421
    const-string v0, "\u0001theme"
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const p1, 2131821166
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 422
    const/16 p0, 46
    invoke-virtual { p1, p0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result p0
  .line 423
    if-lez p0, :L2
    const/4 v0, 0
    invoke-virtual { p1, v0, p0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
  :L2
    return-object p1
.end method

.method private static startEdit(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .registers 3
  .line 620
    sput-object p0, Lcom/innioasis/ipp/Tone;->editing:Lcom/innioasis/y1/activity/SettingActivity;
  .line 621
    sput p1, Lcom/innioasis/ipp/Tone;->editRow:I
  .line 622
    const/4 v0, 1
    if-ne p1, v0, :L0
  .line 623
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->volumeIndex(Landroid/content/Context;)I
    move-result p1
    sput p1, Lcom/innioasis/ipp/Tone;->editVal:I
    goto :L1
  :L0
  .line 625
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->seed(Landroid/content/Context;)V
  .line 626
    invoke-static { }, Lcom/innioasis/ipp/Tone;->soundIds()[Ljava/lang/String;
    move-result-object p1
    sput-object p1, Lcom/innioasis/ipp/Tone;->options:[Ljava/lang/String;
  .line 627
    invoke-static { p1 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->currentSound(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1, v0 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    sput p1, Lcom/innioasis/ipp/Tone;->editVal:I
  :L1
  .line 629
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->showCandidate(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 630
    return-void
.end method

.method public static stockWrite(Z)Z
  .registers 2
  .line 141
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Tone;->setOn(Landroid/content/Context;Z)V
  .line 142
    const/4 p0, 0
    return p0
.end method

.method public static sync(Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L4 .. :L10 } :L11
  .registers 9
  .line 111
    const-string v0, "tone_muted"
    if-nez p0, :L0
    return-void
  :L0
  .line 113
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->manager(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v1
  .line 114
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Tone;->enabled(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L1
    const/4 v4, 1
    goto :L2
  :L1
    const/4 v4, 0
  :L2
  .line 115
    invoke-static { p0, v0, v3 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result v5
  :L3
  .line 116
    const-string v6, "key_tone"
    if-nez v4, :L5
    if-nez v5, :L5
  :L4
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/Prefs;->has(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L8
  :L5
    if-nez v4, :L7
    if-eqz v5, :L6
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-static { p0, v6, v2 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L8
  .line 117
    if-eqz v5, :L9
    invoke-static { p0, v0, v3 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L9
  .line 118
    if-eqz v4, :L10
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Tone;->enable(Ljava/lang/Object;Z)V
  :L10
  .line 120
    goto :L12
  :L11
  .line 119
    move-exception v0
  :L12
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->mirror(Landroid/content/Context;)V
  .line 122
    return-void
.end method

.method private static value(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
  .registers 3
  .line 444
    if-nez p1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->on(Landroid/content/Context;)Z
    move-result p1
    if-eqz p1, :L0
    const p1, 2131820546
    goto :L1
  :L0
    const p1, 2131820545
  :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 445
    const/4 v0, 1
    if-ne p1, v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->volumeIndex(Landroid/content/Context;)I
    move-result p0
    add-int/2addr p0, v0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 446
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->currentSound(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Tone;->soundName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static volumeIndex(Landroid/content/Context;)I
  .registers 2
  .line 450
    const-string v0, "key_tone_volume"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 451
    if-ltz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Tone;->GAIN:[F
    array-length v0, v0
    if-lt p0, v0, :L1
  :L0
    const/4 p0, 7
  :L1
    return p0
.end method

.method public static watch(Landroid/content/Context;)V
  .catchall { :L1 .. :L4 } :L5
  .registers 3
  .line 90
    sget-boolean v0, Lcom/innioasis/ipp/Tone;->started:Z
    if-nez v0, :L7
    if-nez p0, :L0
    goto :L7
  :L0
  .line 91
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Tone;->started:Z
  :L1
  .line 93
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
  .line 94
    if-nez v0, :L2
    goto :L3
  :L2
    move-object p0, v0
  :L3
  .line 95
    invoke-static { p0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 96
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->sync(Landroid/content/Context;)V
  .line 97
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->sound(Landroid/content/Context;)Ljava/lang/String;
  .line 98
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Tone$Seed;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Tone$Seed;-><init>(Landroid/content/Context;)V
    const-string p0, "ipp-tone"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L4
  .line 100
    goto :L6
  :L5
  .line 99
    move-exception p0
  :L6
  .line 101
    return-void
  :L7
  .line 90
    return-void
.end method

.method private static declared-synchronized worker()Landroid/os/Handler;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Tone;
    monitor-enter v0
  :L0
  .line 211
    sget-object v1, Lcom/innioasis/ipp/Tone;->worker:Landroid/os/Handler;
    if-nez v1, :L1
  .line 212
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-tone"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 213
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 214
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/Tone;->worker:Landroid/os/Handler;
  :L1
  .line 216
    sget-object v1, Lcom/innioasis/ipp/Tone;->worker:Landroid/os/Handler;
  :L2
    monitor-exit v0
    return-object v1
  :L3
  .line 210
    move-exception v1
    monitor-exit v0
    throw v1
.end method
