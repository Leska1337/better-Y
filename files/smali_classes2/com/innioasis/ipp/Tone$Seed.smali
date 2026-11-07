.class final Lcom/innioasis/ipp/Tone$Seed;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Seed"
.end annotation

.field private final c:Landroid/content/Context;

.method constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 392
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Tone$Seed;->c:Landroid/content/Context;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 394
    iget-object v0, p0, Lcom/innioasis/ipp/Tone$Seed;->c:Landroid/content/Context;
    invoke-static { v0 }, Lcom/innioasis/ipp/Tone;->seed(Landroid/content/Context;)V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 395
    return-void
.end method
