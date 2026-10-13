.class final Lcom/innioasis/ipp/Albums$Start;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Albums.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Albums;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Start"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final d:Lcom/innioasis/y1/utils/LoadingDialog;

.field private step:I

.method constructor <init>(Landroid/app/Activity;Lcom/innioasis/y1/utils/LoadingDialog;)V
  .registers 3
  .line 337
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Albums$Start;->a:Landroid/app/Activity;
    iput-object p2, p0, Lcom/innioasis/ipp/Albums$Start;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 341
    const/4 v0, 2
    const/4 v1, 1
  :L0
    iget v2, p0, Lcom/innioasis/ipp/Albums$Start;->step:I
    if-nez v2, :L3
  .line 342
    iput v1, p0, Lcom/innioasis/ipp/Albums$Start;->step:I
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$000()Ljava/util/List;
    move-result-object v2
    if-nez v2, :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Start;->a:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->isFinishing()Z
    move-result v2
    if-eqz v2, :L1
    goto :L2
  :L1
  .line 344
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Start;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  .line 345
    const-wide/16 v2, 0
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
    goto :L5
  :L2
  .line 343
    return-void
  :L3
  .line 346
    if-ne v2, v1, :L4
  .line 347
    iput v0, p0, Lcom/innioasis/ipp/Albums$Start;->step:I
  .line 348
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loadNow()V
  .line 349
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Start;->a:Landroid/app/Activity;
    invoke-virtual { v2, p0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :L5
  :L4
  .line 350
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Start;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/LoadingDialog;->isShowing()Z
    move-result v2
    if-eqz v2, :L5
  .line 351
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Start;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L5
  .line 358
    goto :L7
  :L6
  .line 353
    move-exception v2
  .line 354
    iget v2, p0, Lcom/innioasis/ipp/Albums$Start;->step:I
    if-ne v2, v1, :L7
  .line 355
    iput v0, p0, Lcom/innioasis/ipp/Albums$Start;->step:I
  .line 356
    iget-object v0, p0, Lcom/innioasis/ipp/Albums$Start;->a:Landroid/app/Activity;
    invoke-virtual { v0, p0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L7
  .line 359
    return-void
.end method
