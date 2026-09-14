.class public final Lcom/innioasis/ipp/Panel;
.super Ljava/lang/Object;
.source "Panel.java"

.field private final static DIR:Ljava/lang/String; = "better-Y"

.field private final static USB_KEY:Ljava/lang/String; = "persist.sys.usb.config"

.method private constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static adb()V
  .catchall { :L0 .. :L4 } :L5
  .registers 11
  .line 103
    const-string v0, "usb config "
    const-string v1, "persist.sys.usb.config"
    const-string v2, "?"
  :L0
  .line 105
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 106
    const-string v3, "adb"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :L1
  .line 107
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
  .line 108
    return-void
  :L1
  .line 110
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
  .line 111
    const-string v4, "android.os.SystemProperties"
    invoke-static { v4 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v4
  .line 112
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
  .line 115
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
  .line 118
    goto :L6
  :L5
  .line 116
    move-exception v1
  .line 117
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
  .line 119
    return-void
.end method

.method static backups()Ljava/io/File;
  .registers 1
  .line 62
    const-string v0, "backup"
    invoke-static { v0 }, Lcom/innioasis/ipp/Panel;->sub(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
    return-object v0
.end method

.method static card()Ljava/io/File;
  .registers 3
  .line 38
    new-instance v0, Ljava/io/File;
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    const-string v2, "better-Y"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method static dir()Ljava/io/File;
  .registers 2
  .line 43
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
  .line 44
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 45
    return-object v0
.end method

.method static exec([Ljava/lang/String;I)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L1 .. :L6 } :L17
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L19 .. :L20 } :L31
  .catchall { :L21 .. :L22 } :L23
  .catchall { :L26 .. :L27 } :L28
  .catchall { :L32 .. :L33 } :L34
  .catchall { :L37 .. :L38 } :L39
  .registers 11
  .line 155
    nop
  .line 156
    nop
  .line 158
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/lang/ProcessBuilder;
    invoke-direct { v1, p0 }, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V
  .line 159
    const/4 p0, 1
    invoke-virtual { v1, p0 }, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;
  .line 160
    invoke-virtual { v1 }, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    move-result-object p0
  :L1
  .line 161
    invoke-virtual { p0 }, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
  .line 162
    const/16 v1, 8192
    new-array v2, v1, [B
  .line 163
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3, v1 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 164
    const/4 v1, 0
    const/4 v4, 0
  :L2
  .line 165
    invoke-virtual { v0, v2 }, Ljava/io/InputStream;->read([B)I
    move-result v5
    if-lez v5, :L5
  .line 166
    if-lt v4, p1, :L3
    goto :L5
  :L3
  .line 167
    add-int v6, v4, v5
    if-le v6, p1, :L4
    sub-int v5, p1, v4
  :L4
  .line 168
    new-instance v6, Ljava/lang/String;
    const-string v7, "UTF-8"
    invoke-direct { v6, v2, v1, v5, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 169
    add-int/2addr v4, v5
    goto :L2
  :L5
  .line 171
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L6
  .line 176
    if-eqz v0, :L10
  :L7
    invoke-virtual { v0 }, Ljava/io/InputStream;->close()V
  :L8
    goto :L10
  :L9
  .line 177
    move-exception v0
    goto :L11
  :L10
  .line 179
    nop
  :L11
  .line 181
    if-eqz p0, :L15
  :L12
    invoke-virtual { p0 }, Ljava/lang/Process;->destroy()V
  :L13
    goto :L15
  :L14
  .line 182
    move-exception p0
    goto :L16
  :L15
  .line 184
    nop
  :L16
  .line 171
    return-object p1
  :L17
  .line 172
    move-exception p1
    move-object v8, v0
    move-object v0, p0
    move-object p0, v8
    goto :L19
  :L18
    move-exception p1
    move-object p0, v0
  :L19
  .line 173
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
  :L20
  .line 176
    if-eqz p0, :L24
  :L21
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L22
    goto :L24
  :L23
  .line 177
    move-exception p0
    goto :L25
  :L24
  .line 179
    nop
  :L25
  .line 181
    if-eqz v0, :L29
  :L26
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L27
    goto :L29
  :L28
  .line 182
    move-exception p0
    goto :L30
  :L29
  .line 184
    nop
  :L30
  .line 173
    return-object p1
  :L31
  .line 175
    move-exception p1
  .line 176
    if-eqz p0, :L35
  :L32
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L33
    goto :L35
  :L34
  .line 177
    move-exception p0
    goto :L36
  :L35
  .line 179
    nop
  :L36
  .line 181
    if-eqz v0, :L40
  :L37
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L38
    goto :L40
  :L39
  .line 182
    move-exception p0
    goto :L41
  :L40
  .line 184
    nop
  :L41
  .line 185
    goto :L43
  :L42
    throw p1
  :L43
    goto :L42
.end method

.method static logs()Ljava/io/File;
  .registers 1
  .line 57
    const-string v0, "logs"
    invoke-static { v0 }, Lcom/innioasis/ipp/Panel;->sub(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
    return-object v0
.end method

.method private static prop(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L4
  .registers 9
  .line 124
    const-string v0, ""
  :L0
    const-string v1, "android.os.SystemProperties"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 125
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
  .line 126
    if-nez p0, :L2
    goto :L3
  :L2
    move-object v0, p0
  :L3
    return-object v0
  :L4
  .line 127
    move-exception p0
  .line 128
    return-object v0
.end method

.method static stamp()Ljava/lang/String;
  .registers 3
  .line 138
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
  .line 67
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 68
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-nez p0, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 69
    return-object v0
.end method

.method public static usb()Ljava/lang/String;
  .registers 2
  .line 134
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
  .line 143
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
  .line 144
    move-exception p0
  .line 145
    return-object v0
.end method
