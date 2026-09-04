.class final Lcom/innioasis/ipp/GenreSplit$RowCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "GenreSplit.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreSplit;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RowCmp"
.end annotation

.field private final asc:Z

.field private final byName:Z

.field private final field:I

.method constructor <init>(IZZ)V
  .registers 4
  .line 271
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 272
    iput p1, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->field:I
  .line 273
    iput-boolean p2, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->byName:Z
  .line 274
    iput-boolean p3, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->asc:Z
  .line 275
    return-void
.end method

.method private key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 3
  .line 292
    iget v0, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->field:I
    if-nez v0, :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinArtist()Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object p1
  :L1
    return-object p1
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 6
  .line 278
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 279
    check-cast p2, Lcom/innioasis/y1/database/Song;
  .line 281
    iget-boolean v0, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->byName:Z
    if-eqz v0, :L0
  .line 282
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/GenreSplit$RowCmp;->key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/GenreSplit$RowCmp;->key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/GenreSplit;->access$100(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    goto :L3
  :L0
  .line 284
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v0
  .line 285
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p1
  .line 286
    cmp-long v2, v0, p1
    if-gez v2, :L1
    const/4 p1, -1
    goto :L3
  :L1
    cmp-long v2, v0, p1
    if-lez v2, :L2
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
  .line 288
    iget-boolean p2, p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;->asc:Z
    if-eqz p2, :L4
    goto :L5
  :L4
    neg-int p1, p1
  :L5
    return p1
.end method
