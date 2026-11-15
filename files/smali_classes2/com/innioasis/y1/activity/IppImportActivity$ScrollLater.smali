.class final Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppImportActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ScrollLater"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppImportActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .registers 2
  .line 590
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    return-void
.end method

.method public run()V
  .registers 3
  .line 592
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->access$000(Lcom/innioasis/y1/activity/IppImportActivity;)Z
    move-result v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppImportActivity;->scrollToSel(Z)V
  :L0
  .line 593
    return-void
.end method
