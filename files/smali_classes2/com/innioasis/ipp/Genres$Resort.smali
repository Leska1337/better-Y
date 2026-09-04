.class final Lcom/innioasis/ipp/Genres$Resort;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Resort"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.field private final ad:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final albums:Z

.method constructor <init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
  .registers 4
  .line 853
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$Resort;->a:Lcom/innioasis/music/GenresActivity;
    iput-object p2, p0, Lcom/innioasis/ipp/Genres$Resort;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iput-boolean p3, p0, Lcom/innioasis/ipp/Genres$Resort;->albums:Z
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  :L0
  .line 857
    new-instance v0, Ljava/util/ArrayList;
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Resort;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 858
    nop
  .line 859
    iget-boolean v1, p0, Lcom/innioasis/ipp/Genres$Resort;->albums:Z
    if-eqz v1, :L1
  .line 860
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
    goto :L2
  :L1
  .line 862
    invoke-static { }, Lcom/innioasis/ipp/Genres;->access$400()I
    move-result v1
  .line 863
    const/4 v2, -1
    if-eq v1, v2, :L2
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Genres;->access$500(Ljava/util/List;I)Ljava/util/List;
    move-result-object v0
  :L2
  .line 865
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Resort;->a:Lcom/innioasis/music/GenresActivity;
    new-instance v2, Lcom/innioasis/ipp/Genres$Apply;
    iget-object v3, p0, Lcom/innioasis/ipp/Genres$Resort;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v2, v1, v3, v0 }, Lcom/innioasis/ipp/Genres$Apply;-><init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/List;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/GenresActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L3
  .line 868
    goto :L5
  :L4
  .line 866
    move-exception v0
  :L5
  .line 869
    return-void
.end method
