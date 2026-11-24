.class public final Lcom/innioasis/ipp/Wake;
.super Ljava/lang/Object;
.source "Wake.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Wake$Cover;,
    Lcom/innioasis/ipp/Wake$First;,
    Lcom/innioasis/ipp/Wake$Remove;,
    Lcom/innioasis/ipp/Wake$GiveUp;
  }
.end annotation

.field private final static COVERS:Ljava/util/List;

.field final static FADE_MS:I = 250

.field private final static GIVE_UP:Ljava/lang/Runnable;

.field private final static GIVE_UP_MS:I = 1500

.field final static UNBLANK_MS:I = 550

.field private static armed:Z

.field private static main:Landroid/os/Handler;

.field private static onAt:J

.method static constructor <clinit>()V
  .registers 1
  .line 33
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
  .line 120
    new-instance v0, Lcom/innioasis/ipp/Wake$GiveUp;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wake$GiveUp;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wake;->GIVE_UP:Ljava/lang/Runnable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wake;->armed:Z
    return v0
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wake;->armed:Z
    return p0
.end method

.method static synthetic access$100(Landroid/view/View;)V
  .registers 1
  .line 22
    invoke-static { p0 }, Lcom/innioasis/ipp/Wake;->dropAll(Landroid/view/View;)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Wake$Cover;)V
  .registers 1
  .line 22
    invoke-static { p0 }, Lcom/innioasis/ipp/Wake;->unlisten(Lcom/innioasis/ipp/Wake$Cover;)V
    return-void
.end method

