.class final Lcom/innioasis/ipp/Loading$ScanText;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Loading.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Loading;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "ScanText"
.end annotation

.field private final d:Lcom/innioasis/y1/utils/LoadingDialog;

.field private final text:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  .registers 3
  .line 242
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 243
    iput-object p1, p0, Lcom/innioasis/ipp/Loading$ScanText;->d:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 244
    iput-object p2, p0, Lcom/innioasis/ipp/Loading$ScanText;->text:Ljava/lang/String;
  .line 245
    return-void
.end method

.method public run()V
  .registers 3
  .line 248
    iget-object v0, p0, Lcom/innioasis/ipp/Loading$ScanText;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->isShowing()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 249
    iget-object v0, p0, Lcom/innioasis/ipp/Loading$ScanText;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    iget-object v1, p0, Lcom/innioasis/ipp/Loading$ScanText;->text:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Loading;->show(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  .line 250
    return-void
.end method
