.class public final Lcom/innioasis/ipp/Rockbox;
.super Ljava/lang/Object;
.source "Rockbox.java"

.field private final static PACKAGE:Ljava/lang/String; = "org.rockbox"

.field private static started:Z

.method private constructor <init>()V
  .registers 1
  .line 25
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static drop(Ljava/util/List;Ljava/lang/String;)V
  .registers 4
  .line 80
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L0
    if-ltz v0, :L2
  .line 81
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
  .line 82
    invoke-interface { p0, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L1
  .line 80
    add-int/lit8 v0, v0, -1
    goto :L0
  :L2
  .line 85
    return-void
.end method

.method private static present(Landroid/content/Context;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 32
    invoke-virtual { p0 }, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object p0
    const-string v0, "org.rockbox"
    invoke-virtual { p0, v0 }, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I
  :L1
  .line 33
    const/4 p0, 1
    return p0
  :L2
  .line 34
    move-exception p0
  .line 35
    const/4 p0, 0
    return p0
.end method

.method public static settingsConfirm(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .catchall { :L1 .. :L3 } :L4
  .registers 5
  .line 89
    const-string v0, "org.rockbox"
    const v1, 2131820935
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    const/4 v1, 0
    if-nez p1, :L0
    return v1
  :L0
  .line 91
    const/4 p1, 1
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v2
  .line 92
    invoke-virtual { v2, v0, p1, v1 }, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V
  .line 94
    invoke-virtual { v2, v0 }, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v0
  .line 95
    if-nez v0, :L2
    return p1
  :L2
  .line 96
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->startActivity(Landroid/content/Intent;)V
  .line 97
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->finishAffinity()V
  .line 98
    const-string v0, "activity"
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/ActivityManager;
  .line 99
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getPackageName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/app/ActivityManager;->killBackgroundProcesses(Ljava/lang/String;)V
  :L3
  .line 101
    goto :L5
  :L4
  .line 100
    move-exception p0
  :L5
  .line 102
    return p1
.end method

.method public static settingsRows(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 6
  :L0
  .line 60
    new-instance v0, Ljava/io/File;
    const-string v1, "/proc/tpd_keys_enable"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L1
  .line 61
    const v0, 2131820931
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Rockbox;->drop(Ljava/util/List;Ljava/lang/String;)V
  :L1
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/Rockbox;->present(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 64
    const v0, 2131820934
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 65
    nop
  .line 66
    const/4 v1, 0
  :L3
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 1
    if-ge v1, v2, :L5
  .line 67
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
  .line 68
    add-int/2addr v1, v3
  .line 69
    goto :L6
  :L4
  .line 66
    add-int/lit8 v1, v1, 1
    goto :L3
  :L5
    const/4 v1, -1
  :L6
  .line 72
    if-gez v1, :L7
    return-void
  :L7
  .line 73
    new-instance v0, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
  .line 74
    const v2, 2131820935
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    const-string v2, ""
    invoke-direct { v0, p0, v3, v2 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;-><init>(Ljava/lang/String;ZLjava/lang/String;)V
  .line 73
    invoke-interface { p1, v1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L8
  .line 76
    goto :L10
  :L9
  .line 75
    move-exception p0
  :L10
  .line 77
    return-void
.end method

.method public static started(Landroid/content/Context;)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 47
    sget-boolean v0, Lcom/innioasis/ipp/Rockbox;->started:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 48
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Rockbox;->started:Z
  :L1
  .line 50
    invoke-static { p0 }, Lcom/innioasis/ipp/Rockbox;->present(Landroid/content/Context;)Z
    move-result v1
    if-nez v1, :L2
    return-void
  :L2
  .line 51
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setWasUnmounted(Z)V
  .line 52
    new-instance v0, Lcom/innioasis/y1/utils/SDReceiver;
    invoke-direct { v0 }, Lcom/innioasis/y1/utils/SDReceiver;-><init>()V
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_MOUNTED"
    invoke-direct { v1, v2 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/utils/SDReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  :L3
  .line 54
    goto :L5
  :L4
  .line 53
    move-exception p0
  :L5
  .line 55
    return-void
.end method
