.class final Lcom/innioasis/y1/activity/IppImportActivity$Back;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppImportActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Back"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppImportActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .registers 2
  .line 608
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$Back;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    return-void
.end method

.method public run()V
  .registers 2
  .line 610
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$Back;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$Back;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->backToList()V
  :L0
  .line 611
    return-void
.end method
