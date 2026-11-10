.class public final Lcom/innioasis/ipp/Panel;
.super Ljava/lang/Object;
.source "Panel.java"

.field private final static DIR:Ljava/lang/String; = "better-Y"

.field private final static USB_KEY:Ljava/lang/String; = "persist.sys.usb.config"

.method private constructor <init>()V
  .registers 1
  .line 21
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static adb()V
  .catchall { :L0 .. :L4 } :L5
  .registers 11
  .line 59
    const-string v0, "usb config "
    const-string v1, "persist.sys.usb.config"
    const-string v2, "?"
  :L0
  .line 61
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 62
    const-string v3, "adb"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :L1
  .line 63
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v3, ", adb already in it"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 64
    return-void
  :L1
  .line 66
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v3
    if-nez v3, :L2
    const-string v3, "mass_storage,adb"
    goto :L3
  :L2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ",adb"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  :L3
  .line 67
    const-string v4, "android.os.SystemProperties"
    invoke-static { v4 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v4
  .line 68
    const-string v5, "set"
    const/4 v6, 2
    new-array v7, v6, [Ljava/lang/Class;
    const-class v8, Ljava/lang/String;
    const/4 v9, 0
    aput-object v8, v7, v9
    const-class v8, Ljava/lang/String;
    const/4 v10, 1
    aput-object v8, v7, v10
    invoke-virtual { v4, v5, v7 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v4
    new-array v5, v6, [Ljava/lang/Object;
    aput-object v1, v5, v9
    aput-object v3, v5, v10
    const/4 v6, 0
    invoke-virtual { v4, v6, v5 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 70
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " -> asked "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ", now "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L4
  .line 73
    goto :L6
  :L5
  .line 71
    move-exception v1
  .line 72
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " failed: "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L6
  .line 74
    return-void
.end method

.method static backups()Ljava/io/File;
  .registers 1
  .line 40
    const-string v0, "backup"
    invoke-static { v0 }, Lcom/innioasis/ipp/Panel;->sub(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
    return-object v0
.end method

.method static card()Ljava/io/File;
  .registers 3
  .line 28
    new-instance v0, Ljava/io/File;
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    const-string v2, "better-Y"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method static exec([Ljava/lang/String;I)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L19
  .catchall { :L2 .. :L7 } :L18
  .catchall { :L8 .. :L9 } :L10
  .catchall { :L13 .. :L14 } :L15
  .catchall { :L20 .. :L21 } :L32
  .catchall { :L22 .. :L23 } :L24
  .catchall { :L27 .. :L28 } :L29
  .catchall { :L33 .. :L34 } :L35
  .catchall { :L38 .. :L39 } :L40
  .registers 11
  .line 111
    invoke-static { }, Lcom/innioasis/ipp/Fm;->busy()Z
    move-result v0
    if-eqz v0, :L0
    const-string p0, "(skipped: FM radio is on, a process started now silences it)\n"
    return-object p0
  :L0
  .line 112
    nop
  .line 113
    nop
  .line 115
    const/4 v0, 0
  :L1
    new-instance v1, Ljava/lang/ProcessBuilder;
    invoke-direct { v1, p0 }, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V
  .line 116
    const/4 p0, 1
    invoke-virtual { v1, p0 }, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;
  .line 117
    sput-boolean p0, Lcom/innioasis/ipp/Fm;->dirty:Z
  .line 118
    invoke-virtual { v1 }, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    move-result-object p0
  :L2
  .line 119
    invoke-virtual { p0 }, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
  .line 120
    const/16 v1, 8192
    new-array v2, v1, [B
  .line 121
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3, v1 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 122
    const/4 v1, 0
    const/4 v4, 0
  :L3
  .line 123
    invoke-virtual { v0, v2 }, Ljava/io/InputStream;->read([B)I
    move-result v5
    if-lez v5, :L6
  .line 124
    if-lt v4, p1, :L4
    goto :L6
  :L4
  .line 125
    add-int v6, v4, v5
    if-le v6, p1, :L5
    sub-int v5, p1, v4
  :L5
  .line 126
    new-instance v6, Ljava/lang/String;
    const-string v7, "UTF-8"
    invoke-direct { v6, v2, v1, v5, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 127
    add-int/2addr v4, v5
    goto :L3
  :L6
  .line 129
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L7
  .line 134
    if-eqz v0, :L11
  :L8
    invoke-virtual { v0 }, Ljava/io/InputStream;->close()V
  :L9
    goto :L11
  :L10
  .line 135
    move-exception v0
    goto :L12
  :L11
  .line 136
    nop
  :L12
  .line 138
    if-eqz p0, :L16
  :L13
    invoke-virtual { p0 }, Ljava/lang/Process;->destroy()V
  :L14
    goto :L16
  :L15
  .line 139
    move-exception p0
    goto :L17
  :L16
  .line 140
    nop
  :L17
  .line 129
    return-object p1
  :L18
  .line 130
    move-exception p1
    move-object v8, v0
    move-object v0, p0
    move-object p0, v8
    goto :L20
  :L19
    move-exception p1
    move-object p0, v0
  :L20
  .line 131
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "(failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v1, ")\n"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L21
  .line 134
    if-eqz p0, :L25
  :L22
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L23
    goto :L25
  :L24
  .line 135
    move-exception p0
    goto :L26
  :L25
  .line 136
    nop
  :L26
  .line 138
    if-eqz v0, :L30
  :L27
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L28
    goto :L30
  :L29
  .line 139
    move-exception p0
    goto :L31
  :L30
  .line 140
    nop
  :L31
  .line 131
    return-object p1
  :L32
  .line 133
    move-exception p1
  .line 134
    if-eqz p0, :L36
  :L33
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L34
    goto :L36
  :L35
  .line 135
    move-exception p0
    goto :L37
  :L36
  .line 136
    nop
  :L37
  .line 138
    if-eqz v0, :L41
  :L38
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L39
    goto :L41
  :L40
  .line 139
    move-exception p0
    goto :L42
  :L41
  .line 140
    nop
  :L42
  .line 141
    goto :L44
  :L43
    throw p1
  :L44
    goto :L43
.end method

.method static logs()Ljava/io/File;
  .registers 1
  .line 36
    const-string v0, "logs"
    invoke-static { v0 }, Lcom/innioasis/ipp/Panel;->sub(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
    return-object v0
.end method

.method private static prop(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L4
  .registers 9
  .line 79
    const-string v0, ""
  :L0
    const-string v1, "android.os.SystemProperties"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 80
    const-string v2, "get"
    const/4 v3, 2
    new-array v4, v3, [Ljava/lang/Class;
    const-class v5, Ljava/lang/String;
    const/4 v6, 0
    aput-object v5, v4, v6
    const-class v5, Ljava/lang/String;
    const/4 v7, 1
    aput-object v5, v4, v7
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
    new-array v2, v3, [Ljava/lang/Object;
    aput-object p0, v2, v6
    aput-object v0, v2, v7
    const/4 p0, 0
    invoke-virtual { v1, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
  :L1
  .line 81
    if-nez p0, :L2
    goto :L3
  :L2
    move-object v0, p0
  :L3
    return-object v0
  :L4
  .line 82
    move-exception p0
  .line 83
    return-object v0
.end method

.method static stamp()Ljava/lang/String;
  .registers 3
  .line 93
    new-instance v0, Ljava/text/SimpleDateFormat;
    const-string v1, "yyyyMMdd_HHmmss"
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v0, v1, v2 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v1, Ljava/util/Date;
    invoke-direct { v1 }, Ljava/util/Date;-><init>()V
    invoke-virtual { v0, v1 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static sub(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 44
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 45
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-nez p0, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 46
    return-object v0
.end method

.method public static usb()Ljava/lang/String;
  .registers 2
  .line 89
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "persist="
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "persist.sys.usb.config"
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " sys="
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "sys.usb.config"
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static version(Landroid/content/Context;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L3
  .registers 3
  .line 98
    const-string v0, "?"
    if-nez p0, :L0
    goto :L2
  :L0
    const v1, 2131821014
  :L1
    invoke-virtual { p0, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 99
    move-exception p0
  .line 100
    return-object v0
.end method
