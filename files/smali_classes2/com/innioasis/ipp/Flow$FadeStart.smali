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
  .line 1124
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1126
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
  .line 1127
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->alphas:Ljava/util/ArrayList;
  .line 1128
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    return-void
.end method

.method add(Landroid/view/View;)V
  .registers 4
  .line 1135
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1136
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$FadeStart;->alphas:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Landroid/view/View;->getAlpha()F
    move-result v1
    invoke-static { v1 }, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1137
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/view/View;->setAlpha(F)V
  .line 1138
    return-void
.end method

.method public doFrame(J)V
  .registers 7
  .line 1141
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 1142
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
  .line 1143
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    if-eqz v1, :L2
  .line 1144
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->since:J
  .line 1145
    xor-int/lit8 v1, p1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->starting:Z
  :L2
  .line 1148
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->starting:Z
    if-eqz v1, :L4
    if-eqz p1, :L3
    iget p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->after:I
    add-int/2addr p1, v0
    iput p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->after:I
    if-le p1, v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
  .line 1149
    iget-boolean p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
    if-nez p1, :L8
    if-nez v0, :L5
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/innioasis/ipp/Flow$FadeStart;->since:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 600
    cmp-long p1, v0, v2
    if-gez p1, :L5
    goto :L8
  :L5
  .line 1154
    const-string p1, "player fade"
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 1155
    nop
  :L6
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$FadeStart;->views:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-ge p2, p1, :L7
  .line 1156
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
  .line 1157
    const-wide/16 v0, 250
    invoke-virtual { p1, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-static { }, Lcom/innioasis/ipp/Flow;->access$200()Ljava/lang/Runnable;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 1155
    add-int/lit8 p2, p2, 1
    goto :L6
  :L7
  .line 1159
    return-void
  :L8
  .line 1150
    iput-boolean p2, p0, Lcom/innioasis/ipp/Flow$FadeStart;->first:Z
  .line 1151
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 1152
    return-void
.end method
