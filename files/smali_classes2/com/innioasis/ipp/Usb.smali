.class public final Lcom/innioasis/ipp/Usb;
.super Ljava/lang/Object;
.source "Usb.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Usb$Watcher;,
    Lcom/innioasis/ipp/Usb$Open;
  }
.end annotation

.field private final static SCREEN:Landroid/content/ComponentName;

.field private static app:Landroid/content/Context;

.field private static done:Z

.field private static main:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 3
  .line 28
    new-instance v0, Landroid/content/ComponentName;
    const-string v1, "com.android.systemui"
    const-string v2, "com.android.systemui.usb.UsbStorageActivity"
    invoke-direct { v0, v1, v2 }, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    sput-object v0, Lcom/innioasis/ipp/Usb;->SCREEN:Landroid/content/ComponentName;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 26
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/Usb;->app:Landroid/content/Context;
    return-object v0
.end method

.method static synthetic access$100()Landroid/content/ComponentName;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/Usb;->SCREEN:Landroid/content/ComponentName;
    return-object v0
.end method

.method static synthetic access$200()Landroid/os/Handler;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/Usb;->main:Landroid/os/Handler;
    return-object v0
.end method

.method public static boot(Landroid/content/Context;)V
  .catchall { :L1 .. :L3 } :L4
  .registers 9
  .line 37
    sget-boolean v0, Lcom/innioasis/ipp/Usb;->done:Z
    if-nez v0, :L6
    if-nez p0, :L0
    goto/16 :L6
  :L0
  .line 38
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Usb;->done:Z
  :L1
  .line 40
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Usb;->app:Landroid/content/Context;
  .line 41
    if-nez v1, :L2
    sput-object p0, Lcom/innioasis/ipp/Usb;->app:Landroid/content/Context;
  :L2
  .line 42
    new-instance p0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { p0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object p0, Lcom/innioasis/ipp/Usb;->main:Landroid/os/Handler;
  .line 43
    const-string p0, "android.app.ActivityManagerNative"
    invoke-static { p0 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object p0
  .line 44
    const-string v1, "getDefault"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { p0, v1, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object p0
    new-array v1, v2, [Ljava/lang/Object;
    const/4 v3, 0
    invoke-virtual { p0, v3, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 45
    const-string v1, "android.app.IActivityController"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 46
    const-string v4, "android.app.IActivityController$Stub"
    invoke-static { v4 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v4
  .line 47
    const-string v5, "asInterface"
    new-array v6, v0, [Ljava/lang/Class;
    const-class v7, Landroid/os/IBinder;
    aput-object v7, v6, v2
    invoke-virtual { v4, v5, v6 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v4
    new-array v5, v0, [Ljava/lang/Object;
    new-instance v6, Lcom/innioasis/ipp/Usb$Watcher;
    invoke-direct { v6 }, Lcom/innioasis/ipp/Usb$Watcher;-><init>()V
    aput-object v6, v5, v2
    invoke-virtual { v4, v3, v5 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 48
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v4
    const-string v5, "setActivityController"
    new-array v6, v0, [Ljava/lang/Class;
    aput-object v1, v6, v2
    invoke-virtual { v4, v5, v6 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
    new-array v0, v0, [Ljava/lang/Object;
    aput-object v3, v0, v2
    invoke-virtual { v1, p0, v0 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 51
    goto :L5
  :L4
  .line 49
    move-exception p0
  .line 50
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "usb: setActivityController failed: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L5
  .line 52
    return-void
  :L6
  .line 37
    return-void
.end method
