.class public final Lcom/innioasis/ipp/Press;
.super Ljava/lang/Object;
.source "Press.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Press$Run;
  }
.end annotation

.field private final static h:Landroid/os/Handler;

.field private static pending:Ljava/lang/Runnable;

.method static constructor <clinit>()V
  .registers 2
  .line 30
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bottomPressed(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 4
  .line 80
    if-eqz p0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 83
    sget-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 84
    if-eqz v0, :L1
  .line 85
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 86
    sget-object v1, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 87
    invoke-static { p0 }, Lcom/innioasis/ipp/Press;->openPlayer(Landroid/app/Activity;)Z
    move-result p0
    return p0
  :L1
  .line 89
    new-instance v0, Lcom/innioasis/ipp/Press$Run;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Press$Run;-><init>(Lcom/innioasis/y1/base/BaseActivity;)V
  .line 90
    sput-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 91
    sget-object p0, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    const-wide/16 v1, 250
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 92
    const/4 p0, 1
    return p0
  :L2
  .line 81
    const/4 p0, 0
    return p0
.end method

.method public static clearPending(Ljava/lang/Runnable;)V
  .registers 2
  .line 36
    sget-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
    if-ne v0, p0, :L0
  .line 37
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  :L0
  .line 39
    return-void
.end method

.method public static longLimit(I)I
  .registers 2
  .line 54
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 3
  :L1
    return p0
.end method

.method private static openPlayer(Landroid/app/Activity;)Z
  .catchall { :L1 .. :L4 } :L10
  .catchall { :L6 .. :L7 } :L8
  .registers 5
  .line 101
    invoke-static { p0 }, Lcom/innioasis/ipp/Audio;->openOther(Landroid/app/Activity;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 102
    return v1
  :L0
  .line 105
    const/4 v0, 0
  :L1
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 106
    if-nez v2, :L2
  .line 107
    return v0
  :L2
  .line 109
    invoke-virtual { v2 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v2
  .line 110
    if-eqz v2, :L5
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-lez v2, :L5
  .line 111
    invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v2
    if-eqz v2, :L3
  .line 112
    return v0
  :L3
  .line 114
    new-instance v2, Landroid/content/Intent;
    const-class v3, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v2, p0, v3 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 115
    const-string v3, "from_now_playing"
    invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 116
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L4
  .line 117
    return v1
  :L5
  .line 121
    nop
  .line 125
    const v2, 2131820857
  :L6
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-static { p0, v2, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L7
  .line 127
    goto :L9
  :L8
  .line 126
    move-exception p0
  :L9
  .line 128
    return v1
  :L10
  .line 119
    move-exception p0
  .line 120
    return v0
.end method

.method public static playerLongLimit(I)I
  .registers 2
  .line 68
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/16 p0, 8
  :L1
    return p0
.end method
