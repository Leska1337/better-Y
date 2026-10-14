.class public final Lcom/innioasis/y1/activity/IppFlowActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppFlowActivity$Panel;,
    Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Load;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Rested;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Half;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Done;,
    Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Open;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;,
    Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Tick;,
    Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
  }
.end annotation

.field private final static DWELL_MS:I = 300

.field private final static KEY_POS:Ljava/lang/String; = "flow_pos"

.field private final static MOVE_MS:I = 260

.field private final static PANEL_W:I = 360

.field private final static SPREAD_MS:I = 200

.field private final static TURN_SLACK_MS:I = 40

.field private aheadBusy:Ljava/lang/String;

.field private aheadFor:Ljava/lang/String;

.field private aheadPic:Landroid/graphics/Bitmap;

.field private aheadSrc:[Ljava/lang/Object;

.field volatile animating:Z

.field private backBusy:Lcom/innioasis/ipp/Flow$Item;

.field private final backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;

.field private backFor:Lcom/innioasis/ipp/Flow$Item;

.field private backNext:Lcom/innioasis/ipp/Flow$Item;

.field private backReady:Lcom/innioasis/ipp/Flow$Back;

.field private card:Landroid/widget/ImageView;

.field private final dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;

.field flipPending:Z

.field private flipped:I

.field private flow:Lcom/innioasis/ipp/FlowView;

.field private items:Ljava/util/List;

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;

.field private state:I

.field private trip:Landroid/widget/ImageView;

.field private tripPic:Landroid/graphics/Bitmap;

.field private ui:Landroid/os/Handler;

.method public constructor <init>()V
  .registers 2
  .line 53
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 74
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 472
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
  .line 522
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
  .registers 1
  .line 53
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
  .registers 1
  .line 53
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 53
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 53
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    return-void
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 53
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    return-void
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
  .registers 1
  .line 53
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 53
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .registers 1
  .line 53
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-object p0
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 53
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
    return-void
.end method

.method private armAhead()V
  .registers 5
  .line 536
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 537
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 538
    return-void
.end method

.method private armBack()V
  .registers 5
  .line 479
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 480
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 481
    return-void
.end method

.method private back(Z)V
  .registers 12
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 281
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 282
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 283
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 284
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 285
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 286
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 287
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 288
    const/4 v0, 0
    if-eqz p1, :L2
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L0
    goto/16 :L2
  :L0
  .line 293
    const/4 p1, 5
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 294
    const-string p1, "from player"
    invoke-static { p1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 295
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 297
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    const/16 v4, 260
    const/4 v5, 2
    if-ltz v3, :L1
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v3, v6, :L1
  .line 298
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v3, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Flow$Item;
    iget-object v3, v3, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    const/4 v6, 0
    invoke-static { v6, v3 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 299
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v6
  .line 302
    if-eqz v3, :L1
    instance-of v7, v6, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v7, :L1
    move-object v7, v6
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;
  .line 303
    invoke-virtual { v7 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v7
    invoke-virtual { v3, v7 }, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    move-result v7
    if-nez v7, :L1
  .line 304
    new-instance v7, Landroid/graphics/drawable/TransitionDrawable;
    new-array v8, v5, [Landroid/graphics/drawable/Drawable;
    aput-object v6, v8, v0
    new-instance v6, Landroid/graphics/drawable/BitmapDrawable;
  .line 305
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    invoke-direct { v6, v9, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    aput-object v6, v8, p1
    invoke-direct { v7, v8 }, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 306
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V
  .line 307
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v7 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 308
    invoke-virtual { v7, v4 }, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V
  :L1
  .line 311
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 312
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v3
  .line 313
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6, v1 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 314
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6, v1 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 315
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6, v2 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 316
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6, v2 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 317
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v7
    const/4 v8, 6
    aget v7, v7, v8
    invoke-virtual { v6, v7 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 318
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 319
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6, v2 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 320
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v6 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v6
    aget v7, v3, v0
    invoke-virtual { v6, v7 }, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v6
    aget p1, v3, p1
    invoke-virtual { v6, p1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    aget v6, v3, v5
    invoke-virtual { p1, v6 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    aget v3, v3, v5
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
  .line 321
    const-wide/16 v5, 260
    invoke-virtual { p1, v5, v6 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v3, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 322
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 323
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { p1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-direct { p0, v2, v1, v4, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 324
    return-void
  :L2
  .line 289
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 290
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
  .line 291
    return-void
.end method

.method private edgeOn(ILjava/lang/Runnable;)V
  .registers 8
  .line 267
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 268
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v2, 0x42B40000
    invoke-virtual { v1, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v3, 0x3F000000
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
  .line 269
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
  .line 270
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
  .line 271
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1, p2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 272
    return-void
.end method

.method private flipBack()V
  .registers 4
  .line 256
    const-string v0, "flip back"
    invoke-static { v0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 257
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 258
    const/4 v0, 3
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 261
    const/high16 v0, 0x3F800000
    const/16 v1, 220
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;
    const/high16 v2, 0x3FC00000
    invoke-direct { v1, v2 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { v0, v1 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 262
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    const/4 v1, 0
    invoke-direct { v0, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    const/16 v1, 90
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(ILjava/lang/Runnable;)V
  .line 263
    return-void
.end method

.method private flipOver()V
  .registers 9
  .line 201
    const-string v0, "flip over"
    invoke-static { v0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 202
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 203
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v2
  .line 204
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Flow$Item;
  .line 205
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v4, v2 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 206
    const/4 v5, 1
    iput v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 207
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 208
    invoke-direct { p0, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 209
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->show(Lcom/innioasis/ipp/Flow$Item;)V
  .line 210
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .line 212
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 213
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 214
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    invoke-virtual { v3, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 215
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 216
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v6, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 217
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 218
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->getWidth()I
    move-result v6
    add-int/lit16 v6, v6, -360
    div-int/lit8 v6, v6, 2
  .line 219
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 220
    invoke-virtual { v3, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 221
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 223
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 224
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v4, 0x42B80000
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 225
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v4, 0x43080000
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 226
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 227
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 228
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/high16 v6, 0x3F800000
    invoke-virtual { v3, v6 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 229
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v3, v6 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 230
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v3, v4 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 231
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v6, 0
    invoke-virtual { v3, v6 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 232
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v3, v2 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 233
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->shrunk()V
  .line 234
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v3, 0x42B40000
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 235
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v2
    const/high16 v3, 0xC2B40000
    invoke-virtual { v2, v3 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v2
    const-wide/16 v6, 90
    invoke-virtual { v2, v6, v7 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v3, p0, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 236
    const/16 v2, 90
    invoke-direct { p0, v4, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 237
    const-string v2, "setup"
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 238
    return-void
.end method

.method private hold(Z)V
  .registers 3
  .line 464
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
  .line 465
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->hold(Z)V
  :L0
  .line 466
    return-void
.end method

.method private labels(FI)Landroid/animation/ObjectAnimator;
  .registers 7
  .line 341
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
  .line 342
    int-to-long v0, p2
    invoke-virtual { p1, v0, v1 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 343
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 344
    return-object p1
.end method

.method private placeTrip()V
  .registers 7
  .line 427
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 428
    const/4 v1, 2
    new-array v2, v1, [I
  .line 429
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 430
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 431
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 432
    const/4 v1, 3
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 433
    const/4 v1, 0
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 434
    iget v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    invoke-virtual { v3, v1 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 435
    const/4 v1, 1
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 436
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 437
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 4
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 438
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 5
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 439
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
  .line 440
    return-void
.end method

.method private play()V
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 373
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 374
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v1
  .line 375
    if-eqz v0, :L5
    if-gez v1, :L0
    goto :L5
  :L0
  .line 376
    const-string v2, "to player"
    invoke-static { v2 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 377
    const/4 v2, 1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 381
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 382
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 383
    if-nez v3, :L1
  .line 384
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 385
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v5, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Flow$Item;
    iget-object v5, v5, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 386
    const-string v2, "picture"
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 388
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  :L2
  .line 390
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 391
    if-eqz v4, :L3
    invoke-virtual { v4, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L3
  .line 396
    nop
  .line 397
    const-string v0, "playlist"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 398
    const/4 v0, 4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 399
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/AccelerateInterpolator;-><init>()V
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    const/16 v3, 200
    invoke-direct { p0, v1, v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 400
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const/16 v1, 90
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(ILjava/lang/Runnable;)V
  .line 401
    return-void
  :L4
  .line 392
    move-exception v0
  .line 393
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 394
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 395
    return-void
  :L5
  .line 375
    return-void
.end method

.method private shrunk()V
  .registers 5
  .line 242
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 243
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F000000
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 244
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
  .line 245
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
  .line 246
    return-void
.end method

.method private spread(FFILandroid/animation/TimeInterpolator;)V
  .registers 8
  .line 327
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
  .line 328
    int-to-long p2, p3
    invoke-virtual { p1, p2, p3 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 329
    invoke-virtual { p1, p4 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 330
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 331
    return-void
.end method

.method private startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 4
  .line 489
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 490
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string p1, "ipp-flow-tracks"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 491
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 492
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 493
    return-void
.end method

.method private startPose()[F
  .registers 12
  .line 447
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 448
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 449
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    int-to-float v2, v2
  .line 450
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    int-to-float v3, v3
  .line 451
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
  .line 452
    const/high16 v5, 0x40800000
    sub-float/2addr v2, v5
    mul-float v2, v2, v3
  .line 453
    const/high16 v5, 0x43340000
    div-float/2addr v5, v2
  .line 454
    aget v2, v0, v6
    const/high16 v6, 0x40000000
    mul-float v3, v3, v6
    add-float/2addr v2, v3
    aget v6, v0, v9
    add-float/2addr v6, v3
  .line 455
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
  .line 456
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
  .line 457
    new-array v0, v7, [F
    const/4 v2, 0
    aput v3, v0, v2
    const/4 v2, 1
    aput v1, v0, v2
    aput v5, v0, v4
    return-object v0
.end method

.method private takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 5
  .line 579
    const/4 v0, 0
    if-eqz p1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
    if-eqz v1, :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L0
    goto :L2
  :L0
  .line 580
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 581
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 582
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 583
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 584
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 585
    if-eqz v1, :L1
    const/4 v0, 0
    aget-object v0, v1, v0
    instance-of v2, v0, Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    const/4 v2, 1
    aget-object v1, v1, v2
    check-cast v1, Ljava/lang/String;
    check-cast v0, Landroid/graphics/Bitmap;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/BigCover;->keep(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  :L1
  .line 586
    return-object p1
  :L2
  .line 579
    return-object v0
.end method

.method static tidy()V
  .registers 0
  .line 1019
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 1020
    return-void
.end method

.method private tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 10
  .line 497
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 498
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-ne p1, v0, :L0
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
    if-eqz v4, :L0
  .line 499
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    move-object v1, v7
    move-object v2, p0
    move-object v3, p1
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v0, v7 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    goto :L3
  :L0
  .line 500
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, p1, :L1
    goto :L3
  :L1
  .line 502
    if-eqz v0, :L2
  .line 503
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
    goto :L3
  :L2
  .line 505
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L3
  .line 507
    return-void
.end method

.method ahead()V
  .registers 6
  .line 541
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L5
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
    if-nez v0, :L5
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ltz v0, :L5
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt v0, v1, :L0
    goto :L5
  :L0
  .line 542
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 543
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L1
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 544
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 545
    if-eqz v0, :L4
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    goto :L4
  :L3
  .line 546
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 547
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Flow$Item;
    iget-object v3, v3, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-direct { v2, p0, v0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)V
    const-string v0, "ipp-flow-trip"
    invoke-direct { v1, v2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 548
    const/4 v0, 1
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 549
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 550
    return-void
  :L4
  .line 545
    return-void
  :L5
  .line 541
    return-void
.end method

.method aheadDone(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 5
  .line 553
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 554
    if-nez p2, :L0
    move-object p1, v0
  :L0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 555
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 556
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 557
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 p2, 2
    if-ne p1, p2, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 558
    return-void
.end method

.method aheadFirst(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 6
  .line 565
    if-eqz p2, :L5
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 566
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L4
  .line 567
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 568
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L1
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 569
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 570
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L4
  :L3
    return-void
  :L4
  .line 572
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 573
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 574
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 575
    return-void
  :L5
  .line 565
    return-void
.end method

.method public antiClockwise()V
  .registers 4
  .line 154
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, -1
    if-nez v0, :L0
  .line 155
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 156
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 157
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 158
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 159
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 160
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 162
    return-void
.end method

.method backDone(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 13
  .line 510
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 511
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 512
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 513
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    move-object v1, v7
    move-object v2, p0
    move-object v3, p1
    move-object v4, p2
    move-wide v5, p3
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->run()V
  .line 514
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 515
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 516
    if-eqz p2, :L0
    if-eq p2, p1, :L0
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L0
  .line 517
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 142
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 1
    if-nez v0, :L0
  .line 143
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 144
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 145
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 146
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 147
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 148
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 150
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 166
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 167
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L2
  .line 170
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->resting()Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    goto :L3
  :L1
  .line 172
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 173
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->hurry()V
    goto :L3
  :L2
  .line 175
    const/4 v1, 2
    if-ne v0, v1, :L3
  .line 176
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->play()V
  :L3
  .line 178
    return-void
  :L4
  .line 166
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 189
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 190
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 2
    if-ne p1, v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
    goto :L1
  :L0
  .line 191
    if-nez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  :L1
  .line 193
    return-void
.end method

.method done(I)V
  .registers 4
  .line 348
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 349
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 350
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 351
    if-nez p1, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  :L0
  .line 352
    const/4 v0, 2
    if-ne p1, v0, :L1
  .line 353
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 354
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 356
    if-nez p1, :L2
  .line 357
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 358
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { p1, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 359
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 360
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 361
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, -1
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 362
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/high16 v1, 0x3F800000
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 363
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  :L2
  .line 365
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 53
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 78
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method halfBack()V
  .registers 5
  .line 334
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 335
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 336
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
  .line 337
    return-void
.end method

.method halfOver()V
  .registers 4
  .line 249
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 250
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 251
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
  .line 252
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 253
    return-void
.end method

.method public initView()V
  .registers 9
  .line 83
    const v0, 2131821167
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 84
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
  .line 85
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 86
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 87
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 88
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 89
    new-instance v2, Lcom/innioasis/ipp/FlowView;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 90
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 91
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
  .line 92
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 93
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Landroid/widget/ImageView;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 184
    const/16 v7, 272
    invoke-direct { v5, v6, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 94
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
  .line 95
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v2, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 96
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 97
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 1
    invoke-direct { v3, v5, v5 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 98
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .line 99
    const/4 v3, 4
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 100
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 360
    invoke-direct { v3, v5, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 101
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 102
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 103
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 104
    return-void
.end method

.method loaded(Ljava/util/List;)V
  .registers 7
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 108
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
  .line 109
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L1
  .line 110
    const p1, 2131820857
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/widget/Toast;->show()V
  .line 111
    return-void
  :L1
  .line 113
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
  .line 114
    new-instance v1, Lcom/innioasis/ipp/Flow$Loader;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { v1, p1, v3, v4 }, Lcom/innioasis/ipp/Flow$Loader;-><init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 115
    new-instance v1, Ljava/lang/Thread;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    const-string v4, "ipp-flow-covers"
    invoke-direct { v1, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 116
    invoke-virtual { v1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 117
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 118
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/ipp/FlowView;->setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .line 119
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setOnRest(Ljava/lang/Runnable;)V
  .line 120
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 121
    const/high16 p1, 0x3F800000
    const/16 v0, 200
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 122
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  .line 123
    return-void
.end method

.method public longConfirm()V
  .registers 1
  .line 185
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 134
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 135
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L0
  .line 136
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v0, :L1
    const-string v1, "flow_pos"
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 137
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 138
    return-void
.end method

.method protected onResume()V
  .registers 4
  .line 127
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onResume()V
  .line 128
    invoke-static { }, Lcom/innioasis/ipp/Flow;->takeReturning()Z
    move-result v0
  .line 129
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 4
    if-ne v1, v2, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->back(Z)V
  :L0
  .line 130
    return-void
.end method

.method openPlayer()V
  .registers 4
  .line 590
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 591
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 592
    const-string v1, "ipp_flip"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 593
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startActivity(Landroid/content/Intent;)V
  .line 594
    const/4 v0, 0
    invoke-virtual { p0, v0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->overridePendingTransition(II)V
  .line 595
    return-void
.end method

.method public quit()V
  .registers 1
  .line 197
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  .line 198
    return-void
.end method

.method toPlayer()V
  .registers 6
  .line 404
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 405
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 406
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 407
    if-nez v0, :L0
  .line 408
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
  .line 409
    return-void
  :L0
  .line 411
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 412
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 413
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v0
  .line 414
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 0
    aget v3, v0, v2
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 415
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 1
    aget v3, v0, v3
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 416
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 2
    aget v4, v0, v3
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 417
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    aget v0, v0, v3
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 418
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 419
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 420
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
  .line 421
    const-wide/16 v1, 260
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Open;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Open;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .line 422
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 423
    return-void
.end method

.method tracksAhead(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 484
    if-eqz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-eq p1, v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 485
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .line 486
    return-void
  :L1
  .line 484
    return-void
.end method
