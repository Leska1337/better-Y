.class public final Lcom/innioasis/y1/activity/IppActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppActivity$AlbumJob;,
    Lcom/innioasis/y1/activity/IppActivity$Item;,
    Lcom/innioasis/y1/activity/IppActivity$CatAdapter;,
    Lcom/innioasis/y1/activity/IppActivity$RowAdapter;,
    Lcom/innioasis/y1/activity/IppActivity$IconPick;,
    Lcom/innioasis/y1/activity/IppActivity$CatHolder;,
    Lcom/innioasis/y1/activity/IppActivity$RowHolder;,
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
    Lcom/innioasis/y1/activity/IppActivity$Steps;,
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

.field private final static MARK_GAP:I = 3

.field private final static MARK_SP:F = 13.0F

.field private final static NUMBER:I = 4

.field private final static ROWS:I = 5

.field public final static RULE_ALPHA:I = 1493172224

.field private final static SUB:I = 5

.field private final static TEXT_MIN_SP:F = 14.0F

.field private final static TEXT_SP:F = 22.0F

.field private final static TEXT_START:I = 10

.field private final static TOGGLE:I = 1

.field private final static WORKER_PRIORITY:I = 5

.field private static lastItems:Ljava/util/List;

.field private blink:Lcom/innioasis/y1/activity/IppActivity$Blink;

.field private catAdapter:Lcom/innioasis/y1/activity/IppActivity$CatAdapter;

.field private catList:Landroidx/recyclerview/widget/RecyclerView;

.field private catLm:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private catSel:I

