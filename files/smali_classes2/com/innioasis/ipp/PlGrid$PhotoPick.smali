.class final Lcom/innioasis/ipp/PlGrid$PhotoPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "PhotoPick"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final path:Ljava/lang/String;

.field private final pls:Ljava/util/List;

.method constructor <init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/String;)V
  .registers 4
  .line 1517
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1518
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->a:Landroid/app/Activity;
  .line 1519
    iput-object p2, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->pls:Ljava/util/List;
  .line 1520
    iput-object p3, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->path:Ljava/lang/String;
  .line 1521
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 6
  .line 1524
    if-ltz p1, :L0
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->pls:Ljava/util/List;
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p2
    if-ge p1, p2, :L0
  .line 1525
    new-instance p2, Ljava/lang/Thread;
    new-instance v0, Lcom/innioasis/ipp/PlGrid$FromPhoto;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->a:Landroid/app/Activity;
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->pls:Ljava/util/List;
    invoke-interface { v2, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$PhotoPick;->path:Ljava/lang/String;
    invoke-direct { v0, v1, p1, v2 }, Lcom/innioasis/ipp/PlGrid$FromPhoto;-><init>(Landroid/app/Activity;Ljava/util/UUID;Ljava/lang/String;)V
    invoke-direct { p2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p2 }, Ljava/lang/Thread;->start()V
  :L0
  .line 1527
    const/4 p1, 1
    return p1
.end method
