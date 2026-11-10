.class public final Lcom/innioasis/ipp/AlbumTags$Sum;
.super Ljava/lang/Object;
.source "AlbumTags.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumTags;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Sum"
.end annotation

.field public final albumArtist:Ljava/lang/String;

.field private artist:Ljava/lang/String;

.field public final rep:Ljava/lang/String;

.field final songs:Ljava/util/List;

.field public final unread:I

.field public final yearMax:I

.field public final yearMin:I

.method constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;III)V
  .registers 7
  .line 36
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 37
    iput-object p1, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->songs:Ljava/util/List;
  .line 38
    iput-object p2, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
  .line 39
    iput-object p3, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->albumArtist:Ljava/lang/String;
  .line 40
    iput p4, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
  .line 41
    iput p5, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMax:I
  .line 42
    iput p6, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->unread:I
  .line 43
    return-void
.end method

.method public anyRead()Z
  .registers 3
  .line 46
    iget v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->unread:I
    iget-object v1, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->songs:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public declared-synchronized artist()Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
    monitor-enter p0
  :L0
  .line 51
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->artist:Ljava/lang/String;
    if-nez v0, :L1
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->songs:Ljava/util/List;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/AlbumTags;->access$000(Ljava/util/List;Z)Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->artist:Ljava/lang/String;
  :L1
  .line 52
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->artist:Ljava/lang/String;
  :L2
    monitor-exit p0
    return-object v0
  :L3
  .line 50
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method public line()Ljava/lang/String;
  .registers 3
  .line 57
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->albumArtist:Ljava/lang/String;
  .line 58
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->artist()Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
.end method
