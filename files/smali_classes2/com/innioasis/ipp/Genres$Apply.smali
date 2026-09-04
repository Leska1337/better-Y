.class final Lcom/innioasis/ipp/Genres$Apply;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Apply"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.field private final ad:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final list:Ljava/util/List;

.method constructor <init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/List;)V
  .registers 4
  .line 877
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$Apply;->a:Lcom/innioasis/music/GenresActivity;
    iput-object p2, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iput-object p3, p0, Lcom/innioasis/ipp/Genres$Apply;->list:Ljava/util/List;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  :L0
  .line 881
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->a:Lcom/innioasis/music/GenresActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->access$600(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 882
    invoke-static { v1 }, Lcom/innioasis/ipp/Genres;->access$700(Ljava/lang/Object;)I
    move-result v0
    const/4 v1, 3
    if-ne v0, v1, :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->a:Lcom/innioasis/music/GenresActivity;
    iget-object v2, p0, Lcom/innioasis/ipp/Genres$Apply;->list:Ljava/util/List;
    invoke-virtual { v0, v2 }, Lcom/innioasis/music/GenresActivity;->setSongList(Ljava/util/List;)V
  :L2
  .line 883
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iget-object v2, p0, Lcom/innioasis/ipp/Genres$Apply;->list:Ljava/util/List;
    invoke-virtual { v0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setItems(Ljava/util/List;)V
  .line 886
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->access$700(Ljava/lang/Object;)I
    move-result v0
    if-ne v0, v1, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Apply;->list:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/ipp/Genres$Apply;->a:Lcom/innioasis/music/GenresActivity;
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->access$800(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Disc;->preset(Ljava/lang/Object;Ljava/util/List;Landroid/widget/ListView;)V
  :L3
  .line 887
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Apply;->a:Lcom/innioasis/music/GenresActivity;
    iget-object v1, p0, Lcom/innioasis/ipp/Genres$Apply;->ad:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Genres;->access$900(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  :L4
  .line 890
    goto :L6
  :L5
  .line 888
    move-exception v0
  :L6
  .line 891
    return-void
.end method
