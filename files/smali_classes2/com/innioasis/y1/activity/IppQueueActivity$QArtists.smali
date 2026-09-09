.class final Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "QArtists"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1650
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1651
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1652
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 3
  .line 1656
    if-eqz p2, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pickArtist(Ljava/lang/String;)V
  :L0
  .line 1657
    const/4 p1, 1
    return p1
.end method