.field private cats:[I

.field private editIndex:I

.field private editVal:I

.field private editing:Z

.field private group:I

.field private groupOf:[I

.field private hairColor:I

.field private items:Ljava/util/List;

.field private progress:Lcom/innioasis/y1/utils/LoadingDialog;

.field private rowAdapter:Lcom/innioasis/y1/activity/IppActivity$RowAdapter;

.field private rowList:Landroidx/recyclerview/widget/RecyclerView;

.field private rowLm:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private rowPx:I

.field private rowsFitted:Z

.field private sel:I

.field private shown:[I

.field private textSp:F

.method static constructor <clinit>()V
  .registers 1
  .line 97
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 2
  .line 87
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 150
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
  .line 162
    const/4 v0, 0
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
  .line 449
    const/high16 v0, 0x41B00000
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppActivity;)[I
  .registers 1
  .line 87
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppActivity;)[I
  .registers 1
  .line 87
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
    return-object p0
.end method

.method static synthetic access$300()I
  .registers 1
  .line 87
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->workers()I
    move-result v0
    return v0
.end method

.method static synthetic access$400([Ljava/lang/Runnable;)V
  .registers 1
  .line 87
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->spread([Ljava/lang/Runnable;)V
    return-void
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .registers 1
  .line 87
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
    return-void
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 1
  .line 87
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p0
.end method

.method static synthetic access$702(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .registers 2
  .line 87
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
    return-object p1
.end method

.method private static album(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L10 .. :L11 } :L12
  .registers 4
  .line 1651
    if-eqz p0, :L14
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    if-nez v0, :L0
    goto :L14
  :L0
  .line 1652
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L2
  .line 1654
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L1
  .line 1655
    return-void
  :L2
  .line 1658
    nop
  .line 1659
    new-instance v0, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 1661
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 1662
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v2
  :L4
  .line 1664
    goto :L6
  :L5
  .line 1663
    move-exception v2
    move-object v2, v1
  :L6
  .line 1665
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L7
    goto :L9
  :L8
    move-exception v0
  :L9
  .line 1667
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L13
  .line 1669
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v0, :L10
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L10
  .line 1671
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L11
  .line 1673
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1674
    goto :L13
  :L12
  .line 1673
    move-exception p0
    invoke-static { v1, v1 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1674
    throw p0
  :L13
  .line 1676
    return-void
  :L14
  .line 1651
    return-void
.end method

.method public static bandAlpha()I
  .registers 1
  .line 110
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
  .line 178
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->registry()Ljava/util/List;
    move-result-object v0
  .line 179
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->rows(Landroid/content/Context;)Ljava/util/List;
    move-result-object v1
  .line 180
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L0
    return-object v0
  :L0
  .line 182
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 183
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 184
    const/4 v4, 0
    const/4 v5, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L6
  .line 185
    invoke-interface { v1, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Help$Row;
  .line 186
    iget-object v7, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-static { v0, v7 }, Lcom/innioasis/y1/activity/IppActivity;->find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
    move-result-object v7
  .line 187
    if-eqz v7, :L5
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L2
    goto :L5
  :L2
  .line 188
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 189
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->label:Ljava/lang/String;
  .line 190
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 191
    iget-object v8, v6, Lcom/innioasis/ipp/Help$Row;->parent:Ljava/lang/String;
    iput-object v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
  .line 192
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
  .line 193
    iget-object v6, v6, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    iput-object v6, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
  :L4
  .line 195
    invoke-interface { v2, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L5
  .line 184
    add-int/lit8 v5, v5, 1
    goto :L1
  :L6
  .line 198
    nop
  :L7
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L9
  .line 199
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 200
    iget-object v5, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L8
    invoke-interface { v2, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L8
  .line 198
    add-int/lit8 v4, v4, 1
    goto :L7
  :L9
  .line 202
    return-object v2
.end method

.method private clampSel()V
  .registers 3
  .line 308
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
  .line 309
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  :L1
  .line 311
    return-void
.end method

.method private confirmCache()V
  .registers 3
  .line 979
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CachePick;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$CachePick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Pick;->askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .line 980
    return-void
.end method

.method private confirmLog(Ljava/lang/String;)V
  .registers 8
  .line 972
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 973
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
  .line 975
    return-void
.end method

.method private confirmScan(Ljava/lang/String;)V
  .registers 8
  .line 966
    new-instance v0, Lcom/innioasis/y1/utils/DialogUtil;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v0, v1, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
  .line 967
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
  .line 969
    return-void
.end method

.method private editValue()Landroid/widget/TextView;
  .registers 4
  .line 812
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowLm:Landroidx/recyclerview/widget/LinearLayoutManager;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->posOf(I)I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  .line 813
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 814
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object v0
  .line 815
    instance-of v2, v0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;
    if-eqz v2, :L1
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
  :L1
    return-object v1
.end method

.method private endEdit(Z)V
  .registers 5
  .line 838
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 839
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 840
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 841
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L1
  .line 842
    if-eqz p1, :L2
    iget-object p1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L2
  .line 843
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 844
    return-void
.end method

.method private static find(Ljava/util/List;Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 6
  .line 206
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 207
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 208
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 209
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L2
    return-object v2
  :L2
  .line 207
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 211
    return-object v0
.end method

.method private firstSelectable()I
  .registers 4
  .line 301
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 302
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v2
    if-eqz v2, :L1
    return v1
  :L1
  .line 301
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 304
    return v0
.end method

.method private fitRows()V
  .registers 6
  .line 458
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v0
  .line 459
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v1
  .line 460
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowsFitted:Z
    if-nez v2, :L4
    if-lez v0, :L4
    if-gtz v1, :L0
    goto :L4
  :L0
  .line 461
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowsFitted:Z
  .line 462
    div-int/lit8 v0, v0, 5
    sub-int/2addr v0, v2
  .line 464
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F
  .line 465
    const/high16 v3, 0x41B00000
  :L1
  .line 466
    const/high16 v4, 0x41600000
    cmpl-float v4, v3, v4
    if-lez v4, :L3
  .line 467
    mul-float v4, v3, v2
    invoke-direct { p0, v4, v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->fits(FII)Z
    move-result v4
    if-eqz v4, :L2
    goto :L3
  :L2
  .line 466
    const/high16 v4, 0x3F800000
    sub-float/2addr v3, v4
    goto :L1
  :L3
  .line 469
    iput v3, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
  .line 470
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowPx:I
  .line 471
    return-void
  :L4
  .line 460
    return-void
.end method

.method private fits(FII)Z
  .registers 20
  .line 475
    move-object/from16 v0, p0
    new-instance v9, Landroid/text/TextPaint;
    const/4 v10, 1
    invoke-direct { v9, v10 }, Landroid/text/TextPaint;-><init>(I)V
  .line 476
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual { v9, v1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 477
    move/from16 v1, p1
    invoke-virtual { v9, v1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 478
    new-instance v1, Landroid/text/TextPaint;
    invoke-direct { v1, v10 }, Landroid/text/TextPaint;-><init>(I)V
  .line 479
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 480
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F
    const/high16 v3, 0x41500000
    mul-float v2, v2, v3
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 481
    const-string v2, "\u21b4"
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    float-to-double v1, v1
    invoke-static { v1, v2 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v1
    double-to-int v1, v1
    const/4 v11, 3
    add-int/lit8 v12, v1, 3
  .line 482
    const/4 v13, 0
    const/4 v14, 0
  :L0
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v14, v1, :L12
  .line 483
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1, v14 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 484
    iget v2, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v2, :L1
    move/from16 v2, p3
    goto :L10
  :L1
  .line 485
    nop
  .line 487
    iget v2, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v2, v11, :L2
    new-array v2, v13, [Ljava/lang/String;
    goto :L3
  :L2
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->valuesOf(Lcom/innioasis/y1/activity/IppActivity$Item;)[Ljava/lang/String;
    move-result-object v2
  :L3
  .line 488
    const/4 v3, 0
    const/4 v4, 0
  :L4
    array-length v5, v2
    if-ge v4, v5, :L5
    aget-object v5, v2, v4
    invoke-virtual { v9, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v5
    invoke-static { v3, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v3
    add-int/lit8 v4, v4, 1
    goto :L4
  :L5
  .line 490
    add-int/lit8 v2, p2, -10
    const/4 v4, 5
    sub-int/2addr v2, v4
    add-int/lit8 v2, v2, -6
    add-int/lit8 v2, v2, -6
    float-to-double v5, v3
    invoke-static { v5, v6 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v3, v5
    sub-int/2addr v2, v3
  .line 491
    iget-object v3, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    if-eqz v3, :L6
    sub-int/2addr v2, v12
  :L6
  .line 492
    iget v3, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eq v3, v4, :L7
    iget v3, v1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v3, v11, :L8
  :L7
    add-int/lit8 v2, v2, -24
  :L8
    move v4, v2
  .line 493
    if-gtz v4, :L9
    return v13
  :L9
  .line 494
    new-instance v15, Landroid/text/StaticLayout;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v2
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v6, 0x3F800000
    const/4 v7, 0
    const/4 v8, 0
    move-object v1, v15
    move-object v3, v9
    invoke-direct/range { v1 .. v8 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 496
    invoke-virtual { v15 }, Landroid/text/StaticLayout;->getLineCount()I
    move-result v1
    const/4 v2, 2
    if-gt v1, v2, :L11
    invoke-virtual { v15 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v1
    move/from16 v2, p3
    if-le v1, v2, :L10
    goto :L11
  :L10
  .line 482
    add-int/lit8 v14, v14, 1
    goto :L0
  :L11
  .line 496
    return v13
  :L12
  .line 498
    return v10
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 282
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private hair()Landroid/view/View;
  .registers 5
  .line 716
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    if-nez v0, :L0
  .line 717
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 718
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 719
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 718
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 720
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0x1F000000
    or-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
  :L0
  .line 722
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 723
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->hairColor:I
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 724
    return-object v0
.end method

.method private static label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
  .registers 2
  .line 1808
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
  .line 1797
    sget-object v0, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 1798
    const/4 v1, 0
    if-eqz v0, :L4
    if-nez p0, :L0
    goto :L4
  :L0
  .line 1799
    const/4 v2, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1800
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1801
    iget-object v4, v3, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 1799
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1803
    return-object v1
  :L4
  .line 1798
    return-object v1
.end method

.method private move(I)V
  .registers 5
  .line 704
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 705
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 706
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->posOf(I)I
    move-result v0
  .line 707
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->setMark(I)V
  .line 708
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->posOf(I)I
    move-result p1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowAdapter:Lcom/innioasis/y1/activity/IppActivity$RowAdapter;
    invoke-static { v1, p1, v0, v2 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 709
    return-void
.end method

.method private moveCat(I)V
  .registers 6
  .line 760
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
  .line 762
    const/4 v1, 0
    const/4 v2, 1
    if-lez p1, :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v3, v3
    sub-int/2addr v3, v2
    if-lt v0, v3, :L2
    goto :L1
  :L0
    if-gtz v0, :L2
  :L1
    const/4 v1, 1
  :L2
  .line 763
    if-eqz v1, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 764
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v2, v2
    invoke-static { v1, p1, v2 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 765
    if-ne p1, v0, :L4
    return-void
  :L4
  .line 766
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
  .line 767
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->setMark(I)V
  .line 768
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->catAdapter:Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
    invoke-static { p1, v0, v1, v2 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 769
    return-void
.end method

.method private newList(I)Landroidx/recyclerview/widget/RecyclerView;
  .registers 4
  .line 374
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-direct { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V
  .line 375
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setId(I)V
  .line 376
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { p1, p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
  .line 377
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 378
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 379
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 380
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->setItemPrefetchEnabled(Z)V
  .line 381
    const/high16 p1, 0x00060000
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 382
    return-object v0
.end method

.method private openGroup()V
  .registers 5
  .line 522
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    array-length v1, v0
    if-nez v1, :L0
    return-void
  :L0
  .line 523
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    aget v0, v0, v1
  .line 524
    const/4 v1, 0
  :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 525
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 526
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aget v3, v3, v1
    if-ne v3, v0, :L2
    iget v3, v2, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v3, :L2
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v2
    if-eqz v2, :L2
  .line 527
    const/4 v1, -1
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 528
    return-void
  :L2
  .line 524
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 531
    return-void
.end method

.method private openSub(I)V
  .registers 4
  .line 535
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 536
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
  .line 537
    const/4 v0, -1
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 538
    return-void
  :L1
  .line 535
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 541
    return-void
.end method

.method private pickIcons(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 11
  .line 545
    new-instance v8, Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v2
    const v0, 2131821118
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    sget-object v4, Lcom/innioasis/ipp/TopBar;->ICONS:[I
  .line 546
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->valuesOf(Lcom/innioasis/y1/activity/IppActivity$Item;)[Ljava/lang/String;
    move-result-object v5
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->mask(Landroid/content/Context;)I
    move-result v6
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$IconPick;
    invoke-direct { v7, p0 }, Lcom/innioasis/y1/activity/IppActivity$IconPick;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    move-object v0, v8
    invoke-direct/range { v0 .. v7 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;ILcom/innioasis/ipp/PickDialog$Go;)V
  .line 547
    invoke-virtual { v8 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 548
    return-void
.end method

.method private posOf(I)I
  .registers 5
  .line 425
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
    array-length v2, v1
    if-ge v0, v2, :L2
  .line 426
    aget v1, v1, v0
    if-ne v1, p1, :L1
    return v0
  :L1
  .line 425
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 428
    const/4 p1, -1
    return p1
.end method

.method private registry()Ljava/util/List;
  .registers 15
  .line 219
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 221
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v2, 0
    const-string v3, "tools"
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v7 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 222
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 3
    const-string v10, "cache"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 223
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 3
    const-string v4, "scan"
    const/4 v5, 0
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 224
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "backup"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 225
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "m3u_import"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 226
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "log"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 228
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "player"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 229
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "icon_tint"
    const/4 v11, 3
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 230
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "text_tint"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 231
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "lyrics_tint"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 232
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "box_tint"
    const/4 v5, 4
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 233
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "cover_tilt"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 234
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "top_hold"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 235
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "book_top_hold"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 236
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "first_artist_only"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 237
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "feat_in_title"
    const/4 v11, 0
    const-string v13, "first_artist_only"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 238
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "player_album_artist"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 239
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "various_artist"
    const-string v13, "player_album_artist"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 240
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "aa_feat_in_title"
    const-string v7, "player_album_artist"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 241
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "artist_album_scroll"
    const/4 v11, 4
    const/4 v13, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 243
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "menu"
    const/4 v7, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 244
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "alpha_scroll"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 245
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 4
    const-string v4, "alpha_threshold"
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v5, v2
    sget-object v6, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 246
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "follow_playing"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 247
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "follow_idle"
    sget-object v2, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v5, v2
    sget-object v6, Lcom/innioasis/ipp/Follow;->IDLES:[I
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 248
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "loop_scroll"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 249
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "animations"
    const/4 v5, 0
    const/4 v6, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 250
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 2
    const-string v10, "menu_style"
    const/4 v11, 2
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 251
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "preview_text"
    const/4 v5, 3
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 252
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "fixed_menu_pad"
    const/4 v11, 0
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 253
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "album_artists"
    const/4 v5, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 254
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 5
    const-string v10, "status_bar"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 255
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
  .line 256
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
  .line 258
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "metadata"
    const/4 v5, 0
    const/4 v6, 0
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 259
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v9, 1
    const-string v10, "meta_title"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 260
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "book_meta_title"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 261
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "album_year"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 262
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "track_numbers"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 263
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "artist_split"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 264
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v4, "genre_split"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 265
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "artist_scope"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 267
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 0
    const-string v4, "system"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 268
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "delete_folder"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 269
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 1
    const-string v4, "keep_awake"
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 270
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const-string v10, "likes"
    move-object v8, v1
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 272
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    const/4 v3, 2
    const-string v4, "kb_lang2"
    const/4 v5, 2
    move-object v2, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/y1/activity/IppActivity$Item;-><init>(ILjava/lang/String;I[ILjava/lang/String;)V
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 274
    return-object v0
.end method

.method private relist()V
  .registers 5
  .line 413
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 414
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 415
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v3
    if-eqz v3, :L1
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 414
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 417
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    new-array v2, v2, [I
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
  .line 418
    nop
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
    array-length v3, v2
    if-ge v1, v3, :L4
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    aput v3, v2, v1
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 419
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->posOf(I)I
    move-result v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->setMark(I)V
  .line 420
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowAdapter:Lcom/innioasis/y1/activity/IppActivity$RowAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;->notifyDataSetChanged()V
  .line 421
    return-void
.end method

.method private render()V
  .registers 2
  .line 563
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L0
  .line 564
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catAdapter:Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->notifyDataSetChanged()V
  .line 565
    return-void
  :L0
  .line 567
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 568
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->relist()V
  .line 569
    return-void
.end method

.method private selectable(I)Z
  .registers 4
  .line 296
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 297
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

.method private static setHeight(Landroid/view/View;I)Z
  .registers 4
  .line 695
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 696
    if-eqz v0, :L1
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L0
    goto :L1
  :L0
  .line 697
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 698
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 699
    const/4 p0, 1
    return p0
  :L1
  .line 696
    const/4 p0, 0
    return p0
.end method

.method private show(II)V
  .registers 6
  .line 390
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
  .line 391
    const/16 v0, 8
    const/4 v1, 0
    if-gez p1, :L0
  .line 392
    const p1, 2131821015
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 393
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 394
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 395
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->setMark(I)V
  .line 396
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catAdapter:Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->notifyDataSetChanged()V
  .line 397
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 398
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catLm:Landroidx/recyclerview/widget/LinearLayoutManager;
    iget p2, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V
    goto :L4
  :L0
  .line 400
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v2, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$Item;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 401
    if-ltz p2, :L1
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result p1
    if-eqz p1, :L1
    move p1, p2
    goto :L2
  :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->firstSelectable()I
    move-result p1
  :L2
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 402
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->fitRows()V
  .line 403
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 404
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 405
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->relist()V
  .line 406
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 407
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowLm:Landroidx/recyclerview/widget/LinearLayoutManager;
    if-ltz p2, :L3
    iget p2, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppActivity;->posOf(I)I
    move-result v1
  :L3
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V
  :L4
  .line 409
    return-void
.end method

.method private showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 5
  .line 820
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 821
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->editValue()Landroid/widget/TextView;
    move-result-object v0
  .line 822
    if-eqz v0, :L0
  .line 823
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    aget p1, p1, v1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 824
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L0
  .line 826
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v1, 400
    invoke-virtual { p1, v0, v1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 827
    return-void
.end method

.method private spin(I)V
  .registers 5
  .line 804
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 805
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 806
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    add-int/2addr v2, p1
    rem-int/2addr v2, v1
    add-int/2addr v2, v1
    rem-int/2addr v2, v1
    iput v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 807
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 808
    return-void
.end method

.method private static spread([Ljava/lang/Runnable;)V
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 1340
    array-length v0, p0
    new-array v1, v0, [Ljava/lang/Thread;
  .line 1341
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L1
  .line 1342
    new-instance v4, Ljava/lang/Thread;
    aget-object v5, p0, v3
    invoke-direct { v4, v5 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    aput-object v4, v1, v3
  .line 1343
    invoke-virtual { v4 }, Ljava/lang/Thread;->start()V
  .line 1341
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 1345
    nop
  :L2
    if-ge v2, v0, :L7
  :L3
  .line 1347
    aget-object p0, v1, v2
    invoke-virtual { p0 }, Ljava/lang/Thread;->join()V
  :L4
  .line 1349
    goto :L6
  :L5
  .line 1348
    move-exception p0
  :L6
  .line 1345
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 1351
    return-void
.end method

.method private startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .registers 4
  .line 794
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
  .line 795
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
  .line 796
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  .line 797
    if-ltz v0, :L0
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L1
  :L0
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
  :L1
  .line 798
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    if-nez v0, :L2
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
  :L2
  .line 799
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->showCandidate(Lcom/innioasis/y1/activity/IppActivity$Item;)V
  .line 800
    return-void
.end method

.method private step(II)I
  .registers 5
  .line 744
    add-int v0, p1, p2
  :L0
  .line 745
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 746
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 747
    add-int/2addr v0, p2
    goto :L0
  :L2
  .line 749
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Bar;->wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
    if-nez v0, :L3
    return p1
  :L3
  .line 750
    if-lez p2, :L4
    const/4 v0, 0
    goto :L5
  :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L5
  .line 751
    if-eq v0, p1, :L7
  .line 752
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->selectable(I)Z
    move-result v1
    if-eqz v1, :L6
    return v0
  :L6
  .line 753
    add-int/2addr v0, p2
    goto :L5
  :L7
  .line 755
    return p1
.end method

.method private toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 2
  .line 291
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
.end method

.method private valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
  .registers 5
  .line 730
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 1
    if-ne v0, v1, :L2
  .line 731
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
  .line 733
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 2
    const/4 v2, 4
    if-eq v0, v1, :L4
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v0, v2, :L3
    goto :L4
  :L3
  .line 739
    const-string p1, ""
    return-object p1
  :L4
  .line 734
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 735
    if-ltz v0, :L5
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lt v0, v1, :L6
  :L5
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
  :L6
  .line 736
    iget v1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v1, v2, :L7
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    aget p1, p1, v0
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L7
  .line 737
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
  .line 503
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 0
    const/4 v2, 1
    if-ne v0, v2, :L0
  .line 504
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
  .line 506
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 4
    if-ne v0, v2, :L3
  .line 507
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    array-length v0, v0
    new-array v2, v0, [Ljava/lang/String;
  .line 508
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
  .line 509
    return-object v2
  :L3
  .line 511
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lez v0, :L4
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    if-eqz v0, :L4
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->values:[Ljava/lang/String;
    return-object p1
  :L4
  .line 512
    iget v0, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    if-lez v0, :L7
  .line 513
    iget p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    new-array v0, p1, [Ljava/lang/String;
  .line 514
    nop
  :L5
    if-ge v1, p1, :L6
    invoke-static { v1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    add-int/lit8 v1, v1, 1
    goto :L5
  :L6
  .line 515
    return-object v0
  :L7
  .line 517
    new-array p1, v1, [Ljava/lang/String;
    return-object p1
.end method

.method private visible(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
  .registers 3
  .line 286
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
  .line 1331
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 1332
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 1333
    add-int/2addr v0, v1
  .line 1334
    const/4 v1, 4
    if-le v0, v1, :L1
    const/4 v0, 4
  :L1
  .line 1335
    return v0
.end method

.method public antiClockwise()V
  .registers 3
  .line 782
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, -1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 783
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->moveCat(I)V
    return-void
  :L1
  .line 784
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 785
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 786
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 787
    return-void
.end method

.method bindCat(Lcom/innioasis/y1/activity/IppActivity$CatHolder;I)V
  .registers 7
  .line 584
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->label:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    aget v2, v2, p2
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$Item;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 585
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->catSel:I
    const/4 v1, 1
    const/4 v2, 0
    if-ne p2, v0, :L0
    const/4 p2, 1
    goto :L1
  :L0
    const/4 p2, 0
  :L1
  .line 586
    if-eqz p2, :L3
  .line 587
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p2
    if-nez p2, :L2
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->itemView:Landroid/view/View;
    const v3, 2131231050
    invoke-virtual { p2, v0, v3, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L2
  .line 588
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->arrow:Landroid/widget/ImageView;
    const v3, 2131623981
    invoke-virtual { p2, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 589
    iget-object p2, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->arrow:Landroid/widget/ImageView;
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 590
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->label:Landroid/widget/TextView;
  .line 591
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 590
    invoke-virtual { p2, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L5
  :L3
  .line 593
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p2
    if-nez p2, :L4
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->itemView:Landroid/view/View;
    const v1, 2131231044
    invoke-virtual { p2, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 594
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->label:Landroid/widget/TextView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v3, 2131100267
    invoke-virtual { v1, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual { p2, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 595
    iget-object p2, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->arrow:Landroid/widget/ImageView;
    const/4 v0, 4
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L5
  .line 597
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->itemView:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 598
    return-void
.end method

.method bindRow(Lcom/innioasis/y1/activity/IppActivity$RowHolder;I)V
  .registers 11
  .line 665
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->shown:[I
    aget p2, v0, p2
  .line 666
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 667
    iput p2, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->item:I
  .line 668
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getTextSize()F
    move-result v1
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v3
    iget v3, v3, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float v2, v2, v3
    cmpl-float v1, v1, v2
    if-eqz v1, :L0
  .line 669
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 670
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setTextSize(F)V
  :L0
  .line 672
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->line:Landroid/widget/LinearLayout;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowPx:I
    const/4 v3, 4
    if-lez v2, :L1
    goto :L2
  :L1
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v2
    mul-int/lit8 v2, v2, 2
    add-int/2addr v2, v3
  :L2
    invoke-static { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->setHeight(Landroid/view/View;I)Z
  .line 673
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 674
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz v2, :L3
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->editIndex:I
    if-ne p2, v2, :L3
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
    iget v4, p0, Lcom/innioasis/y1/activity/IppActivity;->editVal:I
    aget v2, v2, v4
    invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v2
    goto :L4
  :L3
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->valueText(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/CharSequence;
    move-result-object v2
  :L4
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 675
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 676
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->mark:Landroid/widget/TextView;
    iget-object v4, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
    const/16 v5, 8
    if-eqz v4, :L5
    const/4 v4, 0
    goto :L6
  :L5
    const/16 v4, 8
  :L6
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 678
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ne p2, v1, :L7
    const/4 p2, 1
    goto :L8
  :L7
    const/4 p2, 0
  :L8
  .line 679
    if-eqz p2, :L9
    sget v1, Lcom/innioasis/y1/activity/IppActivity;->ACCENT:I
    goto :L10
  :L9
    const/4 v1, -1
  :L10
  .line 680
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v4
    if-nez v4, :L13
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->line:Landroid/widget/LinearLayout;
    if-eqz p2, :L11
    const v7, 2131231052
    goto :L12
  :L11
    const/4 v7, 0
  :L12
    invoke-virtual { v4, v6, v7, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L13
  .line 681
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
    invoke-virtual { v4, v6, v1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 682
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
    invoke-virtual { v4, v6, v1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 683
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->mark:Landroid/widget/TextView;
    invoke-virtual { v4, v6, v1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 685
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v4, 5
    if-eq v1, v4, :L15
    iget v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v1, 3
    if-ne v0, v1, :L14
    goto :L15
  :L14
  .line 689
    iget-object p2, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->arrow:Landroid/widget/ImageView;
    invoke-virtual { p2, v5 }, Landroid/widget/ImageView;->setVisibility(I)V
    goto :L18
  :L15
  .line 686
    if-eqz p2, :L16
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->arrow:Landroid/widget/ImageView;
    const v4, 2131623981
    invoke-virtual { v0, v1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  :L16
  .line 687
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->arrow:Landroid/widget/ImageView;
    if-eqz p2, :L17
    const/4 v3, 0
  :L17
    invoke-virtual { v0, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L18
  .line 691
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->itemView:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 692
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 830
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 831
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->editValue()Landroid/widget/TextView;
    move-result-object v0
  .line 832
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L1
    const/4 v1, 4
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L3
  .line 833
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->blink:Lcom/innioasis/y1/activity/IppActivity$Blink;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 834
    return-void
.end method

.method cacheFinished(I)V
  .registers 3
  .line 1036
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheDone;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 1037
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 773
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->spin(I)V
    return-void
  :L0
  .line 774
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->moveCat(I)V
    return-void
  :L1
  .line 775
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 776
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->step(II)I
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
  .line 777
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->move(I)V
  .line 778
    return-void
.end method

.method public confirm()V
  .registers 5
  .line 919
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    const/4 v1, 1
    if-eqz v0, :L0
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 920
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->openGroup()V
    return-void
  :L1
  .line 921
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->clampSel()V
  .line 922
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 923
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-ne v2, v1, :L5
  .line 925
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->toggleOn(Lcom/innioasis/y1/activity/IppActivity$Item;)Z
    move-result v3
    xor-int/2addr v1, v3
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 927
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
  .line 929
    const-string v1, "genre_split"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L3
  .line 931
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/Feat;->rival(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 932
    if-eqz v1, :L4
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L4
    const/4 v0, 0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L4
  .line 933
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 934
    goto/16 :L15
  :L5
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 4
    if-ne v2, v3, :L6
  .line 935
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startEdit(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto/16 :L15
  :L6
  .line 936
    iget v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v3, 2
    if-ne v2, v3, :L8
  .line 937
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    add-int/2addr v2, v1
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
    rem-int/2addr v2, v1
  .line 938
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 939
    const-string v1, "bar_text"
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->apply(Ljava/lang/Object;)V
  :L7
  .line 940
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->render()V
  .line 941
    goto/16 :L15
  :L8
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 5
    if-ne v1, v2, :L9
  .line 942
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->openSub(I)V
    goto/16 :L15
  :L9
  .line 943
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v2, 3
    if-ne v1, v2, :L15
  .line 944
    const-string v1, "bar_icons"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L10
  .line 945
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->pickIcons(Lcom/innioasis/y1/activity/IppActivity$Item;)V
    goto :L15
  :L10
  .line 946
    const-string v1, "scan"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L11
  .line 947
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmScan(Ljava/lang/String;)V
    goto :L15
  :L11
  .line 948
    const-string v1, "cache"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L12
  .line 949
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmCache()V
    goto :L15
  :L12
  .line 950
    const-string v1, "backup"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L13
  .line 952
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Backup;->open(Landroid/app/Activity;Ljava/lang/String;)V
    goto :L15
  :L13
  .line 953
    const-string v1, "m3u_import"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L14
  .line 954
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->startActivity(Landroid/content/Intent;)V
    goto :L15
  :L14
  .line 955
    const-string v1, "log"
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L15
  .line 956
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->confirmLog(Ljava/lang/String;)V
  :L15
  .line 959
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1767
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L3
  .line 1769
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz p1, :L0
    const/4 p1, 0
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
    return-void
  :L0
  .line 1770
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ltz p1, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$Item;
    iget p1, p1, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v0, 5
    if-ne p1, v0, :L1
  .line 1771
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    aget p1, p1, v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 1772
    return-void
  :L1
  .line 1774
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-ltz p1, :L2
    const/4 p1, -1
    invoke-direct { p0, p1, p1 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
    return-void
  :L2
  .line 1775
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  :L3
  .line 1777
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 87
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 315
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 11
  .line 320
    const v0, 2131821015
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 322
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 323
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 325
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->buildItems()Ljava/util/List;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
  .line 326
    sput-object v1, Lcom/innioasis/y1/activity/IppActivity;->lastItems:Ljava/util/List;
  .line 327
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 328
    new-array v2, v1, [I
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
  .line 330
    nop
  .line 331
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    if-ge v3, v1, :L2
  .line 332
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v5, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/activity/IppActivity$Item;
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v5, :L1
    add-int/lit8 v4, v4, 1
  :L1
  .line 331
    add-int/lit8 v3, v3, 1
    goto :L0
  :L2
  .line 334
    new-array v3, v4, [I
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
  .line 335
    nop
  .line 336
    nop
  .line 337
    const/4 v3, -1
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, -1
  :L3
    if-ge v4, v1, :L5
  .line 338
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v7, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/activity/IppActivity$Item;
    iget v7, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-nez v7, :L4
  .line 339
    nop
  .line 340
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppActivity;->cats:[I
    add-int/lit8 v7, v5, 1
    aput v4, v6, v5
    move v6, v4
    move v5, v7
  :L4
  .line 342
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aput v6, v7, v4
  .line 337
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 345
    const/4 v4, 0
  :L6
    if-ge v4, v1, :L11
  .line 346
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v5, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 347
    iget v6, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v6, :L10
    iget-object v6, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
    if-nez v6, :L7
    goto :L10
  :L7
  .line 348
    const/4 v6, 0
  :L8
    if-ge v6, v1, :L10
  .line 349
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    invoke-interface { v7, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 350
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    const/4 v9, 5
    if-ne v8, v9, :L9
    iget-object v8, v5, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
    iget-object v7, v7, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-virtual { v8, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L9
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->groupOf:[I
    aput v6, v7, v4
  :L9
  .line 348
    add-int/lit8 v6, v6, 1
    goto :L8
  :L10
  .line 345
    add-int/lit8 v4, v4, 1
    goto :L6
  :L11
  .line 356
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 357
    const v2, 2131362308
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->newList(I)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
  .line 358
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->catLm:Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 359
    new-instance v2, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->catAdapter:Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
  .line 360
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v4, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 361
    const v2, 2131362310
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->newList(I)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
  .line 362
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowLm:Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 363
    new-instance v2, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowAdapter:Lcom/innioasis/y1/activity/IppActivity$RowAdapter;
  .line 364
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v4, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 365
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    const/16 v4, 8
    invoke-virtual { v2, v4 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 366
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->catList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1, v2, v3, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V
  .line 367
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity;->rowList:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1, v2, v3, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V
  .line 368
    invoke-virtual { v0, v1, v3, v3 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 369
    invoke-direct { p0, v3, v3 }, Lcom/innioasis/y1/activity/IppActivity;->show(II)V
  .line 370
    return-void
.end method

.method public longConfirm()V
  .registers 5
  .line 1782
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity;->editing:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1783
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity;->group:I
    if-gez v0, :L1
    return-void
  :L1
  .line 1784
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    if-eqz v0, :L6
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    if-ltz v1, :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v1, v0, :L2
    goto :L6
  :L2
  .line 1785
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->items:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity;->sel:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity$Item;
  .line 1786
    iget v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
    if-eqz v1, :L5
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    if-nez v1, :L3
    goto :L5
  :L3
  .line 1787
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Help;->blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 1788
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 1789
    new-instance v2, Lcom/innioasis/ipp/HelpDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v3
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->label(Lcom/innioasis/y1/activity/IppActivity$Item;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { v2, v3, v0, v1 }, Lcom/innioasis/ipp/HelpDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    invoke-virtual { v2 }, Lcom/innioasis/ipp/HelpDialog;->show()V
  .line 1790
    return-void
  :L5
  .line 1786
    return-void
  :L6
  .line 1784
    return-void
.end method

.method newCat(Landroid/view/ViewGroup;)Lcom/innioasis/y1/activity/IppActivity$CatHolder;
  .registers 5
  .line 573
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    const v1, 2131558521
    const/4 v2, 0
    invoke-virtual { v0, v1, p1, v2 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object p1
  .line 574
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$CatHolder;
    const v1, 2131362491
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/TextView;
  .line 575
    const v2, 2131362144
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/ImageView;
    invoke-direct { v0, p1, v1, v2 }, Lcom/innioasis/y1/activity/IppActivity$CatHolder;-><init>(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/ImageView;)V
  .line 576
    iget-object p1, v0, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->arrow:Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 577
    const/4 v1, 5
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  .line 578
    invoke-virtual { p1, v1 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V
  .line 579
    return-object v0
.end method

.method newRow()Lcom/innioasis/y1/activity/IppActivity$RowHolder;
  .registers 12
  .line 606
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 607
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 608
    invoke-virtual { v2, v0 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 609
    const/16 v1, 16
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 610
    const/16 v3, 10
    const/4 v4, 5
    invoke-virtual { v2, v3, v0, v4, v0 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 614
    new-instance v3, Landroid/widget/TextView;
    invoke-direct { v3, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 615
    const v5, 2131362491
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setId(I)V
  .line 616
    const/high16 v5, 0x41500000
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 617
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 618
    invoke-virtual { v3, v0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 619
    const/16 v5, 17
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 620
    const-string v5, "\u21b4"
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 621
    const/high16 v5, 0x43340000
    invoke-virtual { v3, v5 }, Landroid/widget/TextView;->setRotation(F)V
  .line 622
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -2
    const/4 v7, -1
    invoke-direct { v5, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 623
    const/4 v8, 3
    iput v8, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 624
    invoke-virtual { v2, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 627
    new-instance v5, Landroid/widget/TextView;
    invoke-direct { v5, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 628
    const v8, 2131362459
    invoke-virtual { v5, v8 }, Landroid/widget/TextView;->setId(I)V
  .line 629
    iget v8, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    invoke-virtual { v5, v8 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 630
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v9, 1
    invoke-virtual { v5, v8, v9 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 631
    invoke-virtual { v5, v0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 632
    invoke-virtual { v5, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 633
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v0, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 634
    const/high16 v10, 0x3F800000
    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 635
    invoke-virtual { v2, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 637
    new-instance v8, Landroid/widget/TextView;
    invoke-direct { v8, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 638
    const v10, 2131362437
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setId(I)V
  .line 639
    iget v10, p0, Lcom/innioasis/y1/activity/IppActivity;->textSp:F
    invoke-virtual { v8, v10 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 640
    sget-object v10, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v8, v10, v9 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 641
    invoke-virtual { v8, v0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 642
    invoke-virtual { v8, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 643
    const/4 v1, 6
    invoke-virtual { v8, v1, v0, v1, v0 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 644
    invoke-virtual { v2, v8, v6, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 647
    new-instance v10, Landroid/widget/ImageView;
    invoke-direct { v10, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 648
    const v0, 2131361881
    invoke-virtual { v10, v0 }, Landroid/widget/ImageView;->setId(I)V
  .line 649
    invoke-virtual { v10, v9 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 650
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v0, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 651
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->getPaddingRight()I
    move-result v1
    sub-int/2addr v4, v1
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 652
    invoke-virtual { v2, v10, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 654
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 655
    invoke-virtual { v1, v9 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 657
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual { v5 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v4
    mul-int/lit8 v4, v4, 2
    add-int/lit8 v4, v4, 4
    invoke-direct { v0, v7, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 658
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity;->hair()Landroid/view/View;
    move-result-object v0
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v7, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 659
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    invoke-direct { v0, v7, v6 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 660
    new-instance v7, Lcom/innioasis/y1/activity/IppActivity$RowHolder;
    move-object v0, v7
    move-object v4, v5
    move-object v5, v8
    move-object v6, v10
    invoke-direct/range { v0 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$RowHolder;-><init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V
    return-object v7
.end method

.method public quit()V
  .registers 2
  .line 1813
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->endEdit(Z)V
  .line 1814
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->finish()V
  .line 1815
    return-void
.end method

.method runCacheLibrary(I)V
  .catchall { :L1 .. :L2 } :L3
  .registers 10
  .line 1024
    if-nez p1, :L0
    return-void
  :L0
  .line 1026
    const/4 v0, 0
  :L1
    new-instance v7, Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const v3, 2131821074
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v3, "\n0%"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    const v5, 2131886360
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$Noop;
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppActivity$Noop;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 1028
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L2
  .line 1031
    goto :L4
  :L3
  .line 1029
    move-exception v1
  .line 1030
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L4
  .line 1032
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 1033
    return-void
.end method

.method runFullRescan()V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 1001
    const/4 v0, 0
  :L0
    new-instance v7, Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const v3, 2131821050
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v3, "\n0%"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    const v5, 2131886360
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$Noop;
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppActivity$Noop;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    move-object v1, v7
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 1003
    invoke-virtual { v7 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 1006
    goto :L3
  :L2
  .line 1004
    move-exception v1
  .line 1005
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity;->progress:Lcom/innioasis/y1/utils/LoadingDialog;
  :L3
  .line 1007
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppActivity$RescanTask;-><init>(Lcom/innioasis/y1/activity/IppActivity;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 1008
    return-void
.end method

.method scanFinished(I)V
  .registers 3
  .line 1016
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Done;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppActivity;I)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 1017
    return-void
.end method

.method scanTick(Ljava/lang/String;)V
  .registers 3
  .line 1012
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Tick;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 1013
    return-void
.end method
