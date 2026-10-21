.class public final Lcom/innioasis/ipp/Lab;
.super Ljava/lang/Object;
.source "Lab.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Lab$Frame;,
    Lcom/innioasis/ipp/Lab$Reads;
  }
.end annotation

.field private static last:J

.field private static ran:Z

.field private static start:J

.field private static what:Ljava/lang/String;

.field private static whos:I

.method public constructor <init>()V
  .registers 1
  .line 13
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static a0()V
  .registers 1
  .line 30
    const-string v0, "albums"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->begin(Ljava/lang/String;)V
    return-void
.end method

.method public static a1()V
  .registers 1
  .line 31
    const-string v0, "names query"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a2()V
  .registers 1
  .line 32
    const-string v0, "listForView"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a3()V
  .registers 1
  .line 33
    const-string v0, "years"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a4()V
  .registers 1
  .line 34
    const-string v0, "to main + setAlbums"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Lab;->frame()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
  .registers 1
  .line 13
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method private static begin(Ljava/lang/String;)V
  .registers 3
  .line 20
    sput-object p0, Lcom/innioasis/ipp/Lab;->what:Ljava/lang/String;
  .line 21
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Lab;->last:J
    sput-wide v0, Lcom/innioasis/ipp/Lab;->start:J
  .line 22
    return-void
.end method

.method public static f0()V
  .registers 1
  .line 36
    const-string v0, "folders"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->begin(Ljava/lang/String;)V
    return-void
.end method

.method public static f1()V
  .registers 1
  .line 37
    const-string v0, "byParentPath query"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f2()V
  .registers 1
  .line 38
    const-string v0, "filter + exists"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f3()V
  .registers 1
  .line 39
    const-string v0, "listFiles + sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f4()V
  .registers 1
  .line 40
    const-string v0, "build"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f5()V
  .registers 1
  .line 41
    const-string v0, "to main + setItems"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Lab;->frame()V
    return-void
.end method

.method private static frame()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 62
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Lab$Frame;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Lab$Frame;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L1
  .line 64
    goto :L3
  :L2
  .line 63
    move-exception v0
  :L3
  .line 65
    return-void
.end method

.method private static lap(Ljava/lang/String;)V
  .registers 5
  .line 25
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 26
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    sget-object v3, Lcom/innioasis/ipp/Lab;->what:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " +"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Lab;->last:J
    sub-long v2, v0, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " ms ("
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Lab;->start:J
    sub-long v2, v0, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ")"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v2, "ipplab"
    invoke-static { v2, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 27
    sput-wide v0, Lcom/innioasis/ipp/Lab;->last:J
  .line 28
    return-void
.end method

.method static reads()V
  .catchall { :L1 .. :L2 } :L4
  .registers 3
  .line 83
    sget-boolean v0, Lcom/innioasis/ipp/Lab;->ran:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 84
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lab;->ran:Z
  :L1
  .line 86
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/local/tmp/ipplab"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
  :L2
    if-nez v0, :L3
    return-void
  :L3
  .line 89
    nop
  .line 90
    new-instance v0, Lcom/innioasis/ipp/Lab$Reads;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Lab$Reads;-><init>()V
    const-wide/16 v1, 15000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 91
    return-void
  :L4
  .line 87
    move-exception v0
  .line 88
    return-void
.end method

.method public static s(Ljava/lang/String;)V
  .registers 1
  .line 43
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method static who(Ljava/lang/String;)V
  .registers 7
  .line 49
    sget v0, Lcom/innioasis/ipp/Lab;->whos:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Lab;->whos:I
    const/16 v1, 40
    if-le v0, v1, :L0
    return-void
  :L0
  .line 50
    new-instance v0, Ljava/lang/Throwable;
    invoke-direct { v0 }, Ljava/lang/Throwable;-><init>()V
    invoke-virtual { v0 }, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v0
  .line 51
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1, p0 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string p0, " on "
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 52
    const/4 v1, 2
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
    const/16 v2, 9
    if-ge v1, v2, :L2
  .line 53
    const-string v2, " < "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "com.innioasis."
    const-string v5, ""
    invoke-virtual { v3, v4, v5 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 54
    const/16 v3, 46
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 58
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getLineNumber()I
    move-result v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 52
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 56
    const-string v0, "ipplab"
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 57
    return-void
.end method
