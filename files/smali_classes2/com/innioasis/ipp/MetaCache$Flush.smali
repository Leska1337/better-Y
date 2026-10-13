.class final Lcom/innioasis/ipp/MetaCache$Flush;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "MetaCache.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MetaCache;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Flush"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 143
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 1
  .line 144
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->flush()V
    return-void
.end method
