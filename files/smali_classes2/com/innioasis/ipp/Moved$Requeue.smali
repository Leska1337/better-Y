.class final Lcom/innioasis/ipp/Moved$Requeue;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Moved.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Moved;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Requeue"
.end annotation

.field private final moves:Ljava/util/HashMap;

.method constructor <init>(Ljava/util/HashMap;)V
  .registers 2
  .line 189
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Moved$Requeue;->moves:Ljava/util/HashMap;
    return-void
.end method

.method private fix(Ljava/util/List;)V
  .registers 6
  .line 204
    if-nez p1, :L0
    return-void
  :L0
  .line 205
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L6
  .line 206
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 207
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L5
  :L2
  .line 208
    check-cast v1, Lcom/innioasis/y1/database/Song;
  .line 209
    iget-object v2, p0, Lcom/innioasis/ipp/Moved$Requeue;->moves:Ljava/util/HashMap;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/Moved$Row;
  .line 210
    if-nez v2, :L3
    goto :L5
  :L3
  .line 211
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 212
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->id:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Song;->setSongId(Ljava/lang/String;)V
  .line 213
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->name:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Song;->setName(Ljava/lang/String;)V
  .line 214
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->lower:Ljava/lang/String;
    if-eqz v3, :L4
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->lower:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Song;->setLowerName(Ljava/lang/String;)V
  :L4
  .line 215
    iget-object v3, v2, Lcom/innioasis/ipp/Moved$Row;->pinyin:Ljava/lang/String;
    if-eqz v3, :L5
    iget-object v2, v2, Lcom/innioasis/ipp/Moved$Row;->pinyin:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinName(Ljava/lang/String;)V
  :L5
  .line 205
    add-int/lit8 v0, v0, 1
    goto :L1
  :L6
  .line 217
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 193
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 194
    if-eqz v0, :L1
  .line 195
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Moved$Requeue;->fix(Ljava/util/List;)V
  .line 196
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Moved$Requeue;->fix(Ljava/util/List;)V
  :L1
  .line 198
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualSongs()Ljava/util/List;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Moved$Requeue;->fix(Ljava/util/List;)V
  :L2
  .line 200
    goto :L4
  :L3
  .line 199
    move-exception v0
  :L4
  .line 201
    return-void
.end method
