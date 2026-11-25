.class final Lcom/innioasis/ipp/Theme$Covers;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Theme.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Theme;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Covers"
.end annotation

.field private final box:[I

.field private final todo:Ljava/util/List;

.method constructor <init>(Ljava/util/List;[I)V
  .registers 3
  .line 710
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 711
    iput-object p1, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
  .line 712
    iput-object p2, p0, Lcom/innioasis/ipp/Theme$Covers;->box:[I
  .line 713
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 8
  .line 715
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L5
  .line 716
    iget-object v2, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Ljava/lang/String;
  .line 718
    const/4 v3, 1
  :L1
    aget-object v4, v2, v3
    iget-object v5, p0, Lcom/innioasis/ipp/Theme$Covers;->box:[I
    aget v6, v5, v0
    aget v3, v5, v3
    invoke-static { v4, v6, v3 }, Lcom/innioasis/ipp/Thumbs;->read(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 719
    if-eqz v3, :L2
    invoke-static { }, Lcom/innioasis/ipp/Theme;->access$000()Ljava/util/Hashtable;
    move-result-object v4
    aget-object v2, v2, v0
    invoke-virtual { v4, v2, v3 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 721
    goto :L4
  :L3
  .line 720
    move-exception v2
  :L4
  .line 715
    add-int/lit8 v1, v1, 1
    goto :L0
  :L5
  .line 723
    return-void
.end method
