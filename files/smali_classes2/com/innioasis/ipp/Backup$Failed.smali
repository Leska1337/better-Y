.class final Lcom/innioasis/ipp/Backup$Failed;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Failed"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 541
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Failed;->a:Landroid/app/Activity;
    return-void
.end method

.method public run()V
  .registers 3
  .line 544
    invoke-static { }, Lcom/innioasis/ipp/Backup;->access$000()V
  .line 545
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Failed;->a:Landroid/app/Activity;
    const v1, 2131821127
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Backup;->access$100(Landroid/content/Context;Ljava/lang/String;)V
  .line 546
    return-void
.end method