.method private static cover(Landroid/app/Activity;)V
  .registers 5
  .line 69
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 70
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  :L1
  .line 71
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L2
    return-void
  :L2
  .line 72
    check-cast v0, Landroid/view/ViewGroup;
  .line 74
    sget-object v1, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L3
    if-ltz v1, :L5
  .line 75
    sget-object v2, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  .line 76
    invoke-virtual { v2 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    if-ne v3, v0, :L4
    invoke-static { v2 }, Lcom/innioasis/ipp/Wake;->remove(Landroid/view/View;)V
  :L4
  .line 74
    add-int/lit8 v1, v1, -1
    goto :L3
  :L5
  .line 78
    new-instance v1, Lcom/innioasis/ipp/Wake$Cover;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Wake$Cover;-><init>(Landroid/app/Activity;)V
  .line 79
    const/high16 p0, 0xFF000000
    invoke-virtual { v1, p0 }, Lcom/innioasis/ipp/Wake$Cover;->setBackgroundColor(I)V
  .line 80
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 v2, -1
    invoke-direct { p0, v2, v2 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1, p0 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 82
    new-instance p0, Lcom/innioasis/ipp/Wake$First;
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Wake$First;-><init>(Lcom/innioasis/ipp/Wake$Cover;)V
    iput-object p0, v1, Lcom/innioasis/ipp/Wake$Cover;->first:Lcom/innioasis/ipp/Wake$First;
  .line 83
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Wake$Cover;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object v0, v1, Lcom/innioasis/ipp/Wake$Cover;->first:Lcom/innioasis/ipp/Wake$First;
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 84
    sget-object p0, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { p0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 85
    return-void
.end method

.method private static detach(Landroid/view/View;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 113
    instance-of v0, p0, Lcom/innioasis/ipp/Wake$Cover;
    if-eqz v0, :L1
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/Wake$Cover;
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->unlisten(Lcom/innioasis/ipp/Wake$Cover;)V
  :L1
  .line 114
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 115
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-eqz v1, :L2
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual { v0, p0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L2
  .line 117
    goto :L4
  :L3
  .line 116
    move-exception p0
  :L4
  .line 118
    return-void
.end method

.method static drawn(Lcom/innioasis/ipp/Wake$Cover;)V
  .registers 5
  .line 89
    sget-boolean v0, Lcom/innioasis/ipp/Wake;->armed:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 90
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wake;->armed:Z
  .line 91
    sget-object v0, Lcom/innioasis/ipp/Wake;->main:Landroid/os/Handler;
    if-eqz v0, :L1
    sget-object v1, Lcom/innioasis/ipp/Wake;->GIVE_UP:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L1
  .line 92
    invoke-static { p0 }, Lcom/innioasis/ipp/Wake;->dropAll(Landroid/view/View;)V
  .line 93
    sget-wide v0, Lcom/innioasis/ipp/Wake;->onAt:J
    const-wide/16 v2, 550
    add-long/2addr v0, v2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long/2addr v0, v2
    const-wide/16 v2, 0
    invoke-static { v2, v3, v0, v1 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v0
  .line 94
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Wake$Cover;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v2
    const/4 v3, 0
    invoke-virtual { v2, v3 }, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v2
    invoke-virtual { v2, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 250
    invoke-virtual { v0, v1, v2 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Wake$Remove;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Wake$Remove;-><init>(Landroid/view/View;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
  .line 95
    return-void
.end method

.method private static dropAll(Landroid/view/View;)V
  .registers 4
  .line 98
    sget-object v0, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L0
    if-ltz v0, :L3
  .line 99
    sget-object v1, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  .line 100
    if-ne v2, p0, :L1
    goto :L2
  :L1
  .line 101
    invoke-interface { v1, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 102
    invoke-static { v2 }, Lcom/innioasis/ipp/Wake;->detach(Landroid/view/View;)V
  :L2
  .line 98
    add-int/lit8 v0, v0, -1
    goto :L0
  :L3
  .line 104
    return-void
.end method

.method static off()V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 41
    const/4 v0, 0
  :L0
    sput-boolean v0, Lcom/innioasis/ipp/Wake;->armed:Z
  .line 42
    invoke-static { }, Lcom/innioasis/ipp/Theme;->screens()[Ljava/lang/Object;
    move-result-object v1
  .line 43
    nop
  :L1
    array-length v2, v1
    if-ge v0, v2, :L4
  .line 44
    aget-object v2, v1, v0
    check-cast v2, Landroid/app/Activity;
  .line 45
    if-eqz v2, :L3
    invoke-virtual { v2 }, Landroid/app/Activity;->isFinishing()Z
    move-result v3
    if-eqz v3, :L2
    goto :L3
  :L2
  .line 46
    invoke-static { v2 }, Lcom/innioasis/ipp/Wake;->cover(Landroid/app/Activity;)V
  :L3
  .line 43
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 49
    goto :L6
  :L5
  .line 48
    move-exception v0
  :L6
  .line 50
    return-void
.end method

.method static on()V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 55
    sget-object v0, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 56
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Wake;->armed:Z
  .line 57
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wake;->onAt:J
  .line 58
    sget-object v0, Lcom/innioasis/ipp/Wake;->main:Landroid/os/Handler;
    if-nez v0, :L2
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Wake;->main:Landroid/os/Handler;
  :L2
  .line 59
    sget-object v0, Lcom/innioasis/ipp/Wake;->main:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Wake;->GIVE_UP:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 60
    sget-object v0, Lcom/innioasis/ipp/Wake;->main:Landroid/os/Handler;
    const-wide/16 v2, 1500
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 62
    const/4 v0, 0
  :L3
    sget-object v1, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L5
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->invalidate()V
  :L4
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 65
    goto :L7
  :L6
  .line 63
    move-exception v0
  .line 64
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->dropAll(Landroid/view/View;)V
  :L7
  .line 66
    return-void
.end method

.method static remove(Landroid/view/View;)V
  .registers 2
  .line 107
    sget-object v0, Lcom/innioasis/ipp/Wake;->COVERS:Ljava/util/List;
    invoke-interface { v0, p0 }, Ljava/util/List;->remove(Ljava/lang/Object;)Z
  .line 108
    invoke-static { p0 }, Lcom/innioasis/ipp/Wake;->detach(Landroid/view/View;)V
  .line 109
    return-void
.end method

.method private static unlisten(Lcom/innioasis/ipp/Wake$Cover;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 131
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Wake$Cover;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
  .line 132
    iget-object v1, p0, Lcom/innioasis/ipp/Wake$Cover;->first:Lcom/innioasis/ipp/Wake$First;
    if-eqz v1, :L1
    invoke-virtual { v0 }, Landroid/view/ViewTreeObserver;->isAlive()Z
    move-result v1
    if-eqz v1, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Wake$Cover;->first:Lcom/innioasis/ipp/Wake$First;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 134
    goto :L3
  :L2
  .line 133
    move-exception v0
  :L3
  .line 135
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Wake$Cover;->first:Lcom/innioasis/ipp/Wake$First;
  .line 136
    return-void
.end method
