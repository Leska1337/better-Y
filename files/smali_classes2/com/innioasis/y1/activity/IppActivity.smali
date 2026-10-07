.class public final Lcom/innioasis/y1/activity/IppActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppActivity$AlbumJob;,
    Lcom/innioasis/y1/activity/IppActivity$Item;,
    Lcom/innioasis/y1/activity/IppActivity$Settle;,
    Lcom/innioasis/y1/activity/IppActivity$IconPick;,
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
    Lcom/innioasis/y1/activity/IppActivity$ByPath;,
    Lcom/innioasis/y1/activity/IppActivity$SongWorker;,
    Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;,
    Lcom/innioasis/y1/activity/IppActivity$Blocks;
  }
.end annotation

.field private final static ACCENT:I = 0

.field private final static ACTION:I = 3

.field private final static ACT_LOG:I = 2

.field private final static ACT_SCAN:I = 1

.field private final static ARROW_END:I = 5

.field private final static ARROW_ROOM:I = 24

.field public final static BAND_ALPHA:I = 1493172224

.field public final static BAND_ALPHA_BARE:I = 771751936

.field private final static BLINK_MS:J = 400L

.field private final static CHOICE:I = 2

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static HEADER:I = 0

.field private final static NUMBER:I = 4

.field private final static ROWS:I = 5

.field public final static RULE_ALPHA:I = 1493172224

.field private final static SUB:I = 5

.field private final static TEXT_MIN_SP:F = 14.0F

.field private final static TEXT_SP:F = 22.0F

.field private final static TOGGLE:I = 1

.field private static lastItems:Ljava/util/List;

