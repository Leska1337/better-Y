.class final Lcom/innioasis/ipp/Backup$Saved;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Saved"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final f:Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
  .registers 3
  .line 127
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 128
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Saved;->a:Landroid/app/Activity;
  .line 129
    iput-object p2, p0, Lcom/innioasis/ipp/Backup$Saved;->f:Ljava/io/File;
  .line 130
    return-void
.end method

.method public run()V
  .registers 5
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/Backup;->access$000()V
  .line 134
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Saved;->f:Ljava/io/File;
    if-nez v0, :L0
  .line 135
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Saved;->a:Landroid/app/Activity;
    const v1, 2131821124
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Backup;->access$100(Landroid/content/Context;Ljava/lang/String;)V
    goto :L1
  :L0
  .line 137
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$Saved;->a:Landroid/app/Activity;
    const/4 v2, 1
    new-array v2, v2, [Ljava/lang/Object;
  .line 138
    invoke-virtual { v0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
    const/4 v3, 0
    aput-object v0, v2, v3
  .line 137
    const v0, 2131821123
    invoke-virtual { v1, v0, v2 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Backup;->access$100(Landroid/content/Context;Ljava/lang/String;)V
  :L1
  .line 140
    return-void
.end method
