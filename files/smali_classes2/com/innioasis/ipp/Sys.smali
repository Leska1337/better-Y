.class public final Lcom/innioasis/ipp/Sys;
.super Ljava/lang/Object;
.source "Sys.java"

.field private final static BRIGHTNESS:Ljava/lang/String; = "screen_brightness"

.field private final static BRIGHTNESS_MODE:Ljava/lang/String; = "screen_brightness_mode"

.field private final static PROFILE:Ljava/lang/String; = "mtk_audioprofile_general"

.field private final static SCREEN_OFF:Ljava/lang/String; = "screen_off_timeout"

.method private constructor <init>()V
  .registers 1
  .line 44
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static apply(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L3 .. :L5 } :L11
  .catchall { :L6 .. :L10 } :L11
  .registers 8
  .line 73
    if-eqz p0, :L14
    if-nez p1, :L0
    goto/16 :L14
  :L0
  .line 74
    const-string v0, "\n"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p1
  .line 75
    const/4 v0, 0
    const/4 v1, 0
  :L1
    array-length v2, p1
    if-ge v1, v2, :L13
  .line 76
    aget-object v2, p1, v1
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 77
    const/16 v3, 61
    invoke-virtual { v2, v3 }, Ljava/lang/String;->indexOf(I)I
    move-result v3
  .line 78
    if-gtz v3, :L2
    goto/16 :L12
  :L2
  .line 79
    invoke-virtual { v2, v0, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
  .line 80
    add-int/lit8 v3, v3, 1
    invoke-virtual { v2, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  :L3
  .line 82
    const-string v3, "screen_brightness"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L9
    const-string v3, "screen_brightness_mode"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L9
    const-string v3, "screen_off_timeout"
  .line 83
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    goto :L9
  :L4
  .line 85
    const-string v3, "key_tone"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
  :L5
    const-string v5, "1"
    if-eqz v3, :L7
  :L6
  .line 86
    const-string v3, "setSoundEffectEnabled"
    invoke-virtual { v5, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Sys;->setProfileFlag(Landroid/content/Context;Ljava/lang/String;Z)V
    goto :L10
  :L7
  .line 87
    const-string v3, "key_vibration"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L8
  .line 88
    const-string v3, "setHapticFeedbackEnabled"
    invoke-virtual { v5, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Sys;->setProfileFlag(Landroid/content/Context;Ljava/lang/String;Z)V
    goto :L10
  :L8
  .line 89
    const-string v3, "clock"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L10
  .line 90
    invoke-static { v2 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v2
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Sys;->setClock(Landroid/content/Context;J)V
    goto :L10
  :L9
  .line 84
    invoke-virtual { p0 }, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v3
    invoke-static { v2 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v2
    invoke-static { v3, v4, v2 }, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
  :L10
  .line 94
    goto :L12
  :L11
  .line 92
    move-exception v2
  .line 93
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "restore "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " failed: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L12
  .line 75
    add-int/lit8 v1, v1, 1
    goto/16 :L1
  :L13
  .line 96
    return-void
  :L14
  .line 73
    return-void
.end method

.method private static manager(Landroid/content/Context;)Ljava/lang/Object;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 3
  .line 139
    const-class v0, Landroid/content/Context;
    const-string v1, "AUDIOPROFILE_SERVICE"
    invoke-virtual { v0, v1 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
  .line 140
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 141
    if-nez v0, :L0
    goto :L1
  :L0
    check-cast v0, Ljava/lang/String;
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
  :L1
    return-object v1
.end method

.method private static profileFlag(Landroid/content/Context;Ljava/lang/String;)I
  .catchall { :L0 .. :L3 } :L4
  .registers 8
  .line 114
    const/4 v0, -1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Sys;->manager(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object p0
  .line 115
    if-nez p0, :L1
    return v0
  :L1
  .line 116
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const/4 v2, 1
    new-array v3, v2, [Ljava/lang/Class;
    const-class v4, Ljava/lang/String;
    const/4 v5, 0
    aput-object v4, v3, v5
    invoke-virtual { v1, p1, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 117
    new-array v2, v2, [Ljava/lang/Object;
    const-string v3, "mtk_audioprofile_general"
    aput-object v3, v2, v5
    invoke-virtual { v1, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 118
    instance-of v1, p0, Ljava/lang/Boolean;
    if-nez v1, :L2
    return v0
  :L2
  .line 119
    check-cast p0, Ljava/lang/Boolean;
    invoke-virtual { p0 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result p0
  :L3
    return p0
  :L4
  .line 120
    move-exception p0
  .line 121
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "audioprofile "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v1, " failed: "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 122
    return v0
.end method

.method private static put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .registers 3
  .line 99
    if-ltz p2, :L0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 p1, 61
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 p1, 10
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L0
  .line 100
    return-void
.end method

.method private static setClock(Landroid/content/Context;J)V
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L4 .. :L5 } :L6
  .registers 6
  .line 152
    const-wide/16 v0, 0
    cmp-long v2, p1, v0
    if-gtz v2, :L0
    return-void
  :L0
  .line 154
    const-string v0, "alarm"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/app/AlarmManager;
  .line 155
    if-eqz p0, :L2
  .line 156
    invoke-virtual { p0, p1, p2 }, Landroid/app/AlarmManager;->setTime(J)V
  :L1
  .line 157
    return-void
  :L2
  .line 161
    goto :L4
  :L3
  .line 159
    move-exception p0
  .line 160
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "setTime via AlarmManager failed: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L4
  .line 163
    invoke-static { p1, p2 }, Landroid/os/SystemClock;->setCurrentTimeMillis(J)Z
  :L5
  .line 166
    goto :L7
  :L6
  .line 164
    move-exception p0
  .line 165
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p2, "setCurrentTimeMillis failed: "
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L7
  .line 167
    return-void
.end method

.method private static setProfileFlag(Landroid/content/Context;Ljava/lang/String;Z)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 9
  .line 127
    invoke-static { p0 }, Lcom/innioasis/ipp/Sys;->manager(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object p0
  .line 128
    if-nez p0, :L0
    return-void
  :L0
  .line 129
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const/4 v1, 2
    new-array v2, v1, [Ljava/lang/Class;
    const-class v3, Ljava/lang/String;
    const/4 v4, 0
    aput-object v3, v2, v4
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v5, 1
    aput-object v3, v2, v5
    invoke-virtual { v0, p1, v2 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object p1
  .line 130
    new-array v0, v1, [Ljava/lang/Object;
    const-string v1, "mtk_audioprofile_general"
    aput-object v1, v0, v4
    invoke-static { p2 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object p2
    aput-object p2, v0, v5
    invoke-virtual { p1, p0, v0 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 131
    return-void
.end method

.method static snapshot(Landroid/content/Context;)Ljava/lang/String;
  .registers 4
  .line 58
    new-instance v0, Ljava/lang/StringBuilder;
    const/16 v1, 128
    invoke-direct { v0, v1 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 59
    const-string v1, "screen_brightness"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sys;->sysInt(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Sys;->put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .line 60
    const-string v1, "screen_brightness_mode"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sys;->sysInt(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Sys;->put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .line 61
    const-string v1, "screen_off_timeout"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sys;->sysInt(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Sys;->put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .line 62
    const-string v1, "getSoundEffectEnabled"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sys;->profileFlag(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
    const-string v2, "key_tone"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Sys;->put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .line 63
    const-string v1, "getHapticFeedbackEnabled"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sys;->profileFlag(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    const-string v1, "key_vibration"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Sys;->put(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
  .line 64
    const-string p0, "clock="
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v1, 10
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 65
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static sysInt(Landroid/content/Context;Ljava/lang/String;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 105
    const/4 v0, -1
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    invoke-static { p0, p1, v0 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result p0
  :L1
    return p0
  :L2
  .line 106
    move-exception p0
  .line 107
    return v0
.end method
