.class final Lcom/innioasis/ipp/Genres$SongCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "SongCmp"
.end annotation

.field private final code:I

.method constructor <init>(I)V
  .registers 2
  .line 1051
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/innioasis/ipp/Genres$SongCmp;->code:I
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 1053
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 1054
    check-cast p2, Lcom/innioasis/y1/database/Song;
  .line 1055
    iget v0, p0, Lcom/innioasis/ipp/Genres$SongCmp;->code:I
    const/4 v1, 4
    if-ne v0, v1, :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v0
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p1
    invoke-static { v0, v1, p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1100(JJ)I
    move-result p1
    return p1
  :L0
  .line 1056
    const/4 v1, 5
    if-ne v0, v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v0
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p1
    invoke-static { v0, v1, p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1100(JJ)I
    move-result p1
    neg-int p1, p1
    return p1
  :L1
  .line 1057
    if-nez v0, :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
  :L2
  .line 1058
    const/4 v1, 1
    if-ne v0, v1, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    neg-int p1, p1
    return p1
  :L3
  .line 1059
    const/4 v1, 7
    if-ne v0, v1, :L4
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
  :L4
  .line 1060
    const/4 v1, 3
    if-ne v0, v1, :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    neg-int p1, p1
    return p1
  :L5
  .line 1061
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$1200(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
.end method
