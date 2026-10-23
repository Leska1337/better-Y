.class final Lcom/innioasis/ipp/Pick$Tick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Pick.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pick;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tick"
.end annotation

.field private final d:Lcom/innioasis/y1/utils/LoadingDialog;

.field private final text:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  .registers 3
  .line 190
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 191
    iput-object p1, p0, Lcom/innioasis/ipp/Pick$Tick;->d:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 192
    iput-object p2, p0, Lcom/innioasis/ipp/Pick$Tick;->text:Ljava/lang/String;
  .line 193
    return-void
.end method

.method public run()V
  .registers 3
  .line 196
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Tick;->d:Lcom/innioasis/y1/utils/LoadingDialog;
    iget-object v1, p0, Lcom/innioasis/ipp/Pick$Tick;->text:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Loading;->show(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  .line 197
    return-void
.end method
