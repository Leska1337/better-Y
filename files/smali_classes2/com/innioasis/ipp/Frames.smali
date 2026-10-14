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

.field private static count:I

.field private static lastNanos:J

.field private static parts:Ljava/lang/StringBuilder;

.field private static startAt:J

.field private static tick:Lcom/innioasis/ipp/Frames$Tick;

.field private static what:Ljava/lang/String;

.field private static worst:J

.method private constructor <init>()V
  .registers 1
  .line 13
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
  .registers 1
  .line 11
    sget-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 11
    sget-wide v0, Lcom/innioasis/ipp/Frames;->startAt:J
    return-wide v0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 11
    sget-wide v0, Lcom/innioasis/ipp/Frames;->lastNanos:J
    return-wide v0
.end method

.method static synthetic access$202(J)J
  .registers 2
  .line 11
    sput-wide p0, Lcom/innioasis/ipp/Frames;->lastNanos:J
    return-wide p0
.end method

.method static synthetic access$300()J
  .registers 2
  .line 11
    sget-wide v0, Lcom/innioasis/ipp/Frames;->worst:J
    return-wide v0
.end method

.method static synthetic access$302(J)J
  .registers 2
  .line 11
    sput-wide p0, Lcom/innioasis/ipp/Frames;->worst:J
    return-wide p0
.end method

.method static synthetic access$408()I
  .registers 2
  .line 11
    sget v0, Lcom/innioasis/ipp/Frames;->count:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Frames;->count:I
    return v0
.end method

.method public static part(Ljava/lang/String;J)V
  .registers 5
  .line 45
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
  .line 46
    return-void
.end method

.method public static start(Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    if-nez v0, :L1
    new-instance v0, Lcom/innioasis/ipp/Frames$Tick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Frames$Tick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    goto :L2
  :L1
  .line 32
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L2
  .line 33
    sput-object p0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
  .line 34
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Frames;->startAt:J
  .line 35
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Frames;->lastNanos:J
  .line 36
    sput-wide v0, Lcom/innioasis/ipp/Frames;->worst:J
  .line 37
    const/4 p0, 0
    sput p0, Lcom/innioasis/ipp/Frames;->count:I
  .line 38
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/Frames;->parts:Ljava/lang/StringBuilder;
  .line 39
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object v0, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { p0, v0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 41
    goto :L5
  :L4
  .line 40
    move-exception p0
  :L5
  .line 42
    return-void
.end method

.method public static stop()V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  :L0
  .line 50
    sget-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    if-nez v0, :L1
    return-void
  :L1
  .line 51
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->tick:Lcom/innioasis/ipp/Frames$Tick;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 52
    sget-wide v0, Lcom/innioasis/ipp/Frames;->worst:J
    const-wide/16 v2, 50
    cmp-long v4, v0, v2
    if-ltz v4, :L2
  .line 53
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "slow: frames "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " worst "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v1, Lcom/innioasis/ipp/Frames;->worst:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/Frames;->count:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " frames in "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 54
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Frames;->startAt:J
    sub-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Frames;->parts:Ljava/lang/StringBuilder;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 53
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L2
  .line 56
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Frames;->what:Ljava/lang/String;
  :L3
  .line 58
    goto :L5
  :L4
  .line 57
    move-exception v0
  :L5
  .line 59
    return-void
.end method
