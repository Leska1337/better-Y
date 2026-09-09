.class public final Lcom/innioasis/ipp/Backup;
.super Ljava/lang/Object;
.source "Backup.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Backup$Action;,
    Lcom/innioasis/ipp/Backup$SaveRun;,
    Lcom/innioasis/ipp/Backup$Load;,
    Lcom/innioasis/ipp/Backup$Noop;,
    Lcom/innioasis/ipp/Backup$Failed;,
    Lcom/innioasis/ipp/Backup$RestoreRun;,
    Lcom/innioasis/ipp/Backup$Start;,
    Lcom/innioasis/ipp/Backup$Go;,
    Lcom/innioasis/ipp/Backup$Saved;
  }
.end annotation

.field private final static DIRS:[Ljava/lang/String;

.field private final static FILES:[Ljava/lang/String;

.field private final static KEEP:I = 5

.field private final static PREFIX:Ljava/lang/String; = "backup_"

.field private final static STAGE:Ljava/lang/String; = "ipp_restore"

.field private final static SUFFIX:Ljava/lang/String; = ".zip"

.field private final static SYS:Ljava/lang/String; = "system.txt"

.field private final static TREES:[Ljava/lang/String;

.field private static progress:Lcom/innioasis/y1/utils/LoadingDialog;

.method static constructor <clinit>()V
  .registers 5
  .line 91
    const/4 v0, 2
    new-array v1, v0, [Ljava/lang/String;
    const-string v2, "shared_prefs"
    const/4 v3, 0
    aput-object v2, v1, v3
    const-string v2, "databases"
    const/4 v4, 1
    aput-object v2, v1, v4
    sput-object v1, Lcom/innioasis/ipp/Backup;->DIRS:[Ljava/lang/String;
  .line 94
    new-array v1, v4, [Ljava/lang/String;
    const-string v2, "files/mmkv"
    aput-object v2, v1, v3
    sput-object v1, Lcom/innioasis/ipp/Backup;->TREES:[Ljava/lang/String;
  .line 97
    new-array v0, v0, [Ljava/lang/String;
    const-string v1, "files/save_state"
    aput-object v1, v0, v3
    const-string v1, "cache/ipp_art.txt"
    aput-object v1, v0, v4
    sput-object v0, Lcom/innioasis/ipp/Backup;->FILES:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 81
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()V
  .registers 0
  .line 79
    invoke-static { }, Lcom/innioasis/ipp/Backup;->close()V
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;)V
  .registers 2
  .line 79
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Backup;->toast(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method static synthetic access$202(Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 1
  .line 79
    sput-object p0, Lcom/innioasis/ipp/Backup;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p0
.end method

.method static synthetic access$300(Landroid/app/Activity;I)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 2
  .line 79
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Backup;->show(Landroid/app/Activity;I)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object p0
    return-object p0
.end method

.method private static addDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 8
  .line 314
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1, p2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 315
    nop
  .line 316
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-eqz v0, :L4
    array-length v3, v0
    if-ge v1, v3, :L4
  .line 317
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-nez v3, :L1
    goto :L3
  :L1
  .line 320
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "-shm"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L2
    goto :L3
  :L2
  .line 321
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "/"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v0, v1
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { p0, p1, v3 }, Lcom/innioasis/ipp/Backup;->addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L3
    add-int/lit8 v2, v2, 1
  :L3
  .line 316
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 323
    return v2
.end method

.method private static addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .catchall { :L1 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .registers 6
  .line 343
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1, p2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 344
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result p1
    if-nez p1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 345
    nop
  .line 347
    const/4 p1, 0
  :L1
    new-instance v1, Ljava/io/BufferedInputStream;
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v1, v2 }, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
  :L2
  .line 348
    new-instance p1, Ljava/util/zip/ZipEntry;
    invoke-direct { p1, p2 }, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, p1 }, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
  .line 349
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Backup;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
  .line 350
    invoke-virtual { p0 }, Ljava/util/zip/ZipOutputStream;->closeEntry()V
  :L3
  .line 351
    nop
  .line 353
    invoke-static { v1 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 351
    const/4 p0, 1
    return p0
  :L4
  .line 353
    move-exception p0
    move-object p1, v1
    goto :L6
  :L5
    move-exception p0
  :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 354
    throw p0
.end method

.method private static addTree(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;I)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 9
  .line 328
    const/4 v0, 4
    const/4 v1, 0
    if-le p3, v0, :L0
    return v1
  :L0
  .line 329
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1, p2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 330
    nop
  .line 331
    const/4 v2, 0
  :L1
    if-eqz v0, :L4
    array-length v3, v0
    if-ge v1, v3, :L4
  .line 332
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "/"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v0, v1
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 333
    aget-object v4, v0, v1
    invoke-virtual { v4 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-eqz v4, :L2
  .line 334
    add-int/lit8 v4, p3, 1
    invoke-static { p0, p1, v3, v4 }, Lcom/innioasis/ipp/Backup;->addTree(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;I)I
    move-result v3
    add-int/2addr v2, v3
    goto :L3
  :L2
  .line 335
    invoke-static { p0, p1, v3 }, Lcom/innioasis/ipp/Backup;->addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L3
  .line 336
    add-int/lit8 v2, v2, 1
  :L3
  .line 331
    add-int/lit8 v1, v1, 1
    goto :L1
  :L4
  .line 339
    return v2
.end method

.method private static applyPrefs(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L19
  .catchall { :L1 .. :L2 } :L18
  .catchall { :L4 .. :L17 } :L18
  .catchall { :L20 .. :L21 } :L22
  .registers 13
  .line 651
    nop
  .line 653
    const/4 v0, 0
    const/4 v1, 0
  :L0
    const-string v2, "shared_prefs/"
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v2
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result v3
    add-int/lit8 v3, v3, -4
    invoke-virtual { p2, v2, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
  .line 654
    invoke-static { }, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;
    move-result-object v3
  .line 655
    new-instance v4, Ljava/io/BufferedInputStream;
    new-instance v5, Ljava/io/FileInputStream;
    new-instance v6, Ljava/io/File;
    invoke-direct { v6, p1, p2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-direct { v5, v6 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v4, v5 }, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
  :L1
  .line 656
    const-string p1, "UTF-8"
    invoke-interface { v3, v4, p1 }, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V
  .line 657
    invoke-virtual { p0, v2, v0 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
  .line 658
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;
  .line 659
    nop
  .line 660
    nop
  .line 661
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    move-result p1
  :L2
    move-object v2, v1
    move-object v5, v2
  :L3
    const/4 v6, 1
    if-eq p1, v6, :L16
  .line 662
    const/4 v6, 3
    const-string v7, "set"
    if-ne p1, v6, :L6
  :L4
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v7, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L6
  .line 663
    if-eqz v2, :L5
    if-eqz v5, :L5
    invoke-interface { p0, v2, v5 }, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;
  :L5
  .line 664
    nop
  .line 665
    nop
  .line 666
    move-object v2, v1
    move-object v5, v2
    goto/16 :L15
  :L6
  .line 668
    const/4 v6, 2
    if-eq p1, v6, :L7
    goto/16 :L15
  :L7
  .line 669
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
    move-result-object p1
  .line 670
    const-string v6, "name"
    invoke-interface { v3, v1, v6 }, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 671
    const-string v8, "value"
    invoke-interface { v3, v1, v8 }, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  .line 672
    const-string v9, "string"
    invoke-virtual { v9, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :L9
  .line 674
    if-eqz v5, :L8
    if-nez v6, :L8
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v5, p1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    goto :L15
  :L8
  .line 675
    if-eqz v6, :L15
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, v6, p1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L15
  :L9
  .line 676
    invoke-virtual { v7, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L10
  .line 677
    nop
  .line 678
    new-instance v5, Ljava/util/HashSet;
    invoke-direct { v5 }, Ljava/util/HashSet;-><init>()V
    move-object v2, v6
    goto :L15
  :L10
  .line 679
    if-eqz v6, :L15
    if-nez v8, :L11
  .line 680
    goto :L15
  :L11
  .line 681
    const-string v7, "boolean"
    invoke-virtual { v7, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L12
  .line 682
    const-string p1, "true"
    invoke-virtual { p1, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    invoke-interface { p0, v6, p1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    goto :L15
  :L12
  .line 683
    const-string v7, "int"
    invoke-virtual { v7, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L13
  .line 684
    invoke-static { v8 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p1
    invoke-interface { p0, v6, p1 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    goto :L15
  :L13
  .line 685
    const-string v7, "long"
    invoke-virtual { v7, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L14
  .line 686
    invoke-static { v8 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v7
    invoke-interface { p0, v6, v7, v8 }, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;
    goto :L15
  :L14
  .line 687
    const-string v7, "float"
    invoke-virtual { v7, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L15
  .line 688
    invoke-static { v8 }, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    move-result p1
    invoke-interface { p0, v6, p1 }, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;
  :L15
  .line 661
    invoke-interface { v3 }, Lorg/xmlpull/v1/XmlPullParser;->next()I
    move-result p1
    goto/16 :L3
  :L16
  .line 691
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result p0
  :L17
  .line 696
    invoke-static { v4 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 691
    return p0
  :L18
  .line 692
    move-exception p0
    move-object v1, v4
    goto :L20
  :L19
    move-exception p0
  :L20
  .line 693
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore prefs "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string p2, " failed: "
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L21
  .line 694
    nop
  .line 696
    invoke-static { v1 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 694
    return v0
  :L22
  .line 696
    move-exception p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 697
    goto :L24
  :L23
    throw p0
  :L24
    goto :L23
.end method

.method static askLoad(Landroid/app/Activity;)V
  .registers 9
  .line 388
    invoke-static { }, Lcom/innioasis/ipp/Backup;->list()[Ljava/io/File;
    move-result-object v0
  .line 389
    array-length v1, v0
    if-nez v1, :L0
  .line 390
    const v0, 2131821121
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Backup;->toast(Landroid/content/Context;Ljava/lang/String;)V
  .line 391
    return-void
  :L0
  .line 393
    array-length v1, v0
    new-array v5, v1, [Ljava/lang/String;
  .line 394
    array-length v1, v0
    new-array v6, v1, [Ljava/lang/String;
  .line 395
    const/4 v1, 0
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 396
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->when(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    aput-object v2, v5, v1
  .line 397
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->length()J
    move-result-wide v2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v2
    aput-object v2, v6, v1
  .line 395
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 399
    new-instance v1, Lcom/innioasis/ipp/BackupDialog;
    const v2, 2131821120
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v4
    new-instance v7, Lcom/innioasis/ipp/Backup$Load;
    invoke-direct { v7, p0, v0 }, Lcom/innioasis/ipp/Backup$Load;-><init>(Landroid/app/Activity;[Ljava/io/File;)V
    move-object v2, v1
    move-object v3, p0
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 400
    invoke-virtual { v1 }, Lcom/innioasis/ipp/BackupDialog;->show()V
  .line 401
    return-void
.end method

.method private static checkpoint(Ljava/io/File;)V
  .catchall { :L0 .. :L1 } :L13
  .catchall { :L1 .. :L2 } :L12
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L8 .. :L9 } :L10
  .catchall { :L14 .. :L15 } :L24
  .catchall { :L16 .. :L17 } :L18
  .catchall { :L21 .. :L22 } :L10
  .catchall { :L25 .. :L26 } :L27
  .catchall { :L30 .. :L31 } :L32
  .registers 7
  .line 289
    nop
  .line 290
    nop
  .line 292
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    invoke-static { v1, v0, v2 }, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;
    move-result-object v1
  :L1
  .line 294
    const-string v2, "PRAGMA wal_checkpoint(TRUNCATE)"
    invoke-virtual { v1, v2, v0 }, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    move-result-object v0
  .line 295
    if-eqz v0, :L2
    invoke-interface { v0 }, Landroid/database/Cursor;->moveToFirst()Z
  :L2
  .line 300
    if-eqz v0, :L6
  :L3
    invoke-interface { v0 }, Landroid/database/Cursor;->close()V
  :L4
    goto :L6
  :L5
  .line 301
    move-exception p0
    goto :L7
  :L6
  .line 303
    nop
  :L7
  .line 305
    if-eqz v1, :L11
  :L8
    invoke-virtual { v1 }, Landroid/database/sqlite/SQLiteDatabase;->close()V
  :L9
    goto :L11
  :L10
  .line 306
    move-exception p0
  .line 309
    goto :L23
  :L11
  .line 308
    goto :L23
  :L12
  .line 296
    move-exception v2
    move-object v5, v1
    move-object v1, v0
    move-object v0, v5
    goto :L14
  :L13
    move-exception v2
    move-object v1, v0
  :L14
  .line 297
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "backup checkpoint "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v3, " failed: "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L15
  .line 300
    if-eqz v1, :L19
  :L16
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L17
    goto :L19
  :L18
  .line 301
    move-exception p0
    goto :L20
  :L19
  .line 303
    nop
  :L20
  .line 305
    if-eqz v0, :L11
  :L21
    invoke-virtual { v0 }, Landroid/database/sqlite/SQLiteDatabase;->close()V
  :L22
    goto :L11
  :L23
  .line 310
    return-void
  :L24
  .line 299
    move-exception p0
  .line 300
    if-eqz v1, :L28
  :L25
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L26
    goto :L28
  :L27
  .line 301
    move-exception v1
    goto :L29
  :L28
  .line 303
    nop
  :L29
  .line 305
    if-eqz v0, :L33
  :L30
    invoke-virtual { v0 }, Landroid/database/sqlite/SQLiteDatabase;->close()V
  :L31
    goto :L33
  :L32
  .line 306
    move-exception v0
    goto :L34
  :L33
  .line 308
    nop
  :L34
  .line 309
    goto :L36
  :L35
    throw p0
  :L36
    goto :L35
.end method

.method private static close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 802
    sget-object v0, Lcom/innioasis/ipp/Backup;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 803
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Backup;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 805
    if-eqz v0, :L3
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L1
    goto :L3
  :L2
  .line 806
    move-exception v0
    goto :L4
  :L3
  .line 808
    nop
  :L4
  .line 809
    return-void
.end method

.method private static closeQuietly(Ljava/io/InputStream;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 772
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L1
    goto :L3
  :L2
  .line 773
    move-exception p0
    goto :L4
  :L3
  .line 775
    nop
  :L4
  .line 776
    return-void
.end method

.method private static closeQuietly(Ljava/io/OutputStream;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 780
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/OutputStream;->close()V
  :L1
    goto :L3
  :L2
  .line 781
    move-exception p0
    goto :L4
  :L3
  .line 783
    nop
  :L4
  .line 784
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 5
  .line 764
    const/16 v0, 8192
    new-array v0, v0, [B
  :L0
  .line 766
    invoke-virtual { p0, v0 }, Ljava/io/InputStream;->read([B)I
    move-result v1
    if-lez v1, :L1
    const/4 v2, 0
    invoke-virtual { p1, v0, v2, v1 }, Ljava/io/OutputStream;->write([BII)V
    goto :L0
  :L1
  .line 767
    invoke-virtual { p1 }, Ljava/io/OutputStream;->flush()V
  .line 768
    return-void
.end method

.method private static dataDir(Landroid/content/Context;)Ljava/io/File;
  .registers 2
  .line 746
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getFilesDir()Ljava/io/File;
    move-result-object p0
  :L1
  .line 747
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v0
  :L3
    return-object v0
.end method

.method private static flushPrefs(Landroid/content/Context;Ljava/io/File;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 263
    new-instance v0, Ljava/io/File;
    const-string v1, "shared_prefs"
    invoke-direct { v0, p1, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p1
  .line 264
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p1, :L5
    array-length v2, p1
    if-ge v1, v2, :L5
  .line 265
    aget-object v2, p1, v1
    invoke-virtual { v2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v2
  .line 266
    aget-object v3, p1, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L4
    const-string v3, ".xml"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L1
    goto :L4
  :L1
  .line 268
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v3
    add-int/lit8 v3, v3, -4
    invoke-virtual { v2, v0, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2, v0 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v2
    invoke-interface { v2 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
    invoke-interface { v2 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L2
  .line 271
    goto :L4
  :L3
  .line 269
    move-exception v2
  :L4
  .line 264
    add-int/lit8 v1, v1, 1
    goto :L0
  :L5
  .line 273
    return-void
.end method

.method static list()[Ljava/io/File;
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 367
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L0
  .line 369
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 370
    const/4 v2, 0
  :L1
    if-eqz v1, :L3
    array-length v3, v1
    if-ge v2, v3, :L3
  .line 371
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
  .line 372
    aget-object v4, v1, v2
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v4
    if-eqz v4, :L2
    const-string v4, "backup_"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    const-string v4, ".zip"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L2
    aget-object v3, v1, v2
    invoke-interface { v0, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L2
  .line 370
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 375
    new-instance v1, Lcom/innioasis/ipp/Diag$NameCmp;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Diag$NameCmp;-><init>()V
    invoke-static { v0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 376
    invoke-static { v0 }, Ljava/util/Collections;->reverse(Ljava/util/List;)V
  :L4
  .line 379
    goto :L6
  :L5
  .line 377
    move-exception v1
  :L6
  .line 380
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    new-array v1, v1, [Ljava/io/File;
    invoke-interface { v0, v1 }, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/io/File;
    return-object v0
.end method

.method private static meta(Landroid/content/Context;)Ljava/lang/String;
  .registers 6
  .line 245
    new-instance v0, Ljava/lang/StringBuilder;
    const/16 v1, 256
    invoke-direct { v0, v1 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 246
    const-string v1, "better-Y "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v1, 10
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 247
    const-string p0, "when     "
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    new-instance v2, Ljava/text/SimpleDateFormat;
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v2, v3, v4 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v3, Ljava/util/Date;
    invoke-direct { v3 }, Ljava/util/Date;-><init>()V
  .line 248
    invoke-virtual { v2, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v2
  .line 247
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 248
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 249
    const-string p0, "build    "
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 250
    const-string p0, "model    "
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 251
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static open(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 9
  .line 112
    if-nez p0, :L0
    return-void
  :L0
  .line 113
    const/4 v0, 2
    new-array v4, v0, [Ljava/lang/String;
    const v0, 2131821118
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/4 v1, 0
    aput-object v0, v4, v1
  .line 114
    const v0, 2131821119
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/4 v1, 1
    aput-object v0, v4, v1
  .line 115
    new-instance v0, Lcom/innioasis/ipp/BackupDialog;
    const/4 v5, 0
    new-instance v6, Lcom/innioasis/ipp/Backup$Action;
    invoke-direct { v6, p0 }, Lcom/innioasis/ipp/Backup$Action;-><init>(Landroid/app/Activity;)V
    move-object v1, v0
    move-object v2, p0
    move-object v3, p1
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BackupDialog;->show()V
  .line 116
    return-void
.end method

.method private static put(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;[B)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Throwable;
    }
  .end annotation
  .registers 4
  .line 358
    new-instance v0, Ljava/util/zip/ZipEntry;
    invoke-direct { v0, p1 }, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
  .line 359
    invoke-virtual { p0, p2 }, Ljava/util/zip/ZipOutputStream;->write([B)V
  .line 360
    invoke-virtual { p0 }, Ljava/util/zip/ZipOutputStream;->closeEntry()V
  .line 361
    return-void
.end method

.method static restore(Landroid/content/Context;Ljava/io/File;)Z
  .catchall { :L1 .. :L2 } :L26
  .catchall { :L2 .. :L4 } :L25
  .catchall { :L5 .. :L6 } :L9
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L7 .. :L11 } :L25
  .registers 12
  .line 570
    invoke-static { p0 }, Lcom/innioasis/ipp/Backup;->dataDir(Landroid/content/Context;)Ljava/io/File;
    move-result-object v0
  .line 571
    const/4 v1, 0
    if-eqz v0, :L28
    if-eqz p1, :L28
    invoke-virtual { p1 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-nez v2, :L0
    goto/16 :L28
  :L0
  .line 572
    new-instance v2, Ljava/io/File;
    const-string v3, "ipp_restore"
    invoke-direct { v2, v0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 573
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->wipe(Ljava/io/File;)V
  .line 574
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 575
    nop
  .line 577
    const/4 v4, 0
  :L1
    new-instance v5, Ljava/util/zip/ZipInputStream;
    new-instance v6, Ljava/io/BufferedInputStream;
    new-instance v7, Ljava/io/FileInputStream;
    invoke-direct { v7, p1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v6, v7 }, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    invoke-direct { v5, v6 }, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
  :L2
  .line 579
    invoke-virtual { v5 }, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    move-result-object v6
    if-eqz v6, :L11
  .line 580
    invoke-virtual { v6 }, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;
    move-result-object v7
  .line 581
    invoke-virtual { v6 }, Ljava/util/zip/ZipEntry;->isDirectory()Z
    move-result v6
    if-nez v6, :L2
    invoke-static { v7 }, Lcom/innioasis/ipp/Backup;->wanted(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L3
    goto :L2
  :L3
  .line 582
    new-instance v6, Ljava/io/File;
    invoke-direct { v6, v2, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 583
    invoke-virtual { v6 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v8
  .line 584
    if-eqz v8, :L4
    invoke-virtual { v8 }, Ljava/io/File;->mkdirs()Z
  :L4
  .line 585
    nop
  :L5
  .line 587
    new-instance v8, Ljava/io/BufferedOutputStream;
    new-instance v9, Ljava/io/FileOutputStream;
    invoke-direct { v9, v6 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v8, v9 }, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
  :L6
  .line 588
    invoke-static { v5, v8 }, Lcom/innioasis/ipp/Backup;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
  :L7
  .line 590
    invoke-static { v8 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/OutputStream;)V
  .line 591
    nop
  .line 592
    invoke-interface { v3, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 593
    goto :L2
  :L8
  .line 590
    move-exception p0
    move-object v4, v8
    goto :L10
  :L9
    move-exception p0
  :L10
    invoke-static { v4 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/OutputStream;)V
  .line 591
    throw p0
  :L11
  .line 599
    nop
  .line 600
    invoke-static { v5 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 601
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L12
  .line 602
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->wipe(Ljava/io/File;)V
  .line 603
    return v1
  :L12
  .line 609
    new-instance v4, Ljava/io/File;
    const-string v5, "databases"
    invoke-direct { v4, v0, v5 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v4 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v4
  .line 610
    const/4 v5, 0
  :L13
    if-eqz v4, :L16
    array-length v6, v4
    if-ge v5, v6, :L16
  .line 611
    aget-object v6, v4, v5
    invoke-virtual { v6 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v6
  .line 612
    const-string v7, "-wal"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L14
    const-string v7, "-shm"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L15
  :L14
    aget-object v6, v4, v5
    invoke-virtual { v6 }, Ljava/io/File;->delete()Z
  :L15
  .line 610
    add-int/lit8 v5, v5, 1
    goto :L13
  :L16
  .line 615
    nop
  .line 616
    const/4 v4, 0
    const/4 v5, 0
  :L17
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v6
    const-string v7, "system.txt"
    if-ge v4, v6, :L22
  .line 617
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 618
    invoke-virtual { v7, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L18
    goto :L21
  :L18
  .line 619
    const-string v7, "shared_prefs/"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L19
  .line 620
    invoke-static { p0, v2, v6 }, Lcom/innioasis/ipp/Backup;->applyPrefs(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L21
    add-int/lit8 v5, v5, 1
    goto :L21
  :L19
  .line 623
    new-instance v7, Ljava/io/File;
    invoke-direct { v7, v2, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 624
    new-instance v8, Ljava/io/File;
    invoke-direct { v8, v0, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 625
    invoke-virtual { v8 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v6
  .line 626
    if-eqz v6, :L20
    invoke-virtual { v6 }, Ljava/io/File;->mkdirs()Z
  :L20
  .line 627
    invoke-virtual { v8 }, Ljava/io/File;->delete()Z
  .line 628
    invoke-virtual { v7, v8 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result v6
    if-eqz v6, :L21
    add-int/lit8 v5, v5, 1
  :L21
  .line 616
    add-int/lit8 v4, v4, 1
    goto :L17
  :L22
  .line 631
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, v2, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 632
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v4
    if-eqz v4, :L23
  .line 633
    invoke-static { v0 }, Lcom/innioasis/ipp/Backup;->text(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Sys;->apply(Landroid/content/Context;Ljava/lang/String;)V
  .line 634
    add-int/lit8 v5, v5, 1
  :L23
  .line 637
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->wipe(Ljava/io/File;)V
  .line 638
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "restore: "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " of "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " item(s) from "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 639
    if-lez v5, :L24
    const/4 v1, 1
  :L24
    return v1
  :L25
  .line 594
    move-exception p0
    move-object v4, v5
    goto :L27
  :L26
    move-exception p0
  :L27
  .line 595
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "restore unpack failed: "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 596
    invoke-static { v4 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 597
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->wipe(Ljava/io/File;)V
  .line 598
    return v1
  :L28
  .line 571
    return v1
.end method

.method static save(Landroid/content/Context;)Ljava/io/File;
  .catchall { :L4 .. :L5 } :L16
  .catchall { :L5 .. :L13 } :L15
  .registers 10
  .line 200
    const-string v0, "UTF-8"
    invoke-static { p0 }, Lcom/innioasis/ipp/Backup;->dataDir(Landroid/content/Context;)Ljava/io/File;
    move-result-object v1
  .line 201
    const/4 v2, 0
    if-nez v1, :L0
    return-object v2
  :L0
  .line 202
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Backup;->flushPrefs(Landroid/content/Context;Ljava/io/File;)V
  .line 203
    new-instance v3, Ljava/io/File;
    const-string v4, "databases"
    invoke-direct { v3, v1, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v3
  .line 204
    const/4 v4, 0
    const/4 v5, 0
  :L1
    if-eqz v3, :L3
    array-length v6, v3
    if-ge v5, v6, :L3
  .line 206
    aget-object v6, v3, v5
    invoke-virtual { v6 }, Ljava/io/File;->isFile()Z
    move-result v6
    if-eqz v6, :L2
    aget-object v6, v3, v5
    invoke-virtual { v6 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v6
    const/16 v7, 45
    invoke-virtual { v6, v7 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
    if-gez v6, :L2
    aget-object v6, v3, v5
    invoke-static { v6 }, Lcom/innioasis/ipp/Backup;->checkpoint(Ljava/io/File;)V
  :L2
  .line 204
    add-int/lit8 v5, v5, 1
    goto :L1
  :L3
  .line 209
    new-instance v3, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->dir()Ljava/io/File;
    move-result-object v5
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "backup_"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v8, ".zip"
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-direct { v3, v5, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 210
    nop
  .line 211
    nop
  :L4
  .line 213
    new-instance v5, Ljava/util/zip/ZipOutputStream;
    new-instance v6, Ljava/io/BufferedOutputStream;
    new-instance v8, Ljava/io/FileOutputStream;
    invoke-direct { v8, v3 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v6, v8 }, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    invoke-direct { v5, v6 }, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
  :L5
  .line 214
    const-string v6, "meta.txt"
    invoke-static { p0 }, Lcom/innioasis/ipp/Backup;->meta(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v8, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v8
    invoke-static { v5, v6, v8 }, Lcom/innioasis/ipp/Backup;->put(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;[B)V
  .line 215
    const-string v6, "system.txt"
    invoke-static { p0 }, Lcom/innioasis/ipp/Sys;->snapshot(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-static { v5, v6, p0 }, Lcom/innioasis/ipp/Backup;->put(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;[B)V
  .line 216
    nop
  .line 217
    const/4 p0, 1
    const/4 v0, 0
  :L6
    sget-object v6, Lcom/innioasis/ipp/Backup;->DIRS:[Ljava/lang/String;
    array-length v8, v6
    if-ge v0, v8, :L7
    aget-object v6, v6, v0
    invoke-static { v5, v1, v6 }, Lcom/innioasis/ipp/Backup;->addDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I
    move-result v6
    add-int/2addr p0, v6
    add-int/lit8 v0, v0, 1
    goto :L6
  :L7
  .line 218
    const/4 v0, 0
  :L8
    sget-object v6, Lcom/innioasis/ipp/Backup;->TREES:[Ljava/lang/String;
    array-length v8, v6
    if-ge v0, v8, :L9
    aget-object v6, v6, v0
    invoke-static { v5, v1, v6, v4 }, Lcom/innioasis/ipp/Backup;->addTree(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;I)I
    move-result v6
    add-int/2addr p0, v6
    add-int/lit8 v0, v0, 1
    goto :L8
  :L9
  .line 219
    nop
  :L10
    sget-object v0, Lcom/innioasis/ipp/Backup;->FILES:[Ljava/lang/String;
    array-length v6, v0
    if-ge v4, v6, :L12
  .line 220
    aget-object v0, v0, v4
    invoke-static { v5, v1, v0 }, Lcom/innioasis/ipp/Backup;->addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L11
    add-int/lit8 p0, p0, 1
  :L11
  .line 219
    add-int/lit8 v4, v4, 1
    goto :L10
  :L12
  .line 222
    invoke-virtual { v5 }, Ljava/util/zip/ZipOutputStream;->finish()V
  :L13
  .line 228
    nop
  .line 229
    invoke-static { v5 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/OutputStream;)V
  .line 230
    if-nez p0, :L14
  .line 231
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  .line 232
    return-object v2
  :L14
  .line 234
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "backup saved: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " file(s), "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v3 }, Ljava/io/File;->length()J
    move-result-wide v0
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " B"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 235
    const/4 p0, 5
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Diag;->keepNewest(Ljava/lang/String;I)V
  .line 236
    return-object v3
  :L15
  .line 223
    move-exception p0
    goto :L17
  :L16
    move-exception p0
    move-object v5, v2
  :L17
  .line 224
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "backup write failed: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 225
    invoke-static { v5 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/OutputStream;)V
  .line 226
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  .line 227
    return-object v2
.end method

.method private static show(Landroid/app/Activity;I)Lcom/innioasis/y1/utils/LoadingDialog;
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  :L0
  .line 792
    new-instance v6, Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    const-string v3, ""
    const v4, 2131886360
    new-instance v5, Lcom/innioasis/ipp/Backup$Noop;
    invoke-direct { v5 }, Lcom/innioasis/ipp/Backup$Noop;-><init>()V
    move-object v0, v6
    move-object v1, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
  .line 794
    invoke-virtual { v6 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 795
    return-object v6
  :L2
  .line 796
    move-exception p0
  .line 797
    const/4 p0, 0
    return-object p0
.end method

.method static startSave(Landroid/app/Activity;)V
  .registers 3
  .line 139
    const v0, 2131821122
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Backup;->show(Landroid/app/Activity;I)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Backup;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 140
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Backup$SaveRun;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Backup$SaveRun;-><init>(Landroid/app/Activity;)V
    const-string p0, "ipp-backup"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 141
    const/4 p0, 1
    invoke-virtual { v0, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 142
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 143
    return-void
.end method

.method private static text(Ljava/io/File;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L5 .. :L6 } :L7
  .registers 4
  .line 702
    nop
  .line 704
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/BufferedInputStream;
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    invoke-direct { v1, v2 }, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
  :L1
  .line 705
    new-instance p0, Ljava/io/ByteArrayOutputStream;
    invoke-direct { p0 }, Ljava/io/ByteArrayOutputStream;-><init>()V
  .line 706
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Backup;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
  .line 707
    new-instance v0, Ljava/lang/String;
    invoke-virtual { p0 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
    const-string v2, "UTF-8"
    invoke-direct { v0, p0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  :L2
  .line 711
    invoke-static { v1 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 707
    return-object v0
  :L3
  .line 708
    move-exception p0
    move-object v0, v1
    goto :L5
  :L4
    move-exception p0
  :L5
  .line 709
    const-string p0, ""
  :L6
  .line 711
    invoke-static { v0 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 709
    return-object p0
  :L7
  .line 711
    move-exception p0
    invoke-static { v0 }, Lcom/innioasis/ipp/Backup;->closeQuietly(Ljava/io/InputStream;)V
  .line 712
    throw p0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 3
  .line 821
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 822
    const/4 v0, 1
  :L1
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 823
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object p1
  .line 824
    if-nez p1, :L2
    const/4 p1, 0
    goto :L3
  :L2
    const v0, 16908299
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L3
  .line 825
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L4
    check-cast p1, Landroid/widget/TextView;
    const/16 v0, 17
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 826
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 829
    goto :L7
  :L6
  .line 827
    move-exception p0
  :L7
  .line 830
    return-void
  :L8
  .line 821
    return-void
.end method

.method private static wanted(Ljava/lang/String;)Z
  .registers 6
  .line 722
    const/4 v0, 0
    if-eqz p0, :L14
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L0
    goto/16 :L14
  :L0
  .line 723
    const-string v1, ".."
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-gez v1, :L13
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v2, 47
    if-eq v1, v2, :L13
    const/16 v1, 92
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-ltz v1, :L1
    goto/16 :L13
  :L1
  .line 726
    const-string v1, "system.txt"
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const/4 v3, 1
    if-eqz v1, :L2
    return v3
  :L2
  .line 727
    const-string v1, "shared_prefs/"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
    const-string v1, ".xml"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
  .line 728
    const/16 v1, 13
    invoke-virtual { p0, v2, v1 }, Ljava/lang/String;->indexOf(II)I
    move-result p0
    if-gez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 730
    const-string v1, "databases/"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L6
    const-string v1, "-shm"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L6
  .line 731
    const/16 v1, 10
    invoke-virtual { p0, v2, v1 }, Ljava/lang/String;->indexOf(II)I
    move-result p0
    if-gez p0, :L5
    const/4 v0, 1
  :L5
    return v0
  :L6
  .line 733
    const/4 v1, 0
  :L7
    sget-object v2, Lcom/innioasis/ipp/Backup;->TREES:[Ljava/lang/String;
    array-length v4, v2
    if-ge v1, v4, :L9
  .line 734
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v2, v2, v1
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, "/"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L8
    return v3
  :L8
  .line 733
    add-int/lit8 v1, v1, 1
    goto :L7
  :L9
  .line 736
    const/4 v1, 0
  :L10
    sget-object v2, Lcom/innioasis/ipp/Backup;->FILES:[Ljava/lang/String;
    array-length v4, v2
    if-ge v1, v4, :L12
  .line 737
    aget-object v2, v2, v1
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L11
    return v3
  :L11
  .line 736
    add-int/lit8 v1, v1, 1
    goto :L10
  :L12
  .line 739
    return v0
  :L13
  .line 724
    return v0
  :L14
  .line 722
    return v0
.end method

.method private static when(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 7
  .line 410
    const-string v0, "-"
  :L0
    const-string v1, "backup_"
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    const-string v3, ".zip"
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v3
    sub-int/2addr v2, v3
    invoke-virtual { p0, v1, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
  .line 411
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 15
    if-lt v2, v3, :L2
    const/16 v2, 8
    invoke-virtual { v1, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v3
    const/16 v4, 95
    if-ne v3, v4, :L2
  .line 412
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 0
    const/4 v5, 4
    invoke-virtual { v1, v4, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/4 v4, 6
    invoke-virtual { v1, v5, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v1, v4, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 413
    const/16 v2, 11
    const/16 v3, 9
    invoke-virtual { v1, v3, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, ":"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v3, 13
    invoke-virtual { v1, v2, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 412
    return-object p0
  :L2
  .line 417
    goto :L4
  :L3
  .line 415
    move-exception v0
  :L4
  .line 418
    return-object p0
.end method

.method private static wipe(Ljava/io/File;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  :L0
  .line 752
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 753
    const/4 v1, 0
  :L1
    if-eqz v0, :L4
    array-length v2, v0
    if-ge v1, v2, :L4
  .line 754
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-eqz v2, :L2
    aget-object v2, v0, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Backup;->wipe(Ljava/io/File;)V
    goto :L3
  :L2
  .line 755
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  :L3
  .line 753
    add-int/lit8 v1, v1, 1
    goto :L1
  :L4
  .line 757
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L5
  .line 760
    goto :L7
  :L6
  .line 758
    move-exception p0
  :L7
  .line 761
    return-void
.end method
