.class final Lcom/innioasis/ipp/PlGrid$First;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "First"
.end annotation

.field private final id:Ljava/util/UUID;

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 355
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 356
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$First;->id:Ljava/util/UUID;
  .line 357
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$First;->rv:Ljava/lang/ref/WeakReference;
  .line 358
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L8 } :L9
  .registers 3
  :L0
  .line 362
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$First;->id:Ljava/util/UUID;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$000(Ljava/util/UUID;)Ljava/lang/String;
    move-result-object v0
  .line 363
    if-nez v0, :L1
    return-void
  :L1
  .line 364
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$100()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongBySongIdSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 365
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L3
  .line 366
    if-nez v0, :L6
  .line 367
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v0
  .line 368
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L4
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
    move-result v0
    if-eqz v0, :L5
  :L4
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$First;->id:Ljava/util/UUID;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$200(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->createNewFile()Z
  :L5
  .line 369
    return-void
  :L6
  .line 371
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$First;->id:Ljava/util/UUID;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/PlGrid;->write(Ljava/util/UUID;Landroid/graphics/Bitmap;)Z
    move-result v0
    if-nez v0, :L7
    return-void
  :L7
  .line 372
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$First;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 373
    if-eqz v0, :L8
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Repaint;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/PlGrid$Repaint;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  :L8
  .line 376
    goto :L10
  :L9
  .line 374
    move-exception v0
  :L10
  .line 377
    return-void
.end method
