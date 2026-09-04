.class public final Lcom/innioasis/ipp/Panel;
.super Ljava/lang/Object;
.source "Panel.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Panel$Kill;
  }
.end annotation

.field private final static CAP:I = 98304

.field private final static DIR:Ljava/lang/String; = "better-Y"

.field private final static SETTLE_MS:J = 6000L

.field private final static USB_KEY:Ljava/lang/String; = "persist.sys.usb.config"

.method private constructor <init>()V
  .registers 1
  .line 56
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(J)V
  .registers 2
  .line 54
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Panel;->sleep(J)V
    return-void
.end method

.method public static adb()V
  .catchall { :L0 .. :L4 } :L5
  .registers 11
  .line 117
    const-string v0, "usb config "
    const-string v1, "persist.sys.usb.config"
    const-string v2, "?"
  :L0
  .line 119
    invoke-static { v1 }, Lcom/innioasis/ipp/Panel;->prop(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 120
    const-string v3, "adb"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :L1
  .line 121
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
  .line 122
    return-void
  :L1
  .line 124
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
  .line 125
    const-string v4, "android.os.SystemProperties"
    invoke-static { v4 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v4
  .line 126
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
  .line 129
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
  .line 132
    goto :L6
  :L5
  .line 130
    move-exception v1
  .line 131
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
  .line 133
    return-void
.end method

.method static card()Ljava/io/File;
  .registers 3
  .line 76
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
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
  .line 82
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 83
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
  .line 296
    nop
  .line 297
    nop
  .line 299
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/lang/ProcessBuilder;
    invoke-direct { v1, p0 }, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V
  .line 300
    const/4 p0, 1
    invoke-virtual { v1, p0 }, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;
  .line 301
    invoke-virtual { v1 }, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    move-result-object p0
  :L1
  .line 302
    invoke-virtual { p0 }, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
  .line 303
    const/16 v1, 8192
    new-array v2, v1, [B
  .line 304
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3, v1 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 305
    const/4 v1, 0
    const/4 v4, 0
  :L2
  .line 306
    invoke-virtual { v0, v2 }, Ljava/io/InputStream;->read([B)I
    move-result v5
    if-lez v5, :L5
  .line 307
    if-lt v4, p1, :L3
    goto :L5
  :L3
  .line 308
    add-int v6, v4, v5
    if-le v6, p1, :L4
    sub-int v5, p1, v4
  :L4
  .line 309
    new-instance v6, Ljava/lang/String;
    const-string v7, "UTF-8"
    invoke-direct { v6, v2, v1, v5, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 310
    add-int/2addr v4, v5
    goto :L2
  :L5
  .line 312
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L6
  .line 317
    if-eqz v0, :L10
  :L7
    invoke-virtual { v0 }, Ljava/io/InputStream;->close()V
  :L8
    goto :L10
  :L9
  .line 318
    move-exception v0
    goto :L11
  :L10
  .line 320
    nop
  :L11
  .line 322
    if-eqz p0, :L15
  :L12
    invoke-virtual { p0 }, Ljava/lang/Process;->destroy()V
  :L13
    goto :L15
  :L14
  .line 323
    move-exception p0
    goto :L16
  :L15
  .line 325
    nop
  :L16
  .line 312
    return-object p1
  :L17
  .line 313
    move-exception p1
    move-object v8, v0
    move-object v0, p0
    move-object p0, v8
    goto :L19
  :L18
    move-exception p1
    move-object p0, v0
  :L19
  .line 314
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
  .line 317
    if-eqz p0, :L24
  :L21
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L22
    goto :L24
  :L23
  .line 318
    move-exception p0
    goto :L25
  :L24
  .line 320
    nop
  :L25
  .line 322
    if-eqz v0, :L29
  :L26
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L27
    goto :L29
  :L28
  .line 323
    move-exception p0
    goto :L30
  :L29
  .line 325
    nop
  :L30
  .line 314
    return-object p1
  :L31
  .line 316
    move-exception p1
  .line 317
    if-eqz p0, :L35
  :L32
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L33
    goto :L35
  :L34
  .line 318
    move-exception p0
    goto :L36
  :L35
  .line 320
    nop
  :L36
  .line 322
    if-eqz v0, :L40
  :L37
    invoke-virtual { v0 }, Ljava/lang/Process;->destroy()V
  :L38
    goto :L40
  :L39
  .line 323
    move-exception p0
    goto :L41
  :L40
  .line 325
    nop
  :L41
  .line 326
    goto :L43
  :L42
    throw p1
  :L43
    goto :L42
.end method

.method private static prop(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L4
  .registers 9
  .line 138
    const-string v0, ""
  :L0
    const-string v1, "android.os.SystemProperties"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 139
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
  .line 140
    if-nez p0, :L2
    goto :L3
  :L2
    move-object v0, p0
  :L3
    return-object v0
  :L4
  .line 141
    move-exception p0
  .line 142
    return-object v0
.end method

.method static read(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L11
  .catchall { :L3 .. :L5 } :L10
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L13 .. :L14 } :L15
  .registers 7
  .line 269
    nop
  .line 271
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 272
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-nez p0, :L1
  .line 281
    nop
  .line 284
    nop
  .line 272
    return-object v0
  :L1
  .line 273
    new-instance p0, Ljava/io/FileInputStream;
    invoke-direct { p0, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 274
    const/16 v1, 512
  :L3
    new-array v1, v1, [B
  .line 275
    invoke-virtual { p0, v1 }, Ljava/io/InputStream;->read([B)I
    move-result v2
  .line 276
    if-gtz v2, :L4
    const-string v0, ""
    goto :L6
  :L4
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    const/4 v5, 0
    invoke-direct { v3, v1, v5, v2, v4 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L5
    move-object v0, v3
  :L6
  .line 281
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L7
  .line 284
    goto :L9
  :L8
  .line 282
    move-exception p0
  :L9
  .line 276
    return-object v0
  :L10
  .line 277
    move-exception v1
    goto :L12
  :L11
    move-exception p0
    move-object p0, v0
  :L12
  .line 278
    nop
  .line 281
    if-eqz p0, :L16
  :L13
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L14
    goto :L16
  :L15
  .line 282
    move-exception p0
    goto :L17
  :L16
  .line 284
    nop
  :L17
  .line 278
    return-object v0
.end method

.method public static report(Landroid/content/Context;)Ljava/io/File;
  .catchall { :L0 .. :L4 } :L11
  .catchall { :L4 .. :L5 } :L10
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L13 .. :L14 } :L15
  .registers 17
  .line 157
    nop
  .line 159
    const/4 v1, 0
  :L0
    new-instance v2, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->dir()Ljava/io/File;
    move-result-object v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "sf_"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ".log"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-direct { v2, v0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 160
    new-instance v0, Ljava/lang/StringBuilder;
    const/16 v3, 4096
    invoke-direct { v0, v3 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 161
    const-string v3, "better-Y "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 10
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 162
    const-string v3, "when    "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    new-instance v5, Ljava/text/SimpleDateFormat;
    const-string v6, "yyyy-MM-dd HH:mm:ss"
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v5, v6, v7 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v6, Ljava/util/Date;
    invoke-direct { v6 }, Ljava/util/Date;-><init>()V
  .line 163
    invoke-virtual { v5, v6 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v5
  .line 162
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 163
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 164
    const-string v3, "uptime  "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { }, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v5
    invoke-virtual { v3, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, " ms\n"
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 165
    const-string v3, "build   "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, " / "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    sget-object v5, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 166
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 167
    const-string v3, "sf pid  "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, "/system/bin/surfaceflinger"
    invoke-static { v5 }, Lcom/innioasis/ipp/Force;->pidOf(Ljava/lang/String;)I
    move-result v5
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 169
    const-string v3, "\n--- /sys/class/graphics/fb0 ---\n"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 173
    const/16 v3, 9
    new-array v5, v3, [Ljava/lang/String;
    const-string v6, "name"
    const/4 v7, 0
    aput-object v6, v5, v7
    const-string v6, "virtual_size"
    const/4 v8, 1
    aput-object v6, v5, v8
    const-string v6, "bits_per_pixel"
    const/4 v9, 2
    aput-object v6, v5, v9
    const-string v6, "stride"
    const/4 v10, 3
    aput-object v6, v5, v10
    const-string v6, "mode"
    const/4 v11, 4
    aput-object v6, v5, v11
    const-string v6, "modes"
    const/4 v12, 5
    aput-object v6, v5, v12
    const-string v6, "state"
    const/4 v13, 6
    aput-object v6, v5, v13
    const-string v6, "blank"
    const/4 v14, 7
    aput-object v6, v5, v14
    const-string v6, "rotate"
    const/16 v14, 8
    aput-object v6, v5, v14
  .line 175
    const/4 v6, 0
  :L1
    if-ge v6, v3, :L3
  .line 176
    new-instance v14, Ljava/lang/StringBuilder;
    invoke-direct { v14 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v15, "/sys/class/graphics/fb0/"
    invoke-virtual { v14, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v14
    aget-object v15, v5, v6
    invoke-virtual { v14, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v14
    invoke-virtual { v14 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v14
    invoke-static { v14 }, Lcom/innioasis/ipp/Panel;->read(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v14
  .line 177
    if-eqz v14, :L2
    aget-object v15, v5, v6
    invoke-virtual { v0, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v15
    const-string v3, " = "
    invoke-virtual { v15, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v14 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v14
    invoke-virtual { v3, v14 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L2
  .line 175
    add-int/lit8 v6, v6, 1
    const/16 v3, 9
    goto :L1
  :L3
  .line 180
    const-string v3, "\n--- dumpsys SurfaceFlinger ---\n"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 181
    new-array v3, v9, [Ljava/lang/String;
    const-string v4, "/system/bin/dumpsys"
    aput-object v4, v3, v7
    const-string v4, "SurfaceFlinger"
    aput-object v4, v3, v8
    const v4, 98304
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 182
    const-string v3, "\n--- logcat -d -v time (tail) ---\n"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 183
    new-array v3, v13, [Ljava/lang/String;
    const-string v5, "/system/bin/logcat"
    aput-object v5, v3, v7
    const-string v5, "-d"
    aput-object v5, v3, v8
    const-string v5, "-v"
    aput-object v5, v3, v9
    const-string v5, "time"
    aput-object v5, v3, v10
    const-string v5, "-t"
    aput-object v5, v3, v11
    const-string v5, "300"
    aput-object v5, v3, v12
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 185
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L4
  .line 186
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v4, "UTF-8"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 187
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->flush()V
  .line 188
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/FileDescriptor;->sync()V
  :L5
  .line 189
    nop
  :L6
  .line 194
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L7
  .line 197
    goto :L9
  :L8
  .line 195
    move-exception v0
  :L9
  .line 189
    return-object v2
  :L10
  .line 190
    move-exception v0
    goto :L12
  :L11
    move-exception v0
    move-object v3, v1
  :L12
  .line 191
    nop
  .line 194
    if-eqz v3, :L16
  :L13
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L14
    goto :L16
  :L15
  .line 195
    move-exception v0
    goto :L17
  :L16
  .line 197
    nop
  :L17
  .line 191
    return-object v1
.end method

.method public static restart()V
  .registers 3
  .line 215
    const-string v0, "SurfaceFlinger restart from [Tools]"
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->spill(Ljava/lang/String;Ljava/lang/Throwable;)V
  .line 216
    new-instance v0, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Panel$Kill;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/Panel$Kill;-><init>(Lcom/innioasis/ipp/Panel$1;)V
    const-string v1, "ipp-sf-restart"
    invoke-direct { v0, v2, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 217
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 218
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 219
    return-void
.end method

.method private static sleep(J)V
  .catch Ljava/lang/InterruptedException; { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 249
    invoke-static { p0, p1 }, Ljava/lang/Thread;->sleep(J)V
  :L1
  .line 252
    goto :L3
  :L2
  .line 250
    move-exception p0
  .line 251
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/Thread;->interrupt()V
  :L3
  .line 253
    return-void
.end method

.method static stamp()Ljava/lang/String;
  .registers 3
  .line 256
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

.method public static usb()Ljava/lang/String;
  .registers 2
  .line 148
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
  .line 261
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
  .line 262
    move-exception p0
  .line 263
    return-object v0
.end method
