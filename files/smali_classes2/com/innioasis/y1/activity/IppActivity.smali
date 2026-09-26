.class public final Lcom/innioasis/y1/activity/IppActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppActivity$AlbumJob;,
    Lcom/innioasis/y1/activity/IppActivity$Item;,
    Lcom/innioasis/y1/activity/IppActivity$Retheme;,
    Lcom/innioasis/y1/activity/IppActivity$Scroll;,
    Lcom/innioasis/y1/activity/IppActivity$Blink;,
    Lcom/innioasis/y1/activity/IppActivity$Confirm;,
    Lcom/innioasis/y1/activity/IppActivity$CachePick;,
    Lcom/innioasis/y1/activity/IppActivity$Noop;,
    Lcom/innioasis/y1/activity/IppActivity$RescanTask;,
    Lcom/innioasis/y1/activity/IppActivity$Tick;,
    Lcom/innioasis/y1/activity/IppActivity$Done;,
    Lcom/innioasis/y1/activity/IppActivity$CacheTask;,
    Lcom/innioasis/y1/activity/IppActivity$CacheDone;,
    Lcom/innioasis/y1/activity/IppActivity$RebootRun;,
    Lcom/innioasis/y1/activity/IppActivity$ByPath;,
    Lcom/innioasis/y1/activity/IppActivity$SongWorker;,
    Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;,
    Lcom/innioasis/y1/activity/IppActivity$Blocks;
  }
.end annotation

.field private final static ACCENT:I = 0

.field private final static ACTION:I = 3

.field private final static ACT_LOG:I = 2

.field private final static ACT_REBOOT:I = 0

.field private final static ACT_SCAN:I = 1

.field public final static BAND_ALPHA:I = 1493172224

.field public final static BAND_ALPHA_BARE:I = 771751936

.field private final static BLINK_MS:J = 400L

.field private final static CHOICE:I = 2

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static HEADER:I = 0

.field private final static NUMBER:I = 4

.field public final static RULE_ALPHA:I = 1493172224

.field private final static TOGGLE:I = 1

.field private static lastItems:Ljava/util/List;

.field private blink:Lcom/innioasis/y1/activity/IppActivity$Blink;

.field private editIndex:I

.field private editVal:I

.field private editing:Z

.field private hairColor:I

.field private items:Ljava/util/List;

