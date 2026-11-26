.class public final Lcom/innioasis/ipp/Bar;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "Bar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Bar$Spec;,
    Lcom/innioasis/ipp/Bar$HeadPaint;,
    Lcom/innioasis/ipp/Bar$Tinter;,
    Lcom/innioasis/ipp/Bar$Cursor;,
    Lcom/innioasis/ipp/Bar$Ticks;
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

.field private hb:F

.field private final head:Ljava/lang/ref/WeakReference;

.field private headKey:J

.field private final headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;

.field private final headText:I

.field private last:J

.field private lastPos:I

.field private movedTo:F

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
  .line 229
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
  .line 421
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->CAPTION:Ljava/lang/Object;
  .line 505
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
  .line 574
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
  .line 673
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 9
  .line 269
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 239
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 241
    iput v0, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
  .line 244
    const/4 v1, -1
    iput v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 251
    iput v0, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 254
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
  .line 255
    new-instance v1, Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
  .line 257
    const-wide v1, 9223372036854775806L
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 263
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 400
    add-long/2addr v1, v3
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->standUntil:J
  .line 791
    new-instance v1, Ljava/lang/ref/WeakReference;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 1089
    new-instance v1, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 270
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 271
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 272
    iput-object p3, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
  .line 273
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    if-nez v1, :L0
    goto :L1
  :L0
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    invoke-virtual { p2, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
  :L1
  .line 274
    new-instance p2, Ljava/lang/ref/WeakReference;
    invoke-direct { p2, v2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
  .line 275
    if-eqz v2, :L2
    sget-object p2, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { p2, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 276
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 277
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 278
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 279
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 280
    iget-boolean v2, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    const/4 v3, 1
    const/4 v4, 0
    if-eqz v2, :L3
  .line 281
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 282
    iget p2, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    invoke-virtual { v1, v0, p2, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
    goto :L4
  :L3
  .line 284
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 285
    iget p2, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    invoke-virtual { v1, v0, p2, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 288
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 289
    iget-boolean p1, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    if-eqz p1, :L5
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { v1, p2, p1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L6
  :L5
  .line 290
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { v1, p2, p1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L6
  .line 291
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 292
    iget-boolean p1, p3, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
    if-eqz p1, :L7
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { v1, p2, p1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L8
  :L7
  .line 293
    iget p1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { v1, p2, p1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 294
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 295
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz v0, :L9
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    invoke-virtual { v0, p2, v1, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L9
  .line 296
    iget p3, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz p3, :L10
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
  :L10
    iput p1, p0, Lcom/innioasis/ipp/Bar;->headText:I
  .line 297
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 29
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 29
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$1000(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 29
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$1100(Lcom/innioasis/ipp/Bar;)Z
  .registers 1
  .line 29
    iget-boolean p0, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
    return p0
.end method

.method static synthetic access$1200(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->undressHead()V
    return-void
.end method

.method static synthetic access$1300(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
    return-void
.end method

.method static synthetic access$1400(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 29
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
.end method

.method static synthetic access$1500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->follow(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$1700(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method static synthetic access$1800(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dressHead()V
    return-void
.end method

.method static synthetic access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$2000(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 29
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 29
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Bar;)F
  .registers 1
  .line 29
    iget p0, p0, Lcom/innioasis/ipp/Bar;->y:F
    return p0
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 29
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/Bar;)Z
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result p0
    return p0
.end method

.method static synthetic access$700(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
  .registers 2
  .line 29
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->headTop(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static synthetic access$800(Lcom/innioasis/ipp/Bar;)F
  .registers 1
  .line 29
    iget p0, p0, Lcom/innioasis/ipp/Bar;->hb:F
    return p0
.end method

.method static synthetic access$900(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 29
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    return p0
.end method

.method public static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  :L0
  .line 305
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 306
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
  .line 307
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->specs(Lcom/innioasis/y1/base/BaseActivity;)[Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 308
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
  .line 310
    goto :L6
  :L5
  .line 309
    move-exception p0
  :L6
  .line 311
    return-void
.end method

.method private static apply(Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 4
  .line 314
    iget v0, p1, Lcom/innioasis/ipp/Bar$Spec;->list:I
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 315
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  :L0
  .line 316
    return-void
.end method

.method private arrowOf(Landroid/view/View;)Landroid/view/View;
  .registers 4
  .line 1179
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
  .line 1180
    if-nez v0, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v1, v1, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
    if-eqz v1, :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L2
  .line 1181
    return-object v0
.end method

.method private static attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 352
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 353
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
  .line 354
    if-eqz v1, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
    if-ne v2, v3, :L3
    return-void
  :L3
  .line 355
    if-eqz v2, :L4
  .line 356
    new-instance v1, Lcom/innioasis/ipp/Bar;
    invoke-direct { v1, p1, p0, p2 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 357
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 358
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 359
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 360
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L5
  :L4
  .line 362
    invoke-virtual { v0, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 363
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 364
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 365
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p2 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 366
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->stop()V
  .line 367
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->undressHead()V
  :L5
  .line 369
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 370
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    if-eqz p0, :L6
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L6
  .line 372
    goto :L8
  :L7
  .line 371
    move-exception p0
  :L8
  .line 373
    return-void
.end method

.method private static blank(Landroid/view/View;)V
  .registers 4
  .line 513
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 514
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v2, -1
    if-eqz v1, :L1
  .line 515
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 516
    iget p0, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-eq p0, v2, :L0
    sget-object p0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L0
  .line 517
    goto :L2
  :L1
  .line 518
    new-instance v0, Lcom/innioasis/ipp/Rows$Flat;
    sget-object v1, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 519
    iput v2, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 520
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 522
    return-void
.end method

.method public static blink(Landroid/view/View;Z)Z
  .catchall { :L1 .. :L8 } :L11
  .registers 7
  .line 612
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p0, :L12
    const/4 v2, 3
    if-ge v1, v2, :L12
  :L1
  .line 613
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v2
  .line 614
    if-eqz v2, :L7
  .line 615
    iget-object p0, v2, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 616
    if-eqz p0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L6
  :L2
  .line 617
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    iput-wide v3, v2, Lcom/innioasis/ipp/Bar;->blinkAt:J
  .line 618
    iget-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    xor-int/lit8 v3, p1, 1
    const/4 v4, 1
    if-eq v1, v3, :L5
  .line 619
    if-nez p1, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    iput-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 620
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 622
    if-nez p1, :L5
    const-wide/16 v1, 700
    invoke-virtual { p0, v1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateDelayed(J)V
  :L5
  .line 624
    return v4
  :L6
  .line 616
    return v0
  :L7
  .line 626
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 627
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
  .line 612
    add-int/lit8 v1, v1, 1
    goto :L0
  :L11
  .line 629
    move-exception p0
    goto :L13
  :L12
  .line 630
    nop
  :L13
  .line 631
    return v0
.end method

.method public static bound(Landroidx/viewbinding/ViewBinding;)V
  .registers 1
  .line 380
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 381
    return-void
.end method

.method private static caption(Landroid/view/View;)Z
  .registers 2
  .line 424
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
  .line 911
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
  .line 912
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
  .line 913
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
  .line 911
    return v1
.end method

.method private clean(Landroid/view/View;)V
  .registers 6
  .line 486
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 487
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
  .line 488
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    if-eq v2, v0, :L1
    invoke-virtual { v1, p1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 489
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v1, v1
    if-nez v1, :L2
  .line 490
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
    goto :L6
  :L2
  .line 492
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v2, v2
    if-ge v1, v2, :L6
  .line 493
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    aget v2, v2, v1
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 494
    if-nez v2, :L4
    goto :L5
  :L4
  .line 496
    sget-object v3, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 497
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L5
  .line 492
    add-int/lit8 v1, v1, 1
    goto :L3
  :L6
  .line 500
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 501
    if-eqz v0, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L7
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 502
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  .line 503
    return-void
.end method

.method private cover(Landroidx/recyclerview/widget/RecyclerView;ILandroid/view/View;Z)F
  .registers 9
  .line 895
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v1, 0
    if-nez v0, :L8
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-nez v0, :L8
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L8
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v0
    if-eqz v0, :L0
    goto :L8
  :L0
  .line 896
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    const/high16 v0, 0x3F000000
    const/high16 v2, 0x3F800000
    cmpg-float p1, p1, v0
    if-gez p1, :L2
    if-eqz p4, :L1
    const/high16 v1, 0x3F800000
  :L1
    return v1
  :L2
  .line 897
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 898
    iget p4, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { p4 }, Ljava/lang/Float;->isNaN(F)Z
    move-result p4
    if-eqz p4, :L3
    int-to-float p2, p2
    goto :L4
  :L3
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L4
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    add-int/2addr p2, p1
  .line 899
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
  .line 900
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
  .line 901
    cmpg-float p3, v0, p4
    if-gtz p3, :L5
    return v1
  :L5
  .line 902
    int-to-float p2, p2
    invoke-static { v0, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    int-to-float p1, p1
    invoke-static { p4, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    sub-float/2addr p2, p1
  .line 903
    cmpg-float p1, p2, v1
    if-gtz p1, :L6
    goto :L7
  :L6
    sub-float/2addr v0, p4
    div-float/2addr p2, v0
    invoke-static { v2, p2 }, Ljava/lang/Math;->min(FF)F
    move-result v1
  :L7
    return v1
  :L8
  .line 895
    return v1
.end method

.method private static crosses(Landroidx/recyclerview/widget/RecyclerView;FFFF)Z
  .registers 10
  .line 443
    sub-float v0, p3, p1
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    const/high16 v1, 0x3F000000
    const/4 v2, 0
    cmpg-float v0, v0, v1
    if-gez v0, :L0
    return v2
  :L0
  .line 444
    const/4 v0, 1
    cmpl-float v1, p3, p1
    if-lez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 445
    if-eqz v1, :L3
    add-float/2addr p2, p1
    goto :L4
  :L3
    add-float p2, p3, p4
  :L4
  .line 446
    if-eqz v1, :L5
    move p1, p3
  :L5
  .line 448
    const/high16 p3, 0xBF800000
    cmpg-float p3, p2, p3
    if-gez p3, :L6
    const/4 p3, 0
    cmpl-float p3, p1, p3
    if-ltz p3, :L6
    return v0
  :L6
  .line 450
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plateSpan(Landroidx/recyclerview/widget/RecyclerView;)[I
    move-result-object p3
  .line 451
    const/high16 p4, 0x3F800000
    if-eqz p3, :L7
    aget v1, p3, v2
    int-to-float v1, v1
    sub-float v3, p2, p4
    cmpl-float v1, v1, v3
    if-ltz v1, :L7
    aget p3, p3, v0
    int-to-float p3, p3
    add-float v1, p1, p4
    cmpg-float p3, p3, v1
    if-gtz p3, :L7
    return v0
  :L7
  .line 452
    const/4 p3, 0
  :L8
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-ge p3, v1, :L13
  .line 453
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 454
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v3
    int-to-float v3, v3
    invoke-virtual { v1 }, Landroid/view/View;->getTranslationY()F
    move-result v4
    add-float/2addr v3, v4
  .line 456
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v4
    if-eqz v4, :L9
  .line 457
    nop
  .line 458
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v1
    int-to-float v1, v1
    add-float/2addr v1, v3
    goto :L11
  :L9
  .line 460
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->strip(Landroid/view/View;)I
    move-result v1
  .line 461
    if-nez v1, :L10
    goto :L12
  :L10
  .line 462
    nop
  .line 463
    int-to-float v1, v1
    add-float/2addr v1, v3
  :L11
  .line 465
    sub-float v4, p2, p4
    cmpl-float v3, v3, v4
    if-ltz v3, :L12
    add-float v3, p1, p4
    cmpg-float v1, v1, v3
    if-gtz v1, :L12
    return v0
  :L12
  .line 452
    add-int/lit8 p3, p3, 1
    goto :L8
  :L13
  .line 467
    return v2
.end method

.method private cursor()I
  .registers 4
  .line 710
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-boolean v0, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
    const/4 v1, -1
    if-eqz v0, :L5
  .line 711
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 712
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 713
    instance-of v2, v0, Lcom/innioasis/ipp/Bar$Cursor;
    if-eqz v2, :L2
    check-cast v0, Lcom/innioasis/ipp/Bar$Cursor;
    invoke-interface { v0 }, Lcom/innioasis/ipp/Bar$Cursor;->cursor()I
    move-result v0
    return v0
  :L2
  .line 714
    instance-of v2, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L3
  .line 715
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L3
  .line 717
    instance-of v2, v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v2, :L4
  .line 718
    check-cast v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L4
  .line 720
    return v1
  :L5
  .line 722
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 723
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
  .line 824
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 825
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
  .line 642
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 643
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
  .line 647
    const/4 v0, 1
    return v0
  :L2
  .line 644
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 645
    return v1
.end method

.method static defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 4
  .line 814
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 815
    if-eqz v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 816
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 817
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 818
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 819
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 820
    return v1
  :L3
  .line 815
    const/4 p0, 0
    return p0
.end method

.method static dialog(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 12
  .line 324
    const v0, 2131362413
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 325
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L1
  .line 326
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v1, :L2
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L2
  .line 327
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
    goto :L1
  :L2
  .line 329
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L6
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v1, :L3
    goto :L6
  :L3
  .line 330
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
  .line 331
    new-instance v9, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131362413
    const v3, 2131231051
    const/4 v4, 0
  .line 332
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v5, 2131100253
    invoke-virtual { v1, v5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 333
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
  .line 334
    filled-new-array { v10 }, [I
    move-result-object v1
    iput-object v1, v9, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 335
    const/4 v1, 1
    iput-boolean v1, v9, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 336
    iput-boolean v1, v9, Lcom/innioasis/ipp/Bar$Spec;->menu:Z
  .line 337
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 338
    invoke-static { p0, v0, v9 }, Lcom/innioasis/ipp/Bar;->attach(Lcom/innioasis/y1/base/BaseActivity;Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 340
    sget-object p0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { p0, v0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  .line 341
    if-eqz p0, :L4
  .line 342
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v1, v2 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 343
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v1, p0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L4
  .line 345
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  :L5
  .line 347
    goto :L8
  :L6
  .line 329
    return-void
  :L7
  .line 346
    move-exception p0
  :L8
  .line 348
    return-void
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 9
  .line 1186
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 1187
    if-nez p2, :L0
    return-void
  :L0
  .line 1188
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 1190
    if-eqz v0, :L6
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    const/16 v2, 8
    if-eq v1, v2, :L6
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-nez v1, :L1
    goto :L6
  :L1
  .line 1192
    nop
  .line 1193
    const/4 v1, 0
    move-object v3, v0
    const/4 v2, 0
  :L2
    if-eqz v3, :L5
    if-eq v3, p2, :L5
  .line 1194
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
    add-int/2addr v1, v4
  .line 1195
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v4
    add-int/2addr v2, v4
  .line 1196
    invoke-virtual { v3 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
  .line 1197
    instance-of v4, v3, Landroid/view/View;
    if-eqz v4, :L3
    check-cast v3, Landroid/view/View;
    goto :L4
  :L3
    const/4 v3, 0
  :L4
  .line 1198
    goto :L2
  :L5
  .line 1199
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 1200
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result p2
    add-int/2addr p2, v1
    int-to-float p2, p2
    add-int/2addr p3, v2
    int-to-float p3, p3
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 1201
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 1202
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1203
    return-void
  :L6
  .line 1190
    return-void
.end method

.method private dressHead()V
  .registers 5
  .line 935
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 936
    if-nez v0, :L0
    return-void
  :L0
  .line 937
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
  .line 938
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 939
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v3, -1
    if-eqz v2, :L2
  .line 940
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
  .line 941
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Rows$Flat;->inner()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    if-eq v0, v2, :L1
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L1
  .line 942
    goto :L3
  :L2
  .line 943
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 944
    iput v3, v1, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 945
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 947
    return-void
.end method

.method private dressed()Z
  .registers 3
  .line 950
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 951
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  :L1
  .line 952
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
  .line 1075
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
  .line 1076
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
  .line 1077
    iget v1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float v1, v0, v1
    if-nez v1, :L1
    iget v1, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v2, p2
    cmpl-float v1, v1, v2
    if-nez v1, :L1
    return-void
  :L1
  .line 1078
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->opening()Z
    move-result v1
    if-eqz v1, :L3
  .line 1079
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1080
    int-to-float p2, p2
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 1081
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 1082
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p1
  .line 1083
    if-eqz p1, :L2
    invoke-virtual { p1 }, Landroid/view/View;->invalidate()V
  :L2
  .line 1084
    goto :L4
  :L3
  .line 1085
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L4
  .line 1087
    return-void
  :L5
  .line 1075
    return-void
.end method

.method private static followText(Landroid/view/View;Ljava/lang/Object;I)V
  .registers 4
  .line 1031
    instance-of v0, p1, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v0, :L0
  .line 1032
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->listRow(Landroid/view/View;)V
    goto :L5
  :L0
  .line 1033
    instance-of v0, p1, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v0, :L1
  .line 1034
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->librarySub(Landroid/view/View;)V
    goto :L5
  :L1
  .line 1035
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v0, :L2
  .line 1036
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tinted(Landroid/view/View;)V
    goto :L5
  :L2
  .line 1037
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
  .line 1049
    instance-of p1, p1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz p1, :L5
  .line 1050
    const p1, 2131362040
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 1052
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L5
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object p1
    if-eqz p1, :L5
  .line 1053
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
    goto :L5
  :L4
  .line 1048
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->tinted(Landroid/view/View;)V
  :L5
  .line 1056
    return-void
.end method

.method private head()Landroid/view/View;
  .registers 3
  .line 734
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 735
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
  .line 744
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
  .line 745
    const/4 v0, 2
    new-array v1, v0, [I
  .line 746
    new-array v0, v0, [I
  .line 747
    invoke-virtual { p1, v1 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 748
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLocationInWindow([I)V
  .line 749
    const/4 p0, 1
    aget p1, v1, p0
    aget p0, v0, p0
    sub-int/2addr p1, p0
    return p1
.end method

.method private height(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 6
  .line 1060
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 1061
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p1
    return p1
  :L2
  .line 1062
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 1063
    const/4 v1, 0
    const/4 v2, 0
  :L3
    if-nez v0, :L5
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L5
  .line 1064
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L4
  .line 1063
    add-int/lit8 v2, v2, 1
    goto :L3
  :L5
  .line 1066
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
  .line 582
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
  .line 583
    if-eqz v1, :L13
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-eqz v2, :L13
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L2
    goto/16 :L13
  :L2
  .line 584
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
  .line 585
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v2
  .line 586
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v4
    invoke-virtual { v4 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v4
  .line 587
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
  .line 589
    if-eqz p1, :L10
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    instance-of v1, v1, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L10
  .line 590
    invoke-static { }, Lcom/innioasis/ipp/Loop;->swallow()Z
    move-result v1
    if-eqz v1, :L9
    return v3
  :L9
  .line 591
    invoke-static { }, Lcom/innioasis/ipp/Loop;->noteWrap()V
  :L10
  .line 593
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v1
    const/4 v3, 0
    cmpl-float v1, v1, v3
    if-nez v1, :L11
    return v0
  :L11
  .line 594
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
  .line 595
    return p1
  :L13
  .line 583
    return v0
  :L14
  .line 596
    move-exception p0
  .line 597
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 527
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 528
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
  .line 529
    const/4 v2, 1
    if-eqz v1, :L4
  .line 530
    iget-object v3, v1, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-ne p0, v3, :L2
  .line 532
    iget-object p0, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 533
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p0
    if-lez p0, :L1
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->dressHead()V
  :L1
  .line 534
    goto :L3
  :L2
  .line 535
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L3
  .line 537
    return v2
  :L4
  .line 539
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L5
  .line 540
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L9
  .line 541
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 542
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L7
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L6
    goto :L7
  :L6
  .line 547
    goto :L5
  :L7
  .line 543
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 544
    if-eqz p0, :L8
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L8
  .line 545
    return v2
  :L9
  .line 549
    goto :L11
  :L10
  .line 548
    move-exception p0
  :L11
  .line 550
    return v0
.end method

.method private static live(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 414
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static mix(IIF)I
  .registers 8
  .line 882
    nop
  .line 883
    const/4 v0, 0
    const/4 v1, 0
  :L0
    const/16 v2, 32
    if-ge v0, v2, :L1
  .line 884
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 885
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
  .line 883
    add-int/lit8 v0, v0, 8
    goto :L0
  :L1
  .line 887
    return v1
.end method

.method private multi()Z
  .catchall { :L0 .. :L1 } :L10
  .catch Ljava/lang/NoSuchFieldException; { :L2 .. :L3 } :L4
  .catchall { :L2 .. :L3 } :L10
  .catchall { :L5 .. :L8 } :L10
  .registers 7
  .line 652
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 653
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 655
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
  .line 656
    sget-object v3, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L1
  .line 657
    const/4 v4, 1
    if-nez v3, :L7
  :L2
  .line 659
    const-string v3, "isMultiSelect"
    invoke-virtual { v2, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v3
  .line 660
    invoke-virtual { v3, v4 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  :L3
  .line 661
    nop
  .line 664
    goto :L6
  :L4
  .line 662
    move-exception v3
  :L5
  .line 663
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
  :L6
  .line 665
    sget-object v5, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v5, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 667
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
  .line 668
    move-exception v0
  .line 669
    return v1
.end method

.method private observe()V
  .registers 4
  .line 777
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 778
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 779
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v0, :L2
  .line 781
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 782
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 783
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 784
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  :L2
  .line 786
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 787
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
  .line 788
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 789
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 5
  .line 563
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 564
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
  .line 565
    if-eqz v0, :L3
  .line 566
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    iget-object v3, v0, Lcom/innioasis/ipp/Bar;->self:Ljava/lang/ref/WeakReference;
    if-eq v2, v3, :L2
    invoke-virtual { v1, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 567
    return-object v0
  :L3
  .line 569
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 570
    if-nez p0, :L4
    move-object p0, v2
    goto :L5
  :L4
    check-cast p0, Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L5
  .line 571
    if-eqz p0, :L6
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsValue(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    move-object v2, p0
  :L6
    return-object v2
.end method

.method static on(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 477
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
  .line 739
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
  .line 728
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 729
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
  .line 266
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
  .line 559
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

.method private plain(Ljava/lang/Object;I)I
  .registers 3
  .line 878
    instance-of p1, p1, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz p1, :L0
    iget p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/Eq;->rowColor(II)I
    move-result p1
    goto :L1
  :L0
    iget p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L1
    return p1
.end method

.method private static plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
  .registers 12
  .line 215
    new-instance v8, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131231050
    const v3, 2131231044
  .line 216
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v4
  .line 217
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
  .line 215
    return-object v8
.end method

.method private refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 9
  .line 975
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 976
    if-nez v0, :L0
    return-void
  :L0
  .line 977
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
  .line 978
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
  .line 977
    const-wide v1, 9223372036854775806L
  :L3
  .line 979
    iget-wide v3, p0, Lcom/innioasis/ipp/Bar;->headKey:J
    cmp-long p1, v1, v3
    if-nez p1, :L4
    return-void
  :L4
  .line 980
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 981
    invoke-virtual { v0 }, Landroid/view/View;->invalidate()V
  .line 982
    return-void
.end method

.method public static relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 3
  .line 683
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 684
    const/4 v0, 0
    if-nez p0, :L2
    return v0
  :L2
  .line 685
    const/high16 v1, 0x7FC00000
    iput v1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 686
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 687
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 688
    const/4 p0, 1
    return p0
.end method

.method public static relisted(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 698
    if-eqz p0, :L7
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L7
  :L1
  .line 699
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 700
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L4
  .line 701
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 702
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 703
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-ne v2, p0, :L3
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  :L3
  .line 704
    goto :L2
  :L4
  .line 706
    goto :L6
  :L5
  .line 705
    move-exception p0
  :L6
  .line 707
    return-void
  :L7
  .line 698
    return-void
.end method

.method public static row(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 386
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  :L1
  .line 387
    if-nez v0, :L2
    return-void
  :L2
  .line 388
    iget-object v1, v0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 389
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L3
    goto :L6
  :L3
  .line 391
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
  .line 392
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  .line 395
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L5
  .line 397
    goto :L8
  :L6
  .line 389
    return-void
  :L7
  .line 396
    move-exception p0
  :L8
  .line 398
    return-void
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 795
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 797
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
  .line 798
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 799
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 800
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 797
    return v1
  :L2
  .line 801
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 802
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 803
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L3
  .line 805
    const/4 p1, 1
    return p1
.end method

.method private static spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
  .registers 27
  .line 70
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/MainActivity;
    const v2, 2131100267
    const v3, 2131362491
    const v4, 2131100252
    if-eqz v1, :L0
  .line 71
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v6, 2131362308
    const v7, 2131231052
    const v8, 2131231044
  .line 72
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
  .line 73
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v10
    filled-new-array { v3 }, [I
    move-result-object v11
    const v12, 2131362144
    move-object v5, v1
    invoke-direct/range { v5 .. v12 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 71
    return-object v1
  :L0
  .line 75
    instance-of v1, v0, Lcom/innioasis/y1/activity/SettingActivity;
    const v5, 2131362459
    const v6, 2131362437
    if-eqz v1, :L1
  .line 76
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
  .line 79
    instance-of v1, v0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L2
  .line 80
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131231050
    const v10, 2131231044
  .line 81
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v11
  .line 82
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v12
    filled-new-array { v3 }, [I
    move-result-object v13
    const v14, 2131362144
    move-object v7, v1
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 80
    return-object v1
  :L2
  .line 84
    instance-of v1, v0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L3
  .line 85
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
  .line 88
    instance-of v1, v0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v1, :L4
  .line 89
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
  .line 92
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    const v7, 2131362042
    if-eqz v1, :L5
  .line 93
    const v1, 2131362520
    const v2, 2131362521
    filled-new-array { v7, v1, v2 }, [I
    move-result-object v1
    const v2, 2131362310
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 94
    const v1, 2131362519
    const v2, 2131362041
    filled-new-array { v1, v2 }, [I
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 95
    return-object v0
  :L5
  .line 97
    instance-of v1, v0, Lcom/innioasis/music/SearchActivity;
    const v8, 2131362353
    const/4 v9, 1
    if-nez v1, :L32
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-eqz v1, :L6
    goto/16 :L32
  :L6
  .line 104
    instance-of v1, v0, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v1, :L7
  .line 105
    const v1, 2131362298
    filled-new-array { v3 }, [I
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 106
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 107
    return-object v0
  :L7
  .line 109
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v1, :L8
  .line 111
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
  .line 113
    iput v8, v1, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 114
    const v2, 2131231052
    iput v2, v1, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
  .line 115
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
    iput v0, v1, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
  .line 116
    return-object v1
  :L8
  .line 118
    instance-of v1, v0, Lcom/innioasis/music/SongListActivity;
    if-nez v1, :L31
    instance-of v1, v0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L9
    goto/16 :L31
  :L9
  .line 128
    instance-of v1, v0, Lcom/innioasis/music/GenresActivity;
    const v5, 2131362144
    if-nez v1, :L30
    instance-of v1, v0, Lcom/innioasis/music/AlbumsActivity;
    if-nez v1, :L30
    instance-of v1, v0, Lcom/innioasis/music/ArtistsActivity;
    if-eqz v1, :L10
    goto/16 :L30
  :L10
  .line 141
    instance-of v1, v0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    const v8, 2131362181
    if-nez v1, :L27
    instance-of v1, v0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz v1, :L11
    goto/16 :L27
  :L11
  .line 152
    instance-of v1, v0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v1, :L12
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v10
    if-nez v10, :L13
  :L12
    instance-of v10, v0, Lcom/innioasis/y1_eBook/ui/search/SearchActivity;
    if-eqz v10, :L19
  :L13
  .line 155
    nop
  .line 156
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v12, 2131362311
    const v13, 2131230823
    const/4 v14, 0
    const v15, -12779554
    const/16 v16, -1
  .line 157
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
  .line 158
    if-eqz v1, :L16
    const v18, 2131362144
    goto :L17
  :L16
    const/4 v5, 0
    const/16 v18, 0
  :L17
    move-object v11, v0
    invoke-direct/range { v11 .. v18 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 159
    const v2, 2131362152
    filled-new-array { v2 }, [I
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 160
    if-eqz v1, :L18
    invoke-static { }, Lcom/innioasis/ipp/Ebook;->firstMark()I
    move-result v1
    iput v1, v0, Lcom/innioasis/ipp/Bar$Spec;->markBase:I
  :L18
  .line 161
    return-object v0
  :L19
  .line 163
    instance-of v5, v0, Lcom/innioasis/music/MusicMainActivity;
    if-nez v5, :L24
    instance-of v5, v0, Lcom/innioasis/y1/activity/EbookActivity;
    if-nez v5, :L24
    if-eqz v1, :L20
    goto :L24
  :L20
  .line 172
    instance-of v1, v0, Lcom/innioasis/y1/activity/PlayerActivity;
    if-eqz v1, :L21
  .line 174
    filled-new-array { v3 }, [I
    move-result-object v1
    invoke-static { v0, v8, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 175
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 176
    return-object v0
  :L21
  .line 178
    instance-of v1, v0, Lcom/innioasis/music/FilesActivity;
    if-eqz v1, :L22
  .line 180
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v11, 2131362180
    const v12, 2131231050
    const v13, 2131231044
  .line 181
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 182
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v15
    filled-new-array { v7 }, [I
    move-result-object v16
    const v17, 2131362321
    move-object v10, v1
    invoke-direct/range { v10 .. v17 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 184
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 185
    return-object v1
  :L22
  .line 187
    instance-of v0, v0, Lcom/innioasis/fm/MenuActivity;
    if-eqz v0, :L23
  .line 189
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
  .line 192
    const/4 v0, 0
    return-object v0
  :L24
  .line 167
    nop
  .line 168
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
  .line 169
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 170
    return-object v0
  :L27
  .line 144
    instance-of v1, v0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz v1, :L28
    const v8, 2131362182
    const v11, 2131362182
    goto :L29
  :L28
    const v11, 2131362181
  :L29
  .line 145
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v12, 2131231050
    const v13, 2131231044
  .line 146
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 147
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
  .line 149
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 150
    return-object v1
  :L30
  .line 132
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v19, 2131362180
    const v20, 2131231050
    const v21, 2131231044
  .line 133
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v22
  .line 134
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
  .line 137
    iput v5, v1, Lcom/innioasis/ipp/Bar$Spec;->arrow2:I
  .line 138
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 139
    return-object v1
  :L31
  .line 121
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v11, 2131362180
    const v12, 2131231050
    const v13, 2131231044
  .line 122
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
  .line 123
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
  .line 125
    iput-boolean v9, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 126
    return-object v1
  :L32
  .line 99
    const v1, 2131362094
    filled-new-array { v5, v1 }, [I
    move-result-object v1
    const v2, 2131362354
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 100
    iput-boolean v9, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 101
    iput v8, v0, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 102
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
  .line 200
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppActivity;
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L0
  .line 202
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v5, 2131362308
    const v6, 2131231050
    const v7, 2131231044
  .line 203
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    const v8, 2131100252
    invoke-virtual { v4, v8 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v8
  .line 204
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
  .line 205
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
  .line 207
    const/4 v0, 2
    new-array v0, v0, [Lcom/innioasis/ipp/Bar$Spec;
    aput-object v1, v0, v3
    aput-object v4, v0, v2
    return-object v0
  :L0
  .line 209
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 210
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
  .line 677
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 678
    if-eqz p0, :L2
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  :L2
  .line 679
    return-void
.end method

.method private start()V
  .registers 3
  .line 1206
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1207
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1208
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 1209
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 1210
    return-void
.end method

.method private stop()V
  .registers 2
  .line 1213
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 1214
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1215
    return-void
.end method

.method private static strip(Landroid/view/View;)I
  .registers 4
  .line 432
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 433
    if-eqz v0, :L5
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L5
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    if-nez v1, :L2
    goto :L5
  :L2
  .line 434
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v1
  .line 435
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  :L3
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L4
    if-eq v0, p0, :L4
  .line 436
    move-object v2, v0
    check-cast v2, Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v2
    add-int/2addr v1, v2
  .line 435
    invoke-interface { v0 }, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    goto :L3
  :L4
  .line 438
    return v1
  :L5
  .line 433
    const/4 p0, 0
    return p0
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 830
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
  .line 832
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v0
  .line 833
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 835
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 836
    if-eqz p2, :L1
  .line 837
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
  .line 839
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
  .line 840
    if-nez p2, :L4
    goto :L5
  :L4
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  :L5
  .line 841
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L6
    int-to-float p1, v0
    goto :L7
  :L6
    int-to-float p1, v1
  :L7
  .line 843
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
  .line 754
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 755
    const/4 v0, 0
    if-gez p1, :L0
    return v0
  :L0
  .line 756
    instance-of v1, p0, Lcom/innioasis/ipp/Bar$Ticks;
    if-eqz v1, :L1
    check-cast p0, Lcom/innioasis/ipp/Bar$Ticks;
    invoke-interface { p0, p1 }, Lcom/innioasis/ipp/Bar$Ticks;->ticked(I)Z
    move-result p0
    return p0
  :L1
  .line 757
    nop
  .line 758
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    const/4 v2, 1
    if-eqz v1, :L2
  .line 759
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L2
  .line 760
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L3
  .line 761
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L3
  .line 762
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L8
  .line 763
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 764
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L4
    goto :L7
  :L4
  .line 765
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 766
    instance-of p1, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz p1, :L5
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 767
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result p0
    if-eqz p0, :L5
    const/4 v0, 1
    goto :L6
  :L5
    nop
  :L6
  .line 766
    return v0
  :L7
  .line 764
    return v0
  :L8
  .line 762
    const/4 p0, 0
  :L9
  .line 769
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
  .registers 11
  .line 855
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 856
    if-lez p2, :L12
    if-eqz v0, :L12
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L0
    goto/16 :L12
  :L0
  .line 857
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v1
  .line 858
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 859
    invoke-direct { p0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Ljava/lang/Object;I)I
    move-result v3
  .line 860
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
    move-result p2
  .line 862
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v4
    const/high16 v7, 0x3F800000
    if-eq v1, v4, :L3
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
    if-eqz v0, :L3
    const/high16 p2, 0x3F800000
  :L3
  .line 863
    cmpl-float v0, p2, v7
    if-ltz v0, :L4
    iget v3, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L6
  :L4
    const/4 v0, 0
    cmpg-float v0, p2, v0
    if-gtz v0, :L5
    goto :L6
  :L5
    iget v0, p0, Lcom/innioasis/ipp/Bar;->selText:I
    invoke-static { v3, v0, p2 }, Lcom/innioasis/ipp/Bar;->mix(IIF)I
    move-result v3
  :L6
  .line 864
    nop
  .line 865
    const/4 p2, 0
  :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v0, v0
    if-ge v6, v0, :L10
  .line 866
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v0, v0, v6
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 867
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L8
    goto :L9
  :L8
  .line 868
    check-cast v0, Landroid/widget/TextView;
  .line 869
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    if-eq v1, v3, :L9
  .line 870
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 871
    const/4 p2, 1
  :L9
  .line 865
    add-int/lit8 v6, v6, 1
    goto :L7
  :L10
  .line 874
    if-eqz p2, :L11
    invoke-static { p1, v2, v3 }, Lcom/innioasis/ipp/Bar;->followText(Landroid/view/View;Ljava/lang/Object;I)V
  :L11
  .line 875
    return-void
  :L12
  .line 856
    return-void
.end method

.method private tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 918
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 919
    if-nez v0, :L0
    return-void
  :L0
  .line 920
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
  .line 921
    const/4 p2, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v1, v1
    if-ge p2, v1, :L5
  .line 922
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v1, v1, p2
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 923
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    if-eq v2, p1, :L4
  .line 924
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L4
  .line 921
    add-int/lit8 p2, p2, 1
    goto :L3
  :L5
  .line 927
    return-void
.end method

.method private undressHead()V
  .registers 6
  .line 960
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 961
    if-nez v0, :L0
    return-void
  :L0
  .line 962
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
  .line 963
    iput-boolean v4, p0, Lcom/innioasis/ipp/Bar;->stockHead:Z
  .line 964
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v1, :L3
    iget-object v4, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v4, v4, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
    goto :L4
  :L3
    const v4, 2131231044
  :L4
    invoke-virtual { v2, v0, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 965
    nop
  :L5
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v2, v2
    if-ge v3, v2, :L9
  .line 966
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v2, v2, v3
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 967
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
  .line 965
    add-int/lit8 v3, v3, 1
    goto :L5
  :L9
  .line 969
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 970
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 971
    return-void
.end method

.method public static wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 603
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

.method public doFrame(J)V
  .registers 13
  .line 1218
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 1219
    const/4 v1, 0
    if-eqz v0, :L15
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v2
    if-eqz v2, :L15
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-eqz v2, :L15
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L15
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L15
  .line 1220
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v2
    if-nez v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-nez v2, :L0
    goto/16 :L15
  :L0
  .line 1224
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 1225
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
  .line 1226
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 1227
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 1228
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
  .line 1229
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L10
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L10
  .line 1230
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 1232
    iget v3, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v3 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v3
    if-nez v3, :L4
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->opening()Z
    move-result v3
    if-nez v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    iget v4, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v5, p1
    invoke-static { v0, v3, v4, p2, v5 }, Lcom/innioasis/ipp/Bar;->crosses(Landroidx/recyclerview/widget/RecyclerView;FFFF)Z
    move-result v3
    if-eqz v3, :L4
  :L3
  .line 1233
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1234
    int-to-float v3, p1
    iput v3, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L4
  .line 1237
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    iget v4, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
    const/4 v5, 0
    cmpl-float v4, v3, v4
    if-eqz v4, :L5
    iput v5, p0, Lcom/innioasis/ipp/Bar;->vel:F
  :L5
  .line 1238
    sub-float/2addr v3, p2
  .line 1239
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 1240
    iget v6, p0, Lcom/innioasis/ipp/Bar;->vel:F
    const/high16 v7, 0x41F00000
    mul-float v8, v3, v7
    add-float/2addr v6, v8
  .line 1241
    const/high16 v8, 0xC1F00000
    mul-float v8, v8, v2
    float-to-double v8, v8
    invoke-static { v8, v9 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v8
    double-to-float v8, v8
  .line 1242
    mul-float v9, v6, v2
    add-float/2addr v3, v9
    mul-float v3, v3, v8
  .line 1243
    iget v9, p0, Lcom/innioasis/ipp/Bar;->vel:F
    mul-float v6, v6, v7
    mul-float v6, v6, v2
    sub-float/2addr v9, v6
    mul-float v9, v9, v8
    iput v9, p0, Lcom/innioasis/ipp/Bar;->vel:F
  .line 1245
    iget v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-nez v2, :L7
    cmpl-float v2, v4, v5
    if-nez v2, :L6
    goto :L7
  :L6
  .line 1246
    iget v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v6, p1
    sub-float/2addr v6, v2
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v7
    div-float/2addr v7, v4
    const/high16 v4, 0x3F800000
    sub-float v7, v4, v7
    invoke-static { v4, v7 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    invoke-static { v5, v4 }, Ljava/lang/Math;->max(FF)F
    move-result v4
    mul-float v6, v6, v4
    add-float/2addr v2, v6
    iput v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    goto :L8
  :L7
  .line 1245
    int-to-float v2, p1
    iput v2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L8
  .line 1247
    add-float v2, p2, v3
    iput v2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1248
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L9
    iget v2, p0, Lcom/innioasis/ipp/Bar;->vel:F
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x41700000
    cmpg-float v2, v2, v3
    if-gez v2, :L9
  .line 1249
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1250
    int-to-float p2, p1
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 1251
    iput v5, p0, Lcom/innioasis/ipp/Bar;->vel:F
  :L9
  .line 1253
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    iput p2, p0, Lcom/innioasis/ipp/Bar;->movedTo:F
  :L10
  .line 1255
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 1257
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p2
  .line 1258
    if-eqz p2, :L11
    invoke-virtual { p2 }, Landroid/view/View;->invalidate()V
  :L11
  .line 1259
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L13
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
    cmpl-float p2, p2, v0
    if-nez p2, :L13
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float p1, p1
    cmpl-float p1, p2, p1
    if-eqz p1, :L12
    goto :L13
  :L12
  .line 1262
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
    goto :L14
  :L13
  .line 1260
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L14
  .line 1264
    return-void
  :L15
  .line 1221
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 1222
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 403
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 404
    if-eqz v0, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  :L1
  .line 406
    goto :L3
  :L2
  .line 405
    move-exception p1
  :L3
  .line 407
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 410
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L16 } :L18
  .registers 15
  :L0
  .line 1132
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 1133
    if-eqz p3, :L17
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-nez v0, :L1
    goto/16 :L17
  :L1
  .line 1134
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 1135
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 1136
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 1137
    const/4 v2, 0
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 1138
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
  .line 1139
    invoke-virtual { v3 }, Landroid/view/View;->getRight()I
    move-result v3
  .line 1140
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v5
  .line 1141
    nop
  :L2
    if-ge v2, p3, :L8
  .line 1142
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 1143
    invoke-static { v6 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v7
    if-eqz v7, :L3
    goto :L7
  :L3
  .line 1144
    invoke-virtual { p2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v7
  .line 1146
    if-eq v7, v5, :L4
    invoke-static { p2, v7 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v7
    if-eqz v7, :L4
    move-object v7, v1
    goto :L5
  :L4
    move-object v7, v0
  :L5
  .line 1147
    if-nez v7, :L6
    goto :L7
  :L6
  .line 1148
    invoke-virtual { v6 }, Landroid/view/View;->getTop()I
    move-result v8
    int-to-float v8, v8
    invoke-virtual { v6 }, Landroid/view/View;->getTranslationY()F
    move-result v9
    add-float/2addr v8, v9
    invoke-static { v8 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 1149
    invoke-virtual { v6 }, Landroid/view/View;->getLeft()I
    move-result v9
    invoke-virtual { v6 }, Landroid/view/View;->getRight()I
    move-result v10
    invoke-virtual { v6 }, Landroid/view/View;->getHeight()I
    move-result v6
    add-int/2addr v6, v8
    invoke-virtual { v7, v9, v8, v10, v6 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1150
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L7
  .line 1141
    add-int/lit8 v2, v2, 1
    goto :L2
  :L8
  .line 1152
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p3
    if-nez p3, :L9
  .line 1154
    const/high16 p1, 0x7FC00000
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 1155
    return-void
  :L9
  .line 1157
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p3
  .line 1158
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
  .line 1159
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v2
  .line 1160
    if-nez v0, :L10
  .line 1161
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 1162
    return-void
  :L10
  .line 1164
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 1165
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    if-eqz v5, :L11
    int-to-float v5, p3
    goto :L12
  :L11
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L12
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
  .line 1166
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v6
    if-nez v6, :L14
  .line 1167
    if-eqz v1, :L13
  .line 1168
    add-int/2addr v5, v0
    invoke-virtual { v1, v4, v0, v3, v5 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1169
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L13
  .line 1171
    invoke-direct { p0, p1, p2, v0 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  :L14
  .line 1173
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float p1, p1, v2
    if-nez p1, :L15
    iget p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float p2, p3
    cmpl-float p1, p1, p2
    if-eqz p1, :L16
  :L15
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L16
  .line 1175
    goto :L19
  :L17
  .line 1133
    return-void
  :L18
  .line 1174
    move-exception p1
  :L19
  .line 1176
    return-void
.end method
