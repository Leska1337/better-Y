.class final Lcom/innioasis/ipp/Diag$Crash;
.super Ljava/lang/Object;
.implements Ljava/lang/Thread$UncaughtExceptionHandler;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Crash"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 221
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 223
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "uncaught exception on thread "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    if-nez p1, :L0
    const-string v1, "?"
    goto :L1
  :L0
    invoke-virtual { p1 }, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object v1
  :L1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Diag;->spill(Ljava/lang/String;Ljava/lang/Throwable;)V
  :L2
  .line 225
    invoke-static { }, Lcom/innioasis/ipp/Diag;->access$000()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Diag;->access$000()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    invoke-interface { v0, p1, p2 }, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
  :L3
  .line 228
    goto :L5
  :L4
  .line 226
    move-exception p1
  :L5
  .line 229
    return-void
.end method
