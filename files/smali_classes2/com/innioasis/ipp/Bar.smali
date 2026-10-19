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

.field private final static RATE:F = 22.0F

.field private final static ROWS:Ljava/util/WeakHashMap;

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 700.0F

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

.field private final rowProbe:Landroid/view/View;

.field private final rowText:I

.field private running:Z

.field private final rv:Ljava/lang/ref/WeakReference;

.field private final selProbe:Landroid/view/View;

.field private final selText:I

.field private snap:Z

.field private final spec:Lcom/innioasis/ipp/Bar$Spec;

.field private final tinter:Lcom/innioasis/ipp/Bar$Tinter;

.field private y:F

.method static constructor <clinit>()V
  .registers 2
  .line 162
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
  .line 300
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->CAPTION:Ljava/lang/Object;
  .line 343
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
  .line 407
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
  .line 501
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 8
  .line 190
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 172
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 175
    const/4 v1, -1
    iput v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 182
    iput v0, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 184
    new-instance v0, Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
  .line 186
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 619
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 849
    new-instance v0, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 191
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 192
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 193
    iput-object p3, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
  .line 194
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    if-nez v0, :L0
    goto :L1
  :L0
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    invoke-virtual { p2, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  :L1
  .line 195
    new-instance p2, Ljava/lang/ref/WeakReference;
    invoke-direct { p2, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
  .line 196
    if-eqz v1, :L2
    sget-object p2, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { p2, v1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 197
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 198
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 199
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 200
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    const/4 v3, 1
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 201
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    const/4 v2, 0
    invoke-virtual { p2, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 203
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 204
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { p1, p2, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 205
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 206
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { p1, p2, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 207
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 208
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    invoke-virtual { v0, p2, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 209
    iget p3, p3, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
    if-eqz p3, :L4
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
  :L4
    iput p1, p0, Lcom/innioasis/ipp/Bar;->headText:I
  .line 210
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
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dressed()Z
    move-result p0
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

.method static synthetic access$1600(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method static synthetic access$1700(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dressHead()V
    return-void
.end method

.method static synthetic access$1800(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 29
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p0
    return-object p0
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
  .line 218
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 219
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
  .line 220
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->specs(Lcom/innioasis/y1/base/BaseActivity;)[Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 221
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
  .line 223
    goto :L6
  :L5
  .line 222
    move-exception p0
  :L6
  .line 224
    return-void
.end method

.method private static apply(Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 7
  :L0
  .line 228
    iget v0, p1, Lcom/innioasis/ipp/Bar$Spec;->list:I
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 229
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v1, :L1
    return-void
  :L1
  .line 230
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 231
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, v0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/Bar;
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v3
  .line 233
    if-eqz v2, :L2
    const/4 v4, 1
    goto :L3
  :L2
    const/4 v4, 0
  :L3
    if-ne v3, v4, :L4
    return-void
  :L4
  .line 234
    if-eqz v3, :L5
  .line 235
    new-instance v2, Lcom/innioasis/ipp/Bar;
    invoke-direct { v2, v0, p0, p1 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 236
    invoke-virtual { v1, v0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 237
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 238
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 239
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p1, v2, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L6
  :L5
  .line 241
    invoke-virtual { v1, v0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 242
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 243
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 244
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    iget-object p1, v2, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p0, p1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 245
    invoke-direct { v2 }, Lcom/innioasis/ipp/Bar;->stop()V
  .line 246
    invoke-direct { v2 }, Lcom/innioasis/ipp/Bar;->undressHead()V
  :L6
  .line 248
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 249
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    if-eqz p0, :L7
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L7
  .line 251
    goto :L9
  :L8
  .line 250
    move-exception p0
  :L9
  .line 252
    return-void
.end method

.method private static blank(Landroid/view/View;)V
  .registers 4
  .line 351
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 352
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v2, -1
    if-eqz v1, :L1
  .line 353
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 354
    iget p0, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-eq p0, v2, :L0
    sget-object p0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L0
  .line 355
    goto :L2
  :L1
  .line 356
    new-instance v0, Lcom/innioasis/ipp/Rows$Flat;
    sget-object v1, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 357
    iput v2, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 358
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 360
    return-void
.end method

.method public static blink(Landroid/view/View;Z)Z
  .catchall { :L1 .. :L8 } :L11
  .registers 7
  .line 440
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p0, :L12
    const/4 v2, 3
    if-ge v1, v2, :L12
  :L1
  .line 441
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v2
  .line 442
    if-eqz v2, :L7
  .line 443
    iget-object p0, v2, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 444
    if-eqz p0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L6
  :L2
  .line 445
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    iput-wide v3, v2, Lcom/innioasis/ipp/Bar;->blinkAt:J
  .line 446
    iget-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    xor-int/lit8 v3, p1, 1
    const/4 v4, 1
    if-eq v1, v3, :L5
  .line 447
    if-nez p1, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    iput-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 448
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 450
    if-nez p1, :L5
    const-wide/16 v1, 700
    invoke-virtual { p0, v1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateDelayed(J)V
  :L5
  .line 452
    return v4
  :L6
  .line 444
    return v0
  :L7
  .line 454
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 455
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
  .line 440
    add-int/lit8 v1, v1, 1
    goto :L0
  :L11
  .line 457
    move-exception p0
    goto :L13
  :L12
  .line 458
    nop
  :L13
  .line 459
    return v0
.end method

.method public static bound(Landroidx/viewbinding/ViewBinding;)V
  .registers 1
  .line 259
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 260
    return-void
.end method

.method private static caption(Landroid/view/View;)Z
  .registers 2
  .line 303
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
  .line 707
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
  .line 708
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
  .line 709
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
  .line 707
    return v1
.end method

.method private clean(Landroid/view/View;)V
  .registers 6
  .line 322
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 323
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  .line 324
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 325
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v1, v1
    if-nez v1, :L1
  .line 326
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
    goto :L5
  :L1
  .line 328
    const/4 v1, 0
  :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v2, v2
    if-ge v1, v2, :L5
  .line 329
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    aget v2, v2, v1
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 330
    if-nez v2, :L3
    goto :L4
  :L3
  .line 332
    sget-object v3, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 333
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L4
  .line 328
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 336
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-eqz v0, :L6
  .line 337
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 338
    if-eqz v0, :L6
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L6
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L6
  .line 340
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  .line 341
    return-void
.end method

.method private cursor()I
  .registers 4
  .line 538
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-boolean v0, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
    const/4 v1, -1
    if-eqz v0, :L5
  .line 539
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 540
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 541
    instance-of v2, v0, Lcom/innioasis/ipp/Bar$Cursor;
    if-eqz v2, :L2
    check-cast v0, Lcom/innioasis/ipp/Bar$Cursor;
    invoke-interface { v0 }, Lcom/innioasis/ipp/Bar$Cursor;->cursor()I
    move-result v0
    return v0
  :L2
  .line 542
    instance-of v2, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L3
  .line 543
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L3
  .line 545
    instance-of v2, v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v2, :L4
  .line 546
    check-cast v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L4
  .line 548
    return v1
  :L5
  .line 550
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 551
    if-nez v0, :L6
    goto :L7
  :L6
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  :L7
    return v1
.end method

.method private cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 3
  .line 652
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 653
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
  .line 470
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 471
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
  .line 475
    const/4 v0, 1
    return v0
  :L2
  .line 472
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 473
    return v1
.end method

.method static defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 4
  .line 642
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 643
    if-eqz v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 644
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 645
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 646
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 647
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 648
    return v1
  :L3
  .line 643
    const/4 p0, 0
    return p0
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 9
  .line 939
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 940
    if-nez p2, :L0
    return-void
  :L0
  .line 941
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-nez v0, :L1
    return-void
  :L1
  .line 942
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p2, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 944
    if-eqz v0, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    const/16 v2, 8
    if-eq v1, v2, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 946
    nop
  .line 947
    const/4 v1, 0
    move-object v3, v0
    const/4 v2, 0
  :L3
    if-eqz v3, :L6
    if-eq v3, p2, :L6
  .line 948
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
    add-int/2addr v1, v4
  .line 949
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v4
    add-int/2addr v2, v4
  .line 950
    invoke-virtual { v3 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
  .line 951
    instance-of v4, v3, Landroid/view/View;
    if-eqz v4, :L4
    check-cast v3, Landroid/view/View;
    goto :L5
  :L4
    const/4 v3, 0
  :L5
  .line 952
    goto :L3
  :L6
  .line 953
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 954
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result p2
    add-int/2addr p2, v1
    int-to-float p2, p2
    add-int/2addr p3, v2
    int-to-float p3, p3
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 955
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 956
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 957
    return-void
  :L7
  .line 944
    return-void
.end method

.method private dressHead()V
  .registers 5
  .line 731
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 732
    if-nez v0, :L0
    return-void
  :L0
  .line 733
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 734
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v3, -1
    if-eqz v2, :L2
  .line 735
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
  .line 736
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Rows$Flat;->inner()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    if-eq v0, v2, :L1
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L1
  .line 737
    goto :L3
  :L2
  .line 738
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 739
    iput v3, v1, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 740
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 742
    return-void
.end method

.method private dressed()Z
  .registers 3
  .line 745
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 746
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  :L1
  .line 747
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

.method private static followText(Landroid/view/View;Ljava/lang/Object;I)V
  .registers 4
  .line 822
    instance-of v0, p1, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v0, :L0
  .line 823
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->listRow(Landroid/view/View;)V
    goto :L4
  :L0
  .line 824
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v0, :L1
  .line 825
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tinted(Landroid/view/View;)V
    goto :L4
  :L1
  .line 826
    instance-of v0, p1, Lcom/innioasis/music/SongListActivity;
    if-nez v0, :L3
    instance-of v0, p1, Lcom/innioasis/music/PlayListActivity;
    if-eqz v0, :L2
    goto :L3
  :L2
  .line 829
    instance-of p1, p1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz p1, :L4
  .line 830
    const p1, 2131362040
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 832
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L4
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object p1
    if-eqz p1, :L4
  .line 833
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
    goto :L4
  :L3
  .line 828
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->tinted(Landroid/view/View;)V
  :L4
  .line 836
    return-void
.end method

.method private head()Landroid/view/View;
  .registers 3
  .line 562
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 563
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
  .line 572
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
  .line 573
    const/4 v0, 2
    new-array v1, v0, [I
  .line 574
    new-array v0, v0, [I
  .line 575
    invoke-virtual { p1, v1 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 576
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLocationInWindow([I)V
  .line 577
    const/4 p0, 1
    aget p1, v1, p0
    aget p0, v0, p0
    sub-int/2addr p1, p0
    return p1
.end method

.method private height(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 6
  .line 840
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 841
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p1
    return p1
  :L2
  .line 842
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 843
    const/4 v1, 0
    const/4 v2, 0
  :L3
    if-nez v0, :L5
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L5
  .line 844
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L4
  .line 843
    add-int/lit8 v2, v2, 1
    goto :L3
  :L5
  .line 846
    if-nez v0, :L6
    goto :L7
  :L6
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
  :L7
    return v1
.end method

.method public static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  .line 415
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
  .line 416
    if-eqz v1, :L10
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-eqz v2, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L2
    goto :L10
  :L2
  .line 417
    iget-boolean v2, v1, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 1
    if-eqz v2, :L3
    const-string p0, "holds snap"
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
    return v3
  :L3
  .line 418
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v2
    const/4 v4, 0
    cmpl-float v2, v2, v4
    if-nez v2, :L4
    return v0
  :L4
  .line 419
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v1
  .line 420
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v2
  .line 421
    if-lez p1, :L5
    sub-int/2addr v2, v3
    if-lt v1, v2, :L7
    goto :L6
  :L5
    if-gtz v1, :L7
  :L6
    goto :L8
  :L7
    const/4 v3, 0
  :L8
  .line 422
    if-eqz v3, :L9
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "holds end m "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v1, " left "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result p0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L9
  .line 423
    return v3
  :L10
  .line 416
    return v0
  :L11
  .line 424
    move-exception p0
  .line 425
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 365
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 366
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
  .line 367
    const/4 v2, 1
    if-eqz v1, :L4
  .line 368
    iget-object v3, v1, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-ne p0, v3, :L2
  .line 370
    iget-object p0, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 371
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p0
    if-lez p0, :L1
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->dressHead()V
  :L1
  .line 372
    goto :L3
  :L2
  .line 373
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L3
  .line 375
    return v2
  :L4
  .line 377
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L5
  .line 378
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L9
  .line 379
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 380
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L7
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L6
    goto :L7
  :L6
  .line 385
    goto :L5
  :L7
  .line 381
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 382
    if-eqz p0, :L8
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L8
  .line 383
    return v2
  :L9
  .line 387
    goto :L11
  :L10
  .line 386
    move-exception p0
  :L11
  .line 388
    return v0
.end method

.method private static live(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 293
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private multi()Z
  .catchall { :L0 .. :L1 } :L10
  .catch Ljava/lang/NoSuchFieldException; { :L2 .. :L3 } :L4
  .catchall { :L2 .. :L3 } :L10
  .catchall { :L5 .. :L8 } :L10
  .registers 7
  .line 480
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 481
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 483
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
  .line 484
    sget-object v3, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L1
  .line 485
    const/4 v4, 1
    if-nez v3, :L7
  :L2
  .line 487
    const-string v3, "isMultiSelect"
    invoke-virtual { v2, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v3
  .line 488
    invoke-virtual { v3, v4 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  :L3
  .line 489
    nop
  .line 492
    goto :L6
  :L4
  .line 490
    move-exception v3
  :L5
  .line 491
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
  :L6
  .line 493
    sget-object v5, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v5, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 495
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
  .line 496
    move-exception v0
  .line 497
    return v1
.end method

.method private observe()V
  .registers 4
  .line 605
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 606
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 607
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v0, :L2
  .line 609
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v1, p0, Lcom/innioasis/ipp/Bar;->adapter:Ljava/lang/ref/WeakReference;
  .line 610
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 611
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 612
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  :L2
  .line 614
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 615
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
  .line 616
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 617
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 4
  .line 396
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 397
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
  .line 398
    if-eqz v0, :L2
  .line 399
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 400
    return-object v0
  :L2
  .line 402
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 403
    if-nez p0, :L3
    move-object p0, v2
    goto :L4
  :L3
    check-cast p0, Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L4
  .line 404
    if-eqz p0, :L5
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsValue(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    move-object v2, p0
  :L5
    return-object v2
.end method

.method static on(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 313
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
  .line 567
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
  .line 556
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 557
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

.method private static plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
  .registers 12
  .line 150
    new-instance v8, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131231050
    const v3, 2131231044
  .line 151
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v4
  .line 152
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
  .line 150
    return-object v8
.end method

.method private refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 9
  .line 766
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 767
    if-nez v0, :L0
    return-void
  :L0
  .line 768
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
  .line 769
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
  .line 768
    const-wide v1, 9223372036854775806L
  :L3
  .line 770
    iget-wide v3, p0, Lcom/innioasis/ipp/Bar;->headKey:J
    cmp-long p1, v1, v3
    if-nez p1, :L4
    return-void
  :L4
  .line 771
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 772
    invoke-virtual { v0 }, Landroid/view/View;->invalidate()V
  .line 773
    return-void
.end method

.method public static relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 3
  .line 511
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 512
    const/4 v0, 0
    if-nez p0, :L2
    return v0
  :L2
  .line 513
    const/high16 v1, 0x7FC00000
    iput v1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 514
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 515
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 516
    const/4 p0, 1
    return p0
.end method

.method public static relisted(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 526
    if-eqz p0, :L7
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L7
  :L1
  .line 527
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 528
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L4
  .line 529
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 530
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 531
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-ne v2, p0, :L3
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  :L3
  .line 532
    goto :L2
  :L4
  .line 534
    goto :L6
  :L5
  .line 533
    move-exception p0
  :L6
  .line 535
    return-void
  :L7
  .line 526
    return-void
.end method

.method public static row(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 265
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  :L1
  .line 266
    if-nez v0, :L2
    return-void
  :L2
  .line 267
    iget-object v1, v0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 268
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L3
    goto :L6
  :L3
  .line 270
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
  .line 271
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  .line 274
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L5
  .line 276
    goto :L8
  :L6
  .line 268
    return-void
  :L7
  .line 275
    move-exception p0
  :L8
  .line 277
    return-void
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 623
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 625
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
  .line 626
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 627
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 628
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 625
    return v1
  :L2
  .line 629
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 630
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 631
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L3
  .line 633
    const/4 p1, 1
    return p1
.end method

.method private static spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
  .registers 18
  .line 64
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/MainActivity;
    const v2, 2131100267
    const v3, 2131100252
    const v4, 2131362491
    if-eqz v1, :L0
  .line 65
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v6, 2131362308
    const v7, 2131231052
    const v8, 2131231044
  .line 66
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
  .line 67
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v10
    filled-new-array { v4 }, [I
    move-result-object v11
    const v12, 2131362144
    move-object v5, v1
    invoke-direct/range { v5 .. v12 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 65
    return-object v1
  :L0
  .line 69
    instance-of v1, v0, Lcom/innioasis/y1/activity/SettingActivity;
    const v5, 2131362459
    const v6, 2131362437
    if-eqz v1, :L1
  .line 70
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
  .line 73
    instance-of v1, v0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L2
  .line 74
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131231050
    const v10, 2131231044
  .line 75
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v11
  .line 76
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v12
    filled-new-array { v4 }, [I
    move-result-object v13
    const v14, 2131362144
    move-object v7, v1
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 74
    return-object v1
  :L2
  .line 78
    instance-of v1, v0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L3
  .line 79
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
  .line 82
    instance-of v1, v0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v1, :L4
  .line 83
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
  .line 86
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz v1, :L5
  .line 87
    const v1, 2131362520
    const v2, 2131362521
    const v3, 2131362042
    filled-new-array { v3, v1, v2 }, [I
    move-result-object v1
    const v2, 2131362310
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 88
    const v1, 2131362519
    const v2, 2131362041
    filled-new-array { v1, v2 }, [I
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 89
    return-object v0
  :L5
  .line 91
    instance-of v1, v0, Lcom/innioasis/music/SearchActivity;
    const v7, 2131362353
    const/4 v8, 1
    if-nez v1, :L12
    instance-of v1, v0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-eqz v1, :L6
    goto/16 :L12
  :L6
  .line 98
    instance-of v1, v0, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v1, :L7
  .line 99
    const v1, 2131362298
    filled-new-array { v4 }, [I
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 100
    iput-boolean v8, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 101
    return-object v0
  :L7
  .line 103
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-eqz v1, :L8
  .line 105
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v10, 2131362310
    const v11, 2131231052
    const/4 v12, 0
    const v13, -12779554
    const/4 v14, -1
    filled-new-array { v5, v6, v4 }, [I
    move-result-object v15
    const/16 v16, 0
    move-object v9, v1
    invoke-direct/range { v9 .. v16 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 107
    iput v7, v1, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 108
    const v2, 2131231052
    iput v2, v1, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
  .line 109
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
    iput v0, v1, Lcom/innioasis/ipp/Bar$Spec;->headColor:I
  .line 110
    return-object v1
  :L8
  .line 112
    instance-of v1, v0, Lcom/innioasis/music/SongListActivity;
    if-nez v1, :L11
    instance-of v1, v0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L9
    goto :L11
  :L9
  .line 122
    instance-of v0, v0, Lcom/innioasis/fm/MenuActivity;
    if-eqz v0, :L10
  .line 124
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v8, 2131362310
    const v9, 2131230823
    const/4 v10, 0
    const v11, -12779554
    const/4 v12, -1
    filled-new-array { v4, v6 }, [I
    move-result-object v13
    const v14, 2131362144
    move-object v7, v0
    invoke-direct/range { v7 .. v14 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object v0
  :L10
  .line 127
    const/4 v0, 0
    return-object v0
  :L11
  .line 115
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v10, 2131362180
    const v11, 2131231050
    const v12, 2131231044
  .line 116
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v13
  .line 117
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v14
    const v0, 2131362500
    const v2, 2131362485
    const v3, 2131362499
    filled-new-array { v3, v0, v2 }, [I
    move-result-object v15
    const v16, 2131362321
    move-object v9, v1
    invoke-direct/range { v9 .. v16 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 119
    iput-boolean v8, v1, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 120
    return-object v1
  :L12
  .line 93
    const v1, 2131362094
    filled-new-array { v5, v1 }, [I
    move-result-object v1
    const v2, 2131362354
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 94
    iput-boolean v8, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 95
    iput v7, v0, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 96
    return-object v0
.end method

.method private static specs(Lcom/innioasis/y1/base/BaseActivity;)[Lcom/innioasis/ipp/Bar$Spec;
  .registers 21
  .line 135
    move-object/from16 v0, p0
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppActivity;
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L0
  .line 137
    new-instance v1, Lcom/innioasis/ipp/Bar$Spec;
    const v5, 2131362308
    const v6, 2131231050
    const v7, 2131231044
  .line 138
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    const v8, 2131100252
    invoke-virtual { v4, v8 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v8
  .line 139
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
  .line 140
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
  .line 142
    const/4 v0, 2
    new-array v0, v0, [Lcom/innioasis/ipp/Bar$Spec;
    aput-object v1, v0, v3
    aput-object v4, v0, v2
    return-object v0
  :L0
  .line 144
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Bar;->spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v0
  .line 145
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
  .line 505
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 506
    if-eqz p0, :L2
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  :L2
  .line 507
    return-void
.end method

.method private start()V
  .registers 3
  .line 960
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 961
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 962
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 963
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 964
    return-void
.end method

.method private stop()V
  .registers 2
  .line 967
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 968
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 969
    return-void
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 658
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
  .line 659
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
  .line 660
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 662
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 663
    if-eqz p2, :L1
  .line 664
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
    invoke-virtual { p2 }, Landroid/view/View;->getTranslationY()F
    move-result p2
    add-float/2addr p1, p2
    goto :L7
  :L1
  .line 666
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
  .line 667
    if-nez p2, :L4
    goto :L5
  :L4
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  :L5
  .line 668
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L6
    int-to-float p1, v0
    goto :L7
  :L6
    int-to-float p1, v1
  :L7
  .line 670
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
  .line 582
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 583
    const/4 v0, 0
    if-gez p1, :L0
    return v0
  :L0
  .line 584
    instance-of v1, p0, Lcom/innioasis/ipp/Bar$Ticks;
    if-eqz v1, :L1
    check-cast p0, Lcom/innioasis/ipp/Bar$Ticks;
    invoke-interface { p0, p1 }, Lcom/innioasis/ipp/Bar$Ticks;->ticked(I)Z
    move-result p0
    return p0
  :L1
  .line 585
    nop
  .line 586
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    const/4 v2, 1
    if-eqz v1, :L2
  .line 587
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L2
  .line 588
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L3
  .line 589
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L9
  :L3
  .line 590
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L8
  .line 591
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 592
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L4
    goto :L7
  :L4
  .line 593
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 594
    instance-of p1, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz p1, :L5
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 595
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result p0
    if-eqz p0, :L5
    const/4 v0, 1
    goto :L6
  :L5
    nop
  :L6
  .line 594
    return v0
  :L7
  .line 592
    return v0
  :L8
  .line 590
    const/4 p0, 0
  :L9
  .line 597
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
  .registers 9
  .line 681
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 682
    if-lez p2, :L12
    if-eqz v0, :L12
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L0
    goto/16 :L12
  :L0
  .line 683
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v1
  .line 684
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v2
    int-to-float v2, v2
    invoke-virtual { p1 }, Landroid/view/View;->getTranslationY()F
    move-result v3
    add-float/2addr v2, v3
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v3
    const/4 v4, 1
    const/4 v5, 0
    if-ne v1, v3, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
    invoke-direct { p0, v0, p2, v2, v3 }, Lcom/innioasis/ipp/Bar;->claims(Landroidx/recyclerview/widget/RecyclerView;IFZ)Z
    move-result p2
  .line 685
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 686
    instance-of v3, v2, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/Bar;->rowText:I
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Eq;->rowColor(II)I
    move-result v3
    goto :L4
  :L3
    iget v3, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L4
  .line 688
    if-nez p2, :L5
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p2
    if-eq v1, p2, :L6
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L6
  :L5
    iget v3, p0, Lcom/innioasis/ipp/Bar;->selText:I
  :L6
  .line 689
    nop
  .line 690
    const/4 p2, 0
  :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v0, v0
    if-ge v5, v0, :L10
  .line 691
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v0, v0, v5
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 692
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L8
    goto :L9
  :L8
  .line 693
    check-cast v0, Landroid/widget/TextView;
  .line 694
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    if-eq v1, v3, :L9
  .line 695
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 696
    const/4 p2, 1
  :L9
  .line 690
    add-int/lit8 v5, v5, 1
    goto :L7
  :L10
  .line 699
    if-eqz p2, :L11
    invoke-static { p1, v2, v3 }, Lcom/innioasis/ipp/Bar;->followText(Landroid/view/View;Ljava/lang/Object;I)V
  :L11
  .line 700
    return-void
  :L12
  .line 682
    return-void
.end method

.method private tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 714
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 715
    if-nez v0, :L0
    return-void
  :L0
  .line 716
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
  .line 717
    const/4 p2, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v1, v1
    if-ge p2, v1, :L5
  .line 718
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v1, v1, p2
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 719
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    if-eq v2, p1, :L4
  .line 720
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L4
  .line 717
    add-int/lit8 p2, p2, 1
    goto :L3
  :L5
  .line 723
    return-void
.end method

.method private undressHead()V
  .registers 6
  .line 752
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 753
    if-nez v0, :L0
    return-void
  :L0
  .line 754
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v1
    const/4 v2, -1
    const/4 v3, 0
    if-ne v1, v2, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 755
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v1, :L3
    iget-object v4, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v4, v4, Lcom/innioasis/ipp/Bar$Spec;->headSel:I
    goto :L4
  :L3
    const v4, 2131231044
  :L4
    invoke-virtual { v2, v0, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 756
    nop
  :L5
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v2, v2
    if-ge v3, v2, :L9
  .line 757
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v2, v2, v3
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 758
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
  .line 756
    add-int/lit8 v3, v3, 1
    goto :L5
  :L9
  .line 760
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 761
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 762
    return-void
.end method

.method public static wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 431
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
  .registers 11
  .line 972
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 973
    const/4 v1, 0
    if-eqz v0, :L12
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v2
    if-eqz v2, :L12
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-eqz v2, :L12
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L12
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L12
  .line 974
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v2
    if-nez v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-nez v2, :L0
    goto/16 :L12
  :L0
  .line 978
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 979
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
  .line 980
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 981
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 982
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
  .line 983
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L7
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L7
  .line 984
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 985
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float v3, p2, v3
  .line 986
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 987
    const/high16 v5, 0x41B00000
    mul-float v5, v5, v4
    const v6, 1169915904
    invoke-static { v6, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
    const/high16 v6, 0x442F0000
    invoke-static { v6, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 988
    mul-float v5, v5, v2
    invoke-static { v4, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  .line 990
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    const/4 v6, 0
    if-nez v5, :L4
    cmpl-float v5, v4, v6
    if-nez v5, :L3
    goto :L4
  :L3
  .line 991
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v7, p1
    sub-float/2addr v7, v5
    div-float v4, v2, v4
    mul-float v7, v7, v4
    add-float/2addr v5, v7
    iput v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    goto :L5
  :L4
  .line 990
    int-to-float v4, p1
    iput v4, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L5
  .line 992
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpg-float v3, v3, v6
    if-gez v3, :L6
    neg-float v2, v2
  :L6
    add-float/2addr v4, v2
    iput v4, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 993
    sub-float v2, p2, v4
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L7
  .line 994
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 995
    int-to-float p2, p1
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L7
  .line 998
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 1000
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p2
  .line 1001
    if-eqz p2, :L8
    invoke-virtual { p2 }, Landroid/view/View;->invalidate()V
  :L8
  .line 1002
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L10
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
    cmpl-float p2, p2, v0
    if-nez p2, :L10
    iget p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float p1, p1
    cmpl-float p1, p2, p1
    if-eqz p1, :L9
    goto :L10
  :L9
  .line 1005
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
    goto :L11
  :L10
  .line 1003
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L11
  .line 1007
    return-void
  :L12
  .line 975
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 976
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 282
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 283
    if-eqz v0, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  :L1
  .line 285
    goto :L3
  :L2
  .line 284
    move-exception p1
  :L3
  .line 286
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 289
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L16 } :L18
  .registers 15
  :L0
  .line 891
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 892
    if-eqz p3, :L17
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-nez v0, :L1
    goto/16 :L17
  :L1
  .line 893
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 894
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 895
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 896
    const/4 v2, 0
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 897
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
  .line 898
    invoke-virtual { v3 }, Landroid/view/View;->getRight()I
    move-result v3
  .line 899
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v5
  .line 900
    nop
  :L2
    if-ge v2, p3, :L8
  .line 901
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 902
    invoke-static { v6 }, Lcom/innioasis/ipp/Bar;->caption(Landroid/view/View;)Z
    move-result v7
    if-eqz v7, :L3
    goto :L7
  :L3
  .line 903
    invoke-virtual { p2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v7
  .line 905
    if-eq v7, v5, :L4
    invoke-static { p2, v7 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v7
    if-eqz v7, :L4
    move-object v7, v1
    goto :L5
  :L4
    move-object v7, v0
  :L5
  .line 906
    if-nez v7, :L6
    goto :L7
  :L6
  .line 907
    invoke-virtual { v6 }, Landroid/view/View;->getTop()I
    move-result v8
    int-to-float v8, v8
    invoke-virtual { v6 }, Landroid/view/View;->getTranslationY()F
    move-result v9
    add-float/2addr v8, v9
    invoke-static { v8 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 908
    invoke-virtual { v6 }, Landroid/view/View;->getLeft()I
    move-result v9
    invoke-virtual { v6 }, Landroid/view/View;->getRight()I
    move-result v10
    invoke-virtual { v6 }, Landroid/view/View;->getHeight()I
    move-result v6
    add-int/2addr v6, v8
    invoke-virtual { v7, v9, v8, v10, v6 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 909
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L7
  .line 900
    add-int/lit8 v2, v2, 1
    goto :L2
  :L8
  .line 911
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p3
    if-nez p3, :L9
  .line 913
    const/high16 p1, 0x7FC00000
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 914
    return-void
  :L9
  .line 916
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p3
  .line 917
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
  .line 918
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v2
  .line 919
    if-nez v0, :L10
  .line 920
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 921
    return-void
  :L10
  .line 923
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 924
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
  .line 925
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v6
    if-nez v6, :L14
  .line 926
    if-eqz v1, :L13
  .line 927
    add-int/2addr v5, v0
    invoke-virtual { v1, v4, v0, v3, v5 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 928
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L13
  .line 930
    invoke-direct { p0, p1, p2, v0 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  :L14
  .line 932
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
  .line 934
    goto :L19
  :L17
  .line 892
    return-void
  :L18
  .line 933
    move-exception p1
  :L19
  .line 935
    return-void
.end method
