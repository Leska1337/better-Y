.class public final Lcom/innioasis/y1/activity/IppFlowActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppFlowActivity$Panel;,
    Lcom/innioasis/y1/activity/IppFlowActivity$PlayChange;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Land;,
    Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Opts;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Load;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Gate;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Rested;,
    Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;,
    Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;,
    Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;,
    Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;,
    Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;,
    Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;,
    Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Delete;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Half;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Done;,
    Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Open;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;,
    Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Tick;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Reload;,
    Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Added;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;,
    Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;,
    Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
  }
.end annotation

.field private final static DWELL_MS:I = 300

.field private final static KEY_POS:Ljava/lang/String; = "flow_pos"

.field private final static MOVE_MS:I = 260

.field private final static PANEL_W:I = 360

.field private final static SPREAD_MS:I = 200

.field private final static TIDY_MS:I = 700

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

.field private card:Lcom/innioasis/ipp/FlowView$Card;

.field private final dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;

.field flipPending:Z

.field private flipped:I

.field private flow:Lcom/innioasis/ipp/FlowView;

.field private goAfter:I

.field private items:Ljava/util/List;

.field private keepKey:Ljava/lang/String;

.field private final land:Ljava/lang/Runnable;

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private menu:Lcom/innioasis/music/util/SubMenuDialog;

.field private opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;

.field private panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;

.field private final playChange:Ljava/lang/Runnable;

.field private reloadAfter:Z

.field private volatile state:I

.field private trackMenu:Lcom/innioasis/music/util/SubMenuDialog;

.field private trip:Landroid/widget/ImageView;

.field private tripPic:Landroid/graphics/Bitmap;

.field private ui:Landroid/os/Handler;

.field private wheelAt:J

.method public constructor <init>()V
  .registers 3
  .line 72
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 99
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 139
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$PlayChange;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$PlayChange;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->playChange:Ljava/lang/Runnable;
  .line 140
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Land;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Land;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->land:Ljava/lang/Runnable;
  .line 233
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->goAfter:I
  .line 864
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
  .line 915
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
  .registers 1
  .line 72
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$1000(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 72
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/Flow$Loader;
  .registers 1
  .line 72
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    return-object p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
  .registers 1
  .line 72
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 72
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    return p0
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 72
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    return-void
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 1
  .line 72
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    return-void
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
  .registers 1
  .line 72
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    return-object p0
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)I
  .registers 1
  .line 72
    iget p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    return p0
.end method

