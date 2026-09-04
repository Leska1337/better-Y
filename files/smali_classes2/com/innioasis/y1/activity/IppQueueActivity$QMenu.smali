.class final Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "QMenu"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1202
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1203
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1204
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 3
  .line 1208
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pick(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    return p1
.end method