.field private labels:[Landroid/widget/TextView;

.field private lastHair:Landroid/view/View;

.field private marks:[Landroid/widget/TextView;

.field private progress:Lcom/innioasis/y1/utils/LoadingDialog;

.field private retheme:Lcom/innioasis/y1/activity/IppActivity$Retheme;

.field private rowBoxes:[Landroid/view/View;

.field private rowViews:[Landroid/view/View;

.field private scrollPending:Z

.field private scroller:Landroid/widget/ScrollView;

.field private sel:I

.field private values:[Landroid/widget/TextView;

.method static constructor <clinit>()V
  .registers 1
  .line 92
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 81
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppActivity;)Ljava/util/List;
  .registers 1
  .line 81
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 1
  .line 81
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    return-void
.end method

.method static synthetic access$202(Lcom/innioasis/y1/activity/IppActivity;Z)Z
  .registers 2
  .line 81
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    return p1
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppActivity;Z)V
  .registers 2
  .line 81
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
    return-void
.end method

.method static synthetic access$500()I
  .registers 1
  .line 81
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->workers()I
    move-result v0
    return v0
.end method

.method static synthetic access$600([Ljava/lang/Runnable;)V
  .registers 1
  .line 81
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->spread([Ljava/lang/Runnable;)V
    return-void
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .registers 1
  .line 81
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
    return-void
.end method

.method static synthetic access$900(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 1
  .line 81
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p0
.end method

.method static synthetic access$902(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 2
  .line 81
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p1
.end method

.method private static album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .catchall { :L3 .. :L6 } :L9
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L16
  .registers 4
  .line 1477
    if-eqz p0, :L18
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    if-nez v0, :L0
    goto/16 :L18
  :L0
  .line 1478
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L2
  .line 1481
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L1
  .line 1482
    return-void
  :L2
  .line 1485
    nop
  .line 1486
    new-instance v0, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 1488
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 1489
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-eqz v2, :L4
    const/16 v2, 13
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotArtist:Ljava/lang/String;
  :L4
  .line 1490
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-eqz v2, :L5
  .line 1491
    const/16 v2, 8
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotYear:Ljava/lang/String;
  .line 1492
    const/4 v2, 5
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotDate:Ljava/lang/String;
  :L5
  .line 1494
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v2, :L7
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v2
  :L6
    goto :L8
  :L7
    move-object v2, v1
  :L8
  .line 1497
    goto :L10
  :L9
  .line 1495
    move-exception v2
    move-object v2, v1
  :L10
  .line 1498
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 1500
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L17
  .line 1504
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v0, :L14
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L14
  .line 1506
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L15
  .line 1508
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1509
    goto :L17
  :L16
  .line 1508
    move-exception p0
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1509
    throw p0
  :L17
  .line 1511
    return-void
  :L18
  .line 1477
    return-void
.end method

.method public static bandAlpha()I
  .registers 1
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/Theme;->rowsPainted()Z
    move-result v0
    if-eqz v0, :L0
    const/high16 v0, 0x59000000
    goto :L1
  :L0
    const/high16 v0, 0x2E000000
  :L1
    return v0
.end method

.method private buildItems()Ljava/util/List;
  .registers 11
  .line 187
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->registry()Ljava/util/List;
    move-result-object v0
  .line 188
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->rows(Landroid/content/Context;)Ljava/util/List;
    move-result-object v1
  .line 189
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L0
    return-object v0
  :L0
  .line 191
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 192
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 193
    const/4 v4, 0
    const/4 v5, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L5
  .line 194
    invoke-interface { v1, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Help$Row;
  .line 195
    iget-object v7, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-static { v0, v7 }, Lcom/innioasis/y1/activity/IppActivity;->find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v7
  .line 196
    if-eqz v7, :L4
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L2
    goto :L4
  :L2
  .line 197
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 198
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
  .line 199
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 200
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 2
    if-ne v8, v9, :L3
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v8, :L3
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v8, v8
    iget v9, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-ne v8, v9, :L3
  .line 201
    iget-object v6, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    iput-object v6, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
  :L3
  .line 203
    invoke-interface { v2, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L4
  .line 193
    add-int/lit8 v5, v5, 1
    goto :L1
  :L5
  .line 207
    nop
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L8
  .line 208
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 209
    iget-object v5, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L7
    invoke-interface { v2, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L7
  .line 207
    add-int/lit8 v4, v4, 1
    goto :L6
  :L8
  .line 211
    return-object v2
.end method

.method private clampSel()V
  .registers 3
  .line 328
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L0
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v0
    if-nez v0, :L1
  :L0
  .line 329
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  :L1
  .line 331
    return-void
.end method

.method private confirmCache()V
  .registers 3
  .line 857
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CachePick;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$CachePick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Pick;->askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .line 858
    return-void
.end method

.method private confirmLog(Ljava/lang/String;)V
  .registers 8
  .line 846
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 847
    const v1, 2131821112
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppActivity$Confirm;
    const/4 v1, 2
    invoke-direct { v3, p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Confirm;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    const/4 v4, 0
    const/4 v5, 1
    move-object v1, p1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 849
    return-void
.end method

.method private confirmReboot(Ljava/lang/String;)V
  .registers 9
  .line 834
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const v2, 2131886360
    const/4 v3, 0
    invoke-direct { v0, v1, v3, v2 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 835
    const v1, 2131821040
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    new-instance v4, Lcom/innioasis/y1/activity/IppActivity$Confirm;
    invoke-direct { v4, p0, v3 }, Lcom/innioasis/y1/activity/IppActivity$Confirm;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    const/4 v5, 0
    const/4 v6, 1
    move-object v1, p1
    move-object v3, v4
    move v4, v5
    move v5, v6
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 837
    return-void
.end method

.method private confirmScan(Ljava/lang/String;)V
  .registers 8
  .line 840
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 841
    const v1, 2131821042
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppActivity$Confirm;
    const/4 v1, 1
    invoke-direct { v3, p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Confirm;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    const/4 v4, 0
    const/4 v5, 1
    move-object v1, p1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 843
    return-void
.end method

.method private endEdit(Z)V
  .registers 6
  .line 763
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 764
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 765
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 766
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v2, v2, v3
  .line 767
    if-eqz v2, :L1
  .line 768
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 769
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  :L1
  .line 771
    if-eqz p1, :L2
    iget-object p1, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L2
  .line 772
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 773
    return-void
.end method

.method private static find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 6
  .line 215
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 216
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 217
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 218
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L2
    return-object v2
  :L2
  .line 216
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 220
    return-object v0
.end method

.method private firstSelectable()I
  .registers 4
  .line 321
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 322
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v2
    if-eqz v2, :L1
    return v1
  :L1
  .line 321
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 324
    return v0
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 303
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private glide(I)V
  .registers 5
  .line 685
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getChildCount()I
    move-result v0
    const/4 v1, 0
    if-lez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 686
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v2 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v2
    sub-int/2addr v0, v2
  :L3
  .line 687
    if-gez v0, :L4
    const/4 v0, 0
  :L4
  .line 688
    if-gez p1, :L5
    const/4 p1, 0
  :L5
  .line 689
    if-le p1, v0, :L6
    goto :L7
  :L6
    move v0, p1
  :L7
  .line 690
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1, v1, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 691
    return-void
.end method

.method private hair()Landroid/view/View;
  .registers 5
  .line 583
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    if-nez v0, :L0
  .line 584
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 585
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 586
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 585
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 587
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0x1F000000
    or-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
  :L0
  .line 589
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 590
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 591
    return-object v0
.end method

.method private static label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
  .registers 2
  .line 1649
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
    if-eqz v0, :L0
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
    goto :L1
  :L0
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
  :L1
    return-object p0
.end method

.method public static labelOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 6
  .line 1638
    sget-object v0, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 1639
    const/4 v1, 0
    if-eqz v0, :L4
    if-nez p0, :L0
    goto :L4
  :L0
  .line 1640
    const/4 v2, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1641
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1642
    iget-object v4, v3, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 1640
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1644
    return-object v1
  :L4
  .line 1639
    return-object v1
.end method

.method private move(I)V
  .registers 3
  .line 560
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 561
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 562
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 563
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 564
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 565
    return-void
.end method

.method private paint(I)V
  .registers 7
  .line 598
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L11
    if-ltz p1, :L11
    array-length v0, v0
    if-lt p1, v0, :L0
    goto :L11
  :L0
  .line 599
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 600
    iget v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v0, :L10
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L1
    goto :L10
  :L1
  .line 601
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v0, v0, p1
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L2
    goto :L9
  :L2
  .line 602
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    const/4 v1, 0
    if-ne p1, v0, :L3
    const/4 v0, 1
    goto :L4
  :L3
    const/4 v0, 0
  :L4
  .line 603
    if-eqz v0, :L5
    sget v2, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v2, -1
  :L6
  .line 604
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v4, v4, p1
    if-eqz v0, :L7
    const v1, 2131231052
  :L7
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 605
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 606
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 607
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object v1, v1, p1
    if-eqz v1, :L8
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object p1, v3, p1
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 608
    return-void
  :L9
  .line 601
    return-void
  :L10
  .line 600
    return-void
  :L11
  .line 598
    return-void
.end method

.method private postScroll()V
  .registers 3
  .line 612
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 613
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
  .line 614
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Scroll;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$Scroll;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 615
    return-void
  :L1
  .line 612
    return-void
.end method

.method private registry()Ljava/util/List;
  .registers 15
  .line 233
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 236
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v2, 0
    const-string v3, "tools"
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 237
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 3
    const-string v10, "reboot"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 238
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 3
    const-string v4, "cache"
    const/4 v5, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 239
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "scan"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 243
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "backup"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 246
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "m3u_import"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 248
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "log"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 251
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "player"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 252
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "icon_tint"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 253
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "text_tint"
    const/4 v11, 3
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 254
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "lyrics_tint"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 255
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "cover_tilt"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 259
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "top_hold"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 260
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "book_top_hold"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 261
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "first_artist_only"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 262
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "feat_in_title"
    const/4 v11, 0
    const-string v13, "first_artist_only"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 263
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "artist_album_scroll"
    const/4 v5, 4
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 266
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "menu"
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 267
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "alpha_scroll"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 268
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 4
    const-string v10, "alpha_threshold"
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v11, v2
    sget-object v12, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 269
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "follow_playing"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 270
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "follow_idle"
    sget-object v2, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v11, v2
    sget-object v12, Lcom/innioasis/ipp/Follow;->IDLES:[I
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 271
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "fixed_menu_pad"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 274
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "metadata"
    const/4 v11, 0
    const/4 v12, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 275
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "meta_title"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 276
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "book_meta_title"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 277
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "album_year"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 278
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "track_numbers"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 279
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "artist_split"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 280
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "genre_split"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 281
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "artist_scope"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 284
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "system"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 285
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "delete_folder"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 286
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "keep_awake"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 287
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "likes"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 290
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "kb_lang2"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 292
    return-object v0
.end method

.method private render()V
  .registers 9
  .line 498
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 499
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L9
  .line 500
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 501
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v3, :L4
  .line 502
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, v1
  .line 503
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget v4, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    const/4 v5, 1
    invoke-virtual { v3, v2, v4, v5 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 504
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    const v4, 16777215
    and-int/2addr v3, v4
  .line 510
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 511
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    const v7, 2131100252
    invoke-virtual { v6, v7 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
  .line 510
    invoke-virtual { v5, v2, v6, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 515
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    and-int/2addr v2, v4
  .line 516
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v4, v4, v1
    check-cast v4, Landroid/widget/LinearLayout;
  .line 517
    const/4 v5, 0
  :L1
    invoke-virtual { v4 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v6
    if-ge v5, v6, :L3
  .line 518
    invoke-virtual { v4, v5 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 519
    instance-of v7, v6, Landroid/widget/TextView;
    if-nez v7, :L2
    const/high16 v7, 0x59000000
    or-int/2addr v7, v2
    invoke-virtual { v6, v7 }, Landroid/view/View;->setBackgroundColor(I)V
  :L2
  .line 517
    add-int/lit8 v5, v5, 1
    goto :L1
  :L3
  .line 532
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v2
    or-int/2addr v2, v3
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 533
    goto :L8
  :L4
  .line 538
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
  .line 539
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v4, v4, v1
    if-eqz v3, :L5
    const/4 v5, 0
    goto :L6
  :L5
    const/16 v5, 8
  :L6
    invoke-virtual { v4, v5 }, Landroid/view/View;->setVisibility(I)V
  .line 540
    if-nez v3, :L7
    goto :L8
  :L7
  .line 542
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v1
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 543
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v3, v3, v1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
    move-result-object v2
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 545
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  :L8
  .line 499
    add-int/lit8 v1, v1, 1
    goto/16 :L0
  :L9
  .line 547
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 548
    return-void
.end method

.method private rule()Landroid/view/View;
  .registers 2
  .line 573
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    return-object v0
.end method

.method private scrollToSel()V
  .registers 2
  .line 643
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
  .line 644
    return-void
.end method

.method private scrollToSel(Z)V
  .registers 5
  .line 647
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L7
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    if-eqz v0, :L7
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v1, :L7
    array-length v2, v0
    if-lt v1, v2, :L0
    goto :L7
  :L0
  .line 650
    aget-object v0, v0, v1
  .line 651
    if-nez v0, :L1
    return-void
  :L1
  .line 654
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    if-gtz v1, :L3
  .line 655
    if-eqz p1, :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->postScroll()V
  :L2
  .line 656
    return-void
  :L3
  .line 660
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v1
    if-ne p1, v1, :L4
  .line 661
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  .line 662
    return-void
  :L4
  .line 664
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result p1
  .line 665
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v0
  .line 666
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v1
  .line 667
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v2 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v2
  .line 668
    if-ge p1, v1, :L5
  .line 669
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
    goto :L6
  :L5
  .line 670
    add-int/2addr v1, v2
    if-le v0, v1, :L6
  .line 671
    sub-int/2addr v0, v2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  :L6
  .line 673
    return-void
  :L7
  .line 647
    return-void
.end method

.method private selectable(I)Z
  .registers 3
  .line 316
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 317
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v0, :L0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result p1
    if-eqz p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method private showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 5
  .line 745
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 746
    if-nez v0, :L0
    return-void
  :L0
  .line 747
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    aget p1, p1, v1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 748
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 749
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 750
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v1, 400
    invoke-virtual { v0, p1, v1, v2 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 751
    return-void
.end method

.method private spin(I)V
  .registers 5
  .line 737
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 738
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 739
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    add-int/2addr v2, p1
    rem-int/2addr v2, v1
    add-int/2addr v2, v1
    rem-int/2addr v2, v1
    iput v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 740
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 741
    return-void
.end method

.method private static spread([Ljava/lang/Runnable;)V
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 1281
    array-length v0, p0
    new-array v1, v0, [Ljava/lang/Thread;
  .line 1282
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L1
  .line 1283
    new-instance v4, Ljava/lang/Thread;
    aget-object v5, p0, v3
    invoke-direct { v4, v5 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    aput-object v4, v1, v3
  .line 1284
    invoke-virtual { v4 }, Ljava/lang/Thread;->start()V
  .line 1282
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 1286
    nop
  :L2
    if-ge v2, v0, :L7
  :L3
  .line 1288
    aget-object p0, v1, v2
    invoke-virtual { p0 }, Ljava/lang/Thread;->join()V
  :L4
  .line 1291
    goto :L6
  :L5
  .line 1289
    move-exception p0
  :L6
  .line 1286
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 1293
    return-void
.end method

.method private startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 4
  .line 727
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 728
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
  .line 729
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 730
    if-ltz v0, :L0
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L1
  :L0
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  :L1
  .line 731
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    if-nez v0, :L2
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
  :L2
  .line 732
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 733
    return-void
.end method

.method private step(II)I
  .registers 5
  .line 694
    add-int v0, p1, p2
  :L0
  .line 695
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 696
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 697
    add-int/2addr v0, p2
    goto :L0
  :L2
  .line 699
    return p1
.end method

.method private toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 2
  .line 312
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
.end method

.method private valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
  .registers 5
  .line 630
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 1
    if-ne v0, v1, :L2
  .line 631
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result p1
    if-eqz p1, :L0
    const p1, 2131821018
    goto :L1
  :L0
    const p1, 2131821019
  :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L2
  .line 633
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 2
    const/4 v2, 4
    if-eq v0, v1, :L4
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v0, v2, :L3
    goto :L4
  :L3
  .line 639
    const-string p1, ""
    return-object p1
  :L4
  .line 634
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 635
    if-ltz v0, :L5
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L6
  :L5
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
  :L6
  .line 636
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v1, v2, :L7
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    aget p1, p1, v0
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L7
  .line 637
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    if-eqz v1, :L8
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    aget-object p1, p1, v0
    goto :L9
  :L8
    invoke-static { v0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
  :L9
    return-object p1
.end method

.method private visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 3
  .line 307
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    if-eqz v0, :L1
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L0
    goto :L1
  :L0
    const/4 p1, 0
    goto :L2
  :L1
    const/4 p1, 1
  :L2
    return p1
.end method

.method private static workers()I
  .registers 2
  .line 1272
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 1273
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 1274
    add-int/2addr v0, v1
  .line 1275
    const/4 v1, 4
    if-le v0, v1, :L1
    const/4 v0, 4
  :L1
  .line 1276
    return v0
.end method

.method public antiClockwise()V
  .registers 3
  .line 712
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, -1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 713
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 714
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 715
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 716
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 754
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 755
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 756
    if-nez v0, :L1
    return-void
  :L1
  .line 757
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L2
    const/4 v1, 4
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 758
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 759
    return-void
.end method

.method cacheFinished(I)V
  .registers 3
  .line 928
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheDone;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 929
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 704
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 705
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 706
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 707
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 708
    return-void
.end method

.method public confirm()V
  .registers 5
  .line 784
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 785
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 786
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 787
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v2, v1, :L3
  .line 792
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
    xor-int/2addr v1, v3
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 797
    const-string v1, "likes"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  :L1
  .line 801
    const-string v1, "genre_split"
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L2
  .line 802
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    goto/16 :L12
  :L3
  .line 803
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 4
    if-ne v2, v3, :L4
  .line 804
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto/16 :L12
  :L4
  .line 805
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 2
    if-ne v2, v3, :L5
  .line 806
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    add-int/2addr v2, v1
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    rem-int/2addr v2, v1
  .line 807
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 808
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    goto/16 :L11
  :L5
  .line 809
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 3
    if-ne v1, v2, :L11
  .line 810
    const-string v1, "reboot"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L6
  .line 811
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmReboot(Ljava/lang/String;)V
    goto :L12
  :L6
  .line 812
    const-string v1, "scan"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 813
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmScan(Ljava/lang/String;)V
    goto :L12
  :L7
  .line 814
    const-string v1, "cache"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L8
  .line 815
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmCache()V
    goto :L12
  :L8
  .line 816
    const-string v1, "backup"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 819
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Backup;->open(Landroid/app/Activity;Ljava/lang/String;)V
    goto :L12
  :L9
  .line 820
    const-string v1, "m3u_import"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L10
  .line 821
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startActivity(Landroid/content/Intent;)V
    goto :L12
  :L10
  .line 822
    const-string v1, "log"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L12
  .line 823
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmLog(Ljava/lang/String;)V
    goto :L12
  :L11
  .line 809
    nop
  :L12
  .line 826
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1602
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1605
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz p1, :L0
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 1606
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  :L1
  .line 1608
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 81
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 335
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 17
  .line 340
    move-object/from16 v0, p0
    const v1, 2131821015
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 342
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
    invoke-interface { v1 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 343
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 348
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 349
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 351
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->buildItems()Ljava/util/List;
    move-result-object v4
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
  .line 352
    sput-object v4, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 353
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v4
  .line 354
    new-array v5, v4, [Landroid/view/View;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
  .line 355
    new-array v5, v4, [Landroid/view/View;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
  .line 356
    const/4 v5, 0
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 357
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
  .line 358
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
  .line 359
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
  .line 361
    const/4 v6, 0
    const/4 v7, 0
  :L0
    const/4 v9, -1
    if-ge v7, v4, :L5
  .line 362
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v10, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 363
    iget v11, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/high16 v12, 0x41500000
    const/16 v14, 16
    if-nez v11, :L2
  .line 371
    iget-object v11, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
    const/16 v15, 8
    if-eqz v11, :L1
    invoke-virtual { v11, v15 }, Landroid/view/View;->setVisibility(I)V
  :L1
  .line 372
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 374
    new-instance v11, Landroid/widget/LinearLayout;
    invoke-direct { v11, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 375
    invoke-virtual { v11, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 377
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->rule()Landroid/view/View;
    move-result-object v5
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v13, 2
    invoke-direct { v8, v9, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 379
    new-instance v5, Landroid/widget/TextView;
    invoke-direct { v5, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 380
    invoke-virtual { v5, v12 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 383
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v8
    invoke-virtual { v5, v8, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 384
    invoke-virtual { v5, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 385
    invoke-virtual { v5, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 386
    const/4 v8, 6
    invoke-virtual { v5, v8, v15, v8, v15 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 387
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v5, v8 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 388
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -2
    invoke-direct { v8, v9, v10 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 390
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->rule()Landroid/view/View;
    move-result-object v8
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v9, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 392
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aput-object v11, v8, v7
  .line 393
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aput-object v11, v8, v7
  .line 394
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aput-object v5, v8, v7
  .line 398
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -2
    invoke-direct { v5, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v11, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 399
    goto/16 :L4
  :L2
  .line 403
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct { v5, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 404
    invoke-virtual { v5, v6 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 405
    invoke-virtual { v5, v6 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 406
    invoke-virtual { v5, v14 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 407
    const/4 v8, 5
    invoke-virtual { v5, v8, v6, v8, v6 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 416
    iget-object v8, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    if-eqz v8, :L3
  .line 417
    new-instance v8, Landroid/widget/TextView;
    invoke-direct { v8, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 418
    invoke-virtual { v8, v12 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 419
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v10
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 420
    invoke-virtual { v8, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 421
    const/16 v10, 17
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setGravity(I)V
  .line 422
    const-string v10, "\u21b4"
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 423
    const/high16 v10, 0x43340000
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setRotation(F)V
  .line 424
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v11, -2
    invoke-direct { v10, v11, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 425
    const/4 v11, 3
    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 426
    invoke-virtual { v5, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 427
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aput-object v8, v10, v7
  :L3
  .line 430
    new-instance v8, Landroid/widget/TextView;
    invoke-direct { v8, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 431
    const/high16 v10, 0x41880000
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 432
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v11
    invoke-virtual { v8, v11 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 433
    invoke-virtual { v8, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 434
    invoke-virtual { v8, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 435
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v11, v6, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 436
    const/high16 v12, 0x3F800000
    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 437
    invoke-virtual { v5, v8, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 439
    new-instance v11, Landroid/widget/TextView;
    invoke-direct { v11, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 440
    invoke-virtual { v11, v10 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 441
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v10
    invoke-virtual { v11, v10 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 442
    invoke-virtual { v11, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 443
    invoke-virtual { v11, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 444
    const/4 v10, 6
    invoke-virtual { v11, v10, v6, v10, v6 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 445
    const/4 v10, -2
    invoke-virtual { v5, v11, v10, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 447
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aput-object v5, v10, v7
  .line 448
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aput-object v8, v10, v7
  .line 449
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aput-object v11, v10, v7
  .line 455
    new-instance v10, Landroid/widget/LinearLayout;
    invoke-direct { v10, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 456
    invoke-virtual { v10, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 457
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
  .line 458
    invoke-virtual { v8 }, Landroid/widget/TextView;->getTextSize()F
    move-result v8
    const/high16 v12, 0x40400000
    mul-float v8, v8, v12
    float-to-int v8, v8
    invoke-direct { v11, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 457
    invoke-virtual { v10, v5, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 459
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->hair()Landroid/view/View;
    move-result-object v5
  .line 460
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v9, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v10, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 461
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 462
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aput-object v10, v5, v7
  .line 463
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -2
    invoke-direct { v5, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v10, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L4
  .line 361
    add-int/lit8 v7, v7, 1
    const/4 v5, 0
    goto/16 :L0
  :L5
  .line 467
    new-instance v3, Landroid/widget/ScrollView;
    invoke-direct { v3, v0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v3, v0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
  .line 468
    const/4 v4, -2
    invoke-virtual { v3, v2, v9, v4 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 469
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v2, v9, v9 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 471
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v1
    iput v1, v0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 474
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Retheme;
    invoke-direct { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Retheme;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v1, v0, Lcom/innioasis/y1/activity/IppActivity;->retheme:Lcom/innioasis/y1/activity/IppActivity$Retheme;
  .line 475
    invoke-static { v1 }, Lcom/innioasis/ipp/Theme;->watchRows(Ljava/lang/Runnable;)V
  .line 476
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 477
    return-void
.end method

.method public longConfirm()V
  .registers 5
  .line 1620
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1621
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    if-eqz v0, :L5
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v1, :L5
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v1, v0, :L1
    goto :L5
  :L1
  .line 1622
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1623
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v1, :L4
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    if-nez v1, :L2
    goto :L4
  :L2
  .line 1624
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Help;->blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 1625
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 1626
    new-instance v2, Lcom/innioasis/ipp/HelpDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v3
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { v2, v3, v0, v1 }, Lcom/innioasis/ipp/HelpDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    invoke-virtual { v2 }, Lcom/innioasis/ipp/HelpDialog;->show()V
  .line 1627
    return-void
  :L4
  .line 1623
    return-void
  :L5
  .line 1621
    return-void
.end method

.method protected onDestroy()V
  .registers 2
  .line 483
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->retheme:Lcom/innioasis/y1/activity/IppActivity$Retheme;
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->unwatchRows(Ljava/lang/Runnable;)V
  .line 484
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 485
    return-void
.end method

.method postReboot()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 941
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RebootRun;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RebootRun;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 944
    goto :L3
  :L2
  .line 942
    move-exception v0
  .line 943
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->reboot(Landroid/content/Context;)V
  :L3
  .line 945
    return-void
.end method

.method public quit()V
  .registers 2
  .line 1654
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
  .line 1655
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  .line 1656
    return-void
.end method

.method runCacheLibrary(I)V
  .catchall { :L1 .. :L2 } :L3
  .registers 10
  .line 916
    if-nez p1, :L0
    return-void
  :L0
  .line 918
    const/4 v0, 0
  :L1
    new-instance v7, Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    const v1, 2131821074
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    const v5, 2131886360
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$Noop;
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppActivity$Noop;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 920
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L2
  .line 923
    goto :L4
  :L3
  .line 921
    move-exception v1
  .line 922
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L4
  .line 924
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 925
    return-void
.end method

.method runFullRescan()V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 886
    const/4 v0, 0
  :L0
    new-instance v7, Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    const v1, 2131821050
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    const v5, 2131886360
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$Noop;
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppActivity$Noop;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 888
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 891
    goto :L3
  :L2
  .line 889
    move-exception v1
  .line 890
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L3
  .line 892
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RescanTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 893
    return-void
.end method

.method scanFinished(I)V
  .registers 3
  .line 901
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Done;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 902
    return-void
.end method

.method scanTick(Ljava/lang/String;)V
  .registers 3
  .line 897
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Tick;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 898
    return-void
.end method
