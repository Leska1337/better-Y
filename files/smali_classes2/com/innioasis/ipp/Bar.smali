.class public final Lcom/innioasis/ipp/Bar;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.implements Lcom/innioasis/ipp/Loop$Bumper;
.source "Bar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Bar$Spec;,
    Lcom/innioasis/ipp/Bar$HeadPaint;,
    Lcom/innioasis/ipp/Bar$Tinter;,
    Lcom/innioasis/ipp/Bar$Cursor;,
    Lcom/innioasis/ipp/Bar$Ticks;,
    Lcom/innioasis/ipp/Bar$PlatePart;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static BARS:Ljava/util/WeakHashMap;

.field private final static BLINK_MS:J = 700L

.field public final static CAPTION:Ljava/lang/Object;

.field private final static EMPTY:Landroid/graphics/drawable/Drawable;

.field private final static JUMP:I = 4

.field private final static MULTI:Ljava/util/HashMap;

.field private final static NO_KEY:J = 9223372036854775806L

.field private final static OMEGA:F = 30.0F

.field private final static OPEN_MS:J = 400L

.field private final static ROWS:Ljava/util/WeakHashMap;

.field private final static WHITE:I = -1

.field private final activity:Ljava/lang/ref/WeakReference;

.field private adapter:Ljava/lang/ref/WeakReference;

.field private blinkAt:J

.field private blinkOff:Z

.field private bounceGoal:F

.field private bouncing:Z

.field private hb:F

.field private final head:Ljava/lang/ref/WeakReference;

.field private headKey:J

.field private final headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;

.field private final headText:I

.field private last:J

.field private lastPos:I

.field private movedTo:F

.field private plateShare:F

.field private final rowProbe:Landroid/view/View;

.field private final rowText:I

.field private running:Z

.field private final rv:Ljava/lang/ref/WeakReference;

.field private final selProbe:Landroid/view/View;

.field private final selText:I

.field private final self:Ljava/lang/ref/WeakReference;

.field private snap:Z

.field private final spec:Lcom/innioasis/ipp/Bar$Spec;

.field private final standUntil:J

.field private stockHead:Z

.field private final tinter:Lcom/innioasis/ipp/Bar$Tinter;

.field private vel:F

.field private y:F

