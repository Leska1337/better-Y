.class public final Lcom/innioasis/ipp/Bar;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "Bar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Bar$Spec;,
    Lcom/innioasis/ipp/Bar$HeadPaint;,
    Lcom/innioasis/ipp/Bar$Tinter;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static BARS:Ljava/util/WeakHashMap;

.field private final static BLINK_MS:J = 700L

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

.field private blinkAt:J

.field private blinkOff:Z

.field private hb:F

.field private final head:Ljava/lang/ref/WeakReference;

.field private headKey:J

.field private final headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;

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
  .line 117
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
  .line 263
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
  .line 327
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
  .line 421
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 8
  .line 144
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 126
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 129
    const/4 v1, -1
    iput v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 136
    iput v0, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 138
    new-instance v0, Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
  .line 140
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 725
    new-instance v0, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 145
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 146
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 147
    iput-object p3, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
  .line 148
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    if-nez v0, :L0
    const/4 p2, 0
    goto :L1
  :L0
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->head:I
    invoke-virtual { p2, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p2
  :L1
  .line 149
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
  .line 150
    if-eqz p2, :L2
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, p2, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 151
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 152
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 153
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 154
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    const/4 v3, 1
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 155
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    const/4 v2, 0
    invoke-virtual { p2, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 157
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 158
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { p1, p2, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 159
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 160
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget p3, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { p1, p2, p3, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 161
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 162
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

.method static synthetic access$1000(Lcom/innioasis/ipp/Bar;)Z
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dressed()Z
    move-result p0
    return p0
.end method

.method static synthetic access$1100(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->undressHead()V
    return-void
.end method

.method static synthetic access$1200(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 29
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
    return-void
.end method

.method static synthetic access$1300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 29
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
.end method

.method static synthetic access$1400(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1500(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 29
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method static synthetic access$1600(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 29
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    return-object p0
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
  .catchall { :L0 .. :L9 } :L10
  .registers 7
  :L0
  .line 170
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 171
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 172
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v1
  .line 173
    if-nez v1, :L2
    return-void
  :L2
  .line 174
    iget v2, v1, Lcom/innioasis/ipp/Bar$Spec;->list:I
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 175
    instance-of v2, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L3
    return-void
  :L3
  .line 176
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 177
    sget-object v2, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 178
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v4
  .line 179
    if-eqz v3, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
    if-ne v4, v5, :L6
    return-void
  :L6
  .line 180
    if-eqz v4, :L7
  .line 181
    new-instance v3, Lcom/innioasis/ipp/Bar;
    invoke-direct { v3, p0, v0, v1 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 182
    invoke-virtual { v2, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 183
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 184
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 185
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, v3, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L8
  :L7
  .line 187
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 188
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 189
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 190
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, v3, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 191
    invoke-direct { v3 }, Lcom/innioasis/ipp/Bar;->stop()V
  .line 192
    invoke-direct { v3 }, Lcom/innioasis/ipp/Bar;->undressHead()V
  :L8
  .line 194
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 195
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-eqz v0, :L9
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L9
  .line 197
    goto :L11
  :L10
  .line 196
    move-exception p0
  :L11
  .line 198
    return-void
.end method

.method private static blank(Landroid/view/View;)V
  .registers 4
  .line 271
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 272
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v2, -1
    if-eqz v1, :L1
  .line 273
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 274
    iget p0, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-eq p0, v2, :L0
    sget-object p0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L0
  .line 275
    goto :L2
  :L1
  .line 276
    new-instance v0, Lcom/innioasis/ipp/Rows$Flat;
    sget-object v1, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 277
    iput v2, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 278
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 280
    return-void
.end method

.method static blink(Landroid/view/View;Z)Z
  .catchall { :L1 .. :L8 } :L11
  .registers 7
  .line 360
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p0, :L12
    const/4 v2, 3
    if-ge v1, v2, :L12
  :L1
  .line 361
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v2
  .line 362
    if-eqz v2, :L7
  .line 363
    iget-object p0, v2, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 364
    if-eqz p0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L6
  :L2
  .line 365
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    iput-wide v3, v2, Lcom/innioasis/ipp/Bar;->blinkAt:J
  .line 366
    iget-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    xor-int/lit8 v3, p1, 1
    const/4 v4, 1
    if-eq v1, v3, :L5
  .line 367
    if-nez p1, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    iput-boolean v1, v2, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 368
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 370
    if-nez p1, :L5
    const-wide/16 v1, 700
    invoke-virtual { p0, v1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateDelayed(J)V
  :L5
  .line 372
    return v4
  :L6
  .line 364
    return v0
  :L7
  .line 374
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 375
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
  .line 360
    add-int/lit8 v1, v1, 1
    goto :L0
  :L11
  .line 377
    move-exception p0
    goto :L13
  :L12
  .line 378
    nop
  :L13
  .line 379
    return v0
.end method

.method public static bound(Landroidx/viewbinding/ViewBinding;)V
  .registers 1
  .line 205
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 206
    return-void
.end method

.method private claims(Landroidx/recyclerview/widget/RecyclerView;IFZ)Z
  .registers 7
  .line 590
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
  .line 591
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
  .line 592
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
  .line 590
    return v1
.end method

.method private clean(Landroid/view/View;)V
  .registers 6
  .line 243
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  .line 244
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 245
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v1, v1
    if-nez v1, :L0
  .line 246
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
    goto :L4
  :L0
  .line 248
    const/4 v1, 0
  :L1
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    array-length v2, v2
    if-ge v1, v2, :L4
  .line 249
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
    aget v2, v2, v1
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 250
    if-nez v2, :L2
    goto :L3
  :L2
  .line 252
    sget-object v3, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, v2, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 253
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L3
  .line 248
    add-int/lit8 v1, v1, 1
    goto :L1
  :L4
  .line 256
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-eqz v0, :L5
  .line 257
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 258
    if-eqz v0, :L5
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L5
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 260
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  .line 261
    return-void
.end method

.method private cursor()I
  .registers 4
  .line 434
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-boolean v0, v0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
    const/4 v1, -1
    if-eqz v0, :L4
  .line 435
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 436
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 437
    instance-of v2, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L2
  .line 438
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L2
  .line 440
    instance-of v2, v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v2, :L3
  .line 441
    check-cast v0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getSelectPosition()I
    move-result v0
    return v0
  :L3
  .line 443
    return v1
  :L4
  .line 445
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 446
    if-nez v0, :L5
    goto :L6
  :L5
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  :L6
    return v1
.end method

.method private cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 3
  .line 535
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 536
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
  .line 390
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 391
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
  .line 395
    const/4 v0, 1
    return v0
  :L2
  .line 392
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->blinkOff:Z
  .line 393
    return v1
.end method

.method static defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 4
  .line 525
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 526
    if-eqz v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 527
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 528
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 529
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 530
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 531
    return v1
  :L3
  .line 526
    const/4 p0, 0
    return p0
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 9
  .line 812
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 813
    if-nez p2, :L0
    return-void
  :L0
  .line 814
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-nez v0, :L1
    return-void
  :L1
  .line 815
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p2, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 817
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
  .line 819
    nop
  .line 820
    const/4 v1, 0
    move-object v3, v0
    const/4 v2, 0
  :L3
    if-eqz v3, :L6
    if-eq v3, p2, :L6
  .line 821
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
    add-int/2addr v1, v4
  .line 822
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v4
    add-int/2addr v2, v4
  .line 823
    invoke-virtual { v3 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
  .line 824
    instance-of v4, v3, Landroid/view/View;
    if-eqz v4, :L4
    check-cast v3, Landroid/view/View;
    goto :L5
  :L4
    const/4 v3, 0
  :L5
  .line 825
    goto :L3
  :L6
  .line 826
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 827
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result p2
    add-int/2addr p2, v1
    int-to-float p2, p2
    add-int/2addr p3, v2
    int-to-float p3, p3
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 828
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 829
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 830
    return-void
  :L7
  .line 817
    return-void
.end method

.method private dressHead()V
  .registers 5
  .line 614
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 615
    if-nez v0, :L0
    return-void
  :L0
  .line 616
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 617
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v3, -1
    if-eqz v2, :L2
  .line 618
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
  .line 619
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Rows$Flat;->inner()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    if-eq v0, v2, :L1
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L1
  .line 620
    goto :L3
  :L2
  .line 621
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->headPaint:Lcom/innioasis/ipp/Bar$HeadPaint;
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 622
    iput v3, v1, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 623
    invoke-virtual { v0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 625
    return-void
.end method

.method private dressed()Z
  .registers 3
  .line 628
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 629
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  :L1
  .line 630
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
  .line 705
    instance-of v0, p1, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v0, :L0
  .line 706
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->listRow(Landroid/view/View;)V
    goto :L1
  :L0
  .line 707
    instance-of p1, p1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz p1, :L1
  .line 708
    const p1, 2131362040
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 710
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L1
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object p1
    if-eqz p1, :L1
  .line 711
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 714
    return-void
.end method

.method private head()Landroid/view/View;
  .registers 3
  .line 457
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 458
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
  .line 467
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
  .line 468
    const/4 v0, 2
    new-array v1, v0, [I
  .line 469
    new-array v0, v0, [I
  .line 470
    invoke-virtual { p1, v1 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 471
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLocationInWindow([I)V
  .line 472
    const/4 p0, 1
    aget p1, v1, p0
    aget p0, v0, p0
    sub-int/2addr p1, p0
    return p1
.end method

.method private height(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 5
  .line 718
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->onHead()Z
    move-result v0
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 719
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p1
    return p1
  :L2
  .line 720
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 721
    const/4 v1, 0
    if-nez v0, :L3
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-lez v2, :L3
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L3
  .line 722
    if-nez v0, :L4
    goto :L5
  :L4
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
  :L5
    return v1
.end method

.method public static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  .line 335
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
  .line 336
    if-eqz v1, :L10
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-eqz v2, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L2
    goto :L10
  :L2
  .line 337
    iget-boolean v2, v1, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 1
    if-eqz v2, :L3
    const-string p0, "holds snap"
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
    return v3
  :L3
  .line 338
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v2
    const/4 v4, 0
    cmpl-float v2, v2, v4
    if-nez v2, :L4
    return v0
  :L4
  .line 339
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v1
  .line 340
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v2
  .line 341
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
  .line 342
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
  .line 343
    return v3
  :L10
  .line 336
    return v0
  :L11
  .line 344
    move-exception p0
  .line 345
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 285
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 286
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
  .line 287
    const/4 v2, 1
    if-eqz v1, :L4
  .line 288
    iget-object v3, v1, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-ne p0, v3, :L2
  .line 290
    iget-object p0, v1, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 291
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p0
    if-lez p0, :L1
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->dressHead()V
  :L1
  .line 292
    goto :L3
  :L2
  .line 293
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  :L3
  .line 295
    return v2
  :L4
  .line 297
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L5
  .line 298
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L9
  .line 299
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 300
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L7
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L6
    goto :L7
  :L6
  .line 305
    goto :L5
  :L7
  .line 301
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 302
    if-eqz p0, :L8
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L8
  .line 303
    return v2
  :L9
  .line 307
    goto :L11
  :L10
  .line 306
    move-exception p0
  :L11
  .line 308
    return v0
.end method

.method private static live(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 1
  .line 239
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
  .line 400
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 401
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 403
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
  .line 404
    sget-object v3, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L1
  .line 405
    const/4 v4, 1
    if-nez v3, :L7
  :L2
  .line 407
    const-string v3, "isMultiSelect"
    invoke-virtual { v2, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v3
  .line 408
    invoke-virtual { v3, v4 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  :L3
  .line 409
    nop
  .line 412
    goto :L6
  :L4
  .line 410
    move-exception v3
  :L5
  .line 411
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
  :L6
  .line 413
    sget-object v5, Lcom/innioasis/ipp/Bar;->MULTI:Ljava/util/HashMap;
    invoke-virtual { v5, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 415
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
  .line 416
    move-exception v0
  .line 417
    return v1
.end method

.method private observe()V
  .registers 4
  .line 499
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 500
    iget v1, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
    if-ltz v1, :L0
    sub-int v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Math;->abs(I)I
    move-result v1
    const/4 v2, 4
    if-le v1, v2, :L0
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  :L0
  .line 501
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 502
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 4
  .line 316
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 317
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
  .line 318
    if-eqz v0, :L2
  .line 319
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 320
    return-object v0
  :L2
  .line 322
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 323
    if-nez p0, :L3
    move-object p0, v2
    goto :L4
  :L3
    check-cast p0, Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L4
  .line 324
    if-eqz p0, :L5
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsValue(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    move-object v2, p0
  :L5
    return-object v2
.end method

.method private onHead()Z
  .registers 3
  .line 462
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
  .line 451
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 452
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
  .line 105
    new-instance v8, Lcom/innioasis/ipp/Bar$Spec;
    const v2, 2131231050
    const v3, 2131231044
  .line 106
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v4
  .line 107
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
  .line 105
    return-object v8
.end method

.method private refreshHead(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 9
  .line 649
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 650
    if-nez v0, :L0
    return-void
  :L0
  .line 651
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
  .line 652
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
  .line 651
    const-wide v1, 9223372036854775806L
  :L3
  .line 653
    iget-wide v3, p0, Lcom/innioasis/ipp/Bar;->headKey:J
    cmp-long p1, v1, v3
    if-nez p1, :L4
    return-void
  :L4
  .line 654
    iput-wide v1, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 655
    invoke-virtual { v0 }, Landroid/view/View;->invalidate()V
  .line 656
    return-void
.end method

.method public static relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 3
  .line 425
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 426
    const/4 v0, 0
    if-nez p0, :L2
    return v0
  :L2
  .line 427
    const/high16 v1, 0x7FC00000
    iput v1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 428
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 429
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 430
    const/4 p0, 1
    return p0
.end method

.method public static row(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 211
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  :L1
  .line 212
    if-nez v0, :L2
    return-void
  :L2
  .line 213
    iget-object v1, v0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 214
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-nez v2, :L3
    goto :L6
  :L3
  .line 216
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
  .line 217
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  .line 220
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L5
  .line 222
    goto :L8
  :L6
  .line 214
    return-void
  :L7
  .line 221
    move-exception p0
  :L8
  .line 223
    return-void
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 506
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 508
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
  .line 509
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 510
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  .line 511
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 508
    return v1
  :L2
  .line 512
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 513
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 514
    int-to-float p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L3
  .line 516
    const/4 p1, 1
    return p1
.end method

.method private static spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
  .registers 15
  .line 61
    instance-of v0, p0, Lcom/innioasis/y1/activity/MainActivity;
    const v1, 2131100267
    const v2, 2131100252
    const v3, 2131362491
    if-eqz v0, :L0
  .line 62
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v5, 2131362308
    const v6, 2131231052
    const v7, 2131231044
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v8
  .line 64
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
    filled-new-array { v3 }, [I
    move-result-object v10
    const v11, 2131362144
    move-object v4, v0
    invoke-direct/range { v4 .. v11 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 62
    return-object v0
  :L0
  .line 66
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v4, 2131362437
    const v5, 2131362459
    if-eqz v0, :L1
  .line 67
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231052
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v5, v4 }, [I
    move-result-object v12
    const v13, 2131361881
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L1
  .line 70
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v0, :L2
  .line 71
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231050
    const v9, 2131231044
  .line 72
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v10
  .line 73
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v11
    filled-new-array { v3 }, [I
    move-result-object v12
    const v13, 2131362144
    move-object v6, v0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 71
    return-object v0
  :L2
  .line 75
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v0, :L3
  .line 76
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231050
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v5, v4 }, [I
    move-result-object v12
    const v13, 2131361881
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L3
  .line 79
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v0, :L4
  .line 80
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362312
    const v8, 2131231050
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v4 }, [I
    move-result-object v12
    const/4 v13, 0
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L4
  .line 83
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz v0, :L5
  .line 84
    const v0, 2131362520
    const v1, 2131362521
    const v2, 2131362042
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v0
    const v1, 2131362310
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object p0
  .line 85
    const v0, 2131362519
    const v1, 2131362041
    filled-new-array { v0, v1 }, [I
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 86
    return-object p0
  :L5
  .line 88
    instance-of v0, p0, Lcom/innioasis/music/SearchActivity;
    const/4 v1, 1
    if-nez v0, :L8
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-eqz v0, :L6
    goto :L8
  :L6
  .line 95
    instance-of v0, p0, Lcom/innioasis/music/PlaylistsActivity;
    if-eqz v0, :L7
  .line 96
    const v0, 2131362298
    filled-new-array { v3 }, [I
    move-result-object v2
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object p0
  .line 97
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 98
    return-object p0
  :L7
  .line 100
    const/4 p0, 0
    return-object p0
  :L8
  .line 90
    const v0, 2131362094
    filled-new-array { v5, v0 }, [I
    move-result-object v0
    const v2, 2131362354
    invoke-static { p0, v2, v0 }, Lcom/innioasis/ipp/Bar;->plain(Lcom/innioasis/y1/base/BaseActivity;I[I)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object p0
  .line 91
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar$Spec;->byAdapter:Z
  .line 92
    const v0, 2131362353
    iput v0, p0, Lcom/innioasis/ipp/Bar$Spec;->head:I
  .line 93
    return-object p0
.end method

.method private start()V
  .registers 3
  .line 833
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 834
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 835
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 836
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 837
    return-void
.end method

.method private stop()V
  .registers 2
  .line 840
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 841
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 842
    return-void
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 541
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
  .line 542
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
  .line 543
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 545
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 546
    if-eqz p2, :L1
  .line 547
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
    invoke-virtual { p2 }, Landroid/view/View;->getTranslationY()F
    move-result p2
    add-float/2addr p1, p2
    goto :L7
  :L1
  .line 549
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
  .line 550
    if-nez p2, :L4
    goto :L5
  :L4
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  :L5
  .line 551
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L6
    int-to-float p1, v0
    goto :L7
  :L6
    int-to-float p1, v1
  :L7
  .line 553
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
  .line 477
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 478
    const/4 v0, 0
    if-gez p1, :L0
    return v0
  :L0
  .line 479
    nop
  .line 480
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    const/4 v2, 1
    if-eqz v1, :L1
  .line 481
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L8
  :L1
  .line 482
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L2
  .line 483
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
    goto :L8
  :L2
  .line 484
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L7
  .line 485
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 486
    if-eqz p0, :L6
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L3
    goto :L6
  :L3
  .line 487
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 488
    instance-of p1, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz p1, :L4
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 489
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result p0
    if-eqz p0, :L4
    const/4 v0, 1
    goto :L5
  :L4
    nop
  :L5
  .line 488
    return v0
  :L6
  .line 486
    return v0
  :L7
  .line 484
    const/4 p0, 0
  :L8
  .line 491
    if-eqz p0, :L9
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L9
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L9
    const/4 v0, 1
  :L9
    return v0
.end method

.method private tint(Landroid/view/View;I)V
  .registers 9
  .line 564
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 565
    if-lez p2, :L12
    if-nez v0, :L0
    goto/16 :L12
  :L0
  .line 566
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v1
  .line 567
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
  .line 568
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 569
    instance-of v3, v2, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/Bar;->rowText:I
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Eq;->rowColor(II)I
    move-result v3
    goto :L4
  :L3
    iget v3, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L4
  .line 571
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
  .line 572
    nop
  .line 573
    const/4 p2, 0
  :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v0, v0
    if-ge v5, v0, :L10
  .line 574
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v0, v0, v5
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 575
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L8
    goto :L9
  :L8
  .line 576
    check-cast v0, Landroid/widget/TextView;
  .line 577
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    if-eq v1, v3, :L9
  .line 578
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 579
    const/4 p2, 1
  :L9
  .line 573
    add-int/lit8 v5, v5, 1
    goto :L7
  :L10
  .line 582
    if-eqz p2, :L11
    invoke-static { p1, v2, v3 }, Lcom/innioasis/ipp/Bar;->followText(Landroid/view/View;Ljava/lang/Object;I)V
  :L11
  .line 583
    return-void
  :L12
  .line 565
    return-void
.end method

.method private tintHead(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 597
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object v0
  .line 598
    if-nez v0, :L0
    return-void
  :L0
  .line 599
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
    iget p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L2
  .line 600
    const/4 p2, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v1, v1
    if-ge p2, v1, :L5
  .line 601
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v1, v1, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v1, v1, p2
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 602
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    if-eq v2, p1, :L4
  .line 603
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L4
  .line 600
    add-int/lit8 p2, p2, 1
    goto :L3
  :L5
  .line 606
    return-void
.end method

.method private undressHead()V
  .registers 6
  .line 635
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->head:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 636
    if-nez v0, :L0
    return-void
  :L0
  .line 637
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
  .line 638
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v1, :L3
    const v4, 2131231047
    goto :L4
  :L3
    const v4, 2131231044
  :L4
    invoke-virtual { v2, v0, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 639
    nop
  :L5
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v2, v2
    if-ge v3, v2, :L9
  .line 640
    iget-object v2, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v2, v2, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v2, v2, v3
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 641
    instance-of v4, v2, Landroid/widget/TextView;
    if-eqz v4, :L8
    check-cast v2, Landroid/widget/TextView;
    if-eqz v1, :L6
    iget v4, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L7
  :L6
    iget v4, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L7
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  :L8
  .line 639
    add-int/lit8 v3, v3, 1
    goto :L5
  :L9
  .line 643
    const-wide v0, 9223372036854775806L
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->headKey:J
  .line 644
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 645
    return-void
.end method

.method public static wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 351
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
  .line 845
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 846
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
    if-nez v2, :L0
    goto/16 :L12
  :L0
  .line 850
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 851
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
  .line 852
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 853
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 854
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
  .line 855
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L7
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L7
  .line 856
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 857
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float v3, p2, v3
  .line 858
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 859
    const/high16 v5, 0x41B00000
    mul-float v5, v5, v4
    const v6, 1169915904
    invoke-static { v6, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
    const/high16 v6, 0x442F0000
    invoke-static { v6, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 860
    mul-float v5, v5, v2
    invoke-static { v4, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  .line 862
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    const/4 v6, 0
    if-nez v5, :L4
    cmpl-float v5, v4, v6
    if-nez v5, :L3
    goto :L4
  :L3
  .line 863
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float v7, p1
    sub-float/2addr v7, v5
    div-float v4, v2, v4
    mul-float v7, v7, v4
    add-float/2addr v5, v7
    iput v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    goto :L5
  :L4
  .line 862
    int-to-float v4, p1
    iput v4, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L5
  .line 864
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpg-float v3, v3, v6
    if-gez v3, :L6
    neg-float v2, v2
  :L6
    add-float/2addr v4, v2
    iput v4, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 865
    sub-float v2, p2, v4
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L7
  .line 866
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 867
    int-to-float p2, p1
    iput p2, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L7
  .line 870
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 872
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->head()Landroid/view/View;
    move-result-object p2
  .line 873
    if-eqz p2, :L8
    invoke-virtual { p2 }, Landroid/view/View;->invalidate()V
  :L8
  .line 874
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
  .line 877
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
    goto :L11
  :L10
  .line 875
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L11
  .line 879
    return-void
  :L12
  .line 847
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 848
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 228
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 229
    if-eqz v0, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  :L1
  .line 231
    goto :L3
  :L2
  .line 230
    move-exception p1
  :L3
  .line 232
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 235
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L15 } :L17
  .registers 15
  :L0
  .line 765
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 766
    if-eqz p3, :L16
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->live(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-nez v0, :L1
    goto/16 :L16
  :L1
  .line 767
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 768
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 769
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 770
    const/4 v2, 0
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 771
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
  .line 772
    invoke-virtual { v3 }, Landroid/view/View;->getRight()I
    move-result v3
  .line 773
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v5
  .line 774
    nop
  :L2
    if-ge v2, p3, :L7
  .line 775
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 776
    invoke-virtual { p2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v7
  .line 778
    if-eq v7, v5, :L3
    invoke-static { p2, v7 }, Lcom/innioasis/ipp/Bar;->ticked(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v7
    if-eqz v7, :L3
    move-object v7, v1
    goto :L4
  :L3
    move-object v7, v0
  :L4
  .line 779
    if-nez v7, :L5
    goto :L6
  :L5
  .line 780
    invoke-virtual { v6 }, Landroid/view/View;->getTop()I
    move-result v8
    int-to-float v8, v8
    invoke-virtual { v6 }, Landroid/view/View;->getTranslationY()F
    move-result v9
    add-float/2addr v8, v9
    invoke-static { v8 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 781
    invoke-virtual { v6 }, Landroid/view/View;->getLeft()I
    move-result v9
    invoke-virtual { v6 }, Landroid/view/View;->getRight()I
    move-result v10
    invoke-virtual { v6 }, Landroid/view/View;->getHeight()I
    move-result v6
    add-int/2addr v6, v8
    invoke-virtual { v7, v9, v8, v10, v6 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 782
    invoke-virtual { v7, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L6
  .line 774
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 784
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->onList(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p3
    if-nez p3, :L8
  .line 786
    const/high16 p1, 0x7FC00000
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 787
    return-void
  :L8
  .line 789
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p3
  .line 790
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
  .line 791
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v2
  .line 792
    if-nez v0, :L9
  .line 793
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 794
    return-void
  :L9
  .line 796
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 797
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    if-eqz v5, :L10
    int-to-float v5, p3
    goto :L11
  :L10
    iget v5, p0, Lcom/innioasis/ipp/Bar;->hb:F
  :L11
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
  .line 798
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->dark()Z
    move-result v6
    if-nez v6, :L13
  .line 799
    if-eqz v1, :L12
  .line 800
    add-int/2addr v5, v0
    invoke-virtual { v1, v4, v0, v3, v5 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 801
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L12
  .line 803
    invoke-direct { p0, p1, p2, v0 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  :L13
  .line 805
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float p1, p1, v2
    if-nez p1, :L14
    iget p1, p0, Lcom/innioasis/ipp/Bar;->hb:F
    int-to-float p2, p3
    cmpl-float p1, p1, p2
    if-eqz p1, :L15
  :L14
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L15
  .line 807
    goto :L18
  :L16
  .line 766
    return-void
  :L17
  .line 806
    move-exception p1
  :L18
  .line 808
    return-void
.end method
