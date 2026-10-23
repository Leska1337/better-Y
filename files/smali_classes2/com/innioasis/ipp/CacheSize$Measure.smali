.class final Lcom/innioasis/ipp/CacheSize$Measure;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "CacheSize.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/CacheSize;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Measure"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/SettingActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 2
  .line 58
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/CacheSize$Measure;->a:Lcom/innioasis/y1/activity/SettingActivity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L5 .. :L6 } :L7
  .registers 5
  .line 61
    nop
  :L0
  .line 65
    iget-object v0, p0, Lcom/innioasis/ipp/CacheSize$Measure;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->total(Landroid/content/Context;)J
    move-result-wide v0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Schema;->tagBytes(Ljava/util/List;)J
    move-result-wide v2
    add-long/2addr v0, v2
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v0
  :L1
  .line 67
    goto :L3
  :L2
  .line 66
    move-exception v0
    const/4 v0, 0
  :L3
  .line 68
    if-eqz v0, :L4
  .line 69
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->access$002(Ljava/lang/String;)Ljava/lang/String;
  .line 70
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/CacheSize;->access$102(J)J
  :L4
  .line 72
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->access$202(Z)Z
  :L5
  .line 74
    iget-object v0, p0, Lcom/innioasis/ipp/CacheSize$Measure;->a:Lcom/innioasis/y1/activity/SettingActivity;
    new-instance v1, Lcom/innioasis/ipp/CacheSize$Apply;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/CacheSize$Apply;-><init>(Lcom/innioasis/y1/activity/SettingActivity;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L6
  .line 76
    goto :L8
  :L7
  .line 75
    move-exception v0
  :L8
  .line 77
    return-void
.end method