.method static constructor <clinit>()V
  .registers 2
  .line 230
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
  .line 425
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->CAPTION:Ljava/lang/Object;
  .line 506
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
  .line 575
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
  .line 674
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 9
  .line 273
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 240
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 242
    iput v0, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
  .line 248
    const/4 v1, -1
    iput v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 255
    iput v0, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 258
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
  .line 259
    new-instance v1, Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
  .line 261
    const-wide v1, 9223372036854775806L
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 267
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 400
    add-long/2addr v1, v3
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->standUntil:J
  .line 818
    new-instance v1, Ljava/lang/ref/WeakReference;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 938
    const/high16 v1, 0xBF800000
    iput v1, p0, Lcom/innioasis/ipp/Bar;->plateShare:F
  .line 1224
    new-instance v1, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 274
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 275
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 276
    iput-object p3, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
  .line 277
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    if-nez v1, :L0
    goto :L1
  :L0
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    invoke-virtual { p2, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
  :L1
  .line 278
    new-instance p2, Ljava/lang/ref/WeakReference;
    invoke-direct { p2, v2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
  .line 279
    if-eqz v2, :L2
    sget-object p2, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { p2, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 280
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 281
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 282
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 283
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 284
    iget-boolean v2, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    const/4 v3, 1
    const/4 v4, 0
    if-eqz v2, :L3
  .line 285
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 286
    iget p2, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    invoke-virtual { v1, v0, p2, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
    goto :L4
  :L3
  .line 288
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 289
    iget p2, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    invoke-virtual { v1, v0, p2, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 292
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 293
    iget-boolean p1, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    if-eqz p1, :L5
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { v1, p2, p1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L6
  :L5
  .line 294
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { v1, p2, p1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L6
  .line 295
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 296
    iget-boolean p1, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    if-eqz p1, :L7
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { v1, p2, p1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L8
  :L7
  .line 297
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { v1, p2, p1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 298
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 299
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz v0, :L9
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    invoke-virtual { v0, p2, v1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L9
  .line 300
    iget p3, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz p3, :L10
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
  :L10
    iput p1, p0, Lcom/innioasis/ipp/Bar;->headText:I
  .line 301
    return-void
.end method

.method static synthetic access$000(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 1
  .line 30
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->ofPlate(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/Bar;Landroid/graphics/Canvas;Landroid/view/View;)V
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->drawOnPlate(Landroid/graphics/Canvas;Landroid/view/View;)V
    return-void
.end method

.method static synthetic access$1000(Lcom/innioasis/ipp/Bar;)F
  .registers 1
  .line 30
    iget p0, p0, Lcom/innioasis/ipp/Bar;->hb:F
    return p0
.end method

.method static synthetic access$1100(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 30
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1200(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 30
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$1300(Lcom/innioasis/ipp/Bar;)Z
  .registers 1
  .line 30
    iget-boolean p0, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
    return p0
.end method

.method static synthetic access$1400(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 30
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->undressHead()V
    return-void
.end method

.method static synthetic access$1500(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 30
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
    return-void
.end method

.method static synthetic access$1600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 30
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
.end method

.method static synthetic access$1700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1800(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->follow(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$1900(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 30
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    return-object p0
.end method

.method static synthetic access$2000(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tintPlate(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$2100(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 30
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dressHead()V
    return-void
.end method

.method static synthetic access$2200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 30
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$2300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 30
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 30
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 30
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 30
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/Bar;)F
  .registers 1
  .line 30
    iget p0, p0, Lcom/innioasis/ipp/Bar;->y:F
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 30
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$800(Lcom/innioasis/ipp/Bar;)Z
  .registers 1
  .line 30
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result p0
    return p0
.end method

.method static synthetic access$900(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->headTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method public static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  :L0
  .line 309
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 310
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
  .line 311
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->specs(Lcom/innioasis/y1/base/BaseActivity;)[Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 312
    const/4 v1, 0
  :L2
    array-length v2, v0
    if-ge v1, v2, :L4
    aget-object v2, v0, v1
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Bar;->apply(Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  :L3
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 314
    goto :L6
  :L5
  .line 313
    move-exception p0
  :L6
  .line 315
    return-void
.end method

.method private static apply(Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 4
  .line 318
    iget v0, p1, Lcom/innioasis/ipp/Bar$Spec;->list:I
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 319
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  :L0
  .line 320
    return-void
.end method

.method private arrowOf(Landroid/view/View;)Landroid/view/View;
  .registers 4
  .line 1323
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 1324
    if-nez v0, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v1, v1, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
    if-eqz v1, :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L2
  .line 1325
    return-object v0
.end method

.method private static attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 356
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 357
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
  .line 358
    if-eqz v1, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
    if-ne v2, v3, :L3
    return-void
  :L3
  .line 359
    if-eqz v2, :L4
  .line 360
    new-instance v1, Lcom/innioasis/ipp/Bar;
    invoke-direct { v1, p1, p0, p2 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 361
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 362
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 363
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 364
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L5
  :L4
  .line 366
    invoke-virtual { v0, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 367
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 368
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 369
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p2 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 370
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->stop()V
  .line 371
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->undressHead()V
  :L5
  .line 373
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 374
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    if-eqz p0, :L6
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L6
  .line 376
    goto :L8
  :L7
  .line 375
    move-exception p0
  :L8
  .line 377
    return-void
.end method

.method private static blank(Landroid/view/View;)V
  .registers 4
  .line 514
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 515
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v2, -1
    if-eqz v1, :L1
  .line 516
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 517
    iget p0, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-eq p0, v2, :L0
    sget-object p0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L0
  .line 518
    goto :L2
  :L1
  .line 519
    new-instance v0, Lcom/innioasis/ipp/Rows$Flat;
    sget-object v1, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 520
    iput v2, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 521
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 523
    return-void
.end method

.method public static blink(Landroid/view/View;Z)Z
  .catchall { :L1 .. :L8 } :L11
  .registers 7
  .line 613
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p0, :L12
    const/4 v2, 3
    if-ge v1, v2, :L12
  :L1
  .line 614
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v2
  .line 615
    if-eqz v2, :L7
  .line 616
    iget-object p0, v2, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 617
    if-eqz p0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L6
  :L2
  .line 618
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    iput-wide v3, v2, Lcom/innioasis/ipp/Bar;->blinkAt:J
  .line 619
    iget-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    xor-int/lit8 v3, p1, 1
    const/4 v4, 1
    if-eq v1, v3, :L5
  .line 620
    if-nez p1, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    iput-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 621
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 623
    if-nez p1, :L5
    const-wide/16 v1, 700
    invoke-virtual { p0, v1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateDelayed(J)V
  :L5
  .line 625
    return v4
  :L6
  .line 617
    return v0
  :L7
  .line 627
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 628
    instance-of v2, p0, Landroid/view/View;
    if-eqz v2, :L9
    instance-of v2, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L9
    check-cast p0, Landroid/view/View;
  :L8
    goto :L10
  :L9
    const/4 p0, 0
  :L10
  .line 613
    add-int/lit8 v1, v1, 1
    goto :L0
  :L11
  .line 630
    move-exception p0
    goto :L13
  :L12
  .line 631
    nop
  :L13
  .line 632
    return v0
.end method

.method public static bound(Landroidx/viewbinding/ViewBinding;)V
  .registers 1
  .line 384
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 385
    return-void
.end method

.method private static caption(Landroid/view/View;)Z
  .registers 2
  .line 428
    invoke-virtual { p0 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object p0
    sget-object v0, Lcom/innioasis/ipp/Bar;->CAPTION:Ljava/lang/Object;
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private claims(Landroidx/recyclerview/widget/RecyclerView;IFZ)Z
  .registers 7
  .line 1046
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v1, 0
    if-nez v0, :L3
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-nez v0, :L3
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L3
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v0
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 1047
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    const/high16 v0, 0x3F000000
    cmpg-float p1, p1, v0
    if-gez p1, :L1
    return p4
  :L1
  .line 1048
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr p3, p1
    invoke-static { p3 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    int-to-float p2, p2
    const/high16 p3, 0x40800000
    div-float/2addr p2, p3
    cmpg-float p1, p1, p2
    if-gtz p1, :L2
    const/4 v1, 1
  :L2
    return v1
  :L3
  .line 1046
    return v1
.end method

.method private clean(Landroid/view/View;)V
  .registers 6
  .line 481
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 482
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
  .line 483
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    if-eq v2, v0, :L1
    invoke-virtual { v1, p1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 484
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v1, v1
    if-nez v1, :L2
  .line 485
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
    goto :L6
  :L2
  .line 487
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v2, v2
    if-ge v1, v2, :L6
  .line 488
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    aget v2, v2, v1
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 489
    if-nez v2, :L4
    goto :L5
  :L4
  .line 491
    sget-object v3, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 492
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L5
  .line 487
    add-int/lit8 v1, v1, 1
    goto :L3
  :L6
  .line 496
    const v1, 2131362549
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 497
    if-eqz v1, :L7
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :L7
  .line 498
    sget-object v2, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v2, v1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 499
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L7
  .line 501
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 502
    if-eqz v0, :L8
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L8
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L8
  .line 503
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  .line 504
    return-void
.end method

.method private cover(Landroidx/recyclerview/widget/RecyclerView;ILandroid/view/View;Z)F
  .registers 9
  .line 1030
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v1, 0
    if-nez v0, :L9
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-nez v0, :L9
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L9
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v0
    if-eqz v0, :L0
    goto :L9
  :L0
  .line 1031
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->bouncing:Z
    const/high16 v2, 0x3F800000
    if-nez v0, :L7
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    const/high16 v0, 0x3F000000
    cmpg-float p1, p1, v0
    if-gez p1, :L1
    goto :L7
  :L1
  .line 1032
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 1033
    iget p4, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { p4 }, Ljava/lang/Float;->isNaN(F)Z
    move-result p4
    if-eqz p4, :L2
    int-to-float p2, p2
    goto :L3
  :L2
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L3
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    add-int/2addr p2, p1
  .line 1034
    invoke-virtual { p3 }, Landroid/view/View;->getTop()I
    move-result p4
    int-to-float p4, p4
    invoke-virtual { p3 }, Landroid/view/View;->getTranslationY()F
    move-result v0
    add-float/2addr p4, v0
    invoke-static { p3 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v0
    int-to-float v0, v0
    add-float/2addr p4, v0
  .line 1035
    invoke-virtual { p3 }, Landroid/view/View;->getTop()I
    move-result v0
    int-to-float v0, v0
    invoke-virtual { p3 }, Landroid/view/View;->getTranslationY()F
    move-result v3
    add-float/2addr v0, v3
    invoke-virtual { p3 }, Landroid/view/View;->getHeight()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr v0, p3
  .line 1036
    cmpg-float p3, v0, p4
    if-gtz p3, :L4
    return v1
  :L4
  .line 1037
    int-to-float p2, p2
    invoke-static { v0, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    int-to-float p1, p1
    invoke-static { p4, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    sub-float/2addr p2, p1
  .line 1038
    cmpg-float p1, p2, v1
    if-gtz p1, :L5
    goto :L6
  :L5
    sub-float/2addr v0, p4
    div-float/2addr p2, v0
    invoke-static { v2, p2 }, Ljava/lang/Math;->min(FF)F
    move-result v1
  :L6
    return v1
  :L7
  .line 1031
    if-eqz p4, :L8
    const/high16 v1, 0x3F800000
  :L8
    return v1
  :L9
  .line 1030
    return v1
.end method

.method private static crosses(Landroidx/recyclerview/widget/RecyclerView;FFFF)Z
  .registers 10
  .line 450
    sub-float v0, p3, p1
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    const/high16 v1, 0x3F000000
    const/4 v2, 0
    cmpg-float v0, v0, v1
    if-gez v0, :L0
    return v2
  :L0
  .line 451
    const/4 v0, 1
    cmpl-float v1, p3, p1
    if-lez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 452
    if-eqz v1, :L3
    add-float/2addr p2, p1
    goto :L4
  :L3
    add-float p2, p3, p4
  :L4
  .line 453
    if-eqz v1, :L5
    move p1, p3
  :L5
  .line 455
    const/high16 p3, 0xBF800000
    cmpg-float p3, p2, p3
    if-gez p3, :L6
    const/4 p3, 0
    cmpl-float p3, p1, p3
    if-ltz p3, :L6
    return v0
  :L6
  .line 456
    const/4 p3, 0
  :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p4
    if-ge p3, p4, :L10
  .line 457
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object p4
  .line 458
    invoke-static { p4 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v1
    if-nez v1, :L8
    goto :L9
  :L8
  .line 459
    invoke-virtual { p4 }, Landroid/view/View;->getTop()I
    move-result v1
    int-to-float v1, v1
    invoke-virtual { p4 }, Landroid/view/View;->getTranslationY()F
    move-result v3
    add-float/2addr v1, v3
  .line 460
    const/high16 v3, 0x3F800000
    sub-float v4, p2, v3
    cmpl-float v4, v1, v4
    if-ltz v4, :L9
    invoke-virtual { p4 }, Landroid/view/View;->getHeight()I
    move-result p4
    int-to-float p4, p4
    add-float/2addr v1, p4
    add-float/2addr v3, p1
    cmpg-float p4, v1, v3
    if-gtz p4, :L9
    return v0
  :L9
  .line 456
    add-int/lit8 p3, p3, 1
    goto :L7
  :L10
  .line 462
    return v2
.end method

.method private cursor()I
  .registers 4
  .line 737
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-boolean v0, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
    const/4 v1, -1
    if-eqz v0, :L5
  .line 738
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 739
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 740
    instance-of v2, v0, Lcom/innioasis/ipp/Bar$Cursor;
    if-eqz v2, :L2
    check-cast v0, Lcom/innioasis/ipp/Bar$Cursor;
    invoke-interface { v0 }, Lcom/innioasis/ipp/Bar$Cursor;->cursor()I
    move-result v0
    return v0
  :L2
  .line 741
    instance-of v2, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L3
  .line 742
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L3
  .line 744
    instance-of v2, v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v2, :L4
  .line 745
    check-cast v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L4
  .line 747
    return v1
  :L5
  .line 749
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 750
    if-nez v0, :L6
    goto :L7
  :L6
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v1, v1, Lcom/innioasis/ipp/Bar$Spec;->markBase:I
    sub-int v1, v0, v1
  :L7
    return v1
.end method

.method private cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 3
  .line 851
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 852
    instance-of v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v0, :L0
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return-object p1
.end method

.method private dark()Z
  .registers 7
  .line 643
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 644
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iget-wide v4, p0, Lcom/innioasis/ipp/Bar;->blinkAt:J
    sub-long/2addr v2, v4
    const-wide/16 v4, 700
    cmp-long v0, v2, v4
    if-gez v0, :L2
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->multi()Z
    move-result v0
    if-nez v0, :L1
    goto :L2
  :L1
  .line 648
    const/4 v0, 1
    return v0
  :L2
  .line 645
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 646
    return v1
.end method

.method static defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 4
  .line 841
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 842
    if-eqz v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 843
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 844
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 845
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 846
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 847
    return v1
  :L3
  .line 842
    const/4 p0, 0
    return p0
.end method

.method static dialog(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 12
  .line 328
    const v0, 2131362413
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 329
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L1
  .line 330
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v1, :L2
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L2
  .line 331
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
    goto :L1
  :L2
  .line 333
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L6
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v1, :L3
    goto :L6
  :L3
  .line 334
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
  .line 335
    new-instance v9, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131362413
    const v3, 2131231051
    const/4 v4, 0
  .line 336
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v5, 2131100253
    invoke-virtual { v1, v5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 337
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v6, 2131100267
    invoke-virtual { v1, v6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
    const v10, 2131362414
    filled-new-array { v10 }, [I
    move-result-object v7
    const/4 v8, 0
    move-object v1, v9
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 338
    filled-new-array { v10 }, [I
    move-result-object v1
    iput-object v1, v9, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 339
    const/4 v1, 1
    iput-boolean v1, v9, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 340
    iput-boolean v1, v9, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
  .line 341
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 342
    invoke-static { p0, v0, v9 }, Lcom/innioasis/ipp/Bar;->attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 344
    sget-object p0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { p0, v0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  .line 345
    if-eqz p0, :L4
  .line 346
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v1, v2 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 347
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v1, p0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L4
  .line 349
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  :L5
  .line 351
    goto :L8
  :L6
  .line 333
    return-void
  :L7
  .line 350
    move-exception p0
  :L8
  .line 352
    return-void
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 13
  .line 1335
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 1336
    if-nez p2, :L0
    return-void
  :L0
  .line 1337
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 1339
    if-eqz v0, :L8
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    const/16 v2, 8
    if-eq v1, v2, :L8
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-nez v1, :L1
    goto/16 :L8
  :L1
  .line 1341
    nop
  .line 1342
    const/4 v1, 0
    move-object v3, v0
    const/4 v2, 0
  :L2
    const/4 v4, 0
    if-eqz v3, :L5
    if-eq v3, p2, :L5
  .line 1343
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v5
    add-int/2addr v1, v5
  .line 1344
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v5
    add-int/2addr v2, v5
  .line 1345
    invoke-virtual { v3 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
  .line 1346
    instance-of v5, v3, Landroid/view/View;
    if-eqz v5, :L3
    check-cast v3, Landroid/view/View;
    goto :L4
  :L3
    move-object v3, v4
  :L4
  .line 1347
    goto :L2
  :L5
  .line 1348
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v3
  .line 1349
    invoke-virtual { p2 }, Landroid/view/View;->getHeight()I
    move-result v5
    sub-int/2addr v5, v3
  .line 1350
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result v6
    add-int/2addr v6, v1
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v7
    add-int/2addr v6, v7
  .line 1351
    instance-of v7, v0, Landroid/widget/ImageView;
    if-eqz v7, :L6
    move-object v4, v0
    check-cast v4, Landroid/widget/ImageView;
    invoke-virtual { v4 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  :L6
  .line 1352
    if-eqz v4, :L7
    if-lez p4, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v7
    add-int/lit8 v5, v5, -1
    if-lt v7, v5, :L7
  .line 1353
    invoke-virtual { v4 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v5
    if-lez v5, :L7
    invoke-virtual { v4 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v5
    if-lez v5, :L7
  .line 1354
    invoke-virtual { v4 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result p2
    int-to-float p2, p2
    int-to-float v0, p4
    mul-float p2, p2, v0
    invoke-virtual { v4 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v0
    int-to-float v0, v0
    div-float/2addr p2, v0
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
  .line 1355
    invoke-virtual { v4 }, Landroid/graphics/drawable/Drawable;->copyBounds()Landroid/graphics/Rect;
    move-result-object v0
  .line 1356
    sub-int p2, v6, p2
    add-int/2addr p4, p3
    invoke-virtual { v4, p2, p3, v6, p4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1357
    invoke-virtual { v4, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 1358
    invoke-virtual { v4, v0 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  .line 1359
    return-void
  :L7
  .line 1361
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 1362
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result v4
    invoke-virtual { p2 }, Landroid/view/View;->getRight()I
    move-result v5
    add-int/2addr p4, p3
    invoke-virtual { p1, v4, p3, v5, p4 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 1363
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result p2
    add-int/2addr p2, v1
    int-to-float p2, p2
    add-int/2addr p3, v2
    sub-int/2addr p3, v3
    int-to-float p3, p3
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 1364
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 1365
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1366
    return-void
  :L8
  .line 1339
    return-void
.end method

.method private drawOnPlate(Landroid/graphics/Canvas;Landroid/view/View;)V
  .registers 13
  .line 953
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 954
    if-eqz v0, :L6
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-eqz v1, :L6
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-eqz v1, :L6
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v1
    if-nez v1, :L6
    iget-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez v1, :L6
    iget v1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v1 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v1
    if-eqz v1, :L0
    goto/16 :L6
  :L0
  .line 955
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L1
    return-void
  :L1
  .line 956
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 957
    if-nez v1, :L2
    return-void
  :L2
  .line 958
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 959
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Bar;->plateTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)F
    move-result v3
  .line 960
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
  .line 961
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    if-eqz v5, :L3
    int-to-float v2, v2
    goto :L4
  :L3
    iget v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L4
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
  .line 962
    int-to-float v5, v4
    invoke-static { v5, v3 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    add-int v6, v4, v2
    int-to-float v6, v6
    invoke-virtual { p2 }, Landroid/view/View;->getHeight()I
    move-result v7
    int-to-float v7, v7
    add-float/2addr v7, v3
    invoke-static { v6, v7 }, Ljava/lang/Math;->min(FF)F
    move-result v6
  .line 963
    cmpg-float v7, v6, v5
    if-gtz v7, :L5
    return-void
  :L5
  .line 964
    const/4 v7, 0
    invoke-virtual { v0, v7 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 965
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result v8
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLeft()I
    move-result v9
    sub-int/2addr v8, v9
  .line 966
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 967
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 968
    int-to-float v9, v3
    sub-float/2addr v5, v9
    invoke-virtual { p2 }, Landroid/view/View;->getWidth()I
    move-result p2
    int-to-float p2, p2
    sub-float/2addr v6, v9
    const/4 v9, 0
    invoke-virtual { p1, v9, v5, p2, v6 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 969
    invoke-virtual { v7 }, Landroid/view/View;->getLeft()I
    move-result p2
    sub-int/2addr p2, v8
    sub-int v5, v4, v3
    invoke-virtual { v7 }, Landroid/view/View;->getRight()I
    move-result v6
    sub-int/2addr v6, v8
    add-int v7, v5, v2
    invoke-virtual { v1, p2, v5, v6, v7 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 970
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 972
    neg-int p2, v8
    int-to-float p2, p2
    neg-int v1, v3
    int-to-float v1, v1
    invoke-virtual { p1, p2, v1 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 973
    invoke-direct { p0, p1, v0, v4, v2 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 974
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 975
    return-void
  :L6
  .line 954
    return-void
.end method

.method private dressHead()V
  .registers 5
  .line 1070
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 1071
    if-nez v0, :L0
    return-void
  :L0
  .line 1072
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
  .line 1073
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 1074
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v3, -1
    if-eqz v2, :L2
  .line 1075
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
  .line 1076
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Rows$Flat;->inner()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    if-eq v0, v2, :L1
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L1
  .line 1077
    goto :L3
  :L2
  .line 1078
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 1079
    iput v3, v1, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 1080
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 1082
    return-void
.end method

.method private dressed()Z
  .registers 3
  .line 1085
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 1086
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  :L1
  .line 1087
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L2
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Rows$Flat;->inner()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    if-ne v0, v1, :L2
    const/4 v0, 1
    goto :L3
  :L2
    const/4 v0, 0
  :L3
    return v0
.end method

.method private follow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 1210
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L5
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez v0, :L5
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 1211
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
  .line 1212
    iget v1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float v1, v0, v1
    if-nez v1, :L1
    iget v1, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v2, p2
    cmpl-float v1, v1, v2
    if-nez v1, :L1
    return-void
  :L1
  .line 1213
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->opening()Z
    move-result v1
    if-eqz v1, :L3
  .line 1214
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1215
    int-to-float p2, p2
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 1216
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 1217
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p1
  .line 1218
    if-eqz p1, :L2
    invoke-virtual { p1 }, Landroid/view/View;->invalidate()V
  :L2
  .line 1219
    goto :L4
  :L3
  .line 1220
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L4
  .line 1222
    return-void
  :L5
  .line 1210
    return-void
.end method

.method private static followText(Landroid/view/View;Ljava/lang/Object;I)V
  .registers 4
  .line 1166
    instance-of v0, p1, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v0, :L0
  .line 1167
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->listRow(Landroid/view/View;)V
    goto :L5
  :L0
  .line 1168
    instance-of v0, p1, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v0, :L1
  .line 1169
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->librarySub(Landroid/view/View;)V
    goto :L5
  :L1
  .line 1170
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v0, :L2
  .line 1171
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tinted(Landroid/view/View;)V
    goto :L5
  :L2
  .line 1172
    instance-of v0, p1, Lcom/innioasis/music/SongListActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/AlbumsActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/FilesActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/y1/activity/PlayerActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/MusicMainActivity;
    if-nez v0, :L4
    instance-of v0, p1, Lcom/innioasis/y1/activity/EbookActivity;
    if-eqz v0, :L3
    goto :L4
  :L3
  .line 1184
    instance-of p1, p1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz p1, :L5
  .line 1185
    const p1, 2131362040
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 1187
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L5
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object p1
    if-eqz p1, :L5
  .line 1188
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
    goto :L5
  :L4
  .line 1183
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->tinted(Landroid/view/View;)V
  :L5
  .line 1191
    return-void
.end method

.method private head()Landroid/view/View;
  .registers 3
  .line 761
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 762
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->isShown()Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return-object v0
.end method

.method private static headTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
  .registers 4
  .line 771
    invoke-virtual { p1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    if-ne v0, v1, :L0
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getTop()I
    move-result p0
    sub-int/2addr p1, p0
    return p1
  :L0
  .line 772
    const/4 v0, 2
    new-array v1, v0, [I
  .line 773
    new-array v0, v0, [I
  .line 774
    invoke-virtual { p1, v1 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 775
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLocationInWindow([I)V
  .line 776
    const/4 p0, 1
    aget p1, v1, p0
    aget p0, v0, p0
    sub-int/2addr p1, p0
    return p1
.end method

.method private height(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 6
  .line 1195
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 1196
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p1
    return p1
  :L2
  .line 1197
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 1198
    const/4 v1, 0
    const/4 v2, 0
  :L3
    if-nez v0, :L5
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L5
  .line 1199
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L4
  .line 1198
    add-int/lit8 v2, v2, 1
    goto :L3
  :L5
  .line 1201
    if-nez v0, :L6
    goto :L7
  :L6
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p1
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v0
    sub-int v1, p1, v0
  :L7
    return v1
.end method

.method public static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 7
  .line 583
    const/4 v0, 0
    if-nez p0, :L0
    const/4 v1, 0
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  :L1
  .line 584
    if-eqz v1, :L13
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-eqz v2, :L13
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L2
    goto/16 :L13
  :L2
  .line 585
    iget-boolean v2, v1, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 1
    if-eqz v2, :L4
    sget-boolean p0, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz p0, :L3
    const-string p0, "holds snap"
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L3
    return v3
  :L4
  .line 586
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v2
  .line 587
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v4
    invoke-virtual { v4 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v4
  .line 588
    if-lez p1, :L5
    sub-int/2addr v4, v3
    if-lt v2, v4, :L7
    goto :L6
  :L5
    if-gtz v2, :L7
  :L6
    const/4 p1, 1
    goto :L8
  :L7
    const/4 p1, 0
  :L8
  .line 590
    if-eqz p1, :L10
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    instance-of v1, v1, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L10
  .line 591
    invoke-static { }, Lcom/innioasis/ipp/Loop;->swallow()Z
    move-result v1
    if-eqz v1, :L9
    return v3
  :L9
  .line 592
    invoke-static { }, Lcom/innioasis/ipp/Loop;->noteWrap()V
  :L10
  .line 594
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v1
    const/4 v3, 0
    cmpl-float v1, v1, v3
    if-nez v1, :L11
    return v0
  :L11
  .line 595
    if-eqz p1, :L12
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz v1, :L12
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "holds end m "
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " left "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L12
  .line 596
    return p1
  :L13
  .line 584
    return v0
  :L14
  .line 597
    move-exception p0
  .line 598
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 528
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 529
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
  .line 530
    const/4 v2, 1
    if-eqz v1, :L4
  .line 531
    iget-object v3, v1, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-ne p0, v3, :L2
  .line 533
    iget-object p0, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 534
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p0
    if-lez p0, :L1
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->dressHead()V
  :L1
  .line 535
    goto :L3
  :L2
  .line 536
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L3
  .line 538
    return v2
  :L4
  .line 540
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L5
  .line 541
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L9
  .line 542
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 543
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L7
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L6
    goto :L7
  :L6
  .line 548
    goto :L5
  :L7
  .line 544
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 545
    if-eqz p0, :L8
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L8
  .line 546
    return v2
  :L9
  .line 550
    goto :L11
  :L10
  .line 549
    move-exception p0
  :L11
  .line 551
    return v0
.end method

.method private static live(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 418
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static mix(IIF)I
  .registers 8
  .line 1017
    nop
  .line 1018
    const/4 v0, 0
    const/4 v1, 0
  :L0
    const/16 v2, 32
    if-ge v0, v2, :L1
  .line 1019
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 1020
    int-to-float v4, v2
    sub-int/2addr v3, v2
    int-to-float v2, v3
    mul-float v2, v2, p2
    add-float/2addr v4, v2
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v2
    and-int/lit16 v2, v2, 255
    shl-int/2addr v2, v0
    or-int/2addr v1, v2
  .line 1018
    add-int/lit8 v0, v0, 8
    goto :L0
  :L1
  .line 1022
    return v1
.end method

.method private multi()Z
  .catchall { :L0 .. :L1 } :L10
  .catch Ljava/lang/NoSuchFieldException; { :L2 .. :L3 } :L4
  .catchall { :L2 .. :L3 } :L10
  .catchall { :L5 .. :L8 } :L10
  .registers 7
  .line 653
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 654
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 656
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
  .line 657
    sget-object v3, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L1
  .line 658
    const/4 v4, 1
    if-nez v3, :L7
  :L2
  .line 660
    const-string v3, "isMultiSelect"
    invoke-virtual { v2, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v3
  .line 661
    invoke-virtual { v3, v4 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  :L3
  .line 662
    nop
  .line 665
    goto :L6
  :L4
  .line 663
    move-exception v3
  :L5
  .line 664
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
  :L6
  .line 666
    sget-object v5, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v5, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 668
    instance-of v2, v3, Ljava/lang/reflect/Field;
    if-eqz v2, :L9
    check-cast v3, Ljava/lang/reflect/Field;
    invoke-virtual { v3, v0 }, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    move-result v0
  :L8
    if-eqz v0, :L9
    const/4 v1, 1
  :L9
    return v1
  :L10
  .line 669
    move-exception v0
  .line 670
    return v1
.end method

.method private observe()V
  .registers 4
  .line 804
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 805
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 806
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v0, :L2
  .line 808
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 809
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 810
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 811
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  :L2
  .line 813
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 814
    iget v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
    if-ltz v1, :L3
    sub-int v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->abs(I)I
    move-result v1
    const/4 v2, 4
    if-le v1, v2, :L3
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  :L3
  .line 815
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 816
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 5
  .line 564
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 565
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v2, 0
    if-eqz v1, :L0
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, v0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
    goto :L1
  :L0
    move-object v0, v2
  :L1
  .line 566
    if-eqz v0, :L3
  .line 567
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    iget-object v3, v0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
    if-eq v2, v3, :L2
    invoke-virtual { v1, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 568
    return-object v0
  :L3
  .line 570
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 571
    if-nez p0, :L4
    move-object p0, v2
    goto :L5
  :L4
    check-cast p0, Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L5
  .line 572
    if-eqz p0, :L6
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsValue(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    move-object v2, p0
  :L6
    return-object v2
.end method

.method private static ofPlate(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 5
  .line 979
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 980
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L0
  .line 981
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L2
  .line 982
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/util/Map$Entry;
  .line 983
    invoke-interface { v1 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
  .line 984
    instance-of v3, v2, Landroid/view/View;
    if-eqz v3, :L1
    check-cast v2, Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-ne v2, p0, :L1
    invoke-interface { v1 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
    return-object p0
  :L1
  .line 985
    goto :L0
  :L2
  .line 986
    const/4 p0, 0
    return-object p0
.end method

.method static on(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 472
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-eqz v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private onHead()Z
  .registers 3
  .line 766
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
    const/4 v1, -1
    if-ne v0, v1, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private onList(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 4
  .line 755
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 756
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
    if-eqz v1, :L0
    if-ltz v0, :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p1
    if-lt v0, p1, :L1
  :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result p1
    if-eqz p1, :L2
  :L1
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    return p1
.end method

.method private opening()Z
  .registers 6
  .line 270
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/innioasis/ipp/Bar;->standUntil:J
    cmp-long v4, v0, v2
    if-gez v4, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method static owns(Landroid/view/View;)Z
  .registers 1
  .line 560
    if-eqz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
  .registers 12
  .line 216
    new-instance v8, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131231050
    const v3, 2131231044
  .line 217
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v4
  .line 218
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v0, 2131100267
    invoke-virtual { p0, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
    const v7, 2131362144
    move-object v0, v8
    move v1, p1
    move-object v6, p2
    invoke-direct/range { v0 .. v7 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 216
    return-object v8
.end method

.method private static plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 4
  .line 928
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 929
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-eqz v0, :L0
    move-object v0, p0
    check-cast v0, Landroid/view/View;
    const v2, 2131362548
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    move-object v0, v1
  :L1
  .line 930
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-ne v2, p0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result p0
    if-eqz p0, :L2
    goto :L3
  :L2
    move-object v1, v0
  :L3
    return-object v1
.end method

.method private static plateTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)F
  .registers 3
  .line 935
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v0
    int-to-float v0, v0
    invoke-virtual { p1 }, Landroid/view/View;->getTranslationY()F
    move-result p1
    add-float/2addr v0, p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getTop()I
    move-result p0
    int-to-float p0, p0
    sub-float/2addr v0, p0
    return v0
.end method

.method private refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 9
  .line 1110
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 1111
    if-nez v0, :L0
    return-void
  :L0
  .line 1112
    iget v1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v1 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v1
    if-nez v1, :L2
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p1
    if-eqz p1, :L2
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result p1
    if-eqz p1, :L1
    goto :L2
  :L1
  .line 1113
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    int-to-long v1, p1
    const/16 p1, 32
    shl-long/2addr v1, p1
    iget p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    int-to-long v3, p1
    const-wide v5, 4294967295L
    and-long/2addr v3, v5
    xor-long/2addr v1, v3
    goto :L3
  :L2
  .line 1112
    const-wide v1, 9223372036854775806L
  :L3
  .line 1114
    iget-wide v3, p0, Lcom/innioasis/ipp/Bar;->headKey:J
    cmp-long p1, v1, v3
    if-nez p1, :L4
    return-void
  :L4
  .line 1115
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 1116
    invoke-virtual { v0 }, Landroid/view/View;->invalidate()V
  .line 1117
    return-void
.end method

.method public static relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 3
  .line 684
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 685
    const/4 v0, 0
    if-nez p0, :L2
    return v0
  :L2
  .line 686
    const/high16 v1, 0x7FC00000
    iput v1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 687
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 688
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 689
    const/4 p0, 1
    return p0
.end method

.method public static relisted(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 699
    if-eqz p0, :L7
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L7
  :L1
  .line 700
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 701
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L4
  .line 702
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 703
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 704
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-ne v2, p0, :L3
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  :L3
  .line 705
    goto :L2
  :L4
  .line 707
    goto :L6
  :L5
  .line 706
    move-exception p0
  :L6
  .line 708
    return-void
  :L7
  .line 699
    return-void
.end method

.method public static row(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 390
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  :L1
  .line 391
    if-nez v0, :L2
    return-void
  :L2
  .line 392
    iget-object v1, v0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 393
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L3
    goto :L6
  :L3
  .line 395
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-ne v2, v1, :L4
    invoke-virtual { v1, p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v3
    if-ne v2, v3, :L4
    const/4 v2, 0
    iput-boolean v2, v0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  :L4
  .line 396
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  .line 399
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L5
  .line 401
    goto :L8
  :L6
  .line 393
    return-void
  :L7
  .line 400
    move-exception p0
  :L8
  .line 402
    return-void
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 822
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 824
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->isLayoutRequested()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 825
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 826
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 827
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 824
    return v1
  :L2
  .line 828
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 829
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 830
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L3
  .line 832
    const/4 p1, 1
    return p1
.end method

.method private share(Landroidx/recyclerview/widget/RecyclerView;IFF)F
  .registers 7
  .line 917
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v1, 0
    if-nez v0, :L5
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-nez v0, :L5
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p1
    if-eqz p1, :L5
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result p1
    if-nez p1, :L5
    cmpg-float p1, p4, p3
    if-gtz p1, :L0
    goto :L5
  :L0
  .line 918
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    int-to-float p1, p1
  .line 919
    iget v0, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L1
    int-to-float p2, p2
    goto :L2
  :L1
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L2
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    int-to-float p2, p2
    add-float/2addr p2, p1
  .line 920
    invoke-static { p2, p4 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    invoke-static { p1, p3 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    sub-float/2addr p2, p1
  .line 921
    cmpg-float p1, p2, v1
    if-gtz p1, :L3
    goto :L4
  :L3
    sub-float/2addr p4, p3
    div-float/2addr p2, p4
    const/high16 p1, 0x3F800000
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result v1
  :L4
    return v1
  :L5
  .line 917
    return v1
.end method

.method private static spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
  .registers 27
  .line 71
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/MainActivity;
    const v2, 2131100267
    const v3, 2131362491
    const v4, 2131100252
    if-eqz v1, :L0
  .line 72
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v6, 2131362308
    const v7, 2131231052
    const v8, 2131231044
  .line 73
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
  .line 74
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v10
    filled-new-array { v3 }, [I
    move-result-object v11
    const v12, 2131362144
    move-object v5, v1
    invoke-direct/range { v5 .. v12 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 72
    return-object v1
  :L0
  .line 76
    instance-of v1, v0, Lcom/innioasis/y1/activity/SettingActivity;
    const v5, 2131362459
    const v6, 2131362437
    if-eqz v1, :L1
  .line 77
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131231052
    const/4 v10, 0
    const v11, -12779554
    const/4 v12, -1
    filled-new-array { v5, v6 }, [I
    move-result-object v13
    const v14, 2131361881
    move-object v7, v0
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object v0
  :L1
  .line 80
    instance-of v1, v0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L2
  .line 81
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131231050
    const v10, 2131231044
  .line 82
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v11
  .line 83
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v12
    filled-new-array { v3 }, [I
    move-result-object v13
    const v14, 2131362144
    move-object v7, v1
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 81
    return-object v1
  :L2
  .line 85
    instance-of v1, v0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L3
  .line 86
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131231050
    const/4 v10, 0
    const v11, -12779554
    const/4 v12, -1
    filled-new-array { v5, v6 }, [I
    move-result-object v13
    const v14, 2131361881
    move-object v7, v0
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object v0
  :L3
  .line 89
    instance-of v1, v0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v1, :L4
  .line 90
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362312
    const v9, 2131231050
    const/4 v10, 0
    const v11, -12779554
    const/4 v12, -1
    filled-new-array { v6 }, [I
    move-result-object v13
    const/4 v14, 0
    move-object v7, v0
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object v0
  :L4
  .line 93
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    const v7, 2131362042
    if-eqz v1, :L5
  .line 94
    const v1, 2131362520
    const v2, 2131362521
    filled-new-array { v7, v1, v2 }, [I
    move-result-object v1
    const v2, 2131362310
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 95
    const v1, 2131362519
    const v2, 2131362041
    filled-new-array { v1, v2 }, [I
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 96
    return-object v0
  :L5
  .line 98
    instance-of v1, v0, Lcom/innioasis/music/SearchActivity;
    const v8, 2131362353
    const/4 v9, 1
    if-nez v1, :L32
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-eqz v1, :L6
    goto/16 :L32
  :L6
  .line 105
    instance-of v1, v0, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v1, :L7
  .line 106
    const v1, 2131362298
    filled-new-array { v3 }, [I
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 107
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 108
    return-object v0
  :L7
  .line 110
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v1, :L8
  .line 112
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v11, 2131362310
    const v12, 2131231052
    const/4 v13, 0
    const v14, -12779554
    const/4 v15, -1
    filled-new-array { v5, v6, v3 }, [I
    move-result-object v16
    const/16 v17, 0
    move-object v10, v1
    invoke-direct/range { v10 .. v17 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 114
    iput v8, v1, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 115
    const v2, 2131231052
    iput v2, v1, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
  .line 116
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
    iput v0, v1, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
  .line 117
    return-object v1
  :L8
  .line 119
    instance-of v1, v0, Lcom/innioasis/music/SongListActivity;
    if-nez v1, :L31
    instance-of v1, v0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L9
    goto/16 :L31
  :L9
  .line 129
    instance-of v1, v0, Lcom/innioasis/music/GenresActivity;
    const v5, 2131362144
    if-nez v1, :L30
    instance-of v1, v0, Lcom/innioasis/music/AlbumsActivity;
    if-nez v1, :L30
    instance-of v1, v0, Lcom/innioasis/music/ArtistsActivity;
    if-eqz v1, :L10
    goto/16 :L30
  :L10
  .line 142
    instance-of v1, v0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    const v8, 2131362181
    if-nez v1, :L27
    instance-of v1, v0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz v1, :L11
    goto/16 :L27
  :L11
  .line 153
    instance-of v1, v0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v1, :L12
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v10
    if-nez v10, :L13
  :L12
    instance-of v10, v0, Lcom/innioasis/y1_eBook/ui/search/SearchActivity;
    if-eqz v10, :L19
  :L13
  .line 156
    nop
  .line 157
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v12, 2131362311
    const v13, 2131230823
    const/4 v14, 0
    const v15, -12779554
    const/16 v16, -1
  .line 158
    const v2, 2131362455
    const v3, 2131362252
    if-eqz v1, :L14
    const v4, 2131362301
    goto :L15
  :L14
    const v4, 2131362376
  :L15
    filled-new-array { v3, v4, v2 }, [I
    move-result-object v2
    move-object/from16 v17, v2
  .line 159
    if-eqz v1, :L16
    const v18, 2131362144
    goto :L17
  :L16
    const/4 v5, 0
    const/16 v18, 0
  :L17
    move-object v11, v0
    invoke-direct/range { v11 .. v18 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 160
    const v2, 2131362152
    filled-new-array { v2 }, [I
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 161
    if-eqz v1, :L18
    invoke-static { }, Lcom/innioasis/ipp/Ebook;->firstMark()I
    move-result v1
    iput v1, v0, Lcom/innioasis/ipp/Bar$Spec;->markBase:I
  :L18
  .line 162
    return-object v0
  :L19
  .line 164
    instance-of v5, v0, Lcom/innioasis/music/MusicMainActivity;
    if-nez v5, :L24
    instance-of v5, v0, Lcom/innioasis/y1/activity/EbookActivity;
    if-nez v5, :L24
    if-eqz v1, :L20
    goto :L24
  :L20
  .line 173
    instance-of v1, v0, Lcom/innioasis/y1/activity/PlayerActivity;
    if-eqz v1, :L21
  .line 175
    filled-new-array { v3 }, [I
    move-result-object v1
    invoke-static { v0, v8, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 176
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 177
    return-object v0
  :L21
  .line 179
    instance-of v1, v0, Lcom/innioasis/music/FilesActivity;
    if-eqz v1, :L22
  .line 181
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v11, 2131362180
    const v12, 2131231050
    const v13, 2131231044
  .line 182
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 183
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v15
    filled-new-array { v7 }, [I
    move-result-object v16
    const v17, 2131362321
    move-object v10, v1
    invoke-direct/range { v10 .. v17 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 185
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 186
    return-object v1
  :L22
  .line 188
    instance-of v0, v0, Lcom/innioasis/fm/MenuActivity;
    if-eqz v0, :L23
  .line 190
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131230823
    const/4 v10, 0
    const v11, -12779554
    const/4 v12, -1
    filled-new-array { v3, v6 }, [I
    move-result-object v13
    const v14, 2131362144
    move-object v7, v0
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object v0
  :L23
  .line 193
    const/4 v0, 0
    return-object v0
  :L24
  .line 168
    nop
  .line 169
    if-eqz v1, :L25
    const v1, 2131362552
    goto :L26
  :L25
    const v1, 2131362180
  :L26
    filled-new-array { v3 }, [I
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 170
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 171
    return-object v0
  :L27
  .line 145
    instance-of v1, v0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz v1, :L28
    const v8, 2131362182
    const v11, 2131362182
    goto :L29
  :L28
    const v11, 2131362181
  :L29
  .line 146
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v12, 2131231050
    const v13, 2131231044
  .line 147
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 148
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v15
    const v0, 2131362492
    const v2, 2131362495
    const v3, 2131362558
    filled-new-array { v3, v0, v2 }, [I
    move-result-object v16
    const/16 v17, 0
    move-object v10, v1
    invoke-direct/range { v10 .. v17 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 150
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 151
    return-object v1
  :L30
  .line 133
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v19, 2131362180
    const v20, 2131231050
    const v21, 2131231044
  .line 134
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v22
  .line 135
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v23
    const/16 v0, 8
    new-array v0, v0, [I
    fill-array-data v0, :L33
    const v25, 2131362321
    move-object/from16 v18, v1
    move-object/from16 v24, v0
    invoke-direct/range { v18 .. v25 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 138
    iput v5, v1, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
  .line 139
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 140
    return-object v1
  :L31
  .line 122
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v11, 2131362180
    const v12, 2131231050
    const v13, 2131231044
  .line 123
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 124
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v15
    const v0, 2131362500
    const v2, 2131362485
    const v3, 2131362499
    filled-new-array { v3, v0, v2 }, [I
    move-result-object v16
    const v17, 2131362321
    move-object v10, v1
    invoke-direct/range { v10 .. v17 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 126
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 127
    return-object v1
  :L32
  .line 100
    const v1, 2131362094
    filled-new-array { v5, v1 }, [I
    move-result-object v1
    const v2, 2131362354
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 101
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 102
    iput v8, v0, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 103
    return-object v0
  :L33
  .array-data 4
      2131362059
      2131362094
      2131362491
      2131361870
      2131361882
      2131362499
      2131362500
      2131362485
  .end array-data
.end method

.method private static specs(Lcom/innioasis/y1/base/BaseActivity;)[Lcom/innioasis/ipp/Bar$Spec;
  .registers 21
  .line 201
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppActivity;
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L0
  .line 203
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v5, 2131362308
    const v6, 2131231050
    const v7, 2131231044
  .line 204
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    const v8, 2131100252
    invoke-virtual { v4, v8 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v8
  .line 205
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v4, 2131100267
    invoke-virtual { v0, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
    const v0, 2131362491
    filled-new-array { v0 }, [I
    move-result-object v10
    const v11, 2131362144
    move-object v4, v1
    invoke-direct/range { v4 .. v11 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 206
    new-instance v4, Lcom/innioasis/ipp/Bar$Spec;
    const v13, 2131362310
    const v14, 2131231052
    const/4 v15, 0
    const v16, -12779554
    const/16 v17, -1
    const v5, 2131362459
    const v6, 2131362437
    filled-new-array { v5, v6, v0 }, [I
    move-result-object v18
    const v19, 2131361881
    move-object v12, v4
    invoke-direct/range { v12 .. v19 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 208
    const/4 v0, 2
    new-array v0, v0, [Lcom/innioasis/ipp/Bar$Spec;
    aput-object v1, v0, v3
    aput-object v4, v0, v2
    return-object v0
  :L0
  .line 210
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 211
    if-nez v0, :L1
    new-array v0, v3, [Lcom/innioasis/ipp/Bar$Spec;
    goto :L2
  :L1
    new-array v1, v2, [Lcom/innioasis/ipp/Bar$Spec;
    aput-object v0, v1, v3
    move-object v0, v1
  :L2
    return-object v0
.end method

.method static stand(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 678
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 679
    if-eqz p0, :L2
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  :L2
  .line 680
    return-void
.end method

.method private start()V
  .registers 3
  .line 1369
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1370
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1371
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 1372
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 1373
    return-void
.end method

.method private stop()V
  .registers 2
  .line 1376
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 1377
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1378
    return-void
.end method

.method private static strip(Landroid/view/View;)I
  .registers 4
  .line 436
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 437
    if-eqz v0, :L5
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L5
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    if-nez v1, :L2
    goto :L5
  :L2
  .line 438
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v1
  .line 439
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  :L3
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L4
    if-eq v0, p0, :L4
  .line 440
    move-object v2, v0
    check-cast v2, Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v2
    add-int/2addr v1, v2
  .line 439
    invoke-interface { v0 }, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    goto :L3
  :L4
  .line 442
    return v1
  :L5
  .line 437
    const/4 p0, 0
    return p0
.end method

.method private stripText(Landroid/view/View;F)V
  .registers 5
  .line 909
    invoke-static { }, Lcom/innioasis/ipp/Disc;->stripColor()I
    move-result v0
  .line 910
    instance-of v1, p1, Landroid/widget/TextView;
    if-eqz v1, :L5
    if-nez v0, :L0
    goto :L5
  :L0
  .line 911
    const/high16 v1, 0x3F800000
    cmpl-float v1, p2, v1
    if-ltz v1, :L1
    iget v0, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L3
  :L1
    const/4 v1, 0
    cmpg-float v1, p2, v1
    if-gtz v1, :L2
    goto :L3
  :L2
    iget v1, p0, Lcom/innioasis/ipp/Bar;->selText:I
    invoke-static { v0, v1, p2 }, Lcom/innioasis/ipp/Bar;->mix(IIF)I
    move-result v0
  :L3
  .line 912
    check-cast p1, Landroid/widget/TextView;
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    if-eq p2, v0, :L4
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L4
  .line 913
    return-void
  :L5
  .line 910
    return-void
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 857
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Bar;->headTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result p1
    int-to-float p1, p1
    return p1
  :L0
  .line 859
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v0
  .line 860
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 862
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 863
    if-eqz p2, :L1
  .line 864
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
    invoke-virtual { p2 }, Landroid/view/View;->getTranslationY()F
    move-result v2
    add-float/2addr p1, v2
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result p2
    int-to-float p2, p2
    add-float/2addr p1, p2
    goto :L7
  :L1
  .line 866
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p2
    const/4 v2, 0
    if-lez p2, :L2
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object p2
    goto :L3
  :L2
    const/4 p2, 0
  :L3
  .line 867
    if-nez p2, :L4
    goto :L5
  :L4
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  :L5
  .line 868
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L6
    int-to-float p1, v0
    goto :L7
  :L6
    int-to-float p1, v1
  :L7
  .line 870
    int-to-float p2, v0
    int-to-float v0, v1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p2, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    return p1
.end method

.method private static ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 781
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 782
    const/4 v0, 0
    if-gez p1, :L0
    return v0
  :L0
  .line 783
    instance-of v1, p0, Lcom/innioasis/ipp/Bar$Ticks;
    if-eqz v1, :L1
    check-cast p0, Lcom/innioasis/ipp/Bar$Ticks;
    invoke-interface { p0, p1 }, Lcom/innioasis/ipp/Bar$Ticks;->ticked(I)Z
    move-result p0
    return p0
  :L1
  .line 784
    nop
  .line 785
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    const/4 v2, 1
    if-eqz v1, :L2
  .line 786
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L2
  .line 787
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L3
  .line 788
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L3
  .line 789
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L8
  .line 790
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 791
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L4
    goto :L7
  :L4
  .line 792
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 793
    instance-of p1, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz p1, :L5
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 794
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result p0
    if-eqz p0, :L5
    const/4 v0, 1
    goto :L6
  :L5
    nop
  :L6
  .line 793
    return v0
  :L7
  .line 791
    return v0
  :L8
  .line 789
    const/4 p0, 0
  :L9
  .line 796
    if-eqz p0, :L10
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L10
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
    const/4 v0, 1
  :L10
    return v0
.end method

.method private tint(Landroid/view/View;I)V
  .registers 12
  .line 880
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 881
    if-lez p2, :L13
    if-eqz v0, :L13
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L0
    goto/16 :L13
  :L0
  .line 882
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v1
  .line 883
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 884
    iget v3, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 885
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v4
    const/4 v5, 1
    const/4 v6, 0
    if-ne v1, v4, :L1
    const/4 v4, 1
    goto :L2
  :L1
    const/4 v4, 0
  :L2
    invoke-direct { p0, v0, p2, p1, v4 }, Lcom/innioasis/ipp/Bar;->cover(Landroidx/recyclerview/widget/RecyclerView;ILandroid/view/View;Z)F
    move-result v4
  .line 887
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v7
    const/high16 v8, 0x3F800000
    if-eq v1, v7, :L3
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L3
    const/high16 v4, 0x3F800000
  :L3
  .line 888
    cmpl-float v1, v4, v8
    if-ltz v1, :L4
    iget v3, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L6
  :L4
    const/4 v1, 0
    cmpg-float v1, v4, v1
    if-gtz v1, :L5
    goto :L6
  :L5
    iget v1, p0, Lcom/innioasis/ipp/Bar;->selText:I
    invoke-static { v3, v1, v4 }, Lcom/innioasis/ipp/Bar;->mix(IIF)I
    move-result v3
  :L6
  .line 889
    nop
  .line 890
    const/4 v1, 0
  :L7
    iget-object v4, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v4, v4, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v4, v4
    if-ge v6, v4, :L10
  .line 891
    iget-object v4, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v4, v4, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v4, v4, v6
    invoke-virtual { p1, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
  .line 892
    instance-of v7, v4, Landroid/widget/TextView;
    if-nez v7, :L8
    goto :L9
  :L8
  .line 893
    check-cast v4, Landroid/widget/TextView;
  .line 894
    invoke-virtual { v4 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v7
    if-eq v7, v3, :L9
  .line 895
    invoke-virtual { v4, v3 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 896
    const/4 v1, 1
  :L9
  .line 890
    add-int/lit8 v6, v6, 1
    goto :L7
  :L10
  .line 899
    if-eqz v1, :L11
    invoke-static { p1, v2, v3 }, Lcom/innioasis/ipp/Bar;->followText(Landroid/view/View;Ljava/lang/Object;I)V
  :L11
  .line 900
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v1
  .line 901
    if-lez v1, :L12
  .line 902
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v2
    int-to-float v2, v2
    invoke-virtual { p1 }, Landroid/view/View;->getTranslationY()F
    move-result v3
    add-float/2addr v2, v3
  .line 903
    const v3, 2131362549
    invoke-virtual { p1, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
    int-to-float v1, v1
    add-float/2addr v1, v2
    invoke-direct { p0, v0, p2, v2, v1 }, Lcom/innioasis/ipp/Bar;->share(Landroidx/recyclerview/widget/RecyclerView;IFF)F
    move-result p2
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->stripText(Landroid/view/View;F)V
  :L12
  .line 905
    return-void
  :L13
  .line 881
    return-void
.end method

.method private tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 1053
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 1054
    if-nez v0, :L0
    return-void
  :L0
  .line 1055
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Bar;->headTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result v1
    int-to-float v1, v1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v2
    invoke-direct { p0, p1, p2, v1, v2 }, Lcom/innioasis/ipp/Bar;->claims(Landroidx/recyclerview/widget/RecyclerView;IFZ)Z
    move-result p1
    if-eqz p1, :L1
    iget p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L2
  :L1
    iget p1, p0, Lcom/innioasis/ipp/Bar;->headText:I
  :L2
  .line 1056
    const/4 p2, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v1, v1
    if-ge p2, v1, :L5
  .line 1057
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v1, v1, p2
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 1058
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    if-eq v2, p1, :L4
  .line 1059
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L4
  .line 1056
    add-int/lit8 p2, p2, 1
    goto :L3
  :L5
  .line 1062
    return-void
.end method

.method private tintPlate(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 942
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 943
    if-nez v0, :L0
    return-void
  :L0
  .line 944
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Bar;->plateTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)F
    move-result v1
  .line 945
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v2
    int-to-float v2, v2
    add-float/2addr v2, v1
    invoke-direct { p0, p1, p2, v1, v2 }, Lcom/innioasis/ipp/Bar;->share(Landroidx/recyclerview/widget/RecyclerView;IFF)F
    move-result p1
  .line 946
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->stripText(Landroid/view/View;F)V
  .line 947
    iget p2, p0, Lcom/innioasis/ipp/Bar;->plateShare:F
    cmpl-float p2, p1, p2
    if-nez p2, :L1
    const/4 p2, 0
    cmpl-float p2, p1, p2
    if-lez p2, :L2
  :L1
    invoke-virtual { v0 }, Landroid/view/View;->invalidate()V
  :L2
  .line 948
    iput p1, p0, Lcom/innioasis/ipp/Bar;->plateShare:F
  .line 949
    return-void
.end method

.method private undressHead()V
  .registers 6
  .line 1095
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 1096
    if-nez v0, :L0
    return-void
  :L0
  .line 1097
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v1
    const/4 v2, -1
    const/4 v3, 0
    const/4 v4, 1
    if-ne v1, v2, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 1098
    iput-boolean v4, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
  .line 1099
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v1, :L3
    iget-object v4, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v4, v4, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
    goto :L4
  :L3
    const v4, 2131231044
  :L4
    invoke-virtual { v2, v0, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 1100
    nop
  :L5
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v2, v2
    if-ge v3, v2, :L9
  .line 1101
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v2, v2, v3
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 1102
    instance-of v4, v2, Landroid/widget/TextView;
    if-eqz v4, :L8
    check-cast v2, Landroid/widget/TextView;
    if-eqz v1, :L6
    iget v4, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L7
  :L6
    iget v4, p0, Lcom/innioasis/ipp/Bar;->headText:I
  :L7
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  :L8
  .line 1100
    add-int/lit8 v3, v3, 1
    goto :L5
  :L9
  .line 1104
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 1105
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1106
    return-void
.end method

.method public static wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 604
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public at()I
  .registers 2
  .line 727
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
    return v0
.end method

.method public bump(I)V
  .registers 5
  .line 711
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 712
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->hasWindowFocus()Z
    move-result v1
    if-eqz v1, :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-eqz v1, :L3
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-eqz v1, :L3
    iget-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez v1, :L3
    iget v1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v1 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v1
    if-eqz v1, :L0
    goto :L3
  :L0
  .line 713
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
  .line 714
    if-gtz v1, :L1
    return-void
  :L1
  .line 715
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/ipp/Bar;->bouncing:Z
  .line 716
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Bar;->bounceGoal:F
  .line 718
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    iget v1, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
    cmpl-float v1, v0, v1
    if-eqz v1, :L2
  .line 719
    const/4 v1, 0
    iput v1, p0, Lcom/innioasis/ipp/Bar;->vel:F
  .line 720
    iput v0, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
  :L2
  .line 722
    iget v0, p0, Lcom/innioasis/ipp/Bar;->vel:F
    int-to-float p1, p1
    const/high16 v1, 0x43700000
    mul-float p1, p1, v1
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->vel:F
  .line 723
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 724
    return-void
  :L3
  .line 712
    return-void
.end method

.method public count()I
  .registers 2
  .line 731
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 732
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 733
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v0
  :L3
    return v0
.end method

.method public doFrame(J)V
  .registers 14
  .line 1381
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 1382
    const/4 v1, 0
    if-eqz v0, :L16
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v2
    if-eqz v2, :L16
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-eqz v2, :L16
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L16
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L16
  .line 1383
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v2
    if-nez v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-nez v2, :L0
    goto/16 :L16
  :L0
  .line 1387
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 1388
    iget-wide v2, p0, Lcom/innioasis/ipp/Bar;->last:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-nez v6, :L1
    const v2, 1015222895
    goto :L2
  :L1
    sub-long v2, p1, v2
    long-to-float v2, v2
    const/high16 v3, 0x447A0000
    div-float/2addr v2, v3
    const v3, 1028443341
    invoke-static { v3, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  :L2
  .line 1389
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 1390
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 1391
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
  .line 1392
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 0
    if-nez p2, :L11
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L11
  .line 1393
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 1395
    iget-boolean v4, p0, Lcom/innioasis/ipp/Bar;->bouncing:Z
    const/high16 v5, 0x3F000000
    if-eqz v4, :L3
    iget v4, p0, Lcom/innioasis/ipp/Bar;->bounceGoal:F
    sub-float v4, p2, v4
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result v4
    cmpl-float v4, v4, v5
    if-ltz v4, :L3
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->bouncing:Z
  :L3
  .line 1397
    iget v4, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v4 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v4
    if-nez v4, :L5
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->opening()Z
    move-result v4
    if-nez v4, :L4
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    iget v6, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v7, p1
    invoke-static { v0, v4, v6, p2, v7 }, Lcom/innioasis/ipp/Bar;->crosses(Landroidx/recyclerview/widget/RecyclerView;FFFF)Z
    move-result v4
    if-eqz v4, :L5
  :L4
  .line 1398
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1399
    int-to-float v4, p1
    iput v4, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L5
  .line 1402
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    iget v6, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
    cmpl-float v6, v4, v6
    if-eqz v6, :L6
    iput v3, p0, Lcom/innioasis/ipp/Bar;->vel:F
  :L6
  .line 1403
    sub-float/2addr v4, p2
  .line 1404
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result v6
  .line 1405
    iget v7, p0, Lcom/innioasis/ipp/Bar;->vel:F
    const/high16 v8, 0x41F00000
    mul-float v9, v4, v8
    add-float/2addr v7, v9
  .line 1406
    const/high16 v9, 0xC1F00000
    mul-float v9, v9, v2
    float-to-double v9, v9
    invoke-static { v9, v10 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v9
    double-to-float v9, v9
  .line 1407
    mul-float v10, v7, v2
    add-float/2addr v4, v10
    mul-float v4, v4, v9
  .line 1408
    iget v10, p0, Lcom/innioasis/ipp/Bar;->vel:F
    mul-float v7, v7, v8
    mul-float v7, v7, v2
    sub-float/2addr v10, v7
    mul-float v10, v10, v9
    iput v10, p0, Lcom/innioasis/ipp/Bar;->vel:F
  .line 1410
    iget v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-nez v2, :L8
    cmpl-float v2, v6, v3
    if-nez v2, :L7
    goto :L8
  :L7
  .line 1411
    iget v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v7, p1
    sub-float/2addr v7, v2
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result v8
    div-float/2addr v8, v6
    const/high16 v6, 0x3F800000
    sub-float v8, v6, v8
    invoke-static { v6, v8 }, Ljava/lang/Math;->min(FF)F
    move-result v6
    invoke-static { v3, v6 }, Ljava/lang/Math;->max(FF)F
    move-result v6
    mul-float v7, v7, v6
    add-float/2addr v2, v7
    iput v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    goto :L9
  :L8
  .line 1410
    int-to-float v2, p1
    iput v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L9
  .line 1412
    add-float v2, p2, v4
    iput v2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1413
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpg-float v2, v2, v5
    if-gez v2, :L10
    iget v2, p0, Lcom/innioasis/ipp/Bar;->vel:F
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v4, 0x41700000
    cmpg-float v2, v2, v4
    if-gez v2, :L10
  .line 1414
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1415
    int-to-float p2, p1
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 1416
    iput v3, p0, Lcom/innioasis/ipp/Bar;->vel:F
  :L10
  .line 1418
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    iput p2, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
  :L11
  .line 1420
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 1422
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p2
  .line 1423
    if-eqz p2, :L12
    invoke-virtual { p2 }, Landroid/view/View;->invalidate()V
  :L12
  .line 1424
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L14
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
    cmpl-float p2, p2, v0
    if-nez p2, :L14
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float p1, p1
    cmpl-float p1, p2, p1
    if-nez p1, :L14
    iget p1, p0, Lcom/innioasis/ipp/Bar;->vel:F
    cmpl-float p1, p1, v3
    if-eqz p1, :L13
    goto :L14
  :L13
  .line 1429
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1430
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->bouncing:Z
    goto :L15
  :L14
  .line 1426
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  .line 1427
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L15
  .line 1432
    return-void
  :L16
  .line 1384
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1385
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 407
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 408
    if-eqz v0, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  :L1
  .line 410
    goto :L3
  :L2
  .line 409
    move-exception p1
  :L3
  .line 411
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 414
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L19 } :L21
  .registers 21
  .line 1268
    move-object/from16 v1, p0
    move-object/from16 v0, p1
    move-object/from16 v2, p2
  :L0
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
  .line 1269
    if-eqz v3, :L20
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v4
    if-nez v4, :L1
    goto/16 :L20
  :L1
  .line 1270
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 1271
    iget-object v4, v1, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v4 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 1272
    iget-object v5, v1, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v5 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v5
  .line 1273
    const/4 v6, 0
    invoke-virtual { v2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 1274
    invoke-virtual { v7 }, Landroid/view/View;->getLeft()I
    move-result v8
  .line 1275
    invoke-virtual { v7 }, Landroid/view/View;->getRight()I
    move-result v7
  .line 1276
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v9
  .line 1277
    const/4 v10, 0
  :L2
    if-ge v10, v3, :L10
  .line 1278
    invoke-virtual { v2, v10 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v11
  .line 1279
    invoke-static { v11 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v12
    if-eqz v12, :L3
    goto :L9
  :L3
  .line 1280
    invoke-virtual { v2, v11 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v12
  .line 1282
    if-eq v12, v9, :L4
    invoke-static { v2, v12 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v12
    if-eqz v12, :L4
    move-object v12, v5
    goto :L5
  :L4
    move-object v12, v4
  :L5
  .line 1283
    if-nez v12, :L6
    goto :L9
  :L6
  .line 1284
    invoke-virtual { v11 }, Landroid/view/View;->getTop()I
    move-result v13
    int-to-float v13, v13
    invoke-virtual { v11 }, Landroid/view/View;->getTranslationY()F
    move-result v14
    add-float/2addr v13, v14
    invoke-static { v13 }, Ljava/lang/Math;->round(F)I
    move-result v13
  .line 1285
    invoke-virtual { v11 }, Landroid/view/View;->getLeft()I
    move-result v14
    invoke-virtual { v11 }, Landroid/view/View;->getRight()I
    move-result v15
    invoke-virtual { v11 }, Landroid/view/View;->getHeight()I
    move-result v16
    add-int v6, v13, v16
    invoke-virtual { v12, v14, v13, v15, v6 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1286
    invoke-virtual { v12, v0 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 1288
    if-ne v12, v4, :L7
    invoke-static { v11 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v6
    goto :L8
  :L7
    const/4 v6, 0
  :L8
  .line 1289
    if-lez v6, :L9
  .line 1290
    invoke-virtual { v11 }, Landroid/view/View;->getLeft()I
    move-result v14
    invoke-virtual { v11 }, Landroid/view/View;->getRight()I
    move-result v11
    add-int/2addr v6, v13
    invoke-virtual { v12, v14, v13, v11, v6 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1291
    invoke-virtual { v12, v0 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L9
  .line 1277
    add-int/lit8 v10, v10, 1
    const/4 v6, 0
    goto :L2
  :L10
  .line 1294
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v3
    if-nez v3, :L11
  .line 1296
    const/high16 v0, 0x7FC00000
    iput v0, v1, Lcom/innioasis/ipp/Bar;->y:F
  .line 1297
    return-void
  :L11
  .line 1300
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->hasWindowFocus()Z
    move-result v3
    if-eqz v3, :L12
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Loop;->bumper(Lcom/innioasis/ipp/Loop$Bumper;)V
  :L12
  .line 1301
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 1302
    invoke-direct { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v4
  .line 1303
    invoke-direct { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v6
  .line 1304
    if-nez v4, :L13
  .line 1305
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 1306
    return-void
  :L13
  .line 1308
    iget v4, v1, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
  .line 1309
    iget v9, v1, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v9 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v9
    if-eqz v9, :L14
    int-to-float v9, v3
    goto :L15
  :L14
    iget v9, v1, Lcom/innioasis/ipp/Bar;->hb:F
  :L15
    invoke-static { v9 }, Ljava/lang/Math;->round(F)I
    move-result v9
  .line 1310
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v10
    if-nez v10, :L17
  .line 1311
    if-eqz v5, :L16
  .line 1312
    add-int v10, v4, v9
    invoke-virtual { v5, v8, v4, v7, v10 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1313
    invoke-virtual { v5, v0 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L16
  .line 1315
    invoke-direct { v1, v0, v2, v4, v9 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;II)V
  :L17
  .line 1317
    iget v0, v1, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float v0, v0, v6
    if-nez v0, :L18
    iget v0, v1, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v2, v3
    cmpl-float v0, v0, v2
    if-eqz v0, :L19
  :L18
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L19
  .line 1319
    goto :L22
  :L20
  .line 1269
    return-void
  :L21
  .line 1318
    move-exception v0
  :L22
  .line 1320
    return-void
.end method
