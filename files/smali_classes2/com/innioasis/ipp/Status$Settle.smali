.class final Lcom/innioasis/ipp/Status$Settle;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Status.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Status;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Settle"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 131
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$000()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 134
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$002(Z)Z
  .line 135
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$102(Z)Z
  .line 136
    const/4 v1, 1
    invoke-static { v1 }, Lcom/innioasis/ipp/Status;->access$202(Z)Z
  :L1
  .line 138
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$300()I
    move-result v2
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$400()I
    move-result v3
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/y1/utils/Static;->setPlayValue(II)V
  :L2
    goto :L4
  :L3
  .line 139
    move-exception v1
  :L4
  .line 142
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$202(Z)Z
  .line 143
    nop
  .line 144
    return-void
.end method
