.class final Lcom/innioasis/y1/activity/IppActivity$Noop;
.super Ljava/lang/Object;
.implements Lkotlin/jvm/functions/Function0;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Noop"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 1566
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
  .registers 2
  .line 1566
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity$Noop;-><init>()V
    return-void
.end method

.method public invoke()Ljava/lang/Object;
  .registers 2
  .line 1569
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method
