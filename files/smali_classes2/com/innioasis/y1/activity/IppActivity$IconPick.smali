.class final Lcom/innioasis/y1/activity/IppActivity$IconPick;
.super Lcom/innioasis/ipp/PickDialog$Go;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "IconPick"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 571
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$IconPick;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public go(I)V
  .registers 4
  .line 575
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$IconPick;->a:Lcom/innioasis/y1/activity/IppActivity;
    const-string v1, "bar_icons"
    invoke-static { v0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 576
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$IconPick;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { p1 }, Lcom/innioasis/ipp/TopBar;->apply(Ljava/lang/Object;)V
  .line 577
    return-void
.end method
