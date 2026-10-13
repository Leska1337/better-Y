.class final Lcom/innioasis/ipp/GenreInfo$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "GenreInfo.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreInfo;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Warm"
.end annotation

.field private final adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final todo:Ljava/util/ArrayList;

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/ArrayList;)V
  .registers 3
  .line 167
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 168
    iput-object p1, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 169
    iput-object p2, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
  .line 170
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L20 } :L22
  .registers 16
  .line 174
    const-string v0, " "
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 175
    sget-object v3, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v3 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
  .line 176
    if-eqz v2, :L21
    if-nez v3, :L1
    goto/16 :L21
  :L1
  .line 177
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 178
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v6
  .line 179
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->access$100()Ljava/util/HashMap;
    move-result-object v7
  .line 180
    const/4 v8, 0
  :L2
    iget-object v9, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v8, v9, :L19
  .line 181
    iget-object v9, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
    invoke-virtual { v9, v8 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/music/data/Genre;
  .line 182
    invoke-virtual { v9 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v10
  .line 183
    if-eqz v6, :L3
    invoke-static { v10 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v11
    goto :L4
  :L3
    move-object v11, v10
  :L4
  .line 184
    invoke-virtual { v7, v11 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/ipp/GenreInfo$Bucket;
  .line 185
    nop
  .line 186
    nop
  .line 187
    const/4 v13, 1
    if-eqz v12, :L11
  .line 188
    if-eqz v6, :L5
    invoke-virtual { v11 }, Ljava/lang/String;->length()I
    move-result v11
    if-lez v11, :L5
    iget-boolean v11, v12, Lcom/innioasis/ipp/GenreInfo$Bucket;->composite:Z
    if-eqz v11, :L5
    const/4 v11, 1
    goto :L6
  :L5
    const/4 v11, 0
  :L6
  .line 189
    if-eqz v11, :L7
    iget-object v11, v12, Lcom/innioasis/ipp/GenreInfo$Bucket;->artists:Ljava/util/HashSet;
    goto :L8
  :L7
    iget-object v11, v12, Lcom/innioasis/ipp/GenreInfo$Bucket;->exact:Ljava/util/HashMap;
    invoke-virtual { v11, v10 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Ljava/util/HashSet;
  :L8
  .line 190
    if-eqz v11, :L9
    new-instance v14, Ljava/util/ArrayList;
    invoke-direct { v14, v11 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v14 }, Lcom/innioasis/ipp/Artists;->listGenre(Ljava/util/List;)Ljava/util/List;
    move-result-object v11
    invoke-interface { v11 }, Ljava/util/List;->size()I
    move-result v11
    goto :L10
  :L9
    const/4 v11, 0
  :L10
  .line 192
    iget-object v12, v12, Lcom/innioasis/ipp/GenreInfo$Bucket;->albums:Ljava/util/HashSet;
    invoke-virtual { v12 }, Ljava/util/HashSet;->size()I
    move-result v12
    goto :L12
  :L11
  .line 187
    const/4 v11, 0
    const/4 v12, 0
  :L12
  .line 194
    if-gtz v11, :L13
    invoke-virtual { v3, v9 }, Lcom/innioasis/y1/database/Y1Repository;->getArtistsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v11
    invoke-interface { v11 }, Ljava/util/List;->size()I
    move-result v11
  :L13
  .line 195
    if-gtz v12, :L14
    invoke-virtual { v3, v9 }, Lcom/innioasis/y1/database/Y1Repository;->getAlbumsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v12
    invoke-interface { v12 }, Ljava/util/List;->size()I
    move-result v12
  :L14
  .line 197
    new-instance v14, Ljava/lang/StringBuilder;
    invoke-direct { v14 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v14, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v14
    invoke-virtual { v14, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v14
  .line 198
    if-le v11, v13, :L15
    const v11, 2131820733
    goto :L16
  :L15
    const v11, 2131820732
  :L16
    invoke-virtual { v2, v11 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v14, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
  .line 200
    if-le v12, v13, :L17
    const v12, 2131820731
    goto :L18
  :L17
    const v12, 2131820730
  :L18
    invoke-virtual { v2, v12 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v12
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v11
  .line 201
    invoke-virtual { v9, v11 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
  .line 202
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/GenreInfo;->access$200(Ljava/lang/String;Ljava/lang/String;)V
  .line 180
    add-int/lit8 v8, v8, 1
    goto/16 :L2
  :L19
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->access$300()V
  .line 205
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "genre counts, "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v3, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0, v4, v5 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 206
    invoke-static { v1 }, Lcom/innioasis/ipp/GenreInfo;->access$402(Z)Z
  .line 207
    instance-of v0, v2, Landroid/app/Activity;
    if-eqz v0, :L23
    check-cast v2, Landroid/app/Activity;
    new-instance v0, Lcom/innioasis/ipp/GenreInfo$Repaint;
    iget-object v3, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v0, v3 }, Lcom/innioasis/ipp/GenreInfo$Repaint;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
    invoke-virtual { v2, v0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L20
    goto :L23
  :L21
  .line 210
    invoke-static { v1 }, Lcom/innioasis/ipp/GenreInfo;->access$402(Z)Z
  .line 176
    return-void
  :L22
  .line 208
    move-exception v0
  :L23
  .line 210
    invoke-static { v1 }, Lcom/innioasis/ipp/GenreInfo;->access$402(Z)Z
  .line 211
    nop
  .line 212
    return-void
.end method
