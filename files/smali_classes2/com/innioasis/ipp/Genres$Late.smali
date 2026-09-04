.class final Lcom/innioasis/ipp/Genres$Late;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Late"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.method constructor <init>(Lcom/innioasis/music/GenresActivity;)V
  .registers 2
  .line 1009
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$Late;->a:Lcom/innioasis/music/GenresActivity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  :L0
  .line 1013
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Late;->a:Lcom/innioasis/music/GenresActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->access$600(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 1014
    if-eqz v0, :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->access$700(Ljava/lang/Object;)I
    move-result v1
    const/4 v2, 2
    if-eq v1, v2, :L1
    goto :L3
  :L1
  .line 1015
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
  .line 1016
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
  .line 1017
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 1020
    const/4 v2, 1
    if-gt v1, v2, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Late;->a:Lcom/innioasis/music/GenresActivity;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Genres;->access$900(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  :L2
  .line 1023
    goto :L5
  :L3
  .line 1014
    return-void
  :L4
  .line 1021
    move-exception v0
  :L5
  .line 1024
    return-void
.end method
