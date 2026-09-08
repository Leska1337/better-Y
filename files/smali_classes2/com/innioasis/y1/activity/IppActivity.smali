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
    Lcom/innioasis/y1/activity/IppActivity$SfRun;,
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
    Lcom/innioasis/y1/activity/IppActivity$Blocks;,
    Lcom/innioasis/y1/activity/IppActivity$SfToast;
  }
.end annotation

.field private final static ACCENT:I = 0

.field private final static ACTION:I = 3

.field private final static ACT_LOG:I = 3

.field private final static ACT_REBOOT:I = 0

.field private final static ACT_SCAN:I = 1

.field private final static ACT_SF:I = 2

.field final static BAND_ALPHA:I = 1493172224

.field final static BAND_ALPHA_BARE:I = 771751936

.field private final static BLINK_MS:J = 400L

.field private final static CHOICE:I = 2

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static HEADER:I = 0

.field private final static NUMBER:I = 4

.field final static RULE_ALPHA:I = 1493172224

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
  .line 91
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 80
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppActivity;)Ljava/util/List;
  .registers 1
  .line 80
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 1
  .line 80
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    return-void
.end method

.method static synthetic access$202(Lcom/innioasis/y1/activity/IppActivity;Z)Z
  .registers 2
  .line 80
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    return p1
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppActivity;Z)V
  .registers 2
  .line 80
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
    return-void
.end method

.method static synthetic access$500()I
  .registers 1
  .line 80
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->workers()I
    move-result v0
    return v0
.end method

