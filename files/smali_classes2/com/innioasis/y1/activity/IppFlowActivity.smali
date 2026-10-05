.class public final Lcom/innioasis/y1/activity/IppFlowActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppFlowActivity$Panel;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Load;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Half;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Done;,
    Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Open;,
    Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
  }
.end annotation

.field private final static KEY_POS:Ljava/lang/String; = "flow_pos"

.field private final static MOVE_MS:I = 260

.field private final static PANEL_W:I = 360

.field private final static SPREAD_MS:I = 200

.field private final static TURN_SLACK_MS:I = 40

.field private card:Landroid/widget/ImageView;

.field private flipped:I

.field private flow:Lcom/innioasis/ipp/FlowView;

.field private items:Ljava/util/List;

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;

.field private state:I

.field private trip:Landroid/widget/ImageView;

.field private ui:Landroid/os/Handler;

.method public constructor <init>()V
  .registers 2
  .line 46
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 67
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
  .registers 1
  .line 46
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
  .registers 1
  .line 46
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 46
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
  .registers 1
  .line 46
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .registers 1
  .line 46
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-object p0
.end method

.method private back(Z)V
  .registers 8
  .line 243
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 244
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 245
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 246
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 247
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 248
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 249
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 250
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 251
    const/4 v0, 0
    if-eqz p1, :L1
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 256
    const/4 p1, 5
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 257
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 258
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object p1
  .line 259
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v1 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 260
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v1 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 261
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v2 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 262
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v2 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 263
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v4
    const/4 v5, 6
    aget v4, v4, v5
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 264
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 265
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v3, v2 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 266
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v3
    aget v4, p1, v0
    invoke-virtual { v3, v4 }, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v3
    const/4 v4, 1
    aget v4, p1, v4
    invoke-virtual { v3, v4 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v3
    const/4 v4, 2
    aget v5, p1, v4
    invoke-virtual { v3, v5 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v3
    aget p1, p1, v4
    invoke-virtual { v3, p1 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
  .line 267
    const-wide/16 v3, 260
    invoke-virtual { p1, v3, v4 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v3, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 268
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 269
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { p1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    const/16 v0, 260
    invoke-direct { p0, v2, v1, v0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 270
    return-void
  :L1
  .line 252
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 253
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
  .line 254
    return-void
.end method

.method private edgeOn(ILjava/lang/Runnable;)V
  .registers 8
  .line 230
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 231
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v2, 0x42B40000
    invoke-virtual { v1, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v3, 0x3F000000
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
  .line 232
    if-lez v0, :L0
    const/high16 v3, 0x43340000
    int-to-float v4, v0
    div-float/2addr v3, v4
    goto :L1
  :L0
    const/high16 v3, 0x3F800000
  :L1
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 233
    invoke-virtual { v3 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v3
    int-to-float v3, v3
    add-float/2addr v3, v2
    int-to-float v0, v0
    const/high16 v2, 0x40000000
    div-float/2addr v0, v2
    sub-float/2addr v3, v0
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    int-to-long v1, p1
  .line 234
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1, p2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 235
    return-void
.end method

.method private flipBack()V
  .registers 4
  .line 221
    const/4 v0, 3
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 224
    const/high16 v0, 0x3F800000
    const/16 v1, 220
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;
    const/high16 v2, 0x3FC00000
    invoke-direct { v1, v2 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { v0, v1 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 225
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    const/4 v1, 0
    invoke-direct { v0, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    const/16 v1, 90
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(ILjava/lang/Runnable;)V
  .line 226
    return-void
.end method

.method private flipOver()V
  .registers 7
  .line 170
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
  .line 171
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 172
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 173
    const/4 v3, 1
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 174
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 175
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->show(Lcom/innioasis/ipp/Flow$Item;)V
  .line 176
    new-instance v4, Ljava/lang/Thread;
    new-instance v5, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
    invoke-direct { v5, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string v1, "ipp-flow-tracks"
    invoke-direct { v4, v5, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v4 }, Ljava/lang/Thread;->start()V
  .line 178
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 179
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v4
    add-int/lit8 v4, v4, -2
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 180
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v4
    add-int/lit8 v4, v4, -2
    invoke-virtual { v1, v4 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 181
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v4
    add-int/lit8 v4, v4, -2
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 182
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 183
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 184
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView;->getWidth()I
    move-result v4
    add-int/lit16 v4, v4, -360
    div-int/lit8 v4, v4, 2
  .line 185
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 186
    invoke-virtual { v1, v4 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 187
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 189
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 190
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v2, 0x42B80000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 191
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v2, 0x43080000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 192
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 193
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 194
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v4, 0x3F800000
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 195
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 196
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 197
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v4, 0
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 198
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 199
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->shrunk()V
  .line 200
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v1, 0x42B40000
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 201
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v4, 90
    invoke-virtual { v0, v4, v5 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v1, p0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 202
    const/16 v0, 90
    invoke-direct { p0, v2, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 203
    return-void
.end method

.method private labels(FI)Landroid/animation/ObjectAnimator;
  .registers 7
  .line 287
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v1, 2
    new-array v1, v1, [F
    const/4 v2, 0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getLabels()F
    move-result v3
    aput v3, v1, v2
    const/4 v2, 1
    aput p1, v1, v2
    const-string p1, "labels"
    invoke-static { v0, p1, v1 }, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object p1
  .line 288
    int-to-long v0, p2
    invoke-virtual { p1, v0, v1 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 289
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 290
    return-object p1
.end method

.method private placeTrip()V
  .registers 7
  .line 351
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 352
    const/4 v1, 2
    new-array v2, v1, [I
  .line 353
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 354
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 355
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 356
    const/4 v1, 3
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 357
    const/4 v1, 0
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 358
    iget v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    invoke-virtual { v3, v1 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 359
    const/4 v1, 1
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 360
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 361
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 4
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 362
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 5
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 363
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 7
    aget v2, v0, v2
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
    const/16 v3, 8
    aget v3, v0, v3
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
    const/16 v4, 9
    aget v4, v0, v4
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    const/16 v5, 10
    aget v0, v0, v5
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-virtual { v1, v2, v3, v4, v0 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 364
    return-void
.end method

.method private play()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 312
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 313
    if-eqz v0, :L3
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    goto :L3
  :L0
  .line 315
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 316
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget v2, v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    invoke-virtual { v1, v0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L1
  .line 319
    nop
  .line 320
    const/4 v0, 4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 321
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/AccelerateInterpolator;-><init>()V
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    const/16 v3, 200
    invoke-direct { p0, v1, v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 322
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const/16 v1, 90
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(ILjava/lang/Runnable;)V
  .line 323
    return-void
  :L2
  .line 317
    move-exception v0
  .line 318
    return-void
  :L3
  .line 313
    return-void
.end method

.method private shrunk()V
  .registers 5
  .line 207
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 208
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F000000
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 209
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    if-lez v0, :L0
    const/high16 v2, 0x43340000
    int-to-float v3, v0
    div-float/2addr v2, v3
    goto :L1
  :L0
    const/high16 v2, 0x3F800000
  :L1
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 210
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v2
    int-to-float v2, v2
    const/high16 v3, 0x42B40000
    add-float/2addr v2, v3
    int-to-float v0, v0
    const/high16 v3, 0x40000000
    div-float/2addr v0, v3
    sub-float/2addr v2, v0
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 211
    return-void
.end method

.method private spread(FFILandroid/animation/TimeInterpolator;)V
  .registers 8
  .line 273
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v1, 2
    new-array v1, v1, [F
    const/4 v2, 0
    aput p1, v1, v2
    const/4 p1, 1
    aput p2, v1, p1
    const-string p1, "spread"
    invoke-static { v0, p1, v1 }, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object p1
  .line 274
    int-to-long p2, p3
    invoke-virtual { p1, p2, p3 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 275
    invoke-virtual { p1, p4 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 276
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 277
    return-void
.end method

.method private startPose()[F
  .registers 12
  .line 371
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 372
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 373
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    int-to-float v2, v2
  .line 374
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    int-to-float v3, v3
  .line 375
    const/4 v4, 2
    aget v5, v0, v4
    const/4 v6, 7
    aget v7, v0, v6
    sub-float/2addr v5, v7
    const/16 v7, 9
    aget v7, v0, v7
    sub-float/2addr v5, v7
    div-float/2addr v5, v2
    const/4 v7, 3
    aget v8, v0, v7
    const/16 v9, 8
    aget v10, v0, v9
    sub-float/2addr v8, v10
    const/16 v10, 10
    aget v10, v0, v10
    sub-float/2addr v8, v10
    div-float/2addr v8, v3
    invoke-static { v5, v8 }, Ljava/lang/Math;->min(FF)F
    move-result v3
  .line 376
    const/high16 v5, 0x40800000
    sub-float/2addr v2, v5
    mul-float v2, v2, v3
  .line 377
    const/high16 v5, 0x43340000
    div-float/2addr v5, v2
  .line 378
    aget v2, v0, v6
    const/high16 v6, 0x40000000
    mul-float v3, v3, v6
    add-float/2addr v2, v3
    aget v6, v0, v9
    add-float/2addr v6, v3
  .line 379
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v3
    iget v8, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    sub-int/2addr v3, v8
    int-to-float v3, v3
    const/4 v8, 4
    aget v8, v0, v8
    sub-float/2addr v3, v8
    sub-float/2addr v2, v8
    mul-float v2, v2, v5
    sub-float/2addr v3, v2
  .line 380
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v2
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
    sub-int/2addr v2, v1
    int-to-float v1, v2
    const/4 v2, 5
    aget v0, v0, v2
    sub-float/2addr v1, v0
    sub-float/2addr v6, v0
    mul-float v6, v6, v5
    sub-float/2addr v1, v6
  .line 381
    new-array v0, v7, [F
    const/4 v2, 0
    aput v3, v0, v2
    const/4 v2, 1
    aput v1, v0, v2
    aput v5, v0, v4
    return-object v0
.end method

.method public antiClockwise()V
  .registers 4
  .line 139
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, -1
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
    goto :L1
  :L0
  .line 140
    const/4 v2, 2
    if-ne v0, v2, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  :L1
  .line 141
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 133
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 1
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
    goto :L1
  :L0
  .line 134
    const/4 v2, 2
    if-ne v0, v2, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  :L1
  .line 135
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 145
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L3
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 146
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    goto :L2
  :L1
  .line 147
    const/4 v1, 2
    if-ne v0, v1, :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->play()V
  :L2
  .line 148
    return-void
  :L3
  .line 145
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 156
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 157
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 2
    if-ne p1, v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
    goto :L1
  :L0
  .line 158
    if-nez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  :L1
  .line 160
    return-void
.end method

.method done(I)V
  .registers 4
  .line 294
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 295
    if-nez p1, :L0
  .line 296
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 297
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { p1, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 298
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 299
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 300
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, -1
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 301
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/high16 v1, 0x3F800000
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 302
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  :L0
  .line 304
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 46
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 71
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method halfBack()V
  .registers 5
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 281
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 282
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v2, 90
    invoke-virtual { v0, v2, v3 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v2, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 283
    return-void
.end method

.method halfOver()V
  .registers 4
  .line 214
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 215
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 216
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 90
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    const/4 v2, 2
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 217
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 218
    return-void
.end method

.method public initView()V
  .registers 9
  .line 76
    const v0, 2131821167
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 77
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
  .line 78
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 79
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 80
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 81
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 82
    new-instance v2, Lcom/innioasis/ipp/FlowView;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 83
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 84
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
  .line 85
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 86
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 184
    const/16 v7, 272
    invoke-direct { v5, v6, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 87
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
  .line 88
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v2, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 89
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 90
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 1
    invoke-direct { v3, v5, v5 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 91
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .line 92
    const/4 v3, 4
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 93
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 360
    invoke-direct { v3, v5, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 94
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 95
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 96
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 97
    return-void
.end method

.method loaded(Ljava/util/List;)V
  .registers 7
  .line 100
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 101
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
  .line 102
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L1
  .line 103
    const p1, 2131820857
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/widget/Toast;->show()V
  .line 104
    return-void
  :L1
  .line 106
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v2, 1
    sub-int/2addr v0, v2
    const-string v3, "flow_pos"
    invoke-static { p0, v3, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v3
    invoke-static { v0, v3 }, Ljava/lang/Math;->min(II)I
    move-result v0
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 107
    new-instance v1, Lcom/innioasis/ipp/Flow$Loader;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { v1, p1, v3, v4 }, Lcom/innioasis/ipp/Flow$Loader;-><init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 108
    new-instance v1, Ljava/lang/Thread;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    const-string v4, "ipp-flow-covers"
    invoke-direct { v1, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 109
    invoke-virtual { v1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 110
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 111
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/ipp/FlowView;->setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .line 112
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 113
    const/high16 p1, 0x3F800000
    const/16 v0, 200
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 114
    return-void
.end method

.method public longConfirm()V
  .registers 1
  .line 152
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 125
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 126
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L0
  .line 127
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v0, :L1
    const-string v1, "flow_pos"
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 128
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 129
    return-void
.end method

.method protected onResume()V
  .registers 4
  .line 118
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onResume()V
  .line 119
    invoke-static { }, Lcom/innioasis/ipp/Flow;->takeReturning()Z
    move-result v0
  .line 120
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 4
    if-ne v1, v2, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->back(Z)V
  :L0
  .line 121
    return-void
.end method

.method openPlayer()V
  .registers 4
  .line 385
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 386
    const-string v1, "ipp_flip"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 387
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startActivity(Landroid/content/Intent;)V
  .line 388
    const/4 v0, 0
    invoke-virtual { p0, v0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->overridePendingTransition(II)V
  .line 389
    return-void
.end method

.method public quit()V
  .registers 1
  .line 164
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  .line 165
    return-void
.end method

.method toPlayer()V
  .registers 6
  .line 326
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 327
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 328
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v2, v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L0
  .line 329
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget v2, v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    goto :L1
  :L0
    const/4 v1, 0
  :L1
  .line 330
    iget-object v0, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 331
    if-nez v0, :L2
  .line 332
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
  .line 333
    return-void
  :L2
  .line 335
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 336
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 337
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v0
  .line 338
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 0
    aget v3, v0, v2
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 339
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 1
    aget v3, v0, v3
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 340
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 2
    aget v4, v0, v3
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 341
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    aget v0, v0, v3
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 342
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 343
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 344
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v1
    const/4 v2, 6
    aget v1, v1, v2
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0x3F800000
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
  .line 345
    const-wide/16 v1, 260
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Open;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Open;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .line 346
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 347
    return-void
.end method
