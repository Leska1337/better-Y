.class final Lcom/innioasis/ipp/Flow$FadeStart;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "FadeStart"
.end annotation

.field private final static WAIT_MS:J = 600L

.field private after:I

.field private final alphas:Ljava/util/ArrayList;

.field private first:Z

.field private since:J

.field private starting:Z

.field private final views:Ljava/util/ArrayList;

.method constructor <init>()V
  .registers 2
  .line 1078
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1080
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
  .line 1081
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->alphas:Ljava/util/ArrayList;
  .line 1082
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    return-void
.end method

.method add(Landroid/view/View;)V
  .registers 4
  .line 1089
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1090
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->alphas:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Landroid/view/View;->getAlpha()F
    move-result v1
    invoke-static { v1 }, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1091
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/view/View;->setAlpha(F)V
  .line 1092
    return-void
.end method

.method public doFrame(J)V
  .registers 8
  .line 1095
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 1096
    const/4 p2, 0
    const/4 v0, 1
    if-eqz p1, :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result p1
    if-eqz p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
  .line 1097
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    if-eqz v1, :L2
  .line 1098
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->since:J
  .line 1099
    xor-int/lit8 v1, p1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->starting:Z
  :L2
  .line 1102
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->starting:Z
    if-eqz v1, :L4
    if-eqz p1, :L3
    iget p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->after:I
    add-int/2addr p1, v0
    iput p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->after:I
    if-le p1, v0, :L3
    goto :L4
  :L3
    const/4 p1, 0
    goto :L5
  :L4
    const/4 p1, 1
  :L5
  .line 1103
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    if-nez v1, :L9
    if-nez p1, :L6
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iget-wide v3, p0, Lcom/innioasis/ipp/Flow$FadeStart;->since:J
    sub-long/2addr v1, v3
    const-wide/16 v3, 600
    cmp-long p1, v1, v3
    if-gez p1, :L6
    goto :L9
  :L6
  .line 1108
    const-string p1, "player fade"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 1109
    nop
  :L7
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-ge p2, p1, :L8
  .line 1110
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
    invoke-virtual { p1, p2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/view/View;
    invoke-virtual { p1 }, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->alphas:Ljava/util/ArrayList;
    invoke-virtual { v0, p2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Float;
    invoke-virtual { v0 }, Ljava/lang/Float;->floatValue()F
    move-result v0
    invoke-virtual { p1, v0 }, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
  .line 1111
    const-wide/16 v0, 250
    invoke-virtual { p1, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-static { }, Lcom/innioasis/ipp/Flow;->access$200()Ljava/lang/Runnable;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 1109
    add-int/lit8 p2, p2, 1
    goto :L7
  :L8
  .line 1113
    return-void
  :L9
  .line 1104
    iput-boolean p2, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
  .line 1105
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 1106
    return-void
.end method
