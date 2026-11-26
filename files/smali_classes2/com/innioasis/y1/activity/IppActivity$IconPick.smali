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
  .line 629
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$IconPick;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public go(I)V
  .registers 3
  .line 633
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$IconPick;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/TopBar;->save(Lcom/innioasis/y1/base/BaseActivity;I)V
  .line 634
    return-void
.end method
