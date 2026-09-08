.class public final Lcom/innioasis/ipp/Tone;
.super Ljava/lang/Object;
.source "Tone.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Tone$Watch;
  }
.end annotation

.field private final static PROFILE:Ljava/lang/String; = "mtk_audioprofile_general"

.field private final static P_RESTORE:Ljava/lang/String; = "tone_muted"

.field private static registered:Z

.method private constructor <init>()V
  .registers 1
  .line 34
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)V
  .registers 1
  .line 32
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->restore(Landroid/content/Context;)V
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;)V
  .registers 1
  .line 32
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->mute(Landroid/content/Context;)V
    return-void
.end method

.method private static enable(Ljava/lang/Object;Z)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 134
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "setSoundEffectEnabled"
    const/4 v3, 2
    new-array v4, v3, [Ljava/lang/Class;
    const-class v5, Ljava/lang/String;
    aput-object v5, v4, v0
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v6, 1
    aput-object v5, v4, v6
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 135
    new-array v2, v3, [Ljava/lang/Object;
    const-string v3, "mtk_audioprofile_general"
    aput-object v3, v2, v0
    invoke-static { p1 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object p1
    aput-object p1, v2, v6
    invoke-virtual { v1, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 136
    return v6
  :L2
  .line 137
    move-exception p0
  .line 138
    return v0
.end method

.method private static enabled(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 7
  .line 124
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
  .line 125
    new-array v2, v3, [Ljava/lang/Object;
    const-string v4, "mtk_audioprofile_general"
    aput-object v4, v2, v0
    invoke-virtual { v1, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 126
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
  .line 127
    move-exception p0
  .line 128
    return v0
.end method

.method private static manager(Landroid/content/Context;)Ljava/lang/Object;
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 114
    const/4 v0, 0
  :L0
    const-class v1, Landroid/content/Context;
    const-string v2, "AUDIOPROFILE_SERVICE"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 115
    invoke-virtual { v1, v0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 116
    instance-of v2, v1, Ljava/lang/String;
    if-eqz v2, :L1
    check-cast v1, Ljava/lang/String;
    invoke-virtual { p0, v1 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 117
    move-exception p0
  .line 118
    return-object v0
.end method

.method private static mute(Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 89
    const-string v0, "tone_muted"
    const/4 v1, 0
  :L0
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :L1
    return-void
  :L1
  .line 90
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->manager(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
  .line 91
    if-eqz v2, :L4
    invoke-static { v2 }, Lcom/innioasis/ipp/Tone;->enabled(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    goto :L4
  :L2
  .line 92
    const/4 v3, 1
    invoke-static { p0, v0, v3 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 93
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Tone;->enable(Ljava/lang/Object;Z)Z
    move-result v2
    if-nez v2, :L3
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L3
  .line 96
    goto :L6
  :L4
  .line 91
    return-void
  :L5
  .line 94
    move-exception p0
  :L6
  .line 97
    return-void
.end method

.method private static restore(Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 102
    const-string v0, "tone_muted"
    const/4 v1, 0
  :L0
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :L1
    return-void
  :L1
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->manager(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
  .line 104
    if-eqz v2, :L4
    const/4 v3, 1
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Tone;->enable(Ljava/lang/Object;Z)Z
    move-result v2
    if-nez v2, :L2
    goto :L4
  :L2
  .line 105
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L3
  .line 108
    goto :L6
  :L4
  .line 104
    return-void
  :L5
  .line 106
    move-exception p0
  :L6
  .line 109
    return-void
.end method

.method public static watch(Landroid/content/Context;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 3
  .line 60
    sget-boolean v0, Lcom/innioasis/ipp/Tone;->registered:Z
    if-nez v0, :L8
    if-nez p0, :L0
    goto :L8
  :L0
  .line 62
    const/4 v0, 1
  :L1
    sput-boolean v0, Lcom/innioasis/ipp/Tone;->registered:Z
  .line 63
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
  .line 64
    if-nez v0, :L2
    goto :L3
  :L2
    move-object p0, v0
  :L3
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 66
    new-instance v0, Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_ON"
    invoke-direct { v0, v1 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 67
    const-string v1, "android.intent.action.SCREEN_OFF"
    invoke-virtual { v0, v1 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 68
    new-instance v1, Lcom/innioasis/ipp/Tone$Watch;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Tone$Watch;-><init>()V
    invoke-virtual { p0, v1, v0 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 71
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-eqz v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->restore(Landroid/content/Context;)V
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Tone;->mute(Landroid/content/Context;)V
  :L5
  .line 74
    goto :L7
  :L6
  .line 72
    move-exception p0
  :L7
  .line 75
    return-void
  :L8
  .line 60
    return-void
.end method
