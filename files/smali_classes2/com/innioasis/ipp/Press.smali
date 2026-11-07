.class public final Lcom/innioasis/ipp/Press;
.super Ljava/lang/Object;
.source "Press.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Press$Run;
  }
.end annotation

.field public final static KEY_LOCK:Ljava/lang/String; = "/proc/tpd_keys_enable"

.field private final static h:Landroid/os/Handler;

.field private static laid:Z

.field private static pending:Ljava/lang/Runnable;

.method static constructor <clinit>()V
  .registers 2
  .line 31
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bottomPressed(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 5
  .line 124
    if-eqz p0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 127
    sget-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 128
    const/4 v1, 1
    if-eqz v0, :L2
  .line 129
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 130
    sget-object v2, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    invoke-virtual { v2, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 131
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;
    if-eqz v0, :L1
  .line 132
    check-cast p0, Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->toPlaying()V
  .line 133
    return v1
  :L1
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/Press;->openPlayer(Landroid/app/Activity;)Z
    move-result p0
    return p0
  :L2
  .line 137
    new-instance v0, Lcom/innioasis/ipp/Press$Run;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Press$Run;-><init>(Lcom/innioasis/y1/base/BaseActivity;)V
  .line 138
    sput-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  .line 139
    sget-object p0, Lcom/innioasis/ipp/Press;->h:Landroid/os/Handler;
    const-wide/16 v2, 250
    invoke-virtual { p0, v0, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 140
    return v1
  :L3
  .line 125
    const/4 p0, 0
    return p0
.end method

.method public static clearPending(Ljava/lang/Runnable;)V
  .registers 2
  .line 95
    sget-object v0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
    if-ne v0, p0, :L0
  .line 96
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Press;->pending:Ljava/lang/Runnable;
  :L0
  .line 98
    return-void
.end method

.method private static fromLayout(Lcom/innioasis/fm/configs/KeyMap;)V
  .catchall { :L0 .. :L1 } :L14
  .catchall { :L2 .. :L8 } :L13
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L16 .. :L17 } :L18
  .registers 12
  .line 65
    nop
  .line 66
    nop
  .line 68
    const/4 v0, 0
    const/4 v1, 0
  :L0
    new-instance v2, Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/FileReader;
    const-string v4, "/system/usr/keylayout/Generic.kl"
    invoke-direct { v3, v4 }, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct { v2, v3 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L1
    const/4 v1, 0
    const/4 v3, 0
    const/4 v4, 0
    const/4 v5, 0
  :L2
  .line 70
    invoke-virtual { v2 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L10
  .line 71
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    const-string v7, "\\s+"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v6
  .line 72
    array-length v7, v6
    const/4 v8, 3
    if-lt v7, v8, :L2
    const-string v7, "key"
    aget-object v8, v6, v0
    invoke-virtual { v7, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    goto :L2
  :L3
  .line 73
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v8, "KEYCODE_"
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const/4 v8, 2
    aget-object v8, v6, v8
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Landroid/view/KeyEvent;->keyCodeFromString(Ljava/lang/String;)I
    move-result v7
  .line 74
    if-gtz v7, :L4
    goto :L2
  :L4
  .line 75
    const-string v8, "103"
    const/4 v9, 1
    aget-object v10, v6, v9
    invoke-virtual { v8, v10 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L5
    move v1, v7
    goto :L9
  :L5
  .line 76
    const-string v8, "108"
    aget-object v10, v6, v9
    invoke-virtual { v8, v10 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L6
    move v3, v7
    goto :L9
  :L6
  .line 77
    const-string v8, "105"
    aget-object v10, v6, v9
    invoke-virtual { v8, v10 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L7
    move v4, v7
    goto :L9
  :L7
  .line 78
    const-string v8, "106"
    aget-object v6, v6, v9
    invoke-virtual { v8, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
  :L8
    if-eqz v6, :L9
    move v5, v7
  :L9
  .line 79
    goto :L2
  :L10
  .line 82
    invoke-virtual { v2 }, Ljava/io/BufferedReader;->close()V
  :L11
    goto :L20
  :L12
    move-exception v0
    goto :L20
  :L13
  .line 80
    move-exception v0
    move v0, v1
    move-object v1, v2
    goto :L15
  :L14
    move-exception v2
    const/4 v3, 0
    const/4 v4, 0
    const/4 v5, 0
  :L15
  .line 82
    if-eqz v1, :L19
  :L16
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->close()V
  :L17
    goto :L19
  :L18
    move-exception v1
  :L19
  .line 84
    move v1, v0
  :L20
    if-lez v1, :L21
    if-lez v3, :L21
  .line 85
    invoke-virtual { p0, v1 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_UP(I)V
  .line 86
    invoke-virtual { p0, v3 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_DOWN(I)V
  :L21
  .line 88
    if-lez v4, :L22
    if-lez v5, :L22
  .line 89
    invoke-virtual { p0, v4 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_LEFT(I)V
  .line 90
    invoke-virtual { p0, v5 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_RIGHT(I)V
  :L22
  .line 92
    return-void
.end method

.method public static layout()V
  .registers 4
  .line 46
    sget-boolean v0, Lcom/innioasis/ipp/Press;->laid:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 47
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Press;->laid:Z
  .line 48
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 49
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;
  .line 50
    const-string v2, "Y2"
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L3
    if-eqz v1, :L1
    const-string v2, "6582"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-ltz v1, :L1
    goto :L3
  :L1
  .line 57
    new-instance v1, Ljava/io/File;
    const-string v2, "/proc/tpd_keys_enable"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/Press;->fromLayout(Lcom/innioasis/fm/configs/KeyMap;)V
  :L2
  .line 58
    return-void
  :L3
  .line 51
    const/16 v1, 19
    invoke-virtual { v0, v1 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_UP(I)V
  .line 52
    const/16 v1, 20
    invoke-virtual { v0, v1 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_DOWN(I)V
  .line 53
    const/16 v1, 21
    invoke-virtual { v0, v1 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_LEFT(I)V
  .line 54
    const/16 v1, 22
    invoke-virtual { v0, v1 }, Lcom/innioasis/fm/configs/KeyMap;->setKEY_RIGHT(I)V
  .line 55
    return-void
.end method

.method public static longLimit(I)I
  .registers 2
  .line 107
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
  .line 145
    invoke-static { p0 }, Lcom/innioasis/ipp/Audio;->openOther(Landroid/app/Activity;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 146
    return v1
  :L0
  .line 149
    const/4 v0, 0
  :L1
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 150
    if-nez v2, :L2
  .line 151
    return v0
  :L2
  .line 153
    invoke-virtual { v2 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v2
  .line 154
    if-eqz v2, :L5
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-lez v2, :L5
  .line 155
    invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v2
    if-eqz v2, :L3
  .line 156
    return v0
  :L3
  .line 158
    new-instance v2, Landroid/content/Intent;
    const-class v3, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { v2, p0, v3 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 159
    const-string v3, "from_now_playing"
    invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 160
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L4
  .line 161
    return v1
  :L5
  .line 165
    nop
  .line 168
    const v2, 2131820857
  :L6
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-static { p0, v2, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L7
  .line 170
    goto :L9
  :L8
  .line 169
    move-exception p0
  :L9
  .line 171
    return v1
  :L10
  .line 163
    move-exception p0
  .line 164
    return v0
.end method

.method public static playerLongLimit(I)I
  .registers 2
  .line 115
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
