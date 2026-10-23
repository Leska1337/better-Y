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
    Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
  }
.end annotation

.field private final static DWELL_MS:I = 300

.field private final static KEY_POS:Ljava/lang/String; = "flow_pos"

.field private final static MODES:[Ljava/lang/String;

.field private final static MOVE_MS:I = 260

.field private final static PANEL_W:I = 360

.field private final static SPREAD_MS:I = 200

.field private final static TURN_SLACK_MS:I = 40

.field private static mode:I

.field static noDwell:Z

.field static noGc:Z

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

.field private card:Lcom/innioasis/ipp/FlowView$Card;

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

.method static constructor <clinit>()V
  .registers 3
  .line 189
    const/4 v0, 3
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "normal"
    aput-object v2, v0, v1
    const/4 v1, 1
    const-string v2, "nogc"
    aput-object v2, v0, v1
    const/4 v1, 2
    const-string v2, "nodwell"
    aput-object v2, v0, v1
    sput-object v0, Lcom/innioasis/y1/activity/IppFlowActivity;->MODES:[Ljava/lang/String;
    return-void
.end method

.method public constructor <init>()V
  .registers 2
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 77
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 513
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
  .line 567
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 56
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    return-void
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    return-void
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 56
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-object p0
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
    return-void
.end method

.method private armAhead()V
  .registers 5
  .line 581
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 582
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 583
    return-void
.end method

.method private armBack()V
  .registers 5
  .line 523
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 524
    sget-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noDwell:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 525
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 526
    return-void
.end method

.method private back(Z)V
  .catchall { :L1 .. :L6 } :L7
  .registers 12
  .line 301
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 302
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 303
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 304
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 305
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 306
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 307
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 308
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 309
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 310
    const/4 v0, 0
    if-eqz p1, :L10
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L0
    goto/16 :L10
  :L0
  .line 315
    const/4 p1, 5
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 316
    const-string p1, "from player"
    invoke-static { p1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 317
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 320
    const/4 v3, 0
  :L1
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 321
    if-nez v4, :L2
    move-object v4, v3
    goto :L3
  :L2
    invoke-virtual { v4 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v4
  :L3
  .line 322
    if-nez v4, :L4
    move-object v4, v3
    goto :L5
  :L4
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 323
    if-eqz v4, :L6
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v5, v4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L6
  .line 325
    goto :L8
  :L7
  .line 324
    move-exception v4
  :L8
  .line 327
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    const/16 v5, 260
    const/4 v6, 2
    if-ltz v4, :L9
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v4, v7, :L9
  .line 328
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
    iget-object v4, v4, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 329
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 332
    if-eqz v3, :L9
    instance-of v7, v4, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v7, :L9
    move-object v7, v4
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;
  .line 333
    invoke-virtual { v7 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v7
    invoke-virtual { v3, v7 }, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    move-result v7
    if-nez v7, :L9
  .line 334
    new-instance v7, Landroid/graphics/drawable/TransitionDrawable;
    new-array v8, v6, [Landroid/graphics/drawable/Drawable;
    aput-object v4, v8, v0
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
  .line 335
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    invoke-direct { v4, v9, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    aput-object v4, v8, p1
    invoke-direct { v7, v8 }, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 336
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V
  .line 337
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v7 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 338
    invoke-virtual { v7, v5 }, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V
  :L9
  .line 341
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 342
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v3
  .line 343
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 344
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 345
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 346
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 347
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v7
    const/4 v8, 6
    aget v7, v7, v8
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 348
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 349
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4, v2 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 350
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v4
    aget v7, v3, v0
    invoke-virtual { v4, v7 }, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v4
    aget p1, v3, p1
    invoke-virtual { v4, p1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    aget v4, v3, v6
    invoke-virtual { p1, v4 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    aget v3, v3, v6
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    invoke-virtual { p1, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
  .line 351
    const-wide/16 v3, 260
    invoke-virtual { p1, v3, v4 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v3, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 352
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 353
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { p1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-direct { p0, v2, v1, v5, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 354
    return-void
  :L10
  .line 311
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 312
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
  .line 313
    return-void
.end method

.method private edgeOn(Ljava/lang/Runnable;IF)V
  .registers 9
  .line 287
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 288
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v2, 0x42B40000
    invoke-virtual { v1, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v3, 0x3F000000
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
  .line 289
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
  .line 290
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
    int-to-long v1, p2
  .line 291
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0, p3 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { p2, v0 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
  .line 292
    invoke-virtual { p2, p1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 293
    return-void
.end method

.method private flipBack()V
  .registers 5
  .line 276
    const-string v0, "flip back"
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 277
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 278
    const/4 v0, 3
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 281
    const/16 v0, 245
    const/high16 v1, 0x3F800000
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
    move-result-object v0
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;
    const/high16 v3, 0x3FC00000
    invoke-direct { v2, v3 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { v0, v2 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 282
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    const/4 v2, 0
    invoke-direct { v0, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    const/16 v2, 130
    invoke-direct { p0, v0, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;IF)V
  .line 283
    return-void
.end method

.method private flipOver()V
  .registers 9
  .line 219
    const-string v0, "flip over"
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 220
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 221
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
  .line 222
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v4, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
  .line 223
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v5, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 224
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 225
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 226
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 227
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->show(Lcom/innioasis/ipp/Flow$Item;)V
  .line 228
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .line 230
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView$Card;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 231
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 232
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    invoke-virtual { v4, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 233
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 234
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v6, v4 }, Lcom/innioasis/ipp/FlowView$Card;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 235
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 236
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->getWidth()I
    move-result v6
    add-int/lit16 v6, v6, -360
    div-int/lit8 v6, v6, 2
  .line 237
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 238
    invoke-virtual { v4, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 239
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 241
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 242
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x42B80000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotX(F)V
  .line 243
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x43080000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotY(F)V
  .line 244
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v5, 0
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationX(F)V
  .line 245
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationY(F)V
  .line 246
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v6, 0x3F800000
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleX(F)V
  .line 247
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleY(F)V
  .line 248
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setRotationY(F)V
  .line 249
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v6, 0
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 250
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 251
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->shrunk()V
  .line 252
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v4, 0x42B40000
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 253
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView$Card;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v4, 0xC2B40000
    invoke-virtual { v0, v4 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v6, 75
    invoke-virtual { v0, v6, v7 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;
    const v6, 1060033073
    invoke-direct { v4, v6 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
  .line 254
    invoke-virtual { v0, v4 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v4, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    invoke-virtual { v0, v4 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 255
    const/16 v0, 75
    invoke-direct { p0, v5, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 256
    const-string v0, "setup"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 257
    return-void
.end method

.method private hold(Z)V
  .registers 3
  .line 505
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
  .line 506
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->hold(Z)V
  :L0
  .line 507
    return-void
.end method

.method private labels(FI)Landroid/animation/ObjectAnimator;
  .registers 7
  .line 378
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
  .line 379
    int-to-long v0, p2
    invoke-virtual { p1, v0, v1 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 380
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 381
    return-object p1
.end method

.method private mode(I)V
  .registers 5
  .line 192
    sput p1, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
  .line 193
    const/4 v0, 0
    const/4 v1, 1
    if-ne p1, v1, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    sput-boolean v2, Lcom/innioasis/y1/activity/IppFlowActivity;->noGc:Z
  .line 194
    const/4 v2, 2
    if-ne p1, v2, :L2
    const/4 v0, 1
  :L2
    sput-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noDwell:Z
  .line 195
    if-eqz v0, :L3
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L3
  .line 196
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const v1, 2131821167
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ["
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, Lcom/innioasis/y1/activity/IppFlowActivity;->MODES:[Ljava/lang/String;
    aget-object v2, v1, p1
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "]"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 197
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "flow measure: "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    aget-object p1, v1, p1
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 198
    return-void
.end method

.method private placeTrip()V
  .registers 7
  .line 467
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 468
    const/4 v1, 2
    new-array v2, v1, [I
  .line 469
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 470
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 471
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 472
    const/4 v1, 3
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 473
    const/4 v1, 0
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 474
    iget v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    invoke-virtual { v3, v1 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 475
    const/4 v1, 1
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 476
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 477
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 4
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 478
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 5
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 479
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
  .line 480
    return-void
.end method

.method private play()V
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 411
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 412
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v1
  .line 413
    if-eqz v0, :L5
    if-gez v1, :L0
    goto :L5
  :L0
  .line 414
    const-string v2, "to player"
    invoke-static { v2 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 415
    const/4 v2, 1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 419
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 420
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 421
    if-nez v3, :L1
  .line 422
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 423
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v5, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Flow$Item;
    iget-object v5, v5, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 424
    const-string v2, "picture"
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 426
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  :L2
  .line 428
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 429
    if-eqz v4, :L3
    invoke-virtual { v4, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L3
  .line 434
    nop
  .line 435
    const-string v0, "playlist"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 436
    const/4 v0, 4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 437
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/AccelerateInterpolator;-><init>()V
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    const/16 v3, 200
    invoke-direct { p0, v1, v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 438
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const/16 v1, 130
    invoke-direct { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;IF)V
  .line 439
    return-void
  :L4
  .line 430
    move-exception v0
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 432
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 433
    return-void
  :L5
  .line 413
    return-void
.end method

.method private shrunk()V
  .registers 5
  .line 261
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 262
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F000000
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 263
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
  .line 264
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
  .line 265
    return-void
.end method

.method private spread(FFILandroid/animation/TimeInterpolator;)V
  .registers 8
  .line 357
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
  .line 358
    int-to-long p2, p3
    invoke-virtual { p1, p2, p3 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 359
    invoke-virtual { p1, p4 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 360
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 361
    return-void
.end method

.method private startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 4
  .line 534
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 535
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string p1, "ipp-flow-tracks"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 536
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 537
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 538
    return-void
.end method

.method private startPose()[F
  .registers 12
  .line 487
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 488
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 489
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    int-to-float v2, v2
  .line 490
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    int-to-float v3, v3
  .line 491
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
  .line 492
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v5
    const/4 v8, 0
    if-eqz v5, :L0
    const/4 v5, 0
    goto :L1
  :L0
    const/4 v5, 2
  :L1
  .line 493
    mul-int/lit8 v10, v5, 2
    int-to-float v10, v10
    sub-float/2addr v2, v10
    mul-float v2, v2, v3
  .line 494
    const/high16 v10, 0x43340000
    div-float/2addr v10, v2
  .line 495
    aget v2, v0, v6
    int-to-float v5, v5
    mul-float v5, v5, v3
    add-float/2addr v2, v5
    aget v3, v0, v9
    add-float/2addr v3, v5
  .line 496
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v5 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v5
    iget v6, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    sub-int/2addr v5, v6
    int-to-float v5, v5
    const/4 v6, 4
    aget v6, v0, v6
    sub-float/2addr v5, v6
    sub-float/2addr v2, v6
    mul-float v2, v2, v10
    sub-float/2addr v5, v2
  .line 497
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v2
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
    sub-int/2addr v2, v1
    int-to-float v1, v2
    const/4 v2, 5
    aget v0, v0, v2
    sub-float/2addr v1, v0
    sub-float/2addr v3, v0
    mul-float v3, v3, v10
    sub-float/2addr v1, v3
  .line 498
    new-array v0, v7, [F
    aput v5, v0, v8
    const/4 v2, 1
    aput v1, v0, v2
    aput v10, v0, v4
    return-object v0
.end method

.method private takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 5
  .line 607
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
  .line 608
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 609
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 610
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 611
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 612
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 613
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
  .line 614
    return-object p1
  :L2
  .line 607
    return-object v0
.end method

.method static tidy()V
  .registers 1
  .line 1099
    sget-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noGc:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1100
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1101
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 1102
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1103
    return-void
.end method

.method private tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 10
  .line 542
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 543
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-ne p1, v0, :L0
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
    if-eqz v4, :L0
  .line 544
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
  .line 545
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, p1, :L1
    goto :L3
  :L1
  .line 547
    if-eqz v0, :L2
  .line 548
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
    goto :L3
  :L2
  .line 550
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L3
  .line 552
    return-void
.end method

.method ahead()V
  .registers 6
  .line 586
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
  .line 587
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 588
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L1
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 589
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 590
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
  .line 591
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 592
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
  .line 593
    const/4 v0, 1
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 594
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 595
    return-void
  :L4
  .line 590
    return-void
  :L5
  .line 586
    return-void
.end method

.method aheadDone(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 5
  .line 598
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 599
    if-nez p2, :L0
    move-object p1, v0
  :L0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 600
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 601
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 602
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 p2, 2
    if-ne p1, p2, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 603
    return-void
.end method

.method public antiClockwise()V
  .registers 4
  .line 158
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, -1
    if-nez v0, :L0
  .line 159
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 160
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 161
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 162
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 163
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 164
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 166
    return-void
.end method

.method backDone(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 13
  .line 555
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 556
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 557
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 558
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    move-object v1, v7
    move-object v2, p0
    move-object v3, p1
    move-object v4, p2
    move-wide v5, p3
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->run()V
  .line 559
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 560
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 561
    if-eqz p2, :L0
    if-eq p2, p1, :L0
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L0
  .line 562
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 146
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 1
    if-nez v0, :L0
  .line 147
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 148
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 149
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 150
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 151
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 152
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 154
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 170
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 171
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L2
  .line 174
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->resting()Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    goto :L3
  :L1
  .line 176
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 177
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->hurry()V
    goto :L3
  :L2
  .line 179
    const/4 v1, 2
    if-ne v0, v1, :L3
  .line 180
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->play()V
  :L3
  .line 182
    return-void
  :L4
  .line 170
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 207
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 208
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 2
    if-ne p1, v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
    goto :L1
  :L0
  .line 209
    if-nez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  :L1
  .line 211
    return-void
.end method

.method done(I)V
  .registers 4
  .line 385
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 386
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 387
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 388
    if-nez p1, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  :L0
  .line 389
    const/4 v0, 2
    if-ne p1, v0, :L1
  .line 390
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 391
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 393
    if-nez p1, :L2
  .line 394
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 395
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 398
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tripGone()V
  .line 399
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, -1
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 400
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/high16 v1, 0x3F800000
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 401
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  :L2
  .line 403
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 56
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 81
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method halfBack()V
  .registers 5
  .line 364
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 365
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 366
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView$Card;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v2, 75
    invoke-virtual { v0, v2, v3 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;
    const v3, 1058255163
    invoke-direct { v2, v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V
  .line 367
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v2, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 368
    return-void
.end method

.method halfOver()V
  .registers 4
  .line 268
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 269
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 270
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
    const-wide/16 v1, 190
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    const v2, 1071476900
    invoke-direct { v1, v2 }, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V
  .line 271
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    const/4 v2, 2
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 272
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 273
    return-void
.end method

.method public initView()V
  .registers 9
  .line 86
    const v0, 2131821167
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 87
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
  .line 88
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 89
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 90
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 91
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 92
    new-instance v2, Lcom/innioasis/ipp/FlowView;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 93
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 94
    new-instance v2, Lcom/innioasis/ipp/FlowView$Card;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView$Card;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
  .line 95
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 96
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 184
    const/16 v7, 272
    invoke-direct { v5, v6, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 97
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
  .line 98
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v2, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 99
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 100
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 1
    invoke-direct { v3, v5, v5 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 101
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .line 102
    const/4 v3, 4
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 103
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 360
    invoke-direct { v3, v5, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 104
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 105
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 106
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 107
    return-void
.end method

.method loaded(Ljava/util/List;)V
  .registers 7
  .line 110
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 111
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
  .line 112
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L1
  .line 113
    const p1, 2131820857
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/widget/Toast;->show()V
  .line 114
    return-void
  :L1
  .line 116
    sget v0, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->mode(I)V
  .line 117
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
  .line 118
    new-instance v1, Lcom/innioasis/ipp/Flow$Loader;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { v1, p1, v3, v4 }, Lcom/innioasis/ipp/Flow$Loader;-><init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 119
    new-instance v1, Ljava/lang/Thread;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    const-string v4, "ipp-flow-covers"
    invoke-direct { v1, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 120
    invoke-virtual { v1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 121
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 122
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/ipp/FlowView;->setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .line 123
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setOnRest(Ljava/lang/Runnable;)V
  .line 124
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 125
    const/high16 p1, 0x3F800000
    const/16 v0, 200
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 126
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  .line 127
    return-void
.end method

.method public longConfirm()V
  .registers 3
  .line 202
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L0
    sget v0, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
    add-int/lit8 v0, v0, 1
    sget-object v1, Lcom/innioasis/y1/activity/IppFlowActivity;->MODES:[Ljava/lang/String;
    array-length v1, v1
    rem-int/2addr v0, v1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->mode(I)V
  :L0
  .line 203
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 138
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 139
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L0
  .line 140
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v0, :L1
    const-string v1, "flow_pos"
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 141
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 142
    return-void
.end method

.method protected onResume()V
  .registers 4
  .line 131
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onResume()V
  .line 132
    invoke-static { }, Lcom/innioasis/ipp/Flow;->takeReturning()Z
    move-result v0
  .line 133
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 4
    if-ne v1, v2, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->back(Z)V
  :L0
  .line 134
    return-void
.end method

.method openPlayer()V
  .registers 4
  .line 618
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 619
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 620
    const-string v1, "ipp_flip"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 621
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startActivity(Landroid/content/Intent;)V
  .line 622
    const/4 v0, 0
    invoke-virtual { p0, v0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->overridePendingTransition(II)V
  .line 623
    return-void
.end method

.method public quit()V
  .registers 1
  .line 215
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  .line 216
    return-void
.end method

.method toPlayer()V
  .registers 7
  .line 442
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 443
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 444
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 445
    if-nez v0, :L0
  .line 446
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
  .line 447
    return-void
  :L0
  .line 449
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 450
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v2, 0x3F800000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 451
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 452
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 453
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v0
  .line 454
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 0
    aget v4, v0, v3
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 455
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 1
    aget v4, v0, v4
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 456
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 2
    aget v5, v0, v4
    invoke-virtual { v1, v5 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 457
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    aget v0, v0, v4
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 458
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 459
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 460
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v1
    const/4 v3, 6
    aget v1, v1, v3
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
  .line 461
    const-wide/16 v1, 260
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Open;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Open;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .line 462
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 463
    return-void
.end method

.method tracksAhead(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 529
    if-eqz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-eq p1, v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 530
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .line 531
    return-void
  :L1
  .line 529
    return-void
.end method

.method tripGone()V
  .registers 3
  .line 371
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 372
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 373
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0x3F800000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 374
    return-void
.end method
