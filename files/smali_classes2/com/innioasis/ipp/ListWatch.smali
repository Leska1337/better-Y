.class public final Lcom/innioasis/ipp/ListWatch;
.super Landroid/content/BroadcastReceiver;
.source "ListWatch.java"

.field static registered:Z

.method public constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
    return-void
.end method

.method static register()V
  .registers 4
  .line 30
    sget-boolean v0, Lcom/innioasis/ipp/ListWatch;->registered:Z
    if-eqz v0, :L0
  .line 31
    return-void
  :L0
  .line 33
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 34
    if-nez v0, :L1
  .line 35
    return-void
  :L1
  .line 37
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/ListWatch;->registered:Z
  .line 38
    new-instance v1, Lcom/innioasis/ipp/ListWatch;
    invoke-direct { v1 }, Lcom/innioasis/ipp/ListWatch;-><init>()V
    new-instance v2, Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v2, v3 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1, v2 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 39
    return-void
.end method

.method public static tick(Landroid/widget/BaseAdapter;)V
  .registers 1
  .line 22
    if-nez p0, :L0
  .line 23
    return-void
  :L0
  .line 25
    invoke-static { p0 }, Lcom/innioasis/ipp/Lists;->note(Landroid/widget/BaseAdapter;)V
  .line 26
    invoke-static { }, Lcom/innioasis/ipp/ListWatch;->register()V
  .line 27
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 4
  .line 43
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p1
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Lists;->refresh()V
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/Follow;->onSongChanged()V
  .line 47
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->prefetchPlaying()V
  .line 48
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->onSongChanged()V
  .line 49
    const-string v0, "ListWatch"
    invoke-static { v0, p1, p2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 50
    return-void
.end method
