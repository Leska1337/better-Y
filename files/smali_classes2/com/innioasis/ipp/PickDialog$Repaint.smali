.class final Lcom/innioasis/ipp/PickDialog$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PickDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.field private final d:Lcom/innioasis/ipp/PickDialog;

.method constructor <init>(Lcom/innioasis/ipp/PickDialog;)V
  .registers 2
  .line 185
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 188
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$000(Lcom/innioasis/ipp/PickDialog;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 189
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/PickDialog;->access$002(Lcom/innioasis/ipp/PickDialog;Z)Z
  .line 191
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->access$100(Lcom/innioasis/ipp/PickDialog;)V
  :L2
  .line 193
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/PickDialog;->access$002(Lcom/innioasis/ipp/PickDialog;Z)Z
  .line 194
    nop
  .line 195
    return-void
  :L3
  .line 193
    move-exception v1
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog$Repaint;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/PickDialog;->access$002(Lcom/innioasis/ipp/PickDialog;Z)Z
  .line 194
    throw v1
  :L4
  .line 188
    return-void
.end method
