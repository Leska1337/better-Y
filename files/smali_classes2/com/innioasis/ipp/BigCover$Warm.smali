.class final Lcom/innioasis/ipp/BigCover$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "BigCover.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BigCover;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Warm"
.end annotation

.field private final path:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;)V
  .registers 2
  .line 228
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Warm;->path:Ljava/lang/String;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 231
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Warm;->path:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L1
  .line 234
    goto :L3
  :L2
  .line 232
    move-exception v0
  :L3
  .line 235
    return-void
.end method
