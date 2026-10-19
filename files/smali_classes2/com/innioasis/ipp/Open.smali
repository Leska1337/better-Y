.class public final Lcom/innioasis/ipp/Open;
.super Ljava/lang/Object;
.source "Open.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Open$Drawn;
  }
.end annotation

.field private final static KEY_MS:J = 5000L

.field private final static SLOW_MS:J = 400L

.field private static fromAt:J

.field private static keyAt:J

.field private static lastAt:J

.field private static screen:Landroid/app/Activity;

.field private static startAt:J

.field private static steps:Ljava/lang/StringBuilder;

.field private static watching:Z

.method private constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Landroid/app/Activity;
  .registers 1
  .line 15
    sget-object v0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    return-object v0
.end method

.method static synthetic access$002(Landroid/app/Activity;)Landroid/app/Activity;
  .registers 1
  .line 15
    sput-object p0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/StringBuilder;
  .registers 1
  .line 15
    sget-object v0, Lcom/innioasis/ipp/Open;->steps:Ljava/lang/StringBuilder;
    return-object v0
.end method

.method static synthetic access$102(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
  .registers 1
  .line 15
    sput-object p0, Lcom/innioasis/ipp/Open;->steps:Ljava/lang/StringBuilder;
    return-object p0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 15
    sget-wide v0, Lcom/innioasis/ipp/Open;->startAt:J
    return-wide v0
.end method

.method static synthetic access$300()J
  .registers 2
  .line 15
    sget-wide v0, Lcom/innioasis/ipp/Open;->fromAt:J
    return-wide v0
.end method

.method static key(Landroid/view/KeyEvent;)V
  .registers 3
  .line 35
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getEventTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Open;->keyAt:J
  :L0
  .line 36
    return-void
.end method

.method public static lastKey()J
  .registers 2
  .line 40
    sget-wide v0, Lcom/innioasis/ipp/Open;->keyAt:J
    return-wide v0
.end method

.method public static open(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 10
  :L0
  .line 51
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 52
    sput-object p0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
  .line 53
    sput-wide v0, Lcom/innioasis/ipp/Open;->startAt:J
  .line 54
    sput-wide v0, Lcom/innioasis/ipp/Open;->lastAt:J
  .line 55
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/Open;->watching:Z
  .line 56
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/Open;->steps:Ljava/lang/StringBuilder;
  .line 57
    sput-wide v0, Lcom/innioasis/ipp/Open;->fromAt:J
  .line 58
    sget-wide v2, Lcom/innioasis/ipp/Open;->keyAt:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L1
    cmp-long v4, v2, v0
    if-gtz v4, :L1
    sub-long v4, v0, v2
    const-wide/16 v6, 5000
    cmp-long v8, v4, v6
    if-gez v8, :L1
  .line 59
    sput-wide v2, Lcom/innioasis/ipp/Open;->fromAt:J
  .line 60
    const-string v2, ", key "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Open;->keyAt:J
    sub-long/2addr v0, v2
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  :L1
  .line 63
    goto :L3
  :L2
  .line 62
    move-exception p0
  :L3
  .line 64
    return-void
.end method

.method static screen()Landroid/app/Activity;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    return-object v0
.end method

.method public static step(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  :L0
  .line 72
    sget-object v0, Lcom/innioasis/ipp/Open;->steps:Ljava/lang/StringBuilder;
    if-eqz v0, :L5
    sget-object v0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    if-nez v0, :L1
    goto :L5
  :L1
  .line 73
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 74
    sget-object v2, Lcom/innioasis/ipp/Open;->steps:Ljava/lang/StringBuilder;
    const-string v3, ", "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v2, 32
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Open;->lastAt:J
    sub-long v2, v0, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  .line 75
    sput-wide v0, Lcom/innioasis/ipp/Open;->lastAt:J
  .line 76
    sget-boolean p0, Lcom/innioasis/ipp/Open;->watching:Z
    if-eqz p0, :L2
    return-void
  :L2
  .line 77
    sget-object p0, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->peekDecorView()Landroid/view/View;
    move-result-object p0
  .line 78
    if-nez p0, :L3
    return-void
  :L3
  .line 79
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Open;->watching:Z
  .line 80
    invoke-virtual { p0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Open$Drawn;
    sget-object v2, Lcom/innioasis/ipp/Open;->screen:Landroid/app/Activity;
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/ipp/Open$Drawn;-><init>(Landroid/view/View;Landroid/app/Activity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L4
  .line 82
    goto :L7
  :L5
  .line 72
    return-void
  :L6
  .line 81
    move-exception p0
  :L7
  .line 83
    return-void
.end method
