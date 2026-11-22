.class final Lcom/innioasis/ipp/AlbumArtists$Reader;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "AlbumArtists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumArtists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Reader"
.end annotation

.field private next:I

.field private final out:[Lcom/innioasis/ipp/Meta$Info;

.field private final paths:Ljava/util/List;

.method constructor <init>(Ljava/util/List;[Lcom/innioasis/ipp/Meta$Info;)V
  .registers 3
  .line 207
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 208
    iput-object p1, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->paths:Ljava/util/List;
  .line 209
    iput-object p2, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->out:[Lcom/innioasis/ipp/Meta$Info;
  .line 210
    return-void
.end method

.method private declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 213
    iget v0, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->next:I
    iget-object v1, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->paths:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
    iget v0, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->next:I
    add-int/lit8 v1, v0, 1
    iput v1, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->next:I
  :L1
    goto :L3
  :L2
    const/4 v0, -1
  :L3
    monitor-exit p0
    return v0
  :L4
  .line 213
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 218
    nop
  :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/AlbumArtists$Reader;->take()I
    move-result v0
    if-ltz v0, :L5
  :L1
  .line 220
    iget-object v1, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->out:[Lcom/innioasis/ipp/Meta$Info;
    iget-object v2, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->paths:Ljava/util/List;
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    const/4 v3, 0
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v2
    aput-object v2, v1, v0
  :L2
    goto :L4
  :L3
  .line 221
    move-exception v0
  :L4
  .line 222
    goto :L0
  :L5
  .line 224
    return-void
.end method
