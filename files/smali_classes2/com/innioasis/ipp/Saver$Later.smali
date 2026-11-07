.class final Lcom/innioasis/ipp/Saver$Later;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Later"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 176
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 179
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$200()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 180
    return-void
.end method
