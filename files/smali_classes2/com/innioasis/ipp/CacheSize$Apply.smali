.class final Lcom/innioasis/ipp/CacheSize$Apply;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "CacheSize.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/CacheSize;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Apply"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/SettingActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 2
  .line 83
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/CacheSize$Apply;->a:Lcom/innioasis/y1/activity/SettingActivity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 87
    iget-object v0, p0, Lcom/innioasis/ipp/CacheSize$Apply;->a:Lcom/innioasis/y1/activity/SettingActivity;
    const v1, 2131820574
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 88
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->panelShows(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L1
    return-void
  :L1
  .line 89
    iget-object v1, p0, Lcom/innioasis/ipp/CacheSize$Apply;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L2
  .line 91
    goto :L4
  :L3
  .line 90
    move-exception v0
  :L4
  .line 92
    return-void
.end method
