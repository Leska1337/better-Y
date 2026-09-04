.class public final Lcom/innioasis/ipp/Lyrics;
.super Ljava/lang/Object;
.source "Lyrics.java"

.field private final static ALIASES:[[Ljava/lang/String;

.field private final static UTF8:Ljava/nio/charset/Charset;

.method static constructor <clinit>()V
  .registers 9
  .line 42
    const-string v0, "UTF-8"
    invoke-static { v0 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Lyrics;->UTF8:Ljava/nio/charset/Charset;
  .line 53
    const/4 v0, 7
    new-array v0, v0, [[Ljava/lang/String;
    const/4 v1, 4
    new-array v2, v1, [Ljava/lang/String;
    const-string v3, "MACCYRILLIC"
    const/4 v4, 0
    aput-object v3, v2, v4
    const-string v3, "x-MacCyrillic"
    const/4 v5, 1
    aput-object v3, v2, v5
    const-string v3, "MacCyrillic"
    const/4 v6, 2
    aput-object v3, v2, v6
    const-string v3, "x-mac-cyrillic"
    const/4 v7, 3
    aput-object v3, v2, v7
    aput-object v2, v0, v4
    new-array v2, v1, [Ljava/lang/String;
    const-string v3, "TIS620"
    aput-object v3, v2, v4
    const-string v3, "TIS-620"
    aput-object v3, v2, v5
    const-string v3, "x-TIS620"
    aput-object v3, v2, v6
    const-string v3, "ISO-8859-11"
    aput-object v3, v2, v7
    aput-object v2, v0, v5
    new-array v2, v1, [Ljava/lang/String;
    const-string v3, "IBM855"
    aput-object v3, v2, v4
    aput-object v3, v2, v5
    const-string v3, "cp855"
    aput-object v3, v2, v6
    const-string v3, "x-IBM855"
    aput-object v3, v2, v7
    aput-object v2, v0, v6
    new-array v2, v7, [Ljava/lang/String;
    const-string v3, "IBM866"
    aput-object v3, v2, v4
    aput-object v3, v2, v5
    const-string v3, "cp866"
    aput-object v3, v2, v6
    aput-object v2, v0, v7
    new-array v2, v7, [Ljava/lang/String;
    const-string v3, "EUC-TW"
    aput-object v3, v2, v4
    const-string v8, "x-EUC-TW"
    aput-object v8, v2, v5
    aput-object v3, v2, v6
    aput-object v2, v0, v1
    new-array v1, v1, [Ljava/lang/String;
    const-string v2, "SHIFT_JIS"
    aput-object v2, v1, v4
    const-string v2, "Shift_JIS"
    aput-object v2, v1, v5
    const-string v2, "SJIS"
    aput-object v2, v1, v6
    const-string v2, "windows-31j"
    aput-object v2, v1, v7
    const/4 v2, 5
    aput-object v1, v0, v2
    new-array v1, v7, [Ljava/lang/String;
    const-string v2, "GB18030"
    aput-object v2, v1, v4
    aput-object v2, v1, v5
    const-string v2, "GBK"
    aput-object v2, v1, v6
    const/4 v2, 6
    aput-object v1, v0, v2
    sput-object v0, Lcom/innioasis/ipp/Lyrics;->ALIASES:[[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 40
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static charset(Ljava/io/File;)Ljava/nio/charset/Charset;
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 99
    if-eqz p0, :L6
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v0
    if-nez v0, :L1
    goto :L6
  :L1
  .line 100
    sget-object v0, Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;->INSTANCE:Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Lyrics;->UTF8:Ljava/nio/charset/Charset;
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;->detectCharset(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    move-result-object v0
  .line 101
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "lrc "
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, ": "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    if-nez v0, :L2
    const-string v1, "?"
    goto :L3
  :L2
    invoke-virtual { v0 }, Ljava/nio/charset/Charset;->name()Ljava/lang/String;
    move-result-object v1
  :L3
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 102
    if-nez v0, :L4
    goto :L5
  :L4
    move-object v2, v0
  :L5
    return-object v2
  :L6
  .line 99
    sget-object p0, Lcom/innioasis/ipp/Lyrics;->UTF8:Ljava/nio/charset/Charset;
  :L7
    return-object p0
  :L8
  .line 103
    move-exception p0
  .line 104
    sget-object p0, Lcom/innioasis/ipp/Lyrics;->UTF8:Ljava/nio/charset/Charset;
    return-object p0
.end method

.method public static resolve(Ljava/lang/String;)Ljava/nio/charset/Charset;
  .registers 6
  .line 69
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 70
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 71
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 72
    invoke-static { p0 }, Lcom/innioasis/ipp/Lyrics;->tryName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object v1
  .line 73
    if-eqz v1, :L2
    return-object v1
  :L2
  .line 75
    invoke-virtual { p0 }, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    move-result-object p0
  .line 76
    const/4 v1, 0
    const/4 v2, 0
  :L3
    sget-object v3, Lcom/innioasis/ipp/Lyrics;->ALIASES:[[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L8
  .line 77
    aget-object v3, v3, v2
    aget-object v3, v3, v1
    invoke-virtual { v3, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L4
  .line 76
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 78
    const/4 p0, 1
  :L5
    sget-object v1, Lcom/innioasis/ipp/Lyrics;->ALIASES:[[Ljava/lang/String;
    aget-object v1, v1, v2
    array-length v3, v1
    if-ge p0, v3, :L7
  .line 79
    aget-object v1, v1, p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Lyrics;->tryName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object v1
  .line 80
    if-eqz v1, :L6
    return-object v1
  :L6
  .line 78
    add-int/lit8 p0, p0, 1
    goto :L5
  :L7
  .line 82
    nop
  :L8
  .line 84
    return-object v0
.end method

.method private static tryName(Ljava/lang/String;)Ljava/nio/charset/Charset;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 90
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 91
    move-exception p0
  .line 92
    return-object v0
.end method
