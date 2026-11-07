.class final Lcom/innioasis/ipp/Saver$Dump;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Dump"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 199
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 202
    nop
  :L0
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$700()[J
    move-result-object v0
  :L1
  .line 210
    goto :L4
  :L2
  .line 205
    move-exception v0
  .line 206
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$800()Z
    move-result v1
    if-nez v1, :L3
  .line 207
    const/4 v1, 1
    invoke-static { v1 }, Lcom/innioasis/ipp/Saver;->access$802(Z)Z
  .line 208
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "saver: power dump failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L3
  .line 211
    const/4 v0, 0
  :L4
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/ipp/Saver$Decide;
    invoke-direct { v2, v0 }, Lcom/innioasis/ipp/Saver$Decide;-><init>([J)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 212
    return-void
.end method
