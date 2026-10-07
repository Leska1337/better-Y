.class public final Lcom/innioasis/ipp/Ahead;
.super Ljava/lang/Object;
.source "Ahead.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Ahead$Pick;,
    Lcom/innioasis/ipp/Ahead$Read;
  }
.end annotation

.field private final static CAP:J = 33554432L

.field private final static CHUNK:I = 131072

.field private final static MAIN:Landroid/os/Handler;

.field private final static PAUSE_MS:J = 20L

.field private final static PICK:Lcom/innioasis/ipp/Ahead$Pick;

.field private final static WAIT_MS:J = 4000L

.field private static volatile done:Ljava/lang/String;

.field static volatile turn:I

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 2
  .line 29
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
  .line 30
    new-instance v0, Lcom/innioasis/ipp/Ahead$Pick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Ahead$Pick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
  .registers 1
  .line 15
    sget-object v0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 15
    sput-object p0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$100()Landroid/os/Handler;
  .registers 1
  .line 15
    sget-object v0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$102(Landroid/os/Handler;)Landroid/os/Handler;
  .registers 1
  .line 15
    sput-object p0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object p0
.end method

.method public static onSongChanged()V
  .registers 4
  .line 41
    sget v0, Lcom/innioasis/ipp/Ahead;->turn:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Ahead;->turn:I
  .line 42
    sget-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 43
    const-wide/16 v2, 4000
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 44
    return-void
.end method
