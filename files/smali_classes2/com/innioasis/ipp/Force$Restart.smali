.class final Lcom/innioasis/ipp/Force$Restart;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Restart"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 183
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 183
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Restart;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Force;->saveState()V
  .line 186
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 187
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->reboot(Landroid/content/Context;)V
  :L0
  .line 188
    return-void
.end method
