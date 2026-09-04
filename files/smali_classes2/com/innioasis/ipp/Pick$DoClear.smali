.class final Lcom/innioasis/ipp/Pick$DoClear;
.super Lcom/innioasis/ipp/PickDialog$Go;
.source "Pick.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pick;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "DoClear"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/SettingActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 2
  .line 74
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Pick$DoClear;->a:Lcom/innioasis/y1/activity/SettingActivity;
    return-void
.end method

.method public go(I)V
  .registers 3
  .line 78
    if-nez p1, :L0
    return-void
  :L0
  .line 79
    and-int/lit8 v0, p1, 4
    if-eqz v0, :L1
  .line 82
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$DoClear;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->ippClearCache(I)V
  .line 83
    return-void
  :L1
  .line 85
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$DoClear;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Pick;->access$000(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .line 86
    return-void
.end method
