.class final Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AlbumMenu"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final at:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .registers 3
  .line 1947
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;->at:I
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 4
  .line 1950
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AlbumMenu;->at:I
    invoke-virtual { p1, v0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->pick(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    return p1
.end method
