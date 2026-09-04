.class final Lcom/innioasis/ipp/Artists$SongCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Artists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Artists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "SongCmp"
.end annotation

.field private final type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;

.method constructor <init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 2
  .line 525
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 527
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 528
    check-cast p2, Lcom/innioasis/y1/database/Song;
  .line 529
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v0
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p1
    invoke-static { v0, v1, p1, p2 }, Lcom/innioasis/ipp/Artists;->access$100(JJ)I
    move-result p1
    return p1
  :L0
  .line 530
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v0
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p1
    invoke-static { v0, v1, p1, p2 }, Lcom/innioasis/ipp/Artists;->access$100(JJ)I
    move-result p1
    neg-int p1, p1
    return p1
  :L1
  .line 531
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->access$200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
  :L2
  .line 532
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->access$200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    neg-int p1, p1
    return p1
  :L3
  .line 533
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L4
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->access$200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
  :L4
  .line 534
    iget-object v0, p0, Lcom/innioasis/ipp/Artists$SongCmp;->type:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne v0, v1, :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->access$200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    neg-int p1, p1
    return p1
  :L5
  .line 536
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->access$200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
.end method
