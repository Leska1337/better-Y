.class public final Lcom/innioasis/ipp/Frames;
.super Ljava/lang/Object;
.source "Frames.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Frames$Tick;
  }
.end annotation

.field private final static GIVE_UP_MS:J = 3000L

.field private final static SLOW_MS:J = 50L

.field private static always:Z

.field private static count:I

.field private static gaps:Ljava/lang/StringBuilder;

.field private static lastCpu:J

.field private static lastNanos:J

.field private static parts:Ljava/lang/StringBuilder;

.field private static startAt:J

.field private static tick:Lcom/innioasis/ipp/Frames$Tick;

.field private static what:Ljava/lang/String;

.field private static worst:J

.method private constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
  .registers 1
  .line 13
    sget-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 13
    sget-wide v0, Lcom/innioasis/ipp/Frames;->startAt:J
    return-wide v0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 13
    sget-wide v0, Lcom/innioasis/ipp/Frames;->lastNanos:J
    return-wide v0
.end method

.method static synthetic access$202(J)J
  .registers 2
  .line 13
    sput-wide p0, Lcom/innioasis/ipp/Frames;->lastNanos:J
    return-wide p0
.end method

.method static synthetic access$300()J
  .registers 2
  .line 13
    sget-wide v0, Lcom/innioasis/ipp/Frames;->worst:J
    return-wide v0
.end method

.method static synthetic access$302(J)J
  .registers 2
  .line 13
    sput-wide p0, Lcom/innioasis/ipp/Frames;->worst:J
    return-wide p0
.end method

.method static synthetic access$408()I
  .registers 2
  .line 13
    sget v0, Lcom/innioasis/ipp/Frames;->count:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Frames;->count:I
    return v0
.end method

.method public static part(Ljava/lang/String;J)V
  .registers 5
  .line 58
    sget-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Frames;->parts:Ljava/lang/StringBuilder;
    const-string v1, ", "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v0, 32
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, p1
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  :L0
  .line 59
    return-void
.end method

.method public static start(Ljava/lang/String;)V
  .registers 2
  .line 36
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 37
    return-void
.end method

.method public static start(Ljava/lang/String;Z)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 42
    sput-boolean p1, Lcom/innioasis/ipp/Frames;->always:Z
  .line 43
    sget-object p1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    if-nez p1, :L1
    new-instance p1, Lcom/innioasis/ipp/Frames$Tick;
    invoke-direct { p1 }, Lcom/innioasis/ipp/Frames$Tick;-><init>()V
    sput-object p1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    goto :L2
  :L1
  .line 44
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    sget-object v0, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { p1, v0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L2
  .line 45
    sput-object p0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
  .line 46
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p0
    sput-wide p0, Lcom/innioasis/ipp/Frames;->startAt:J
  .line 47
    const-wide/16 p0, 0
    sput-wide p0, Lcom/innioasis/ipp/Frames;->lastNanos:J
  .line 48
    sput-wide p0, Lcom/innioasis/ipp/Frames;->worst:J
  .line 49
    const/4 p0, 0
    sput p0, Lcom/innioasis/ipp/Frames;->count:I
  .line 50
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/Frames;->parts:Ljava/lang/StringBuilder;
  .line 51
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/Frames;->gaps:Ljava/lang/StringBuilder;
  .line 52
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 54
    goto :L5
  :L4
  .line 53
    move-exception p0
  :L5
  .line 55
    return-void
.end method

.method public static stop()V
  .catchall { :L0 .. :L8 } :L9
  .registers 8
  :L0
  .line 63
    sget-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    if-nez v0, :L1
    return-void
  :L1
  .line 64
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 65
    sget-wide v0, Lcom/innioasis/ipp/Frames;->worst:J
    const-wide/16 v2, 50
    cmp-long v4, v0, v2
    if-gez v4, :L2
    sget-boolean v0, Lcom/innioasis/ipp/Frames;->always:Z
    if-eqz v0, :L7
  :L2
  .line 66
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v4, Lcom/innioasis/ipp/Frames;->startAt:J
    sub-long/2addr v0, v4
  .line 67
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    sget-wide v5, Lcom/innioasis/ipp/Frames;->worst:J
    cmp-long v7, v5, v2
    if-ltz v7, :L3
    const-string v2, "slow: frames "
    goto :L4
  :L3
    const-string v2, "frames "
  :L4
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " worst "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v3, Lcom/innioasis/ipp/Frames;->worst:J
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms, "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget v3, Lcom/innioasis/ipp/Frames;->count:I
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " frames in "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms, mean "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 69
    sget v3, Lcom/innioasis/ipp/Frames;->count:I
    if-lez v3, :L5
    int-to-long v3, v3
    div-long/2addr v0, v3
    goto :L6
  :L5
    const-wide/16 v0, 0
  :L6
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->parts:Ljava/lang/StringBuilder;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ""
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 71
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L7
  .line 74
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
  :L8
  .line 76
    goto :L10
  :L9
  .line 75
    move-exception v0
  :L10
  .line 77
    return-void
.end method
