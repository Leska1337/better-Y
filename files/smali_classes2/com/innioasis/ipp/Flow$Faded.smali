.class final Lcom/innioasis/ipp/Flow$Faded;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Faded"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 1165
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 1
  .line 1166
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
    return-void
.end method
