.class final Lcom/innioasis/ipp/M3u$Run;
.super Ljava/lang/Object;
.implements Lkotlin/jvm/functions/Function0;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Run"
.end annotation

.field private final r:Ljava/lang/Runnable;

.method constructor <init>(Ljava/lang/Runnable;)V
  .registers 2
  .line 625
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Run;->r:Ljava/lang/Runnable;
    return-void
.end method

.method public invoke()Ljava/lang/Object;
  .registers 2
  .line 628
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Run;->r:Ljava/lang/Runnable;
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/lang/Runnable;->run()V
  :L0
  .line 629
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method
