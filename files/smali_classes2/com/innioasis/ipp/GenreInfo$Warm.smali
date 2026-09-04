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
  .line 101
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 102
    iput-object p1, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 103
    iput-object p2, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
  .line 104
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L9 } :L11
  .registers 10
  .line 108
    const-string v0, " "
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 109
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 110
    if-eqz v1, :L10
    if-nez v2, :L1
    goto/16 :L10
  :L1
  .line 111
    const/4 v3, 0
  :L2
    iget-object v4, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v4
    if-ge v3, v4, :L8
  .line 112
    iget-object v4, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->todo:Ljava/util/ArrayList;
    invoke-virtual { v4, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/music/data/Genre;
  .line 113
    invoke-virtual { v2, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getArtistsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v5
  .line 117
    invoke-static { v4 }, Lcom/innioasis/ipp/Genres;->albumCount(Lcom/innioasis/music/data/Genre;)I
    move-result v6
  .line 118
    if-gtz v6, :L3
    invoke-virtual { v2, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getAlbumsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v6
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v6
  :L3
  .line 120
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v7, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
  .line 121
    const/4 v8, 1
    if-le v5, v8, :L4
    const v5, 2131820733
    goto :L5
  :L4
    const v5, 2131820732
  :L5
    invoke-virtual { v1, v5 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v7, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
  .line 123
    if-le v6, v8, :L6
    const v6, 2131820731
    goto :L7
  :L6
    const v6, 2131820730
  :L7
    invoke-virtual { v1, v6 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
  .line 124
    invoke-virtual { v4, v5 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
  .line 125
    invoke-virtual { v4 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/GenreInfo;->put(Ljava/lang/String;Ljava/lang/String;)V
  .line 111
    add-int/lit8 v3, v3, 1
    goto :L2
  :L8
  .line 127
    instance-of v0, v1, Landroid/app/Activity;
    if-eqz v0, :L9
    check-cast v1, Landroid/app/Activity;
    new-instance v0, Lcom/innioasis/ipp/GenreInfo$Repaint;
    iget-object v2, p0, Lcom/innioasis/ipp/GenreInfo$Warm;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v0, v2 }, Lcom/innioasis/ipp/GenreInfo$Repaint;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
    invoke-virtual { v1, v0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L9
  .line 130
    goto :L12
  :L10
  .line 110
    return-void
  :L11
  .line 128
    move-exception v0
  :L12
  .line 131
    return-void
.end method
