.class final Lcom/innioasis/ipp/Saved$Resolve;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saved.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saved;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Resolve"
.end annotation

.field private final ps:Lcom/innioasis/y1/service/PlayerService;

.method constructor <init>(Lcom/innioasis/y1/service/PlayerService;)V
  .registers 2
  .line 138
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Saved$Resolve;->ps:Lcom/innioasis/y1/service/PlayerService;
    return-void
.end method

.method private static swap(Ljava/util/List;Z)Lcom/innioasis/ipp/Saved$Swap;
  .registers 11
  .line 154
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 155
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 156
    new-array v2, v1, [Lcom/innioasis/y1/database/Song;
  .line 157
    new-array v3, v1, [Lcom/innioasis/y1/database/Song;
  .line 158
    nop
  .line 159
    if-eqz p1, :L1
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v4
    goto :L2
  :L1
    move-object v4, v0
  :L2
  .line 160
    const/4 v5, 0
    const/4 v6, 0
  :L3
    if-ge v5, v1, :L9
  .line 161
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 162
    invoke-static { v7 }, Lcom/innioasis/ipp/Saved;->access$000(Lcom/innioasis/y1/database/Song;)Z
    move-result v8
    if-nez v8, :L4
    goto :L8
  :L4
  .line 163
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    if-eqz p1, :L5
    invoke-virtual { v4, v8 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v8
    goto :L6
  :L5
    invoke-static { v8 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v8
  :L6
  .line 164
    if-nez v8, :L7
    goto :L8
  :L7
  .line 165
    aput-object v7, v2, v5
  .line 166
    aput-object v8, v3, v5
  .line 167
    add-int/lit8 v6, v6, 1
  :L8
  .line 160
    add-int/lit8 v5, v5, 1
    goto :L3
  :L9
  .line 169
    if-nez v6, :L10
    goto :L11
  :L10
    new-instance v0, Lcom/innioasis/ipp/Saved$Swap;
    invoke-direct { v0, p0, v2, v3 }, Lcom/innioasis/ipp/Saved$Swap;-><init>(Ljava/util/List;[Lcom/innioasis/y1/database/Song;[Lcom/innioasis/y1/database/Song;)V
  :L11
    return-object v0
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 142
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
  .line 143
    iget-object v0, p0, Lcom/innioasis/ipp/Saved$Resolve;->ps:Lcom/innioasis/y1/service/PlayerService;
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v0
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saved$Resolve;->swap(Ljava/util/List;Z)Lcom/innioasis/ipp/Saved$Swap;
    move-result-object v0
  .line 144
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Resolve;->ps:Lcom/innioasis/y1/service/PlayerService;
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v1
    const/4 v2, 1
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Saved$Resolve;->swap(Ljava/util/List;Z)Lcom/innioasis/ipp/Saved$Swap;
    move-result-object v1
  .line 145
    new-instance v2, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    invoke-direct { v2, v3 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
  .line 146
    if-eqz v0, :L1
    invoke-virtual { v2, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 147
    if-eqz v1, :L2
    invoke-virtual { v2, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L2
  .line 150
    goto :L4
  :L3
  .line 148
    move-exception v0
  .line 149
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "save_state stubs not resolved: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L4
  .line 151
    return-void
.end method
