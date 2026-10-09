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

.method public static tick(Landroid/widget/BaseAdapter;)V
  .registers 4
  .line 22
    if-nez p0, :L0
  .line 23
    return-void
  :L0
  .line 25
    invoke-static { p0 }, Lcom/innioasis/ipp/Lists;->note(Landroid/widget/BaseAdapter;)V
  .line 27
    sget-boolean p0, Lcom/innioasis/ipp/ListWatch;->registered:Z
    if-eqz p0, :L1
  .line 28
    return-void
  :L1
  .line 30
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 31
    if-nez p0, :L2
  .line 32
    return-void
  :L2
  .line 34
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/ListWatch;->registered:Z
  .line 35
    new-instance v0, Lcom/innioasis/ipp/ListWatch;
    invoke-direct { v0 }, Lcom/innioasis/ipp/ListWatch;-><init>()V
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0, v1 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 36
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 4
  .line 40
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p1
  .line 41
    invoke-static { }, Lcom/innioasis/ipp/Lists;->refresh()V
  .line 42
    invoke-static { }, Lcom/innioasis/ipp/Follow;->onSongChanged()V
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->prefetchPlaying()V
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->onSongChanged()V
  .line 46
    const-string v0, "ListWatch"
    invoke-static { v0, p1, p2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 47
    return-void
.end method
