.class final Lcom/innioasis/ipp/Thumbs$Clear;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Thumbs.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Thumbs;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Clear"
.end annotation

.field private final c:Landroid/content/Context;

.method constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 159
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 160
    iput-object p1, p0, Lcom/innioasis/ipp/Thumbs$Clear;->c:Landroid/content/Context;
  .line 161
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 165
    iget-object v0, p0, Lcom/innioasis/ipp/Thumbs$Clear;->c:Landroid/content/Context;
    invoke-static { v0 }, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/bumptech/glide/Glide;->clearMemory()V
  :L1
  .line 167
    goto :L3
  :L2
  .line 166
    move-exception v0
  :L3
  .line 168
    return-void
.end method
