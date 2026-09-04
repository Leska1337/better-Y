.class final Lcom/innioasis/ipp/Force$Boom;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Boom"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 153
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 153
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Boom;-><init>()V
    return-void
.end method

.method public run()V
  .registers 1
  .line 155
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$100()V
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$200()V
  .line 157
    return-void
.end method