.method static synthetic access$600([Ljava/lang/Runnable;)V
  .registers 1
  .line 80
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->spread([Ljava/lang/Runnable;)V
    return-void
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .registers 1
  .line 80
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
    return-void
.end method

.method static synthetic access$900(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 1
  .line 80
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p0
.end method

.method static synthetic access$902(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 2
  .line 80
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p1
.end method

.method private static album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .catchall { :L3 .. :L6 } :L9
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L16
  .registers 4
  .line 1542
    if-eqz p0, :L18
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    if-nez v0, :L0
    goto/16 :L18
  :L0
  .line 1543
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L2
  .line 1546
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L1
  .line 1547
    return-void
  :L2
  .line 1550
    nop
  .line 1551
    new-instance v0, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 1553
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 1554
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-eqz v2, :L4
    const/16 v2, 13
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotArtist:Ljava/lang/String;
  :L4
  .line 1555
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-eqz v2, :L5
  .line 1556
    const/16 v2, 8
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotYear:Ljava/lang/String;
  .line 1557
    const/4 v2, 5
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotDate:Ljava/lang/String;
  :L5
  .line 1559
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v2, :L7
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v2
  :L6
    goto :L8
  :L7
    move-object v2, v1
  :L8
  .line 1562
    goto :L10
  :L9
  .line 1560
    move-exception v2
    move-object v2, v1
  :L10
  .line 1563
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 1565
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L17
  .line 1569
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v0, :L14
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L14
  .line 1571
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L15
  .line 1573
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1574
    goto :L17
  :L16
  .line 1573
    move-exception p0
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1574
    throw p0
  :L17
  .line 1576
    return-void
  :L18
  .line 1542
    return-void
.end method

.method static bandAlpha()I
  .registers 1
  .line 117
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
  .line 192
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->registry()Ljava/util/List;
    move-result-object v0
  .line 193
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->rows(Landroid/content/Context;)Ljava/util/List;
    move-result-object v1
  .line 194
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L0
    return-object v0
  :L0
  .line 196
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 197
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 198
    const/4 v4, 0
    const/4 v5, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L5
  .line 199
    invoke-interface { v1, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Help$Row;
  .line 200
    iget-object v7, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-static { v0, v7 }, Lcom/innioasis/y1/activity/IppActivity;->find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v7
  .line 201
    if-eqz v7, :L4
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L2
    goto :L4
  :L2
  .line 202
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 203
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
  .line 204
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 205
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 2
    if-ne v8, v9, :L3
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v8, :L3
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v8, v8
    iget v9, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-ne v8, v9, :L3
  .line 206
    iget-object v6, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    iput-object v6, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
  :L3
  .line 208
    invoke-interface { v2, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L4
  .line 198
    add-int/lit8 v5, v5, 1
    goto :L1
  :L5
  .line 212
    nop
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L8
  .line 213
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 214
    iget-object v5, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L7
    invoke-interface { v2, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L7
  .line 212
    add-int/lit8 v4, v4, 1
    goto :L6
  :L8
  .line 216
    return-object v2
.end method

.method private clampSel()V
  .registers 3
  .line 335
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
  .line 336
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  :L1
  .line 338
    return-void
.end method

.method private confirmCache()V
  .registers 3
  .line 920
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CachePick;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$CachePick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Pick;->askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .line 921
    return-void
.end method

.method private confirmLog(Ljava/lang/String;)V
  .registers 8
  .line 851
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 852
    const v1, 2131821112
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppActivity$Confirm;
    const/4 v1, 3
    invoke-direct { v3, p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Confirm;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    const/4 v4, 0
    const/4 v5, 1
    move-object v1, p1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 854
    return-void
.end method

.method private confirmReboot(Ljava/lang/String;)V
  .registers 9
  .line 839
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const v2, 2131886360
    const/4 v3, 0
    invoke-direct { v0, v1, v3, v2 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 840
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
  .line 842
    return-void
.end method

.method private confirmScan(Ljava/lang/String;)V
  .registers 8
  .line 845
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 846
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
  .line 848
    return-void
.end method

.method private confirmSf(Ljava/lang/String;)V
  .registers 8
  .line 857
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 858
    const v1, 2131821109
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppActivity$Confirm;
    const/4 v1, 2
    invoke-direct { v3, p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Confirm;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    const/4 v4, 0
    const/4 v5, 1
    move-object v1, p1
    invoke-virtual/range { v0 .. v5 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 860
    return-void
.end method

.method private endEdit(Z)V
  .registers 6
  .line 771
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 772
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 773
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 774
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v2, v2, v3
  .line 775
    if-eqz v2, :L1
  .line 776
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 777
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  :L1
  .line 779
    if-eqz p1, :L2
    iget-object p1, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L2
  .line 780
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 781
    return-void
.end method

.method private static find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 6
  .line 220
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 221
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 222
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 223
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L2
    return-object v2
  :L2
  .line 221
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 225
    return-object v0
.end method

.method private firstSelectable()I
  .registers 4
  .line 328
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 329
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v2
    if-eqz v2, :L1
    return v1
  :L1
  .line 328
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 331
    return v0
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 310
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private glide(I)V
  .registers 5
  .line 693
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
  .line 694
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
  .line 695
    if-gez v0, :L4
    const/4 v0, 0
  :L4
  .line 696
    if-gez p1, :L5
    const/4 p1, 0
  :L5
  .line 697
    if-le p1, v0, :L6
    goto :L7
  :L6
    move v0, p1
  :L7
  .line 698
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1, v1, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 699
    return-void
.end method

.method private hair()Landroid/view/View;
  .registers 5
  .line 591
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    if-nez v0, :L0
  .line 592
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 593
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 594
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 593
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 595
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0x1F000000
    or-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
  :L0
  .line 597
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 598
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 599
    return-object v0
.end method

.method private static label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
  .registers 2
  .line 1714
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
  .line 1703
    sget-object v0, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 1704
    const/4 v1, 0
    if-eqz v0, :L4
    if-nez p0, :L0
    goto :L4
  :L0
  .line 1705
    const/4 v2, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1706
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1707
    iget-object v4, v3, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 1705
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1709
    return-object v1
  :L4
  .line 1704
    return-object v1
.end method

.method private move(I)V
  .registers 3
  .line 568
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 569
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 570
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 571
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 572
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 573
    return-void
.end method

.method private paint(I)V
  .registers 7
  .line 606
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L11
    if-ltz p1, :L11
    array-length v0, v0
    if-lt p1, v0, :L0
    goto :L11
  :L0
  .line 607
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 608
    iget v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v0, :L10
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L1
    goto :L10
  :L1
  .line 609
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v0, v0, p1
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L2
    goto :L9
  :L2
  .line 610
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    const/4 v1, 0
    if-ne p1, v0, :L3
    const/4 v0, 1
    goto :L4
  :L3
    const/4 v0, 0
  :L4
  .line 611
    if-eqz v0, :L5
    sget v2, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v2, -1
  :L6
  .line 612
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v4, v4, p1
    if-eqz v0, :L7
    const v1, 2131231052
  :L7
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 613
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 614
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 615
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object v1, v1, p1
    if-eqz v1, :L8
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object p1, v3, p1
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 616
    return-void
  :L9
  .line 609
    return-void
  :L10
  .line 608
    return-void
  :L11
  .line 606
    return-void
.end method

.method private postScroll()V
  .registers 3
  .line 620
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 621
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
  .line 622
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Scroll;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$Scroll;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 623
    return-void
  :L1
  .line 620
    return-void
.end method

.method private registry()Ljava/util/List;
  .registers 15
  .line 238
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 241
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v2, 0
    const-string v3, "tools"
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 242
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 3
    const-string v10, "reboot"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 243
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 3
    const-string v4, "cache"
    const/4 v5, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 244
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "scan"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 246
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "log"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v1
    if-eqz v1, :L0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 3
    const-string v4, "sf"
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L0
  .line 260
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "player"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 261
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "icon_tint"
    const/4 v5, 3
    const/4 v6, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 262
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "cover_tilt"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 266
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "top_hold"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 267
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "book_top_hold"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 268
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "first_artist_only"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 269
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "feat_in_title"
    const/4 v11, 0
    const-string v13, "first_artist_only"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 270
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "artist_album_scroll"
    const/4 v5, 4
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 273
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "menu"
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 274
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "alpha_scroll"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 275
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 4
    const-string v10, "alpha_threshold"
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v11, v2
    sget-object v12, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 276
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "follow_playing"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 277
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "follow_idle"
    sget-object v2, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v11, v2
    sget-object v12, Lcom/innioasis/ipp/Follow;->IDLES:[I
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 278
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "fixed_menu_pad"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 281
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "metadata"
    const/4 v11, 0
    const/4 v12, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 282
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "meta_title"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 283
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "book_meta_title"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 284
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "album_year"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 285
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "track_numbers"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 286
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "artist_split"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 287
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "genre_split"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 288
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "artist_scope"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 291
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 0
    const-string v10, "system"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 292
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "delete_folder"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 293
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "keep_awake"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 294
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "likes"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 297
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "kb_lang2"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 299
    return-object v0
.end method

.method private render()V
  .registers 9
  .line 506
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 507
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L9
  .line 508
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 509
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v3, :L4
  .line 510
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, v1
  .line 511
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget v4, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    const/4 v5, 1
    invoke-virtual { v3, v2, v4, v5 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 512
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    const v4, 16777215
    and-int/2addr v3, v4
  .line 518
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 519
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    const v7, 2131100252
    invoke-virtual { v6, v7 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
  .line 518
    invoke-virtual { v5, v2, v6, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 523
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    and-int/2addr v2, v4
  .line 524
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v4, v4, v1
    check-cast v4, Landroid/widget/LinearLayout;
  .line 525
    const/4 v5, 0
  :L1
    invoke-virtual { v4 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v6
    if-ge v5, v6, :L3
  .line 526
    invoke-virtual { v4, v5 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 527
    instance-of v7, v6, Landroid/widget/TextView;
    if-nez v7, :L2
    const/high16 v7, 0x59000000
    or-int/2addr v7, v2
    invoke-virtual { v6, v7 }, Landroid/view/View;->setBackgroundColor(I)V
  :L2
  .line 525
    add-int/lit8 v5, v5, 1
    goto :L1
  :L3
  .line 540
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v2
    or-int/2addr v2, v3
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 541
    goto :L8
  :L4
  .line 546
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
  .line 547
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v4, v4, v1
    if-eqz v3, :L5
    const/4 v5, 0
    goto :L6
  :L5
    const/16 v5, 8
  :L6
    invoke-virtual { v4, v5 }, Landroid/view/View;->setVisibility(I)V
  .line 548
    if-nez v3, :L7
    goto :L8
  :L7
  .line 550
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v1
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 551
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v3, v3, v1
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
    move-result-object v2
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 553
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  :L8
  .line 507
    add-int/lit8 v1, v1, 1
    goto/16 :L0
  :L9
  .line 555
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 556
    return-void
.end method

.method private rule()Landroid/view/View;
  .registers 2
  .line 581
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    return-object v0
.end method

.method private scrollToSel()V
  .registers 2
  .line 651
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
  .line 652
    return-void
.end method

.method private scrollToSel(Z)V
  .registers 5
  .line 655
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
  .line 658
    aget-object v0, v0, v1
  .line 659
    if-nez v0, :L1
    return-void
  :L1
  .line 662
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    if-gtz v1, :L3
  .line 663
    if-eqz p1, :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->postScroll()V
  :L2
  .line 664
    return-void
  :L3
  .line 668
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v1
    if-ne p1, v1, :L4
  .line 669
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  .line 670
    return-void
  :L4
  .line 672
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result p1
  .line 673
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v0
  .line 674
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v1
  .line 675
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v2 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v2
  .line 676
    if-ge p1, v1, :L5
  .line 677
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
    goto :L6
  :L5
  .line 678
    add-int/2addr v1, v2
    if-le v0, v1, :L6
  .line 679
    sub-int/2addr v0, v2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  :L6
  .line 681
    return-void
  :L7
  .line 655
    return-void
.end method

.method private selectable(I)Z
  .registers 3
  .line 323
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 324
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
  .line 753
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 754
    if-nez v0, :L0
    return-void
  :L0
  .line 755
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    aget p1, p1, v1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 756
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 757
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 758
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v1, 400
    invoke-virtual { v0, p1, v1, v2 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 759
    return-void
.end method

.method private spin(I)V
  .registers 5
  .line 745
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 746
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 747
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    add-int/2addr v2, p1
    rem-int/2addr v2, v1
    add-int/2addr v2, v1
    rem-int/2addr v2, v1
    iput v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 748
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 749
    return-void
.end method

.method private static spread([Ljava/lang/Runnable;)V
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 1346
    array-length v0, p0
    new-array v1, v0, [Ljava/lang/Thread;
  .line 1347
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L1
  .line 1348
    new-instance v4, Ljava/lang/Thread;
    aget-object v5, p0, v3
    invoke-direct { v4, v5 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    aput-object v4, v1, v3
  .line 1349
    invoke-virtual { v4 }, Ljava/lang/Thread;->start()V
  .line 1347
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 1351
    nop
  :L2
    if-ge v2, v0, :L7
  :L3
  .line 1353
    aget-object p0, v1, v2
    invoke-virtual { p0 }, Ljava/lang/Thread;->join()V
  :L4
  .line 1356
    goto :L6
  :L5
  .line 1354
    move-exception p0
  :L6
  .line 1351
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 1358
    return-void
.end method

.method private startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 4
  .line 735
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 736
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
  .line 737
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 738
    if-ltz v0, :L0
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L1
  :L0
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  :L1
  .line 739
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    if-nez v0, :L2
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
  :L2
  .line 740
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 741
    return-void
.end method

.method private step(II)I
  .registers 5
  .line 702
    add-int v0, p1, p2
  :L0
  .line 703
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 704
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 705
    add-int/2addr v0, p2
    goto :L0
  :L2
  .line 707
    return p1
.end method

.method private toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 2
  .line 319
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
.end method

.method private valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
  .registers 5
  .line 638
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 1
    if-ne v0, v1, :L2
  .line 639
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
  .line 641
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 2
    const/4 v2, 4
    if-eq v0, v1, :L4
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v0, v2, :L3
    goto :L4
  :L3
  .line 647
    const-string p1, ""
    return-object p1
  :L4
  .line 642
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 643
    if-ltz v0, :L5
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L6
  :L5
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
  :L6
  .line 644
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v1, v2, :L7
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    aget p1, p1, v0
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L7
  .line 645
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
  .line 314
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
  .line 1337
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 1338
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 1339
    add-int/2addr v0, v1
  .line 1340
    const/4 v1, 4
    if-le v0, v1, :L1
    const/4 v0, 4
  :L1
  .line 1341
    return v0
.end method

.method public antiClockwise()V
  .registers 3
  .line 720
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, -1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 721
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 722
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 723
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 724
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 762
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 763
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 764
    if-nez v0, :L1
    return-void
  :L1
  .line 765
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L2
    const/4 v1, 4
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 766
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 767
    return-void
.end method

.method cacheFinished(I)V
  .registers 3
  .line 991
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheDone;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 992
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 712
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
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

.method public confirm()V
  .registers 5
  .line 792
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 793
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 794
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 795
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v2, v1, :L3
  .line 800
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
    xor-int/2addr v1, v3
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 805
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
  .line 809
    const-string v1, "genre_split"
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L2
  .line 810
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    goto/16 :L11
  :L3
  .line 811
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 4
    if-ne v2, v3, :L4
  .line 812
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto/16 :L11
  :L4
  .line 813
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 2
    if-ne v2, v3, :L5
  .line 814
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    add-int/2addr v2, v1
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    rem-int/2addr v2, v1
  .line 815
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 816
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    goto :L10
  :L5
  .line 817
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 3
    if-ne v1, v2, :L10
  .line 818
    const-string v1, "reboot"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L6
  .line 819
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmReboot(Ljava/lang/String;)V
    goto :L11
  :L6
  .line 820
    const-string v1, "scan"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 821
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmScan(Ljava/lang/String;)V
    goto :L11
  :L7
  .line 822
    const-string v1, "cache"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L8
  .line 823
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmCache()V
    goto :L11
  :L8
  .line 824
    const-string v1, "sf"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 825
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmSf(Ljava/lang/String;)V
    goto :L11
  :L9
  .line 826
    const-string v1, "log"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L11
  .line 827
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmLog(Ljava/lang/String;)V
    goto :L11
  :L10
  .line 817
    nop
  :L11
  .line 830
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1667
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1670
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz p1, :L0
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 1671
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  :L1
  .line 1673
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 80
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 342
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 17
  .line 347
    move-object/from16 v0, p0
    const v1, 2131821015
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 349
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
    invoke-interface { v1 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 350
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 355
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 356
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 358
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->buildItems()Ljava/util/List;
    move-result-object v4
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
  .line 359
    sput-object v4, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 360
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v4
  .line 361
    new-array v5, v4, [Landroid/view/View;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
  .line 362
    new-array v5, v4, [Landroid/view/View;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
  .line 363
    const/4 v5, 0
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 364
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
  .line 365
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
  .line 366
    new-array v6, v4, [Landroid/widget/TextView;
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
  .line 368
    const/4 v6, 0
    const/4 v7, 0
  :L0
    const/4 v9, -1
    if-ge v7, v4, :L5
  .line 369
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v10, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 370
    iget v11, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/high16 v12, 0x41500000
    const/16 v14, 16
    if-nez v11, :L2
  .line 378
    iget-object v11, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
    const/16 v15, 8
    if-eqz v11, :L1
    invoke-virtual { v11, v15 }, Landroid/view/View;->setVisibility(I)V
  :L1
  .line 379
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 381
    new-instance v11, Landroid/widget/LinearLayout;
    invoke-direct { v11, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 382
    invoke-virtual { v11, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 384
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->rule()Landroid/view/View;
    move-result-object v5
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v13, 2
    invoke-direct { v8, v9, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 386
    new-instance v5, Landroid/widget/TextView;
    invoke-direct { v5, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 387
    invoke-virtual { v5, v12 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 390
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v8
    invoke-virtual { v5, v8, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 391
    invoke-virtual { v5, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 392
    invoke-virtual { v5, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 393
    const/4 v8, 6
    invoke-virtual { v5, v8, v15, v8, v15 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 394
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v5, v8 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 395
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -2
    invoke-direct { v8, v9, v10 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 397
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->rule()Landroid/view/View;
    move-result-object v8
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v9, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v11, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 399
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aput-object v11, v8, v7
  .line 400
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aput-object v11, v8, v7
  .line 401
    iget-object v8, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aput-object v5, v8, v7
  .line 405
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -2
    invoke-direct { v5, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v11, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 406
    goto/16 :L4
  :L2
  .line 410
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct { v5, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 411
    invoke-virtual { v5, v6 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 412
    invoke-virtual { v5, v6 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 413
    invoke-virtual { v5, v14 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 414
    const/4 v8, 5
    invoke-virtual { v5, v8, v6, v8, v6 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 423
    iget-object v8, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    if-eqz v8, :L3
  .line 424
    new-instance v8, Landroid/widget/TextView;
    invoke-direct { v8, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 425
    invoke-virtual { v8, v12 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 426
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v10
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 427
    invoke-virtual { v8, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 428
    const/16 v10, 17
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setGravity(I)V
  .line 429
    const-string v10, "\u21b4"
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 430
    const/high16 v10, 0x43340000
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setRotation(F)V
  .line 431
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v11, -2
    invoke-direct { v10, v11, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 432
    const/4 v11, 3
    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 433
    invoke-virtual { v5, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 434
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aput-object v8, v10, v7
  :L3
  .line 437
    new-instance v8, Landroid/widget/TextView;
    invoke-direct { v8, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 438
    const/high16 v10, 0x41880000
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 439
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v11
    invoke-virtual { v8, v11 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 440
    invoke-virtual { v8, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 441
    invoke-virtual { v8, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 442
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v11, v6, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 443
    const/high16 v12, 0x3F800000
    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 444
    invoke-virtual { v5, v8, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 446
    new-instance v11, Landroid/widget/TextView;
    invoke-direct { v11, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 447
    invoke-virtual { v11, v10 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 448
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v10
    invoke-virtual { v11, v10 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 449
    invoke-virtual { v11, v6 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 450
    invoke-virtual { v11, v14 }, Landroid/widget/TextView;->setGravity(I)V
  .line 451
    const/4 v10, 6
    invoke-virtual { v11, v10, v6, v10, v6 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 452
    const/4 v10, -2
    invoke-virtual { v5, v11, v10, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 454
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aput-object v5, v10, v7
  .line 455
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aput-object v8, v10, v7
  .line 456
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aput-object v11, v10, v7
  .line 462
    new-instance v10, Landroid/widget/LinearLayout;
    invoke-direct { v10, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 463
    invoke-virtual { v10, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 464
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
  .line 465
    invoke-virtual { v8 }, Landroid/widget/TextView;->getTextSize()F
    move-result v8
    const/high16 v12, 0x40400000
    mul-float v8, v8, v12
    float-to-int v8, v8
    invoke-direct { v11, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 464
    invoke-virtual { v10, v5, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 466
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->hair()Landroid/view/View;
    move-result-object v5
  .line 467
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v9, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v10, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 468
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->lastHair:Landroid/view/View;
  .line 469
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aput-object v10, v5, v7
  .line 470
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -2
    invoke-direct { v5, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v10, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L4
  .line 368
    add-int/lit8 v7, v7, 1
    const/4 v5, 0
    goto/16 :L0
  :L5
  .line 474
    new-instance v3, Landroid/widget/ScrollView;
    invoke-direct { v3, v0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v3, v0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
  .line 475
    const/4 v4, -2
    invoke-virtual { v3, v2, v9, v4 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 476
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v2, v9, v9 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 478
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v1
    iput v1, v0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 481
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Retheme;
    invoke-direct { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Retheme;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v1, v0, Lcom/innioasis/y1/activity/IppActivity;->retheme:Lcom/innioasis/y1/activity/IppActivity$Retheme;
  .line 482
    invoke-static { v1 }, Lcom/innioasis/ipp/Theme;->watchRows(Ljava/lang/Runnable;)V
  .line 483
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 484
    return-void
.end method

.method public longConfirm()V
  .registers 5
  .line 1685
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1686
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    if-eqz v0, :L5
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v1, :L5
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v1, v0, :L1
    goto :L5
  :L1
  .line 1687
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1688
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v1, :L4
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    if-nez v1, :L2
    goto :L4
  :L2
  .line 1689
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Help;->blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 1690
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 1691
    new-instance v2, Lcom/innioasis/ipp/HelpDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v3
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { v2, v3, v0, v1 }, Lcom/innioasis/ipp/HelpDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    invoke-virtual { v2 }, Lcom/innioasis/ipp/HelpDialog;->show()V
  .line 1692
    return-void
  :L4
  .line 1688
    return-void
  :L5
  .line 1686
    return-void
.end method

.method protected onDestroy()V
  .registers 2
  .line 490
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->retheme:Lcom/innioasis/y1/activity/IppActivity$Retheme;
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->unwatchRows(Ljava/lang/Runnable;)V
  .line 491
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 492
    return-void
.end method

.method postReboot()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 1004
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RebootRun;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RebootRun;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 1007
    goto :L3
  :L2
  .line 1005
    move-exception v0
  .line 1006
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->reboot(Landroid/content/Context;)V
  :L3
  .line 1008
    return-void
.end method

.method public quit()V
  .registers 2
  .line 1719
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
  .line 1720
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  .line 1721
    return-void
.end method

.method runCacheLibrary(I)V
  .catchall { :L1 .. :L2 } :L3
  .registers 10
  .line 979
    if-nez p1, :L0
    return-void
  :L0
  .line 981
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
  .line 983
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L2
  .line 986
    goto :L4
  :L3
  .line 984
    move-exception v1
  .line 985
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L4
  .line 987
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 988
    return-void
.end method

.method runFullRescan()V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 949
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
  .line 951
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 954
    goto :L3
  :L2
  .line 952
    move-exception v1
  .line 953
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L3
  .line 955
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RescanTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 956
    return-void
.end method

.method scanFinished(I)V
  .registers 3
  .line 964
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Done;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 965
    return-void
.end method

.method scanTick(Ljava/lang/String;)V
  .registers 3
  .line 960
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Tick;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 961
    return-void
.end method

.method startSfRestart()V
  .registers 4
  .line 871
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$SfRun;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$SfRun;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    const-string v2, "ipp-sf-report"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 872
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 873
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 874
    return-void
.end method
