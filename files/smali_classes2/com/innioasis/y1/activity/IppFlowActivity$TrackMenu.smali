.class final Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "TrackMenu"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final s:Lcom/innioasis/y1/database/Song;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 2040
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;->s:Lcom/innioasis/y1/database/Song;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 4
  .line 2043
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackMenu;->s:Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1, v0, p2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->trackPick(Lcom/innioasis/y1/database/Song;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    return p1
.end method