.method static synthetic access$900(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .registers 1
  .line 72
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-object p0
.end method

.method private addTo(Ljava/util/List;Lcom/innioasis/y1/database/Playlist;)V
  .registers 6
  .line 402
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;
    const/4 v2, 0
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p2
    invoke-direct { v1, p0, p1, v2, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;Lcom/innioasis/ipp/Flow$Item;Ljava/util/UUID;)V
    const-string p1, "ipp-flow-playlist"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 403
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 404
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 405
    return-void
.end method

.method private armAhead()V
  .registers 5
  .line 929
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 930
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->dwell:Lcom/innioasis/y1/activity/IppFlowActivity$Dwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 931
    return-void
.end method

.method private armBack()V
  .registers 5
  .line 871
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 872
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    const-wide/16 v2, 300
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 873
    return-void
.end method

.method private back(Z)V
  .catchall { :L1 .. :L6 } :L7
  .registers 12
  .line 631
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 632
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 633
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 634
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 635
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleY(F)V
  .line 636
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setTranslationY(F)V
  .line 637
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 638
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 639
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 640
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v3, 0
    invoke-virtual { v0, v3 }, Lcom/innioasis/ipp/FlowView;->turnedBy(Lcom/innioasis/ipp/FlowView$Card;)V
  .line 641
    const/4 v0, 0
    if-eqz p1, :L10
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L0
    goto/16 :L10
  :L0
  .line 646
    const/4 p1, 5
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 647
    const-string p1, "from player"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 648
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  :L1
  .line 651
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v4
  .line 652
    if-nez v4, :L2
    move-object v4, v3
    goto :L3
  :L2
    invoke-virtual { v4 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v4
  :L3
  .line 653
    if-nez v4, :L4
    move-object v4, v3
    goto :L5
  :L4
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 654
    if-eqz v4, :L6
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v5, v4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L6
  .line 656
    goto :L8
  :L7
  .line 655
    move-exception v4
  :L8
  .line 658
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    const/16 v5, 260
    const/4 v6, 2
    if-ltz v4, :L9
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v4, v7, :L9
  .line 659
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v4 }, Lcom/innioasis/ipp/Flow;->coverOf(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/y1/database/Song;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 660
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 663
    if-eqz v3, :L9
    instance-of v7, v4, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v7, :L9
    move-object v7, v4
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;
  .line 664
    invoke-virtual { v7 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v7
    invoke-virtual { v3, v7 }, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    move-result v7
    if-nez v7, :L9
  .line 665
    new-instance v7, Landroid/graphics/drawable/TransitionDrawable;
    new-array v8, v6, [Landroid/graphics/drawable/Drawable;
    aput-object v4, v8, v0
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
  .line 666
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    invoke-direct { v4, v9, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    aput-object v4, v8, p1
    invoke-direct { v7, v8 }, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 667
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V
  .line 668
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3, v7 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 669
    invoke-virtual { v7, v5 }, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V
  :L9
  .line 672
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 673
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v3
  .line 674
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 675
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 676
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 677
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v2 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 678
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v7
    const/4 v8, 6
    aget v7, v7, v8
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 679
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v4, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 680
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4, v2 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 681
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
  .line 682
    const-wide/16 v3, 260
    invoke-virtual { p1, v3, v4 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v3 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v3, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 683
    invoke-virtual { p1, v3 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 684
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { p1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-direct { p0, v2, v1, v5, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 685
    return-void
  :L10
  .line 642
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setSpread(F)V
  .line 643
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
  .line 644
    return-void
.end method

.method private edgeOn(Ljava/lang/Runnable;FIF)V
  .registers 8
  .line 617
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 618
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    invoke-virtual { v1, p2 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    const/high16 v1, 0x3F000000
    invoke-virtual { p2, v1 }, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
  .line 619
    if-lez v0, :L0
    const/high16 v1, 0x43340000
    int-to-float v2, v0
    div-float/2addr v1, v2
    goto :L1
  :L0
    const/high16 v1, 0x3F800000
  :L1
    invoke-virtual { p2, v1 }, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 620
    invoke-virtual { v1 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v1
    int-to-float v1, v1
    const/high16 v2, 0x42B40000
    add-float/2addr v1, v2
    int-to-float v0, v0
    const/high16 v2, 0x40000000
    div-float/2addr v0, v2
    sub-float/2addr v1, v0
    invoke-virtual { p2, v1 }, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    int-to-long v0, p3
  .line 621
    invoke-virtual { p2, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
    new-instance p3, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { p3, p4 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { p2, p3 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object p2
  .line 622
    invoke-virtual { p2, p1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 623
    return-void
.end method

.method private flipBack()V
  .registers 6
  .line 606
    const-string v0, "flip back"
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 607
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 608
    const/4 v0, 3
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 611
    const/16 v0, 245
    const/high16 v2, 0x3F800000
    invoke-direct { p0, v2, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
    move-result-object v0
    new-instance v3, Landroid/view/animation/AccelerateInterpolator;
    const/high16 v4, 0x3FC00000
    invoke-direct { v3, v4 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
    invoke-virtual { v0, v3 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 612
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v0, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    const/high16 v1, 0x42B40000
    const/16 v3, 130
    invoke-direct { p0, v0, v1, v3, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;FIF)V
  .line 613
    return-void
.end method

.method private flipOver()V
  .registers 10
  .line 546
    const-string v0, "flip over"
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 547
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 548
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
  .line 549
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v4, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
  .line 550
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v5, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 551
    const/4 v6, 1
    iput v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 552
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 553
    invoke-direct { p0, v6 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 554
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v7, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->show(Lcom/innioasis/ipp/Flow$Item;)V
  .line 555
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .line 557
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->prepare()V
  .line 559
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView$Card;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 560
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v7 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v7
    add-int/lit8 v7, v7, -2
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 561
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v7 }, Lcom/innioasis/ipp/FlowView;->coverLeft()I
    move-result v7
    add-int/lit8 v7, v7, -2
    invoke-virtual { v4, v7 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 562
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v7 }, Lcom/innioasis/ipp/FlowView;->coverTop()I
    move-result v7
    add-int/lit8 v7, v7, -2
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 563
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v7, v4 }, Lcom/innioasis/ipp/FlowView$Card;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 564
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;
  .line 565
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v7 }, Lcom/innioasis/ipp/FlowView;->getWidth()I
    move-result v7
    add-int/lit16 v7, v7, -360
    div-int/lit8 v7, v7, 2
  .line 566
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 567
    invoke-virtual { v4, v7 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 568
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v7, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 570
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 571
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x42B80000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotX(F)V
  .line 572
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v5, 0x43080000
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setPivotY(F)V
  .line 573
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v5, 0
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationX(F)V
  .line 574
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setTranslationY(F)V
  .line 575
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/high16 v7, 0x3F800000
    invoke-virtual { v4, v7 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleX(F)V
  .line 576
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v7 }, Lcom/innioasis/ipp/FlowView$Card;->setScaleY(F)V
  .line 577
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v5 }, Lcom/innioasis/ipp/FlowView$Card;->setRotationY(F)V
  .line 578
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v4, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 579
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 580
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->turnedBy(Lcom/innioasis/ipp/FlowView$Card;)V
  .line 581
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->shrunk()V
  .line 582
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v1, 0x42B40000
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setRotationY(F)V
  .line 583
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView$Card;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0xC2B40000
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v7, 75
    invoke-virtual { v0, v7, v8 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;
    const v4, 1060033073
    invoke-direct { v1, v4 }, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V
  .line 584
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Half;
    invoke-direct { v1, p0, v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$Half;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 585
    const/16 v0, 75
    invoke-direct { p0, v5, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  .line 586
    const-string v0, "setup"
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 587
    return-void
.end method

.method private follows()Z
  .registers 2
  .line 154
    const-string v0, "follow_playing"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private free()Z
  .registers 7
  .line 158
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trackMenu:Lcom/innioasis/music/util/SubMenuDialog;
    const/4 v1, 0
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L0
    return v1
  :L0
  .line 159
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iget-wide v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->wheelAt:J
    sub-long/2addr v2, v4
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v4
    cmp-long v0, v2, v4
    if-ltz v0, :L2
  :L1
    const/4 v1, 1
  :L2
    return v1
.end method

.method private hold(Z)V
  .registers 3
  .line 856
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
  .line 857
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->hold(Z)V
  :L0
  .line 858
    return-void
.end method

.method private labels(FI)Landroid/animation/ObjectAnimator;
  .registers 7
  .line 721
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
  .line 722
    int-to-long v0, p2
    invoke-virtual { p1, v0, v1 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 723
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 724
    return-object p1
.end method

.method private pin(ILjava/lang/String;I)V
  .registers 5
  .line 386
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
    iget-object v0, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Art;->pin(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p2
    if-nez p2, :L0
    return-void
  :L0
  .line 387
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz p2, :L1
    invoke-virtual { p2, p1 }, Lcom/innioasis/ipp/Flow$Loader;->renew(I)V
  :L1
  .line 388
    invoke-virtual { p0, p3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->showToast(Ljava/lang/String;)V
  .line 389
    return-void
.end method

.method private placeTrip()V
  .registers 7
  .line 818
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 819
    const/4 v1, 2
    new-array v2, v1, [I
  .line 820
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 821
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;
  .line 822
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 823
    const/4 v1, 3
    aget v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 824
    const/4 v1, 0
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 825
    iget v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
    invoke-virtual { v3, v1 }, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V
  .line 826
    const/4 v1, 1
    aget v4, v0, v1
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    aget v1, v2, v1
    sub-int/2addr v4, v1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 827
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 828
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 4
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotX(F)V
  .line 829
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 5
    aget v2, v0, v2
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setPivotY(F)V
  .line 830
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
  .line 831
    return-void
.end method

.method private play()V
  .catchall { :L2 .. :L3 } :L4
  .registers 9
  .line 762
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 763
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v1
  .line 764
    if-eqz v0, :L5
    if-gez v1, :L0
    goto :L5
  :L0
  .line 765
    const-string v2, "to player"
    const/4 v3, 0
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 766
    const/4 v2, 1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 770
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 771
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v4
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 772
    if-nez v4, :L1
  .line 773
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 774
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v6, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Flow$Item;
    iget-object v6, v6, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 775
    const-string v2, "picture"
    invoke-static { v2, v4, v5 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 777
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L2
  .line 779
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 780
    if-eqz v2, :L3
    invoke-virtual { v2, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L3
  .line 785
    nop
  .line 786
    const-string v0, "playlist"
    invoke-static { v0, v4, v5 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 787
    const/4 v0, 4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 788
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;
    invoke-direct { v0 }, Landroid/view/animation/AccelerateInterpolator;-><init>()V
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    const/16 v3, 200
    invoke-direct { p0, v1, v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->spread(FFILandroid/animation/TimeInterpolator;)V
  .line 789
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$ToPlayer;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const/high16 v1, 0xC2B40000
    const/16 v3, 130
    invoke-direct { p0, v0, v1, v3, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->edgeOn(Ljava/lang/Runnable;FIF)V
  .line 790
    return-void
  :L4
  .line 781
    move-exception v0
  .line 782
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 783
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 784
    return-void
  :L5
  .line 764
    return-void
.end method

.method private static playingAlbum(Ljava/util/List;)I
  .registers 4
  .line 215
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity;->playingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 216
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  :L1
  .line 217
    const/4 v1, 0
  :L2
    if-eqz v0, :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 218
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/Flow$Item;
    iget-object v2, v2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return v1
  :L3
  .line 217
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 220
    const/4 p0, -1
    return p0
.end method

.method private static playingMusic()Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 225
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 226
    if-nez v1, :L1
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 227
    move-exception v1
  .line 228
    return-object v0
.end method

.method private static release(Landroid/graphics/drawable/Drawable;)V
  .registers 2
  .line 716
    instance-of v0, p0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :L0
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->release(Landroid/graphics/Bitmap;)V
  :L0
  .line 717
    return-void
.end method

.method private shrunk()V
  .registers 5
  .line 591
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->getHeight()I
    move-result v0
  .line 592
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/high16 v2, 0x3F000000
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setScaleX(F)V
  .line 593
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
  .line 594
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
  .line 595
    return-void
.end method

.method private spread(FFILandroid/animation/TimeInterpolator;)V
  .registers 8
  .line 688
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
  .line 689
    int-to-long p2, p3
    invoke-virtual { p1, p2, p3 }, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;
  .line 690
    invoke-virtual { p1, p4 }, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V
  .line 691
    invoke-virtual { p1 }, Landroid/animation/ObjectAnimator;->start()V
  .line 692
    return-void
.end method

.method private startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 4
  .line 881
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 882
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string p1, "ipp-flow-tracks"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 883
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 884
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 885
    return-void
.end method

.method private startPose()[F
  .registers 12
  .line 838
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->geo(Landroid/content/Context;)[F
    move-result-object v0
  .line 839
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;
  .line 840
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    int-to-float v2, v2
  .line 841
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v3 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    int-to-float v3, v3
  .line 842
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
  .line 843
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v5
    const/4 v8, 0
    if-eqz v5, :L0
    const/4 v5, 0
    goto :L1
  :L0
    const/4 v5, 2
  :L1
  .line 844
    mul-int/lit8 v10, v5, 2
    int-to-float v10, v10
    sub-float/2addr v2, v10
    mul-float v2, v2, v3
  .line 845
    const/high16 v10, 0x43340000
    div-float/2addr v10, v2
  .line 846
    aget v2, v0, v6
    int-to-float v5, v5
    mul-float v5, v5, v3
    add-float/2addr v2, v5
    aget v3, v0, v9
    add-float/2addr v3, v5
  .line 847
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
  .line 848
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
  .line 849
    new-array v0, v7, [F
    aput v5, v0, v8
    const/4 v2, 1
    aput v1, v0, v2
    aput v10, v0, v4
    return-object v0
.end method

.method private takeAhead(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 5
  .line 961
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
  .line 962
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 963
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 964
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 965
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 966
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 967
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
  .line 968
    return-object p1
  :L2
  .line 961
    return-object v0
.end method

.method static tidy()V
  .registers 1
  .line 1938
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1939
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 1940
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyGc:Z
  .line 1941
    return-void
.end method

.method private trackMenu()V
  .registers 6
  .line 350
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 351
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    if-eqz v1, :L1
    if-gez v0, :L0
    goto :L1
  :L0
  .line 352
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 353
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 354
    const v2, 2131820841
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 355
    const v2, 2131821047
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 356
    const v2, 2131821174
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 357
    new-instance v2, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getActivity()Landroid/app/Activity;
    move-result-object v3
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;
    invoke-direct { v4, p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;)V
    const v0, 2131886360
    invoke-direct { v2, v3, v1, v4, v0 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trackMenu:Lcom/innioasis/music/util/SubMenuDialog;
  .line 358
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 359
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trackMenu:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 360
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->wheeled()V
  .line 361
    return-void
  :L1
  .line 351
    return-void
.end method

.method private tracks(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 9
  .line 889
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backDwell:Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 890
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-ne p1, v0, :L0
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
    if-eqz v4, :L0
  .line 892
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    move-object v1, v0
    move-object v2, p0
    move-object v3, p1
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->run()V
    goto :L3
  :L0
  .line 893
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, p1, :L1
    goto :L3
  :L1
  .line 895
    if-eqz v0, :L2
  .line 896
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
    goto :L3
  :L2
  .line 898
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L3
  .line 900
    return-void
.end method

.method private wheeled()V
  .registers 5
  .line 164
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->wheelAt:J
  .line 165
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->land:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 166
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->follows()Z
    move-result v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->land:Ljava/lang/Runnable;
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v2
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 167
    return-void
.end method

.method added()V
  .registers 2
  .line 408
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L0
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->showToast(Ljava/lang/String;)V
  :L0
  .line 409
    return-void
.end method

.method ahead()V
  .registers 6
  .line 934
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
  .line 935
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->track()I
    move-result v0
  .line 936
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    const/4 v2, 0
    if-eqz v1, :L1
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 937
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    move-object v0, v2
  :L2
  .line 938
    if-eqz v0, :L4
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    goto :L4
  :L3
  .line 940
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 941
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 942
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 943
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 944
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->release(Landroid/graphics/Bitmap;)V
  .line 945
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 946
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
  .line 947
    const/4 v0, 1
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 948
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 949
    return-void
  :L4
  .line 938
    return-void
  :L5
  .line 934
    return-void
.end method

.method aheadDone(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 5
  .line 952
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadBusy:Ljava/lang/String;
  .line 953
    if-nez p2, :L0
    move-object p1, v0
  :L0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFor:Ljava/lang/String;
  .line 954
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadPic:Landroid/graphics/Bitmap;
  .line 955
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadSrc:[Ljava/lang/Object;
  .line 956
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 p2, 2
    if-ne p1, p2, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 957
    return-void
.end method

.method public antiClockwise()V
  .registers 4
  .line 290
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, -1
    if-nez v0, :L0
  .line 291
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 292
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 293
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L2
  :L0
  .line 294
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 295
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 296
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  .line 297
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->wheeled()V
    goto :L2
  :L1
  .line 298
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 6
    if-ne v0, v2, :L2
  .line 299
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->move(I)V
  :L2
  .line 301
    return-void
.end method

.method backDone(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 13
  .line 903
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
  .line 904
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 905
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 906
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    move-object v1, v7
    move-object v2, p0
    move-object v3, p1
    move-object v4, p2
    move-wide v5, p3
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->run()V
  .line 907
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 908
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backNext:Lcom/innioasis/ipp/Flow$Item;
  .line 909
    if-eqz p2, :L0
    if-eq p2, p1, :L0
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  :L0
  .line 910
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 275
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 1
    if-nez v0, :L0
  .line 276
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 277
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->step(I)V
  .line 278
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L2
  :L0
  .line 279
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 2
    if-ne v0, v2, :L1
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->move(I)V
  .line 281
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  .line 282
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->wheeled()V
    goto :L2
  :L1
  .line 283
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 6
    if-ne v0, v2, :L2
  .line 284
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->move(I)V
  :L2
  .line 286
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 305
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 306
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v0, :L2
  .line 309
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->resting()Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipOver()V
    goto :L4
  :L1
  .line 311
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 312
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->hurry()V
    goto :L4
  :L2
  .line 314
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L3
  .line 315
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->play()V
    goto :L4
  :L3
  .line 316
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 6
    if-ne v0, v1, :L4
  .line 317
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->change()V
  .line 318
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->count(Landroid/content/Context;)I
    move-result v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->setCount(I)V
  .line 319
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->yearAt(Landroid/content/Context;)I
    move-result v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView;->setYears(I)V
  :L4
  .line 321
    return-void
  :L5
  .line 305
    return-void
.end method

.method delete(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 4
  .line 505
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string p1, "ipp-flow-delete"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 506
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 507
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 508
    return-void
.end method

.method deleteTrack(Lcom/innioasis/y1/database/Song;)V
  .registers 6
  .line 413
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ltz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt v0, v1, :L0
    goto :L1
  :L0
  .line 414
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/Flow$Item;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->row()I
    move-result v3
    invoke-direct { v1, p0, p1, v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Flow$Item;I)V
    const-string p1, "ipp-flow-delete"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 416
    const/4 p1, 1
    invoke-virtual { v0, p1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 417
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 418
    return-void
  :L1
  .line 413
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 527
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L2
  .line 528
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 2
    if-ne p1, v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
    goto :L2
  :L0
  .line 529
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
    goto :L2
  :L1
  .line 530
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v0, 6
    if-ne p1, v0, :L2
  .line 531
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->setVisibility(I)V
  .line 532
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setVisibility(I)V
  .line 533
    const p1, 2131821167
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 534
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 535
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->regrouped()Z
    move-result p1
    if-eqz p1, :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->reload()V
  :L2
  .line 538
    return-void
.end method

.method done(I)V
  .registers 5
  .line 728
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 729
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->hold(Z)V
  .line 730
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 731
    if-nez p1, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  :L0
  .line 732
    const/4 v1, 2
    if-ne p1, v1, :L1
  .line 733
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 734
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L1
  .line 736
    if-nez p1, :L3
  .line 737
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v1, 8
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 738
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v1, 0
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  .line 741
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tripGone()V
  .line 742
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v1, -1
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->hide(I)V
  .line 743
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/high16 v2, 0x3F800000
    invoke-virtual { p1, v2 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 744
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
  .line 745
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->goAfter:I
    if-ltz p1, :L2
  .line 746
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2, p1 }, Lcom/innioasis/ipp/FlowView;->goTo(I)V
  .line 747
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->goAfter:I
  :L2
  .line 749
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->reloadAfter:Z
    if-eqz p1, :L3
  .line 750
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->reloadAfter:Z
  .line 751
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->reload()V
  :L3
  .line 754
    return-void
.end method

.method enqueued(Ljava/util/List;)V
  .registers 3
  .line 500
    if-eqz p1, :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->addAllFromMusic(Ljava/util/List;)V
  :L0
  .line 501
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 72
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 103
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method halfBack()V
  .registers 5
  .line 695
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 696
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 697
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
  .line 698
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    invoke-direct { v2, p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
    invoke-virtual { v0, v2 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 699
    return-void
.end method

.method halfOver()V
  .registers 4
  .line 598
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 599
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 600
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
  .line 601
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Done;
    const/4 v2, 2
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .line 602
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 603
    return-void
.end method

.method public initView()V
  .registers 9
  .line 108
    const v0, 2131821167
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 109
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
  .line 110
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 111
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 112
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 113
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 114
    new-instance v2, Lcom/innioasis/ipp/FlowView;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
  .line 115
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->yearAt(Landroid/content/Context;)I
    move-result v3
    invoke-virtual { v2, v3 }, Lcom/innioasis/ipp/FlowView;->setYears(I)V
  .line 116
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 117
    new-instance v2, Lcom/innioasis/ipp/FlowView$Card;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/FlowView$Card;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
  .line 118
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Lcom/innioasis/ipp/FlowView$Card;->setVisibility(I)V
  .line 119
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 184
    const/16 v7, 272
    invoke-direct { v5, v6, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 120
    new-instance v2, Landroid/widget/ImageView;
    invoke-direct { v2, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
  .line 121
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v2, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 122
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 123
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v6, 1
    invoke-direct { v5, v6, v6 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 124
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
  .line 125
    const/4 v5, 4
    invoke-virtual { v2, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 126
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v6, 360
    invoke-direct { v5, v6, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 127
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
  .line 128
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->setVisibility(I)V
  .line 129
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 130
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 131
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Highlight;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 132
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->playChange:Ljava/lang/Runnable;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lists;->watch(Ljava/lang/Runnable;)V
  .line 133
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 134
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 135
    return-void
.end method

.method landed()V
  .registers 3
  .line 171
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L3
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->follows()Z
    move-result v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 172
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trackMenu:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L1
  .line 173
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->wheeled()V
  .line 174
    return-void
  :L1
  .line 176
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 177
    if-eqz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->follow(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L2
  .line 178
    return-void
  :L3
  .line 171
    return-void
.end method

.method loaded(Ljava/util/List;)V
  .registers 7
  .line 181
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 182
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
  .line 183
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L2
  .line 184
    const p1, 2131820857
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/widget/Toast;->show()V
  .line 185
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-nez p1, :L1
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result p1
    if-lez p1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  :L1
  .line 186
    return-void
  :L2
  .line 188
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
  .line 189
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->keepKey:Ljava/lang/String;
    if-nez v3, :L3
    const-string v3, "flow_start"
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v3
    if-ne v3, v2, :L3
  .line 190
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->playingAlbum(Ljava/util/List;)I
    move-result v3
  .line 191
    if-ltz v3, :L3
    move v0, v3
  :L3
  .line 193
    nop
  :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->keepKey:Ljava/lang/String;
    if-eqz v3, :L6
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L6
  .line 194
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->keepKey:Ljava/lang/String;
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Flow$Item;
    iget-object v4, v4, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
    move v0, v1
  :L5
  .line 193
    add-int/lit8 v1, v1, 1
    goto :L4
  :L6
  .line 196
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->keepKey:Ljava/lang/String;
  .line 197
    new-instance v1, Lcom/innioasis/ipp/Flow$Loader;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->ui:Landroid/os/Handler;
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Repaint;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { v1, p1, v3, v4 }, Lcom/innioasis/ipp/Flow$Loader;-><init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 198
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 199
    new-instance v1, Ljava/lang/Thread;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    const-string v4, "ipp-flow-covers"
    invoke-direct { v1, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 200
    invoke-virtual { v1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 201
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 202
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/ipp/FlowView;->setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .line 203
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    new-instance v0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setOnRest(Ljava/lang/Runnable;)V
  .line 204
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/FlowView;->calm()Z
    move-result p1
    const/high16 v0, 0x3F800000
    if-eqz p1, :L7
  .line 205
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { p1, v0 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
    goto :L8
  :L7
  .line 207
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 v1, 0
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/FlowView;->setLabels(F)V
  .line 208
    const/16 p1, 200
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->labels(FI)Landroid/animation/ObjectAnimator;
  :L8
  .line 210
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
  .line 211
    return-void
.end method

.method public longConfirm()V
  .registers 6
  .line 329
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L4
  :L0
  .line 330
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L1
  .line 331
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->trackMenu()V
  .line 332
    return-void
  :L1
  .line 334
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-eqz v0, :L2
    return-void
  :L2
  .line 335
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 336
    const v1, 2131820961
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 337
    const v1, 2131821047
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 338
    const v1, 2131820582
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 340
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v2
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
    iget-object v1, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/Art;->hasPick(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L3
    const v1, 2131821176
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 342
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v4
    invoke-direct { v3, p0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
    const v4, 2131886360
    invoke-direct { v1, v2, v0, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->menu:Lcom/innioasis/music/util/SubMenuDialog;
  .line 343
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 344
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->menu:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 345
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->menu:Lcom/innioasis/music/util/SubMenuDialog;
    const v1, 2131820772
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Menus;->append(Landroid/app/Dialog;Ljava/lang/String;)V
  .line 346
    return-void
  :L4
  .line 329
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 267
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 268
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L0
  .line 269
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v0, :L1
    const-string v1, "flow_pos"
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 270
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 271
    return-void
.end method

.method protected onResume()V
  .registers 4
  .line 260
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onResume()V
  .line 261
    invoke-static { }, Lcom/innioasis/ipp/Flow;->takeReturning()Z
    move-result v0
  .line 262
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 4
    if-ne v1, v2, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->back(Z)V
  :L0
  .line 263
    return-void
.end method

.method openPlayer()V
  .registers 4
  .line 972
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 973
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 974
    const-string v1, "ipp_flip"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 975
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startActivity(Landroid/content/Intent;)V
  .line 976
    const/4 v0, 0
    invoke-virtual { p0, v0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->overridePendingTransition(II)V
  .line 977
    return-void
.end method

.method pick(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 15
  .line 445
    const/4 v0, 0
    if-nez p2, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object v1
  :L1
  .line 446
    const/4 v2, 1
    if-eqz v1, :L9
    if-ltz p1, :L9
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-lt p1, v3, :L2
    goto/16 :L9
  :L2
  .line 447
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v3, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Flow$Item;
  .line 448
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p2
  .line 449
    if-eqz p2, :L3
  .line 450
    new-instance p1, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p2
    invoke-direct { v1, p0, v0, v3, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;Lcom/innioasis/ipp/Flow$Item;Ljava/util/UUID;)V
    const-string p2, "ipp-flow-playlist"
    invoke-direct { p1, v1, p2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 451
    invoke-virtual { p1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 452
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 453
    return v2
  :L3
  .line 455
    const p2, 2131820961
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    const/4 v4, 0
    const v5, 2131886360
    if-eqz p2, :L4
  .line 456
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 457
    const p2, 2131820965
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-interface { p1, p2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 458
    const p2, 2131820971
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-interface { p1, p2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 459
    const p2, 2131821028
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-interface { p1, p2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 460
    const p2, 2131821029
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-interface { p1, p2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 461
    new-instance p2, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getActivity()Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-direct { p2, v0, p1, v1, v5 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { p2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 462
    return v4
  :L4
  .line 464
    const p2, 2131821047
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L5
  .line 465
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;
    invoke-direct { p2, p0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const-string v0, "ipp-flow-queue"
    invoke-direct { p1, p2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 466
    invoke-virtual { p1, v2 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 467
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 468
    goto :L8
  :L5
    const p2, 2131820582
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L6
  .line 469
    new-instance v6, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getActivity()Landroid/app/Activity;
    move-result-object p1
    invoke-direct { v6, p1, v4, v5 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 470
    const p1, 2131820738
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
    const-string v8, ""
    new-instance v9, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;
    invoke-direct { v9, p0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
    const/4 v10, 0
    const/4 v11, 1
    invoke-virtual/range { v6 .. v11 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 471
    goto :L8
  :L6
    const p2, 2131821176
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L7
  .line 472
    const p2, 2131821177
    invoke-direct { p0, p1, v0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->pin(ILjava/lang/String;I)V
    goto :L8
  :L7
  .line 473
    const p1, 2131820772
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L8
  .line 474
    const/4 p1, 6
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
  .line 475
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->open()V
  .line 476
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    const/4 p2, 4
    invoke-virtual { p1, p2 }, Lcom/innioasis/ipp/FlowView;->setVisibility(I)V
  .line 477
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->opts:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->title()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->setStateBarLeftText(Ljava/lang/String;)V
  :L8
  .line 479
    return v2
  :L9
  .line 446
    return v2
.end method

.method playChanged()V
  .registers 3
  .line 146
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 147
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->free()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->follows()Z
    move-result v0
    if-eqz v0, :L0
  .line 148
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 149
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->follow(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L0
  .line 151
    return-void
.end method

.method public quit()V
  .registers 1
  .line 542
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->finish()V
  .line 543
    return-void
.end method

.method reload()V
  .registers 4
  .line 512
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 513
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->quit()V
  :L1
  .line 514
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 515
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    if-eqz v1, :L2
  .line 516
    invoke-virtual { v1 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v1
  .line 517
    const-string v2, "flow_pos"
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 518
    if-ltz v1, :L2
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
    iget-object v1, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->keepKey:Ljava/lang/String;
  :L2
  .line 520
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 521
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 522
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Load;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    const-string v2, "ipp-flow-list"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 523
    return-void
.end method

.method slid()V
  .registers 3
  .line 393
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 394
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ltz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v1, :L0
  .line 395
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 396
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->card:Lcom/innioasis/ipp/FlowView$Card;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/FlowView$Card;->setSlide(Landroid/graphics/Bitmap;)V
  :L0
  .line 398
    return-void
.end method

.method sort(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 5
  .line 483
    const/4 v0, 0
    if-nez p1, :L0
    move-object p1, v0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 484
    nop
  .line 485
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L2
    const/4 p1, 0
    goto :L6
  :L2
  .line 486
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    const/4 p1, 1
    goto :L6
  :L3
  .line 487
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
    const/4 p1, 2
    goto :L6
  :L4
  .line 488
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L5
    const/4 p1, 3
    goto :L6
  :L5
    const/4 p1, -1
  :L6
  .line 489
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->menu:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v1, :L7
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  :L7
  .line 490
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->menu:Lcom/innioasis/music/util/SubMenuDialog;
  .line 491
    if-ltz p1, :L8
    const-string v0, "flow_sort"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
    if-eq p1, v1, :L8
  .line 492
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 493
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->reload()V
  :L8
  .line 495
    return v2
.end method

.method toPlayer()V
  .registers 7
  .line 793
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setVisibility(I)V
  .line 794
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 795
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->tripPic:Landroid/graphics/Bitmap;
  .line 796
    if-nez v0, :L0
  .line 797
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
  .line 798
    return-void
  :L0
  .line 800
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/ViewPropertyAnimator;->cancel()V
  .line 801
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v2, 0x3F800000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 802
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 803
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->placeTrip()V
  .line 804
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startPose()[F
    move-result-object v0
  .line 805
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v3, 0
    aget v4, v0, v3
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationX(F)V
  .line 806
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 1
    aget v4, v0, v4
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setTranslationY(F)V
  .line 807
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v4, 2
    aget v5, v0, v4
    invoke-virtual { v1, v5 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 808
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    aget v0, v0, v4
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 809
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v1, 0x42B40000
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setRotationY(F)V
  .line 810
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 811
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
  .line 812
    const-wide/16 v1, 260
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;
    invoke-direct { v1 }, Landroid/view/animation/DecelerateInterpolator;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Open;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Open;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .line 813
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 814
    return-void
.end method

.method public toPlaying()V
  .registers 4
  .line 240
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    if-eqz v0, :L6
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L6
  :L0
  .line 241
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->playingAlbum(Ljava/util/List;)I
    move-result v0
  .line 242
    if-gez v0, :L1
    return-void
  :L1
  .line 243
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    if-nez v1, :L2
  .line 244
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 245
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flow:Lcom/innioasis/ipp/FlowView;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/FlowView;->goTo(I)V
  .line 246
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armBack()V
    goto :L5
  :L2
  .line 247
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v2, 2
    if-ne v1, v2, :L5
  .line 248
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ne v0, v1, :L4
  .line 249
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity;->playingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 250
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->select(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L3
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  :L3
  .line 251
    goto :L5
  :L4
  .line 252
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->goAfter:I
  .line 253
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
  :L5
  .line 256
    return-void
  :L6
  .line 240
    return-void
.end method

.method trackDeleted(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;I)V
  .registers 6
  .line 421
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 422
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 423
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L3
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->state:I
    const/4 v1, 2
    if-ne v0, v1, :L3
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ltz v0, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p1, :L0
    goto :L3
  :L0
  .line 424
    if-eqz p2, :L2
    iget-object v0, p2, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    if-eqz v0, :L2
    iget-object v0, p2, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 429
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
  .line 430
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backReady:Lcom/innioasis/ipp/Flow$Back;
  .line 431
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .line 432
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->panel:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { p1, p3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->near(I)V
  .line 433
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->armAhead()V
  .line 434
    return-void
  :L2
  .line 425
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->reloadAfter:Z
  .line 426
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->flipBack()V
  .line 427
    return-void
  :L3
  .line 423
    return-void
.end method

.method trackPick(Lcom/innioasis/y1/database/Song;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 11
  .line 364
    const/4 v0, 1
    if-eqz p2, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 365
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 366
    invoke-interface { v1, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 367
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v2
  .line 368
    if-eqz v2, :L1
  .line 369
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->addTo(Ljava/util/List;Lcom/innioasis/y1/database/Playlist;)V
  .line 370
    return v0
  :L1
  .line 372
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
  .line 373
    const v2, 2131821047
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
  .line 374
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addAllFromMusic(Ljava/util/List;)V
    goto :L5
  :L2
  .line 375
    const v1, 2131820841
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 376
    new-instance v2, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getActivity()Landroid/app/Activity;
    move-result-object p2
    const/4 v1, 0
    const v3, 2131886360
    invoke-direct { v2, p2, v1, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 377
    const p2, 2131820738
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    new-instance v5, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;
    invoke-direct { v5, p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;)V
    const/4 v6, 0
    const/4 v7, 1
    invoke-virtual/range { v2 .. v7 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
    goto :L4
  :L3
  .line 378
    const v1, 2131821174
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L4
  .line 379
    iget p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    if-ltz p2, :L5
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge p2, v1, :L5
    iget p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipped:I
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    const v1, 2131821175
    invoke-direct { p0, p2, p1, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->pin(ILjava/lang/String;I)V
    goto :L5
  :L4
  .line 378
    nop
  :L5
  .line 381
    return v0
  :L6
  .line 364
    return v0
.end method

.method tracksAhead(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 876
    if-eqz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backFor:Lcom/innioasis/ipp/Flow$Item;
    if-eq p1, v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->backBusy:Lcom/innioasis/ipp/Flow$Item;
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 877
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->startBack(Lcom/innioasis/ipp/Flow$Item;)V
  .line 878
    return-void
  :L1
  .line 876
    return-void
.end method

.method tripGone()V
  .registers 4
  .line 702
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 703
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/16 v2, 8
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 704
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 705
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity;->trip:Landroid/widget/ImageView;
    const/high16 v2, 0x3F800000
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setAlpha(F)V
  .line 707
    instance-of v1, v0, Landroid/graphics/drawable/TransitionDrawable;
    if-eqz v1, :L2
  .line 708
    check-cast v0, Landroid/graphics/drawable/TransitionDrawable;
  .line 709
    const/4 v1, 0
  :L0
    invoke-virtual { v0 }, Landroid/graphics/drawable/TransitionDrawable;->getNumberOfLayers()I
    move-result v2
    if-ge v1, v2, :L1
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/TransitionDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->release(Landroid/graphics/drawable/Drawable;)V
    add-int/lit8 v1, v1, 1
    goto :L0
  :L1
  .line 710
    goto :L3
  :L2
  .line 711
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->release(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 713
    return-void
.end method
