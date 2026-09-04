.class final Lcom/innioasis/ipp/Force$Down;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Down"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 177
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 177
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Down;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 179
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/Other;->shutdown()V
  .line 180
    return-void
.end method
