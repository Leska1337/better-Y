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

.field private final out:[Ljava/lang/String;

.field private final paths:Ljava/util/List;

.method constructor <init>(Ljava/util/List;[Ljava/lang/String;)V
  .registers 3
  .line 259
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 260
    iput-object p1, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->paths:Ljava/util/List;
  .line 261
    iput-object p2, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->out:[Ljava/lang/String;
  .line 262
    return-void
.end method

.method private declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 265
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
  .line 265
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 270
    nop
  :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/AlbumArtists$Reader;->take()I
    move-result v0
    if-ltz v0, :L5
  .line 271
    const-string v1, ""
  :L1
  .line 273
    iget-object v2, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->paths:Ljava/util/List;
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    const/4 v3, 0
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v2
    iget-object v2, v2, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 274
    if-eqz v2, :L2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
  :L2
  .line 277
    goto :L4
  :L3
  .line 275
    move-exception v2
  :L4
  .line 278
    iget-object v2, p0, Lcom/innioasis/ipp/AlbumArtists$Reader;->out:[Ljava/lang/String;
    aput-object v1, v2, v0
  .line 279
    goto :L0
  :L5
  .line 280
    return-void
.end method