.field private arrows:[Landroid/widget/ImageView;

.field private blink:Lcom/innioasis/y1/activity/IppActivity$Blink;

.field private catArrows:[Landroid/widget/ImageView;

.field private catLabels:[Landroid/widget/TextView;

.field private catList:Landroid/widget/LinearLayout;

.field private catRows:[Landroid/view/View;

.field private catSel:I

.field private cats:[I

.field private editIndex:I

.field private editVal:I

.field private editing:Z

.field private group:I

.field private groupOf:[I

.field private hairColor:I

.field private items:Ljava/util/List;

.field private labels:[Landroid/widget/TextView;

.field private marks:[Landroid/widget/TextView;

.field private minRow:I

.field private progress:Lcom/innioasis/y1/utils/LoadingDialog;

.field private rowBoxes:[Landroid/view/View;

.field private rowList:Landroid/widget/LinearLayout;

.field private rowViews:[Landroid/view/View;

.field private rowsFitted:Z

.field private scrollPending:Z

.field private scroller:Landroid/widget/ScrollView;

.field private sel:I

.field private values:[Landroid/widget/TextView;

.method static constructor <clinit>()V
  .registers 1
  .line 85
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 2
  .line 75
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 146
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppActivity;)Landroid/widget/ScrollView;
  .registers 1
  .line 75
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppActivity;Z)V
  .registers 2
  .line 75
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
    return-void
.end method

.method static synthetic access$202(Lcom/innioasis/y1/activity/IppActivity;Z)Z
  .registers 2
  .line 75
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    return p1
.end method

.method static synthetic access$400()I
  .registers 1
  .line 75
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->workers()I
    move-result v0
    return v0
.end method

.method static synthetic access$500([Ljava/lang/Runnable;)V
  .registers 1
  .line 75
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->spread([Ljava/lang/Runnable;)V
    return-void
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .registers 1
  .line 75
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
    return-void
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 1
  .line 75
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p0
.end method

.method static synthetic access$802(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 2
  .line 75
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p1
.end method

.method private static album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .catchall { :L3 .. :L6 } :L9
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L16
  .registers 4
  .line 1419
    if-eqz p0, :L18
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    if-nez v0, :L0
    goto/16 :L18
  :L0
  .line 1420
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L2
  .line 1422
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L1
  .line 1423
    return-void
  :L2
  .line 1426
    nop
  .line 1427
    new-instance v0, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 1429
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 1430
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-eqz v2, :L4
    const/16 v2, 13
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotArtist:Ljava/lang/String;
  :L4
  .line 1431
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-eqz v2, :L5
  .line 1432
    const/16 v2, 8
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotYear:Ljava/lang/String;
  .line 1433
    const/4 v2, 5
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotDate:Ljava/lang/String;
  :L5
  .line 1435
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v2, :L7
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v2
  :L6
    goto :L8
  :L7
    move-object v2, v1
  :L8
  .line 1437
    goto :L10
  :L9
  .line 1436
    move-exception v2
    move-object v2, v1
  :L10
  .line 1438
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 1440
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L17
  .line 1442
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v0, :L14
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L14
  .line 1444
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L15
  .line 1446
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1447
    goto :L17
  :L16
  .line 1446
    move-exception p0
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1447
    throw p0
  :L17
  .line 1449
    return-void
  :L18
  .line 1419
    return-void
.end method

.method public static bandAlpha()I
  .registers 1
  .line 98
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
  .line 168
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->registry()Ljava/util/List;
    move-result-object v0
  .line 169
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->rows(Landroid/content/Context;)Ljava/util/List;
    move-result-object v1
  .line 170
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L0
    return-object v0
  :L0
  .line 172
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 173
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 174
    const/4 v4, 0
    const/4 v5, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L6
  .line 175
    invoke-interface { v1, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Help$Row;
  .line 176
    iget-object v7, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-static { v0, v7 }, Lcom/innioasis/y1/activity/IppActivity;->find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v7
  .line 177
    if-eqz v7, :L5
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L2
    goto :L5
  :L2
  .line 178
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 179
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
  .line 180
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 181
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->parent:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
  .line 182
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 2
    if-eq v8, v9, :L3
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 3
    if-ne v8, v9, :L4
  :L3
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v8, :L4
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v8, v8
    iget v9, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-ne v8, v9, :L4
  .line 183
    iget-object v6, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    iput-object v6, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
  :L4
  .line 185
    invoke-interface { v2, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L5
  .line 174
    add-int/lit8 v5, v5, 1
    goto :L1
  :L6
  .line 188
    nop
  :L7
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L9
  .line 189
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 190
    iget-object v5, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L8
    invoke-interface { v2, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L8
  .line 188
    add-int/lit8 v4, v4, 1
    goto :L7
  :L9
  .line 192
    return-object v2
.end method

.method private clampSel()V
  .registers 3
  .line 292
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
  .line 293
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  :L1
  .line 295
    return-void
.end method

.method private confirmCache()V
  .registers 3
  .line 934
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CachePick;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$CachePick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Pick;->askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .line 935
    return-void
.end method

.method private confirmLog(Ljava/lang/String;)V
  .registers 8
  .line 927
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 928
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
  .line 930
    return-void
.end method

.method private confirmScan(Ljava/lang/String;)V
  .registers 8
  .line 921
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 922
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
  .line 924
    return-void
.end method

.method private endEdit(Z)V
  .registers 6
  .line 856
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 857
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 858
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 859
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v2, v2, v3
  .line 860
    if-eqz v2, :L1
  .line 861
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 862
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  :L1
  .line 864
    if-eqz p1, :L2
    iget-object p1, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L2
  .line 865
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 866
    return-void
.end method

.method private static find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 6
  .line 196
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 197
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 198
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 199
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L2
    return-object v2
  :L2
  .line 197
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 201
    return-object v0
.end method

.method private firstSelectable()I
  .registers 4
  .line 285
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 286
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v2
    if-eqz v2, :L1
    return v1
  :L1
  .line 285
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 288
    return v0
.end method

.method private fitRows()V
  .registers 6
  .line 498
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v0
  .line 499
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getWidth()I
    move-result v1
  .line 500
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowsFitted:Z
    if-nez v2, :L8
    if-lez v0, :L8
    if-gtz v1, :L0
    goto :L8
  :L0
  .line 501
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowsFitted:Z
  .line 502
    div-int/lit8 v0, v0, 5
    sub-int/2addr v0, v2
  .line 504
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F
  .line 505
    const/high16 v3, 0x41B00000
  :L1
  .line 506
    const/high16 v4, 0x41600000
    cmpl-float v4, v3, v4
    if-lez v4, :L3
  .line 507
    mul-float v4, v3, v2
    invoke-direct { p0, v4, v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->fits(FII)Z
    move-result v4
    if-eqz v4, :L2
    goto :L3
  :L2
  .line 506
    const/high16 v4, 0x3F800000
    sub-float/2addr v3, v4
    goto :L1
  :L3
  .line 509
    const/4 v1, 0
  :L4
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    array-length v4, v2
    if-ge v1, v4, :L7
  .line 510
    aget-object v2, v2, v1
    if-nez v2, :L5
    goto :L6
  :L5
  .line 511
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, v1
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 512
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v2, v2, v1
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 513
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v2, v2, v1
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 514
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v2, v2, v1
    invoke-virtual { v2 }, Landroid/view/View;->requestLayout()V
  :L6
  .line 509
    add-int/lit8 v1, v1, 1
    goto :L4
  :L7
  .line 516
    return-void
  :L8
  .line 500
    return-void
.end method

.method private fits(FII)Z
  .registers 16
  .line 520
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    array-length v3, v2
    if-ge v1, v3, :L11
  .line 521
    aget-object v2, v2, v1
    if-nez v2, :L1
    goto/16 :L9
  :L1
  .line 522
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 523
    new-instance v5, Landroid/text/TextPaint;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v1
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-direct { v5, v3 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 524
    invoke-virtual { v5, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 525
    nop
  .line 527
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v4, 3
    if-ne v3, v4, :L2
    new-array v3, v0, [Ljava/lang/String;
    goto :L3
  :L2
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->valuesOf(Lcom/innioasis/y1/activity/IppActivity$Item;)[Ljava/lang/String;
    move-result-object v3
  :L3
  .line 528
    const/4 v6, 0
    const/4 v7, 0
  :L4
    array-length v8, v3
    if-ge v7, v8, :L5
    aget-object v8, v3, v7
    invoke-virtual { v5, v8 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v8
    invoke-static { v6, v8 }, Ljava/lang/Math;->max(FF)F
    move-result v6
    add-int/lit8 v7, v7, 1
    goto :L4
  :L5
  .line 529
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v3, v3, v1
    invoke-virtual { v3 }, Landroid/view/View;->getPaddingLeft()I
    move-result v3
    sub-int v3, p2, v3
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v7, v7, v1
    invoke-virtual { v7 }, Landroid/view/View;->getPaddingRight()I
    move-result v7
    sub-int/2addr v3, v7
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v7, v7, v1
  .line 530
    invoke-virtual { v7 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v7
    sub-int/2addr v3, v7
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v7, v7, v1
    invoke-virtual { v7 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v7
    sub-int/2addr v3, v7
    float-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v6
    double-to-int v6, v6
    sub-int/2addr v3, v6
  .line 531
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object v6, v6, v1
    if-eqz v6, :L6
  .line 532
    invoke-virtual { v6 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v6
    const-string v7, "\u21b4"
    invoke-virtual { v6, v7 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v6
    float-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v6
    double-to-int v6, v6
    add-int/2addr v6, v4
    sub-int/2addr v3, v6
  :L6
  .line 534
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
    aget-object v4, v4, v1
    if-eqz v4, :L7
    add-int/lit8 v3, v3, -24
  :L7
    move v6, v3
  .line 535
    if-gtz v6, :L8
    return v0
  :L8
  .line 536
    new-instance v11, Landroid/text/StaticLayout;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v4
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v8, 0x3F800000
    const/4 v9, 0
    const/4 v10, 0
    move-object v3, v11
    invoke-direct/range { v3 .. v10 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 538
    invoke-virtual { v11 }, Landroid/text/StaticLayout;->getLineCount()I
    move-result v2
    const/4 v3, 2
    if-gt v2, v3, :L10
    invoke-virtual { v11 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v2
    if-le v2, p3, :L9
    goto :L10
  :L9
  .line 520
    add-int/lit8 v1, v1, 1
    goto/16 :L0
  :L10
  .line 538
    return v0
  :L11
  .line 540
    const/4 p1, 1
    return p1
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 266
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private glide(I)V
  .registers 5
  .line 763
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
  .line 764
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
  .line 765
    if-gez v0, :L4
    const/4 v0, 0
  :L4
  .line 766
    if-gez p1, :L5
    const/4 p1, 0
  :L5
  .line 767
    if-le p1, v0, :L6
    goto :L7
  :L6
    move v0, p1
  :L7
  .line 768
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1, v1, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 769
    return-void
.end method

.method private hair()Landroid/view/View;
  .registers 5
  .line 661
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    if-nez v0, :L0
  .line 662
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 663
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 664
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 663
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 665
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0x1F000000
    or-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
  :L0
  .line 667
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 668
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 669
    return-object v0
.end method

.method private static label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
  .registers 2
  .line 1581
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
  .line 1570
    sget-object v0, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 1571
    const/4 v1, 0
    if-eqz v0, :L4
    if-nez p0, :L0
    goto :L4
  :L0
  .line 1572
    const/4 v2, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1573
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1574
    iget-object v4, v3, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 1572
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1576
    return-object v1
  :L4
  .line 1571
    return-object v1
.end method

.method private move(I)V
  .registers 3
  .line 649
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 650
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 651
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 652
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  .line 653
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 654
    return-void
.end method

.method private moveCat(I)V
  .registers 4
  .line 788
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
  .line 789
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 790
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 791
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
  .line 792
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->paintCat(I)V
  .line 793
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->paintCat(I)V
  .line 794
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 795
    return-void
.end method

.method private openGroup()V
  .registers 5
  .line 564
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v1, v0
    if-nez v1, :L0
    return-void
  :L0
  .line 565
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    aget v0, v0, v1
  .line 566
    const/4 v1, 0
  :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 567
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 568
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aget v3, v3, v1
    if-ne v3, v0, :L2
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v3, :L2
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v2
    if-eqz v2, :L2
  .line 569
    const/4 v1, -1
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 570
    return-void
  :L2
  .line 566
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 573
    return-void
.end method

.method private openSub(I)V
  .registers 4
  .line 577
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 578
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aget v1, v1, v0
    if-ne v1, p1, :L1
    if-eq v0, p1, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v1
    if-eqz v1, :L1
  .line 579
    const/4 v0, -1
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 580
    return-void
  :L1
  .line 577
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 583
    return-void
.end method

.method private paint(I)V
  .registers 8
  .line 675
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L16
    if-ltz p1, :L16
    array-length v0, v0
    if-lt p1, v0, :L0
    goto/16 :L16
  :L0
  .line 676
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 677
    iget v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v0, :L15
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L1
    goto/16 :L15
  :L1
  .line 678
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v0, v0, p1
    if-eqz v0, :L14
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L2
    goto :L14
  :L2
  .line 679
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    const/4 v1, 0
    if-ne p1, v0, :L3
    const/4 v0, 1
    goto :L4
  :L3
    const/4 v0, 0
  :L4
  .line 680
    if-eqz v0, :L5
    sget v2, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v2, -1
  :L6
  .line 681
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aget-object v4, v4, p1
    if-eqz v0, :L7
    const v5, 2131231052
    goto :L8
  :L7
    const/4 v5, 0
  :L8
    invoke-virtual { v3, v4, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 682
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    invoke-virtual { v3, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 683
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    invoke-virtual { v3, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 684
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    if-eqz v3, :L9
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    invoke-virtual { v3, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L9
  .line 685
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
    aget-object v2, v2, p1
    if-eqz v2, :L13
  .line 686
    if-eqz v0, :L10
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
    aget-object v3, v3, p1
    const v4, 2131623981
    invoke-virtual { v2, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  :L10
  .line 687
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
    aget-object p1, v2, p1
    if-eqz v0, :L11
    goto :L12
  :L11
    const/4 v1, 4
  :L12
    invoke-virtual { p1, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L13
  .line 689
    return-void
  :L14
  .line 678
    return-void
  :L15
  .line 677
    return-void
  :L16
  .line 675
    return-void
.end method

.method private paintCat(I)V
  .registers 8
  .line 629
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catRows:[Landroid/view/View;
    if-eqz v0, :L5
    if-ltz p1, :L5
    array-length v1, v0
    if-lt p1, v1, :L0
    goto :L5
  :L0
  .line 630
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    const/4 v2, 1
    const/4 v3, 0
    if-ne p1, v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 631
    aget-object v0, v0, p1
  .line 632
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->catLabels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 633
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity;->catArrows:[Landroid/widget/ImageView;
    aget-object p1, v5, p1
  .line 634
    if-eqz v1, :L3
  .line 635
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v5, 2131231050
    invoke-virtual { v1, v0, v5, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 636
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v1, 2131623981
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 637
    invoke-virtual { p1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 638
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 639
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 638
    invoke-virtual { p1, v4, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L4
  :L3
  .line 641
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v2, 2131231044
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 642
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131100267
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual { v0, v4, v1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 643
    const/4 v0, 4
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L4
  .line 645
    return-void
  :L5
  .line 629
    return-void
.end method

.method private pickIcons(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 11
  .line 587
    new-instance v8, Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v2
    const v0, 2131821118
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    sget-object v4, Lcom/innioasis/ipp/TopBar;->ICONS:[I
  .line 588
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->valuesOf(Lcom/innioasis/y1/activity/IppActivity$Item;)[Ljava/lang/String;
    move-result-object v5
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->mask(Landroid/content/Context;)I
    move-result v6
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$IconPick;
    invoke-direct { v7, p0 }, Lcom/innioasis/y1/activity/IppActivity$IconPick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    move-object v0, v8
    invoke-direct/range { v0 .. v7 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;ILcom/innioasis/ipp/PickDialog$Go;)V
  .line 589
    invoke-virtual { v8 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 590
    return-void
.end method

.method private postScroll()V
  .registers 3
  .line 693
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 694
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scrollPending:Z
  .line 695
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Scroll;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$Scroll;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 696
    return-void
  :L1
  .line 693
    return-void
.end method

.method private registry()Ljava/util/List;
  .registers 15
  .line 209
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 211
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v2, 0
    const-string v3, "tools"
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 212
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 3
    const-string v10, "cache"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 213
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 3
    const-string v4, "scan"
    const/4 v5, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 214
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "backup"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 215
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "m3u_import"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 216
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "log"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 218
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "player"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 219
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "icon_tint"
    const/4 v11, 3
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 220
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "text_tint"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 221
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "lyrics_tint"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 222
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "cover_tilt"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 223
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "top_hold"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 224
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "book_top_hold"
    const/4 v5, 2
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 225
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "first_artist_only"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 226
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "feat_in_title"
    const/4 v5, 0
    const-string v7, "first_artist_only"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 227
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "artist_album_scroll"
    const/4 v11, 4
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 229
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "menu"
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 230
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "alpha_scroll"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 231
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 4
    const-string v4, "alpha_threshold"
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v5, v2
    sget-object v6, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 232
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "follow_playing"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 233
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "follow_idle"
    sget-object v2, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v5, v2
    sget-object v6, Lcom/innioasis/ipp/Follow;->IDLES:[I
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 234
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "loop_scroll"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 235
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "menu_style"
    const/4 v5, 2
    const/4 v6, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 236
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "fixed_menu_pad"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 237
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "album_artists"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 238
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 5
    const-string v10, "status_bar"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 239
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "bar_text"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    const-string v2, "status_bar"
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity$Item;->in(Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 240
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v4, 3
    const-string v5, "bar_icons"
    sget-object v3, Lcom/innioasis/ipp/TopBar;->ICONS:[I
    array-length v6, v3
    const/4 v8, 0
    move-object v3, v1
    invoke-direct/range { v3 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity$Item;->in(Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 242
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "metadata"
    const/4 v5, 0
    const/4 v6, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 243
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "meta_title"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 244
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "book_meta_title"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 245
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "album_year"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 246
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "track_numbers"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 247
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "artist_split"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 248
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "genre_split"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 249
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "artist_scope"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 251
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "system"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 252
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "delete_folder"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 253
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "keep_awake"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 254
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "likes"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 256
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "kb_lang2"
    const/4 v5, 2
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 258
    return-object v0
.end method

.method private render()V
  .registers 7
  .line 604
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    const/4 v1, 0
    if-gez v0, :L2
  .line 605
    nop
  :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v0, v0
    if-ge v1, v0, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->paintCat(I)V
    add-int/lit8 v1, v1, 1
    goto :L0
  :L1
  .line 606
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 607
    return-void
  :L2
  .line 609
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 610
    const/4 v0, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L11
  .line 611
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 612
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v3, :L4
    goto :L10
  :L4
  .line 615
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aget v3, v3, v0
    iget v4, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ne v3, v4, :L5
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
    if-eqz v3, :L5
    const/4 v3, 1
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 616
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aget-object v4, v4, v0
    if-eqz v3, :L7
    const/4 v5, 0
    goto :L8
  :L7
    const/16 v5, 8
  :L8
    invoke-virtual { v4, v5 }, Landroid/view/View;->setVisibility(I)V
  .line 617
    if-nez v3, :L9
    goto :L10
  :L9
  .line 619
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 620
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
    move-result-object v2
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 622
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->paint(I)V
  :L10
  .line 610
    add-int/lit8 v0, v0, 1
    goto :L3
  :L11
  .line 624
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel()V
  .line 625
    return-void
.end method

.method private scrollToSel()V
  .registers 2
  .line 723
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scrollToSel(Z)V
  .line 724
    return-void
.end method

.method private scrollToSel(Z)V
  .registers 7
  .line 727
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    if-nez v0, :L0
    return-void
  :L0
  .line 731
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    const/4 v1, 1
    const/4 v2, 0
    if-gez v0, :L4
  .line 732
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catRows:[Landroid/view/View;
    if-eqz v0, :L3
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    if-ltz v3, :L3
    array-length v4, v0
    if-lt v3, v4, :L1
    goto :L3
  :L1
  .line 733
    aget-object v0, v0, v3
  .line 734
    if-nez v3, :L2
    goto :L7
  :L2
    const/4 v1, 0
    goto :L7
  :L3
  .line 732
    return-void
  :L4
  .line 736
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    if-eqz v0, :L14
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v3, :L14
    array-length v4, v0
    if-lt v3, v4, :L5
    goto :L14
  :L5
  .line 737
    aget-object v0, v0, v3
  .line 738
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v4
    if-ne v3, v4, :L6
    goto :L7
  :L6
    const/4 v1, 0
  :L7
  .line 740
    if-nez v0, :L8
    return-void
  :L8
  .line 742
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v3
    if-gtz v3, :L10
  .line 743
    if-eqz p1, :L9
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->postScroll()V
  :L9
  .line 744
    return-void
  :L10
  .line 746
    if-eqz v1, :L11
  .line 747
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  .line 748
    return-void
  :L11
  .line 750
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result p1
  .line 751
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v0
  .line 752
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v1
  .line 753
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v2 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v2
  .line 754
    if-ge p1, v1, :L12
  .line 755
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
    goto :L13
  :L12
  .line 756
    add-int/2addr v1, v2
    if-le v0, v1, :L13
  .line 757
    sub-int/2addr v0, v2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->glide(I)V
  :L13
  .line 759
    return-void
  :L14
  .line 736
    return-void
.end method

.method private selectable(I)Z
  .registers 4
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 281
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v1, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aget p1, v1, p1
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ne p1, v1, :L0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result p1
    if-eqz p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method private show(II)V
  .registers 7
  .line 447
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
  .line 448
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->removeAllViews()V
  .line 449
    const/4 v0, -2
    const/4 v1, -1
    if-gez p1, :L0
  .line 450
    const v2, 2131821015
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 451
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3, v1, v0 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
    goto :L3
  :L0
  .line 453
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 454
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3, v1, v0 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 455
    if-ltz p2, :L1
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v0
    if-eqz v0, :L1
    move v0, p2
    goto :L2
  :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v0
  :L2
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 456
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->fitRows()V
  :L3
  .line 458
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    const/4 v1, 0
    invoke-virtual { v0, v1, v1 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 459
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 461
    if-ltz p1, :L4
    if-ltz p2, :L4
  .line 462
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1 }, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    new-instance p2, Lcom/innioasis/y1/activity/IppActivity$Settle;
    invoke-direct { p2, p0 }, Lcom/innioasis/y1/activity/IppActivity$Settle;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-virtual { p1, p2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L4
  .line 464
    return-void
.end method

.method private showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 5
  .line 838
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 839
    if-nez v0, :L0
    return-void
  :L0
  .line 840
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    aget p1, p1, v1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 841
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 842
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 843
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v1, 400
    invoke-virtual { v0, p1, v1, v2 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 844
    return-void
.end method

.method private spin(I)V
  .registers 5
  .line 830
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 831
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 832
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    add-int/2addr v2, p1
    rem-int/2addr v2, v1
    add-int/2addr v2, v1
    rem-int/2addr v2, v1
    iput v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 833
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 834
    return-void
.end method

.method private static spread([Ljava/lang/Runnable;)V
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 1241
    array-length v0, p0
    new-array v1, v0, [Ljava/lang/Thread;
  .line 1242
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L1
  .line 1243
    new-instance v4, Ljava/lang/Thread;
    aget-object v5, p0, v3
    invoke-direct { v4, v5 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    aput-object v4, v1, v3
  .line 1244
    invoke-virtual { v4 }, Ljava/lang/Thread;->start()V
  .line 1242
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 1246
    nop
  :L2
    if-ge v2, v0, :L7
  :L3
  .line 1248
    aget-object p0, v1, v2
    invoke-virtual { p0 }, Ljava/lang/Thread;->join()V
  :L4
  .line 1250
    goto :L6
  :L5
  .line 1249
    move-exception p0
  :L6
  .line 1246
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 1252
    return-void
.end method

.method private startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 4
  .line 820
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 821
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
  .line 822
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 823
    if-ltz v0, :L0
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L1
  :L0
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  :L1
  .line 824
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    if-nez v0, :L2
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
  :L2
  .line 825
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 826
    return-void
.end method

.method private step(II)I
  .registers 5
  .line 772
    add-int v0, p1, p2
  :L0
  .line 773
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 774
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 775
    add-int/2addr v0, p2
    goto :L0
  :L2
  .line 777
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v0
    if-nez v0, :L3
    return p1
  :L3
  .line 778
    if-lez p2, :L4
    const/4 v0, 0
    goto :L5
  :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L5
  .line 779
    if-eq v0, p1, :L7
  .line 780
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L6
    return v0
  :L6
  .line 781
    add-int/2addr v0, p2
    goto :L5
  :L7
  .line 783
    return p1
.end method

.method private toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 2
  .line 275
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
.end method

.method private valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
  .registers 5
  .line 710
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 1
    if-ne v0, v1, :L2
  .line 711
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
  .line 713
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 2
    const/4 v2, 4
    if-eq v0, v1, :L4
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v0, v2, :L3
    goto :L4
  :L3
  .line 719
    const-string p1, ""
    return-object p1
  :L4
  .line 714
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 715
    if-ltz v0, :L5
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L6
  :L5
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
  :L6
  .line 716
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v1, v2, :L7
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    aget p1, p1, v0
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L7
  .line 717
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

.method private valuesOf(Lcom/innioasis/y1/activity/IppActivity$Item;)[Ljava/lang/String;
  .registers 6
  .line 545
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 0
    const/4 v2, 1
    if-ne v0, v2, :L0
  .line 546
    const/4 p1, 2
    new-array p1, p1, [Ljava/lang/String;
    const v0, 2131821018
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    aput-object v0, p1, v1
    const v0, 2131821019
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    aput-object v0, p1, v2
    return-object p1
  :L0
  .line 548
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 4
    if-ne v0, v2, :L3
  .line 549
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    array-length v0, v0
    new-array v2, v0, [Ljava/lang/String;
  .line 550
    nop
  :L1
    if-ge v1, v0, :L2
    iget-object v3, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    aget v3, v3, v1
    invoke-static { v3 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v3
    aput-object v3, v2, v1
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 551
    return-object v2
  :L3
  .line 553
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lez v0, :L4
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    if-eqz v0, :L4
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    return-object p1
  :L4
  .line 554
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lez v0, :L7
  .line 555
    iget p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    new-array v0, p1, [Ljava/lang/String;
  .line 556
    nop
  :L5
    if-ge v1, p1, :L6
    invoke-static { v1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    add-int/lit8 v1, v1, 1
    goto :L5
  :L6
  .line 557
    return-object v0
  :L7
  .line 559
    new-array p1, v1, [Ljava/lang/String;
    return-object p1
.end method

.method private visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 3
  .line 270
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
  .line 1232
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 1233
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 1234
    add-int/2addr v0, v1
  .line 1235
    const/4 v1, 4
    if-le v0, v1, :L1
    const/4 v0, 4
  :L1
  .line 1236
    return v0
.end method

.method public antiClockwise()V
  .registers 3
  .line 808
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, -1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 809
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->moveCat(I)V
    return-void
  :L1
  .line 810
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 811
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 812
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 813
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 847
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 848
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    aget-object v0, v0, v1
  .line 849
    if-nez v0, :L1
    return-void
  :L1
  .line 850
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L2
    const/4 v1, 4
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 851
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 852
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
  .line 799
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 800
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->moveCat(I)V
    return-void
  :L1
  .line 801
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 802
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 803
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 804
    return-void
.end method

.method public confirm()V
  .registers 5
  .line 877
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 878
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->openGroup()V
    return-void
  :L1
  .line 879
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 880
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 881
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v2, v1, :L4
  .line 883
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
    xor-int/2addr v1, v3
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 885
    const-string v1, "likes"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  :L2
  .line 887
    const-string v1, "genre_split"
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L3
  .line 888
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
    goto/16 :L14
  :L4
  .line 889
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 4
    if-ne v2, v3, :L5
  .line 890
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto/16 :L14
  :L5
  .line 891
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 2
    if-ne v2, v3, :L7
  .line 892
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    add-int/2addr v2, v1
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    rem-int/2addr v2, v1
  .line 893
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 894
    const-string v1, "bar_text"
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->apply(Ljava/lang/Object;)V
  :L6
  .line 895
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 896
    goto/16 :L14
  :L7
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 5
    if-ne v1, v2, :L8
  .line 897
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->openSub(I)V
    goto/16 :L14
  :L8
  .line 898
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 3
    if-ne v1, v2, :L14
  .line 899
    const-string v1, "bar_icons"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 900
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->pickIcons(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto :L14
  :L9
  .line 901
    const-string v1, "scan"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L10
  .line 902
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmScan(Ljava/lang/String;)V
    goto :L14
  :L10
  .line 903
    const-string v1, "cache"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L11
  .line 904
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmCache()V
    goto :L14
  :L11
  .line 905
    const-string v1, "backup"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L12
  .line 907
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Backup;->open(Landroid/app/Activity;Ljava/lang/String;)V
    goto :L14
  :L12
  .line 908
    const-string v1, "m3u_import"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L13
  .line 909
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startActivity(Landroid/content/Intent;)V
    goto :L14
  :L13
  .line 910
    const-string v1, "log"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L14
  .line 911
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmLog(Ljava/lang/String;)V
  :L14
  .line 914
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1540
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L3
  .line 1542
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz p1, :L0
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 1543
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ltz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$Item;
    iget p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v0, 5
    if-ne p1, v0, :L1
  .line 1544
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    aget p1, p1, v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 1545
    return-void
  :L1
  .line 1547
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ltz p1, :L2
    const/4 p1, -1
    invoke-direct { p0, p1, p1 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
    return-void
  :L2
  .line 1548
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  :L3
  .line 1550
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 75
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 299
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 18
  .line 304
    move-object/from16 v0, p0
    const v1, 2131821015
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 306
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
    invoke-interface { v1 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 307
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 311
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v2, v0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroid/widget/LinearLayout;
  .line 312
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 314
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->buildItems()Ljava/util/List;
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
  .line 315
    sput-object v2, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 316
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
  .line 317
    new-array v4, v2, [Landroid/view/View;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
  .line 318
    new-array v4, v2, [Landroid/view/View;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
  .line 319
    new-array v4, v2, [Landroid/widget/TextView;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
  .line 320
    new-array v4, v2, [Landroid/widget/TextView;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
  .line 321
    new-array v4, v2, [Landroid/widget/TextView;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
  .line 322
    new-array v4, v2, [Landroid/widget/ImageView;
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
  .line 323
    new-array v4, v2, [I
    iput-object v4, v0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
  .line 325
    nop
  .line 326
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
  :L0
    if-ge v5, v2, :L2
  .line 327
    iget-object v7, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v7, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    iget v7, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v7, :L1
    add-int/lit8 v6, v6, 1
  :L1
  .line 326
    add-int/lit8 v5, v5, 1
    goto :L0
  :L2
  .line 329
    new-array v5, v6, [I
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
  .line 330
    new-array v5, v6, [Landroid/view/View;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->catRows:[Landroid/view/View;
  .line 331
    new-array v5, v6, [Landroid/widget/TextView;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->catLabels:[Landroid/widget/TextView;
  .line 332
    new-array v5, v6, [Landroid/widget/ImageView;
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->catArrows:[Landroid/widget/ImageView;
  .line 333
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct { v5, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroid/widget/LinearLayout;
  .line 334
    invoke-virtual { v5, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 336
    nop
  .line 337
    nop
  .line 338
    const/4 v5, -1
    const/4 v6, 0
    const/4 v7, -1
    const/4 v8, 0
  :L3
    const/4 v9, 5
    if-ge v6, v2, :L9
  .line 339
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v10, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 340
    iget v11, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v11, :L4
  .line 342
    nop
  .line 343
    iget-object v7, v0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aput v6, v7, v6
  .line 344
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v7
    const v11, 2131558521
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroid/widget/LinearLayout;
    invoke-virtual { v7, v11, v12, v4 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object v7
  .line 345
    const v11, 2131362491
    invoke-virtual { v7, v11 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v11
    check-cast v11, Landroid/widget/TextView;
  .line 346
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v11, v10 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 347
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    aput v6, v10, v8
  .line 348
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->catRows:[Landroid/view/View;
    aput-object v7, v10, v8
  .line 349
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->catLabels:[Landroid/widget/TextView;
    aput-object v11, v10, v8
  .line 350
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->catArrows:[Landroid/widget/ImageView;
    const v11, 2131362144
    invoke-virtual { v7, v11 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v11
    check-cast v11, Landroid/widget/ImageView;
    aput-object v11, v10, v8
  .line 352
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->catArrows:[Landroid/widget/ImageView;
    aget-object v10, v10, v8
    invoke-virtual { v10 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v10
    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 353
    iput v9, v10, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  .line 354
    invoke-virtual { v10, v9 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V
  .line 355
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroid/widget/LinearLayout;
    invoke-virtual { v9, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
  .line 356
    add-int/lit8 v8, v8, 1
  .line 357
    move v7, v6
    goto/16 :L8
  :L4
  .line 358
    iget-object v11, v0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aput v7, v11, v6
  .line 360
    new-instance v11, Landroid/widget/LinearLayout;
    invoke-direct { v11, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 361
    invoke-virtual { v11, v4 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 362
    invoke-virtual { v11, v4 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 363
    const/16 v12, 16
    invoke-virtual { v11, v12 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 364
    invoke-virtual { v11, v9, v4, v9, v4 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 368
    iget-object v13, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    const/4 v14, 3
    const/4 v15, -2
    if-eqz v13, :L5
  .line 369
    new-instance v13, Landroid/widget/TextView;
    invoke-direct { v13, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 370
    const/high16 v9, 0x41500000
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 371
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v9
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 372
    invoke-virtual { v13, v4 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 373
    const/16 v9, 17
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 374
    const-string v9, "\u21b4"
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 375
    const/high16 v9, 0x43340000
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setRotation(F)V
  .line 376
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v9, v15, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 377
    iput v14, v9, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 378
    invoke-virtual { v11, v13, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 379
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppActivity;->marks:[Landroid/widget/TextView;
    aput-object v13, v9, v6
  :L5
  .line 383
    new-instance v9, Landroid/widget/TextView;
    invoke-direct { v9, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 384
    const/high16 v13, 0x41B00000
    invoke-virtual { v9, v13 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 385
    sget-object v14, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v9, v14, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 386
    invoke-virtual { v9, v4 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 387
    invoke-virtual { v9, v12 }, Landroid/widget/TextView;->setGravity(I)V
  .line 388
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v14, v4, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 389
    const/high16 v5, 0x3F800000
    iput v5, v14, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 390
    invoke-virtual { v11, v9, v14 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 392
    new-instance v5, Landroid/widget/TextView;
    invoke-direct { v5, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 393
    invoke-virtual { v5, v13 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 394
    sget-object v13, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v5, v13, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 395
    invoke-virtual { v5, v4 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 396
    invoke-virtual { v5, v12 }, Landroid/widget/TextView;->setGravity(I)V
  .line 397
    const/4 v12, 6
    invoke-virtual { v5, v12, v4, v12, v4 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 398
    invoke-virtual { v11, v5, v15, v15 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 401
    iget v12, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v13, 4
    const/4 v14, 5
    if-eq v12, v14, :L6
    iget v10, v10, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v12, 3
    if-ne v10, v12, :L7
  :L6
  .line 402
    new-instance v10, Landroid/widget/ImageView;
    invoke-direct { v10, v0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 403
    invoke-virtual { v10, v3 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 404
    invoke-virtual { v10, v13 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 405
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, -1
    invoke-direct { v12, v15, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 406
    invoke-virtual { v11 }, Landroid/widget/LinearLayout;->getPaddingRight()I
    move-result v14
    const/16 v16, 5
    rsub-int/lit8 v14, v14, 5
    iput v14, v12, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 407
    invoke-virtual { v11, v10, v12 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 408
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppActivity;->arrows:[Landroid/widget/ImageView;
    aput-object v10, v12, v6
  :L7
  .line 411
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->rowViews:[Landroid/view/View;
    aput-object v11, v10, v6
  .line 412
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->labels:[Landroid/widget/TextView;
    aput-object v9, v10, v6
  .line 413
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppActivity;->values:[Landroid/widget/TextView;
    aput-object v5, v10, v6
  .line 416
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct { v5, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 417
    invoke-virtual { v5, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 419
    invoke-virtual { v9 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v9
    mul-int/lit8 v9, v9, 2
    add-int/2addr v9, v13
    iput v9, v0, Lcom/innioasis/y1/activity/IppActivity;->minRow:I
  .line 420
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    iget v10, v0, Lcom/innioasis/y1/activity/IppActivity;->minRow:I
    const/4 v12, -1
    invoke-direct { v9, v12, v10 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v5, v11, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 421
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->hair()Landroid/view/View;
    move-result-object v9
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v12, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v5, v9, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 422
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppActivity;->rowBoxes:[Landroid/view/View;
    aput-object v5, v9, v6
  .line 423
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroid/widget/LinearLayout;
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v12, v15 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v5, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L8
  .line 338
    add-int/lit8 v6, v6, 1
    const/4 v5, -1
    goto/16 :L3
  :L9
  .line 428
    const/4 v3, 0
  :L10
    if-ge v3, v2, :L17
  .line 429
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v5, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 430
    iget v6, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v6, :L15
    iget-object v6, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
    if-nez v6, :L11
    const/4 v9, 5
    goto :L16
  :L11
  .line 431
    const/4 v6, 0
  :L12
    if-ge v6, v2, :L14
  .line 432
    iget-object v7, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v7, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 433
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 5
    if-ne v8, v9, :L13
    iget-object v8, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
    iget-object v7, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v8, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L13
    iget-object v7, v0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aput v6, v7, v3
  :L13
  .line 431
    add-int/lit8 v6, v6, 1
    goto :L12
  :L14
    const/4 v9, 5
    goto :L16
  :L15
  .line 430
    const/4 v9, 5
  :L16
  .line 428
    add-int/lit8 v3, v3, 1
    goto :L10
  :L17
  .line 437
    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct { v2, v0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v2, v0, Lcom/innioasis/y1/activity/IppActivity;->scroller:Landroid/widget/ScrollView;
  .line 438
    const/4 v3, -1
    invoke-virtual { v1, v2, v3, v3 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 439
    invoke-direct { v0, v3, v3 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 440
    return-void
.end method

.method public longConfirm()V
  .registers 5
  .line 1555
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1556
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    return-void
  :L1
  .line 1557
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    if-eqz v0, :L6
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v1, :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v1, v0, :L2
    goto :L6
  :L2
  .line 1558
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1559
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v1, :L5
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    if-nez v1, :L3
    goto :L5
  :L3
  .line 1560
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Help;->blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 1561
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 1562
    new-instance v2, Lcom/innioasis/ipp/HelpDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v3
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { v2, v3, v0, v1 }, Lcom/innioasis/ipp/HelpDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    invoke-virtual { v2 }, Lcom/innioasis/ipp/HelpDialog;->show()V
  .line 1563
    return-void
  :L5
  .line 1559
    return-void
  :L6
  .line 1557
    return-void
.end method

.method public quit()V
  .registers 2
  .line 1586
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
  .line 1587
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  .line 1588
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
  .line 956
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
  .line 958
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 961
    goto :L3
  :L2
  .line 959
    move-exception v1
  .line 960
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L3
  .line 962
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RescanTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 963
    return-void
.end method

.method scanFinished(I)V
  .registers 3
  .line 971
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Done;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 972
    return-void
.end method

.method scanTick(Ljava/lang/String;)V
  .registers 3
  .line 967
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Tick;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 968
    return-void
.end method
