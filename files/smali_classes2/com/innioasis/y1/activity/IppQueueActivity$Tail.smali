.class final Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tail"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 560
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    return-void
.end method

.method public run()V
  .registers 2
  .line 561
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
    return-void
.end method
