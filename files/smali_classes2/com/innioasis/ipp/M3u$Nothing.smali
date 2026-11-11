.class final Lcom/innioasis/ipp/M3u$Nothing;
.super Ljava/lang/Object;
.implements Lkotlin/jvm/functions/Function0;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Nothing"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 238
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public invoke()Ljava/lang/Object;
  .registers 2
  .line 240
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method
