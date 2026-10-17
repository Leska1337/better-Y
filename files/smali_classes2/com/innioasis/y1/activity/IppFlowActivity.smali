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
  .line 187
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
  .line 54
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 75
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 511
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
  .line 565
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
  .registers 1
  .line 54
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
  .registers 1
  .line 54
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 54
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 54
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    return-void
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 54
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    return-void
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
  .registers 1
  .line 54
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 54
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .registers 1
  .line 54
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-object p0
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 54
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
    return-void
.end method

.method private armAhead()V
  .registers 5
  .line 579
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 580
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 581
    return-void
.end method

.method private armBack()V
  .registers 5
  .line 521
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 522
    sget-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noDwell:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 523
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 524
    return-void
.end method

.method private back(Z)V
  .catchall { :L1 .. :L6 } :L7
  .registers 12
  .line 299
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 300
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 301
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 302
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 303
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 304
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 305
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 306
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 307
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 308
    const/4 v0, 0
    if-eqz p1, :L10
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L0
    goto/16 :L10
  :L0
  .line 313
    const/4 p1, 5
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 314
    const-string p1, "from player"
    invoke-static { p1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 315
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 318
    const/4 v3, 0
  :L1
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 319
    if-nez v4, :L2
    move-object v4, v3
    goto :L3
  :L2
    invoke-virtual { v4 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v4
  :L3
  .line 320
    if-nez v4, :L4
    move-object v4, v3
    goto :L5
  :L4
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 321
    if-eqz v4, :L6
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v5, v4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L6
  .line 323
    goto :L8
  :L7
  .line 322
    move-exception v4
  :L8
  .line 325
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    const/16 v5, 260
    const/4 v6, 2
    if-ltz v4, :L9
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v4, v7, :L9
  .line 326
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
    iget-object v4, v4, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 327
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 330
    if-eqz v3, :L9
    instance-of v7, v4, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v7, :L9
    move-object v7, v4
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;
  .line 331
    invoke-virtual { v7 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v7
    invoke-virtual { v3, v7 }, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    move-result v7
    if-nez v7, :L9
  .line 332
    new-instance v7, Landroid/graphics/drawable/TransitionDrawable;
    new-array v8, v6, [Landroid/graphics/drawable/Drawable;
    aput-object v4, v8, v0
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
  .line 333
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    invoke-direct { v4, v9, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    aput-object v4, v8, p1
    invoke-direct { v7, v8 }, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 334
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V
  .line 335
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v7 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 336
    invoke-virtual { v7, v5 }, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V
  :L9
  .line 339
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 340
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v3
  .line 341
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 342
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 343
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 344
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 345
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v7
    const/4 v8, 6
    aget v7, v7, v8
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 346
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 347
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4, v2 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 348
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
  .line 349
    const-wide/16 v3, 260
    invoke-virtual { p1, v3, v4 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v3, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 350
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 351
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { p1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-direct { p0, v2, v1, v5, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 352
    return-void
  :L10
  .line 309
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 310
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
  .line 311
    return-void
.end method

.method private edgeOn(Ljava/lang/Runnable;IF)V
  .registers 9
  .line 285
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 286
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v2, 0x42B40000
    invoke-virtual { v1, v2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    const/high16 v3, 0x3F000000
    invoke-virtual { v1, v3 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v1
  .line 287
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
  .line 288
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
  .line 289
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0, p3 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { p2, v0 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
  .line 290
    invoke-virtual { p2, p1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 291
    return-void
.end method

.method private flipBack()V
  .registers 5
  .line 274
    const-string v0, "flip back"
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 275
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 276
    const/4 v0, 3
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 279
    const/16 v0, 245
    const/high16 v1, 0x3F800000
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
    move-result-object v0
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;
    const/high16 v3, 0x3FC00000
    invoke-direct { v2, v3 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { v0, v2 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 280
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    const/4 v2, 0
    invoke-direct { v0, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    const/16 v2, 130
    invoke-direct { p0, v0, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;IF)V
  .line 281
    return-void
.end method

.method private flipOver()V
  .registers 9
  .line 217
    const-string v0, "flip over"
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 218
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 219
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
  .line 220
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v4, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
  .line 221
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v5, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 222
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 223
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 224
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 225
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->show(Lcom/innioasis/ipp/Flow$Item;)V
  .line 226
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .line 228
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView$Card;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 229
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 230
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v6
    add-int/lit8 v6, v6, -2
    invoke-virtual { v4, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 231
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v6
    add-int/lit8 v6, v6, -2
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 232
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v6, v4 }, Lcom/innioasis/ipp/FlowView$Card;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 233
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 234
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v6 }, Lcom/innioasis/ipp/FlowView;->getWidth()I
    move-result v6
    add-int/lit16 v6, v6, -360
    div-int/lit8 v6, v6, 2
  .line 235
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 236
    invoke-virtual { v4, v6 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 237
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v6, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 239
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 240
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x42B80000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotX(F)V
  .line 241
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x43080000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotY(F)V
  .line 242
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v5, 0
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationX(F)V
  .line 243
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationY(F)V
  .line 244
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v6, 0x3F800000
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleX(F)V
  .line 245
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleY(F)V
  .line 246
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setRotationY(F)V
  .line 247
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v6, 0
    invoke-virtual { v4, v6 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 248
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 249
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->shrunk()V
  .line 250
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v4, 0x42B40000
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 251
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
  .line 252
    invoke-virtual { v0, v4 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v4, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    invoke-virtual { v0, v4 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 253
    const/16 v0, 75
    invoke-direct { p0, v5, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 254
    const-string v0, "setup"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 255
    return-void
.end method

.method private hold(Z)V
  .registers 3
  .line 503
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
  .line 504
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->hold(Z)V
  :L0
  .line 505
    return-void
.end method

.method private labels(FI)Landroid/animation/ObjectAnimator;
  .registers 7
  .line 376
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
  .line 377
    int-to-long v0, p2
    invoke-virtual { p1, v0, v1 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 378
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 379
    return-object p1
.end method

.method private mode(I)V
  .registers 5
  .line 190
    sput p1, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
  .line 191
    const/4 v0, 0
    const/4 v1, 1
    if-ne p1, v1, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    sput-boolean v2, Lcom/innioasis/y1/activity/IppFlowActivity;->noGc:Z
  .line 192
    const/4 v2, 2
    if-ne p1, v2, :L2
    const/4 v0, 1
  :L2
    sput-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noDwell:Z
  .line 193
    if-eqz v0, :L3
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L3
  .line 194
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
  .line 195
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
  .line 196
    return-void
.end method

.method private placeTrip()V
  .registers 7
  .line 465
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 466
    const/4 v1, 2
    new-array v2, v1, [I
  .line 467
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 468
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 469
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 470
    const/4 v1, 3
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 471
    const/4 v1, 0
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 472
    iget v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    invoke-virtual { v3, v1 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 473
    const/4 v1, 1
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 474
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 475
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 4
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 476
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 5
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 477
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
  .line 478
    return-void
.end method

.method private play()V
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 409
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 410
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v1
  .line 411
    if-eqz v0, :L5
    if-gez v1, :L0
    goto :L5
  :L0
  .line 412
    const-string v2, "to player"
    invoke-static { v2 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 413
    const/4 v2, 1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 417
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 418
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 419
    if-nez v3, :L1
  .line 420
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 421
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v5, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Flow$Item;
    iget-object v5, v5, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 422
    const-string v2, "picture"
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 424
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  :L2
  .line 426
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 427
    if-eqz v4, :L3
    invoke-virtual { v4, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L3
  .line 432
    nop
  .line 433
    const-string v0, "playlist"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 434
    const/4 v0, 4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 435
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/AccelerateInterpolator;-><init>()V
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    const/16 v3, 200
    invoke-direct { p0, v1, v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 436
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const/16 v1, 130
    invoke-direct { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;IF)V
  .line 437
    return-void
  :L4
  .line 428
    move-exception v0
  .line 429
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 430
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 431
    return-void
  :L5
  .line 411
    return-void
.end method

.method private shrunk()V
  .registers 5
  .line 259
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 260
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F000000
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 261
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
  .line 262
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
  .line 263
    return-void
.end method

.method private spread(FFILandroid/animation/TimeInterpolator;)V
  .registers 8
  .line 355
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
  .line 356
    int-to-long p2, p3
    invoke-virtual { p1, p2, p3 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 357
    invoke-virtual { p1, p4 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 358
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 359
    return-void
.end method

.method private startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 4
  .line 532
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 533
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string p1, "ipp-flow-tracks"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 534
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 535
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 536
    return-void
.end method

.method private startPose()[F
  .registers 12
  .line 485
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 486
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 487
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    int-to-float v2, v2
  .line 488
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    int-to-float v3, v3
  .line 489
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
  .line 490
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v5
    const/4 v8, 0
    if-eqz v5, :L0
    const/4 v5, 0
    goto :L1
  :L0
    const/4 v5, 2
  :L1
  .line 491
    mul-int/lit8 v10, v5, 2
    int-to-float v10, v10
    sub-float/2addr v2, v10
    mul-float v2, v2, v3
  .line 492
    const/high16 v10, 0x43340000
    div-float/2addr v10, v2
  .line 493
    aget v2, v0, v6
    int-to-float v5, v5
    mul-float v5, v5, v3
    add-float/2addr v2, v5
    aget v3, v0, v9
    add-float/2addr v3, v5
  .line 494
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
  .line 495
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
  .line 496
    new-array v0, v7, [F
    aput v5, v0, v8
    const/4 v2, 1
    aput v1, v0, v2
    aput v10, v0, v4
    return-object v0
.end method

.method private takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 5
  .line 605
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
  .line 606
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 607
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 608
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 609
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 610
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 611
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
  .line 612
    return-object p1
  :L2
  .line 605
    return-object v0
.end method

.method static tidy()V
  .registers 1
  .line 1019
    sget-boolean v0, Lcom/innioasis/y1/activity/IppFlowActivity;->noGc:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1020
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1021
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 1022
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1023
    return-void
.end method

.method private tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 10
  .line 540
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 541
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-ne p1, v0, :L0
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
    if-eqz v4, :L0
  .line 542
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
  .line 543
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, p1, :L1
    goto :L3
  :L1
  .line 545
    if-eqz v0, :L2
  .line 546
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
    goto :L3
  :L2
  .line 548
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L3
  .line 550
    return-void
.end method

.method ahead()V
  .registers 6
  .line 584
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
  .line 585
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 586
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L1
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 587
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 588
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
  .line 589
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 590
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
  .line 591
    const/4 v0, 1
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 592
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 593
    return-void
  :L4
  .line 588
    return-void
  :L5
  .line 584
    return-void
.end method

.method aheadDone(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 5
  .line 596
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 597
    if-nez p2, :L0
    move-object p1, v0
  :L0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 598
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 599
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 600
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 p2, 2
    if-ne p1, p2, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 601
    return-void
.end method

.method public antiClockwise()V
  .registers 4
  .line 156
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, -1
    if-nez v0, :L0
  .line 157
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 158
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 159
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 160
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 161
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 162
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 164
    return-void
.end method

.method backDone(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 13
  .line 553
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 554
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 555
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 556
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    move-object v1, v7
    move-object v2, p0
    move-object v3, p1
    move-object v4, p2
    move-wide v5, p3
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->run()V
  .line 557
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 558
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 559
    if-eqz p2, :L0
    if-eq p2, p1, :L0
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L0
  .line 560
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 144
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 1
    if-nez v0, :L0
  .line 145
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 146
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 147
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L1
  :L0
  .line 148
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 149
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 150
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 152
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 168
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 169
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L2
  .line 172
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->resting()Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    goto :L3
  :L1
  .line 174
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 175
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->hurry()V
    goto :L3
  :L2
  .line 177
    const/4 v1, 2
    if-ne v0, v1, :L3
  .line 178
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->play()V
  :L3
  .line 180
    return-void
  :L4
  .line 168
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 205
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 206
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 2
    if-ne p1, v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
    goto :L1
  :L0
  .line 207
    if-nez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  :L1
  .line 209
    return-void
.end method

.method done(I)V
  .registers 4
  .line 383
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 384
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 385
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 386
    if-nez p1, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  :L0
  .line 387
    const/4 v0, 2
    if-ne p1, v0, :L1
  .line 388
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 389
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 391
    if-nez p1, :L2
  .line 392
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 393
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 396
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tripGone()V
  .line 397
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, -1
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 398
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/high16 v1, 0x3F800000
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 399
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  :L2
  .line 401
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 54
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 79
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method halfBack()V
  .registers 5
  .line 362
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 363
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 364
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
  .line 365
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v2, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 366
    return-void
.end method

.method halfOver()V
  .registers 4
  .line 266
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 267
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 268
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
  .line 269
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    const/4 v2, 2
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 270
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 271
    return-void
.end method

.method public initView()V
  .registers 9
  .line 84
    const v0, 2131821167
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 85
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
  .line 86
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 87
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 88
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 89
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 90
    new-instance v2, Lcom/innioasis/ipp/FlowView;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 91
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 92
    new-instance v2, Lcom/innioasis/ipp/FlowView$Card;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView$Card;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
  .line 93
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 94
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 184
    const/16 v7, 272
    invoke-direct { v5, v6, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 95
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
  .line 96
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v2, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 97
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 98
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 1
    invoke-direct { v3, v5, v5 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 99
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .line 100
    const/4 v3, 4
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 101
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 360
    invoke-direct { v3, v5, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 102
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 103
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 104
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 105
    return-void
.end method

.method loaded(Ljava/util/List;)V
  .registers 7
  .line 108
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 109
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
  .line 110
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L1
  .line 111
    const p1, 2131820857
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/widget/Toast;->show()V
  .line 112
    return-void
  :L1
  .line 114
    sget v0, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->mode(I)V
  .line 115
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
  .line 116
    new-instance v1, Lcom/innioasis/ipp/Flow$Loader;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { v1, p1, v3, v4 }, Lcom/innioasis/ipp/Flow$Loader;-><init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 117
    new-instance v1, Ljava/lang/Thread;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    const-string v4, "ipp-flow-covers"
    invoke-direct { v1, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 118
    invoke-virtual { v1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 119
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 120
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/ipp/FlowView;->setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .line 121
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setOnRest(Ljava/lang/Runnable;)V
  .line 122
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 123
    const/high16 p1, 0x3F800000
    const/16 v0, 200
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 124
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  .line 125
    return-void
.end method

.method public longConfirm()V
  .registers 3
  .line 200
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L0
    sget v0, Lcom/innioasis/y1/activity/IppFlowActivity;->mode:I
    add-int/lit8 v0, v0, 1
    sget-object v1, Lcom/innioasis/y1/activity/IppFlowActivity;->MODES:[Ljava/lang/String;
    array-length v1, v1
    rem-int/2addr v0, v1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->mode(I)V
  :L0
  .line 201
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 136
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 137
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L0
  .line 138
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v0, :L1
    const-string v1, "flow_pos"
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 139
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 140
    return-void
.end method

.method protected onResume()V
  .registers 4
  .line 129
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onResume()V
  .line 130
    invoke-static { }, Lcom/innioasis/ipp/Flow;->takeReturning()Z
    move-result v0
  .line 131
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 4
    if-ne v1, v2, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->back(Z)V
  :L0
  .line 132
    return-void
.end method

.method openPlayer()V
  .registers 4
  .line 616
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 617
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 618
    const-string v1, "ipp_flip"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 619
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startActivity(Landroid/content/Intent;)V
  .line 620
    const/4 v0, 0
    invoke-virtual { p0, v0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->overridePendingTransition(II)V
  .line 621
    return-void
.end method

.method public quit()V
  .registers 1
  .line 213
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  .line 214
    return-void
.end method

.method toPlayer()V
  .registers 7
  .line 440
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 441
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 442
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 443
    if-nez v0, :L0
  .line 444
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
  .line 445
    return-void
  :L0
  .line 447
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 448
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v2, 0x3F800000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 449
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 450
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 451
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v0
  .line 452
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 0
    aget v4, v0, v3
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 453
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 1
    aget v4, v0, v4
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 454
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 2
    aget v5, v0, v4
    invoke-virtual { v1, v5 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 455
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    aget v0, v0, v4
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 456
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 457
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 458
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
  .line 459
    const-wide/16 v1, 260
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Open;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Open;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .line 460
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 461
    return-void
.end method

.method tracksAhead(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 527
    if-eqz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-eq p1, v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 528
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .line 529
    return-void
  :L1
  .line 527
    return-void
.end method

.method tripGone()V
  .registers 3
  .line 369
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 370
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 371
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0x3F800000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 372
    return-void
.end method
