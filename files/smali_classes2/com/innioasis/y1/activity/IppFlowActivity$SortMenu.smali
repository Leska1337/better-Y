.class final Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "SortMenu"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 2
  .line 1956
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 3
  .line 1959
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$SortMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->sort(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    return p1
.end method
