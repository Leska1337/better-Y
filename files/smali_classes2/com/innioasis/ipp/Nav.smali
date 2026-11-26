.class public final Lcom/innioasis/ipp/Nav;
.super Ljava/lang/Object;
.source "Nav.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Nav$Run;,
    Lcom/innioasis/ipp/Nav$Popups;,
    Lcom/innioasis/ipp/Nav$Start;,
    Lcom/innioasis/ipp/Nav$Level;,
    Lcom/innioasis/ipp/Nav$Layer;
  }
.end annotation

.field private final static FRAME_NS:J = 27000000L

.field private final static FULL:I = 2

.field private final static LOC:[I

.field private final static OMEGA:F = 14.0F

.field private final static PUSH:I = 1

.field private final static SEEN:Ljava/util/WeakHashMap;

.field private final static SHOT_MS:J = 3000L

.field private final static SLIDE:I = 0

.field private final static SPLIT:I = 3

.field private final static WAIT_NS:J = 400000000L

.field private static bufA:Landroid/graphics/Bitmap;

.field private static bufB:Landroid/graphics/Bitmap;

.field private static bufC:Landroid/graphics/Bitmap;

.field static current:Ljava/lang/ref/WeakReference;

.field private static keyAct:Ljava/lang/ref/WeakReference;

.field private static keyAt:J

.field private static keyEdge:I

.field private static keyHalf:Z

.field private static keyList:Z

.field private static keyMenu:Z

.field private static keySig:Ljava/lang/String;

.field static running:Lcom/innioasis/ipp/Nav$Run;

.method static constructor <clinit>()V
  .registers 1
  .line 60
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Nav;->SEEN:Ljava/util/WeakHashMap;
  .line 203
    const/4 v0, 2
    new-array v0, v0, [I
    sput-object v0, Lcom/innioasis/ipp/Nav;->LOC:[I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)Z
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->shotOf(Landroid/app/Activity;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1000()Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Nav;->bufA:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method static synthetic access$1002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sput-object p0, Lcom/innioasis/ipp/Nav;->bufA:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$102(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 44
    sput-object p0, Lcom/innioasis/ipp/Nav;->keyAct:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$1100(Landroid/view/View;)I
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->left(Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static synthetic access$1200(Landroid/view/View;)I
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->right(Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static synthetic access$1300()Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Nav;->bufB:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method static synthetic access$1302(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sput-object p0, Lcom/innioasis/ipp/Nav;->bufB:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$1400(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 3
  .line 44
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Nav;->buffer(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1500(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  .registers 3
  .line 44
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Nav;->listShot(Landroid/graphics/Bitmap;Landroid/view/View;I)V
    return-void
.end method

.method static synthetic access$1600(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  .registers 3
  .line 44
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Nav;->window(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
    return-void
.end method

.method static synthetic access$1700()Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Nav;->bufC:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method static synthetic access$1702(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    sput-object p0, Lcom/innioasis/ipp/Nav;->bufC:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$1800(Landroid/view/View;)Z
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->filled(Landroid/view/View;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$200(Landroid/app/Activity;)Z
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->menu(Landroid/app/Activity;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$300()Z
  .registers 1
  .line 44
    sget-boolean v0, Lcom/innioasis/ipp/Nav;->keyList:Z
    return v0
.end method

.method static synthetic access$400(Landroid/app/Activity;)Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->sig(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500()Ljava/lang/String;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Nav;->keySig:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 44
    sget-boolean v0, Lcom/innioasis/ipp/Nav;->keyHalf:Z
    return v0
.end method

.method static synthetic access$700()I
  .registers 1
  .line 44
    sget v0, Lcom/innioasis/ipp/Nav;->keyEdge:I
    return v0
.end method

.method static synthetic access$800()Z
  .registers 1
  .line 44
    sget-boolean v0, Lcom/innioasis/ipp/Nav;->keyMenu:Z
    return v0
.end method

.method static synthetic access$900(Landroid/app/Activity;)I
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->top(Landroid/app/Activity;)I
    move-result p0
    return p0
.end method

.method public static arrive(Ljava/lang/Object;)V
  .catchall { :L0 .. :L11 } :L15
  .registers 6
  .line 76
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 78
    check-cast p0, Landroid/app/Activity;
  .line 79
    sget-object v0, Lcom/innioasis/ipp/Nav;->SEEN:Ljava/util/WeakHashMap;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    const/4 v1, 1
    const/4 v2, 0
    if-nez v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 80
    sget-object v3, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
    if-nez v3, :L3
    const/4 v3, 0
    goto :L4
  :L3
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/app/Activity;
  :L4
  .line 81
    if-ne v3, p0, :L5
    return-void
  :L5
  .line 82
    new-instance v4, Ljava/lang/ref/WeakReference;
    invoke-direct { v4, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v4, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
  .line 83
    sget-object v4, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
    if-eqz v4, :L6
    invoke-virtual { v4 }, Lcom/innioasis/ipp/Nav$Run;->end()V
  :L6
  .line 84
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  .line 85
    if-eqz v3, :L14
    invoke-static { }, Lcom/innioasis/ipp/Anim;->nav()Z
    move-result v4
    if-nez v4, :L7
    goto :L14
  :L7
  .line 86
    instance-of v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity;
    if-nez v4, :L13
    instance-of v4, p0, Lcom/innioasis/y1/activity/IppUsbActivity;
    if-nez v4, :L13
    instance-of v4, v3, Lcom/innioasis/y1/activity/IppSaverActivity;
    if-nez v4, :L13
    instance-of v4, v3, Lcom/innioasis/y1/activity/IppUsbActivity;
    if-eqz v4, :L8
    goto :L13
  :L8
  .line 89
    if-eqz v0, :L9
    invoke-virtual { v3 }, Landroid/app/Activity;->isFinishing()Z
    move-result v4
    if-nez v4, :L9
    const/4 v1, 0
    goto :L10
  :L9
  .line 90
    if-nez v0, :L12
    invoke-virtual { v3 }, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L12
  :L10
  .line 92
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav$Popups;->hide(Landroid/app/Activity;)V
  .line 93
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  .line 94
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v2, Lcom/innioasis/ipp/Nav$Start;
    invoke-direct { v2, p0, v3, v1 }, Lcom/innioasis/ipp/Nav$Start;-><init>(Landroid/app/Activity;Landroid/app/Activity;Z)V
    invoke-virtual { v0, v2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L11
  .line 96
    goto :L16
  :L12
  .line 91
    return-void
  :L13
  .line 87
    return-void
  :L14
  .line 85
    return-void
  :L15
  .line 95
    move-exception p0
  :L16
  .line 97
    return-void
.end method

.method private static buffer(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 4
  .line 249
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
    if-ne v0, p1, :L0
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
    if-ne v0, p2, :L0
    return-object p0
  :L0
  .line 250
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p2, p0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static filled(Landroid/view/View;)Z
  .registers 2
  .line 180
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->rowsIn(Landroid/view/View;)I
    move-result p0
  .line 181
    const/4 v0, 1
    if-eq p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static key(Ljava/lang/Object;Landroid/view/KeyEvent;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  .line 105
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L9
    if-eqz p1, :L9
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v0
    if-eqz v0, :L0
    goto :L9
  :L0
  .line 107
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
  .line 108
    sget-object v1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 109
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v2
    const/4 v3, 1
    if-ne v0, v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 110
    if-nez v2, :L3
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-eq v0, v1, :L3
    return-void
  :L3
  .line 111
    invoke-static { }, Lcom/innioasis/ipp/Anim;->nav()Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 112
    check-cast p0, Landroid/app/Activity;
  .line 113
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v0
    if-nez v0, :L5
  .line 114
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->snap(Landroid/app/Activity;)V
    goto :L6
  :L5
  .line 115
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result p1
    if-ne p1, v3, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->shotOf(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L6
  .line 116
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    new-instance v0, Lcom/innioasis/ipp/Nav$Level;
    invoke-direct { v0, p0, v2 }, Lcom/innioasis/ipp/Nav$Level;-><init>(Landroid/app/Activity;Z)V
    invoke-virtual { p1, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L6
  .line 119
    goto :L8
  :L7
  .line 118
    move-exception p0
  :L8
  .line 120
    return-void
  :L9
  .line 105
    return-void
.end method

.method private static left(Landroid/view/View;)I
  .registers 2
  .line 206
    sget-object v0, Lcom/innioasis/ipp/Nav;->LOC:[I
    invoke-virtual { p0, v0 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 207
    const/4 p0, 0
    aget p0, v0, p0
    return p0
.end method

.method private static listShot(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  .registers 6
  .line 241
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 242
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, p0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 243
    sget-object p0, Lcom/innioasis/ipp/Nav;->LOC:[I
    invoke-virtual { p1, p0 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 244
    aget v0, p0, v0
    int-to-float v0, v0
    const/4 v2, 1
    aget p0, p0, v2
    sub-int/2addr p0, p2
    int-to-float p0, p0
    invoke-virtual { v1, v0, p0 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 245
    invoke-virtual { p1, v1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 246
    return-void
.end method

.method private static menu(Landroid/app/Activity;)Z
  .registers 2
  .line 199
    instance-of v0, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity;
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 200
    const v0, 2131362153
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->rows(Landroid/view/View;)Z
    move-result p0
    return p0
  :L1
  .line 199
    const/4 p0, 0
    return p0
.end method

.method private static right(Landroid/view/View;)I
  .registers 3
  .line 211
    sget-object v0, Lcom/innioasis/ipp/Nav;->LOC:[I
    invoke-virtual { p0, v0 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 212
    const/4 v1, 0
    aget v0, v0, v1
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
    add-int/2addr v0, p0
    return v0
.end method

.method private static rowsIn(Landroid/view/View;)I
  .registers 5
  .line 186
    const/4 v0, 0
    if-eqz p0, :L10
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L0
    goto :L10
  :L0
  .line 187
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v2, 2
    const/4 v3, 1
    if-eqz v1, :L3
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p0
    if-lez p0, :L1
    goto :L2
  :L1
    const/4 v2, 1
  :L2
    return v2
  :L3
  .line 188
    instance-of v1, p0, Landroid/widget/AbsListView;
    if-eqz v1, :L6
    check-cast p0, Landroid/widget/AbsListView;
    invoke-virtual { p0 }, Landroid/widget/AbsListView;->getChildCount()I
    move-result p0
    if-lez p0, :L4
    goto :L5
  :L4
    const/4 v2, 1
  :L5
    return v2
  :L6
  .line 189
    nop
  .line 190
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L9
  .line 191
    check-cast p0, Landroid/view/ViewGroup;
  .line 192
    const/4 v1, 0
  :L7
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v0, v3, :L8
    if-ge v1, v2, :L8
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->rowsIn(Landroid/view/View;)I
    move-result v3
    invoke-static { v1, v3 }, Ljava/lang/Math;->max(II)I
    move-result v1
    add-int/lit8 v0, v0, 1
    goto :L7
  :L8
  .line 194
    move v0, v1
  :L9
    return v0
  :L10
  .line 186
    return v0
.end method

.method private static shotOf(Landroid/app/Activity;)Z
  .registers 5
  .line 123
    sget-object v0, Lcom/innioasis/ipp/Nav;->keyAct:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/Nav;->keyAt:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 3000
    cmp-long p0, v0, v2
    if-gez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static sig(Landroid/app/Activity;)Ljava/lang/String;
  .registers 4
  .line 153
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 154
    const v1, 2131362410
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 155
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L0
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
  :L0
  .line 156
    const v1, 2131362153
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Nav;->sigOf(Landroid/view/View;Ljava/lang/StringBuilder;)V
  .line 157
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static sigOf(Landroid/view/View;Ljava/lang/StringBuilder;)V
  .registers 4
  .line 161
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 162
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/16 v1, 124
    if-eqz v0, :L1
  .line 163
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-static { p0 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result p0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 164
    return-void
  :L1
  .line 166
    instance-of v0, p0, Landroid/widget/AbsListView;
    if-eqz v0, :L2
  .line 167
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    check-cast p0, Landroid/widget/AbsListView;
    invoke-virtual { p0 }, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;
    move-result-object p0
    invoke-static { p0 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result p0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 168
    return-void
  :L2
  .line 170
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L4
  .line 171
    check-cast p0, Landroid/view/ViewGroup;
  .line 172
    const/4 v0, 0
  :L3
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Nav;->sigOf(Landroid/view/View;Ljava/lang/StringBuilder;)V
    add-int/lit8 v0, v0, 1
    goto :L3
  :L4
  .line 174
    return-void
  :L5
  .line 161
    return-void
.end method

.method private static snap(Landroid/app/Activity;)V
  .registers 9
  .line 127
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Nav;->keyAct:Ljava/lang/ref/WeakReference;
  .line 128
    sget-object v0, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Nav$Run;->end()V
  :L0
  .line 129
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->half(Landroid/app/Activity;)Landroid/view/View;
    move-result-object v0
  .line 130
    const/4 v1, 1
    const/4 v2, 0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->menu(Landroid/app/Activity;)Z
    move-result v3
    if-eqz v3, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
  .line 131
    if-nez v0, :L3
    if-nez v3, :L3
    return-void
  :L3
  .line 132
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v4
  .line 133
    invoke-virtual { v4 }, Landroid/view/View;->getWidth()I
    move-result v5
    invoke-virtual { v4 }, Landroid/view/View;->getHeight()I
    move-result v4
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->top(Landroid/app/Activity;)I
    move-result v6
  .line 135
    if-lez v5, :L12
    if-lt v6, v4, :L4
    goto :L12
  :L4
  .line 136
    sget-object v7, Lcom/innioasis/ipp/Nav;->bufA:Landroid/graphics/Bitmap;
    sub-int/2addr v4, v6
    invoke-static { v7, v5, v4 }, Lcom/innioasis/ipp/Nav;->buffer(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v7
    sput-object v7, Lcom/innioasis/ipp/Nav;->bufA:Landroid/graphics/Bitmap;
  .line 137
    invoke-static { v7, p0, v6 }, Lcom/innioasis/ipp/Nav;->window(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  .line 138
    if-eqz v0, :L5
    const/4 v7, 1
    goto :L6
  :L5
    const/4 v7, 0
  :L6
    sput-boolean v7, Lcom/innioasis/ipp/Nav;->keyList:Z
  .line 139
    if-eqz v7, :L7
  .line 140
    sget-object v7, Lcom/innioasis/ipp/Nav;->bufB:Landroid/graphics/Bitmap;
    invoke-static { v7, v5, v4 }, Lcom/innioasis/ipp/Nav;->buffer(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v4
    sput-object v4, Lcom/innioasis/ipp/Nav;->bufB:Landroid/graphics/Bitmap;
  .line 141
    invoke-static { v4, v0, v6 }, Lcom/innioasis/ipp/Nav;->listShot(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  :L7
  .line 143
    if-eqz v0, :L8
    goto :L9
  :L8
    const/4 v1, 0
  :L9
    sput-boolean v1, Lcom/innioasis/ipp/Nav;->keyHalf:Z
  .line 144
    if-eqz v1, :L10
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->right(Landroid/view/View;)I
    move-result v0
    goto :L11
  :L10
    const/4 v0, -1
  :L11
    sput v0, Lcom/innioasis/ipp/Nav;->keyEdge:I
  .line 145
    sput-boolean v3, Lcom/innioasis/ipp/Nav;->keyMenu:Z
  .line 146
    invoke-static { p0 }, Lcom/innioasis/ipp/Nav;->sig(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Nav;->keySig:Ljava/lang/String;
  .line 147
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Nav;->keyAt:J
  .line 148
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Nav;->keyAct:Ljava/lang/ref/WeakReference;
  .line 149
    return-void
  :L12
  .line 135
    return-void
.end method

.method private static top(Landroid/app/Activity;)I
  .registers 3
  .line 217
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 218
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/view/View;->isShown()Z
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 219
    sget-object v0, Lcom/innioasis/ipp/Nav;->LOC:[I
    invoke-virtual { p0, v0 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 220
    const/4 v1, 1
    aget v0, v0, v1
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
    add-int/2addr v0, p0
    return v0
  :L1
  .line 218
    const/4 p0, 0
    return p0
.end method

.method private static window(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  .registers 6
  .line 225
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 226
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, p0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 227
    neg-int p0, p2
    int-to-float p0, p0
    const/4 p2, 0
    invoke-virtual { v1, p2, p0 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 228
    invoke-virtual { p1 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 229
    nop
  :L0
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result p1
    if-ge v0, p1, :L3
  .line 230
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 231
    invoke-virtual { p1 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L2
    instance-of p2, p1, Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p2, :L1
    goto :L2
  :L1
  .line 232
    invoke-virtual { v1 }, Landroid/graphics/Canvas;->save()I
  .line 233
    invoke-virtual { p1 }, Landroid/view/View;->getLeft()I
    move-result p2
    int-to-float p2, p2
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v2
    int-to-float v2, v2
    invoke-virtual { v1, p2, v2 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 234
    invoke-virtual { p1, v1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 235
    invoke-virtual { v1 }, Landroid/graphics/Canvas;->restore()V
  :L2
  .line 229
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 237
    return-void
.end method
