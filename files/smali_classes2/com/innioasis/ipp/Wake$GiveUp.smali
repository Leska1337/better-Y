.class final Lcom/innioasis/ipp/Wake$GiveUp;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wake.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wake;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "GiveUp"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 122
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 124
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->access$002(Z)Z
  .line 125
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->access$100(Landroid/view/View;)V
  .line 126
    return-void
.end method
