.class final Lcom/innioasis/ipp/Rows$Kick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Rows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Rows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Kick"
.end annotation

.field private final tv:Landroid/widget/TextView;

.method constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 341
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 342
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Kick;->tv:Landroid/widget/TextView;
  .line 343
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 349
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Kick;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWidth()I
    move-result v0
    if-lez v0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Kick;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->isSelected()Z
    move-result v0
    if-nez v0, :L1
    goto :L3
  :L1
  .line 350
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Kick;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSelected(Z)V
  .line 351
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Kick;->tv:Landroid/widget/TextView;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSelected(Z)V
  :L2
  .line 354
    goto :L5
  :L3
  .line 349
    return-void
  :L4
  .line 352
    move-exception v0
  :L5
  .line 355
    return-void
.end method
