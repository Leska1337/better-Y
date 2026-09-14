.class final Lcom/innioasis/y1/activity/IppActivity$Retheme;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Retheme"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 487
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public run()V
  .registers 2
  .line 490
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$000(Lcom/innioasis/y1/activity/IppActivity;)Ljava/util/List;
    move-result-object v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$100(Lcom/innioasis/y1/activity/IppActivity;)V
  :L0
  .line 491
    return-void
.end method
