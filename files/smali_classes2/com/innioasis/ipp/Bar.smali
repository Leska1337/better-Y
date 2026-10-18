.class public final Lcom/innioasis/ipp/Bar;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "Bar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Bar$Spec;,
    Lcom/innioasis/ipp/Bar$Tinter;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static BARS:Ljava/util/WeakHashMap;

.field private final static EMPTY:Landroid/graphics/drawable/Drawable;

.field private final static JUMP:I = 4

.field private final static RATE:F = 22.0F

.field private final static ROWS:Ljava/util/WeakHashMap;

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 700.0F

.field private final static WHITE:I = -1

.field private final activity:Ljava/lang/ref/WeakReference;

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
  .line 84
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
  .line 191
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
  .line 248
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .registers 8
  .line 100
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 93
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 96
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 367
    new-instance v0, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 101
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 102
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 103
    iput-object p3, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
  .line 104
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 105
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 106
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 107
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v2, p3, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
    const/4 v3, 1
    invoke-virtual { v1, p2, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 108
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v1, p3, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
    const/4 v2, 0
    invoke-virtual { p2, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 110
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 111
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget v0, p3, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
    invoke-virtual { p1, p2, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 112
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 113
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget p3, p3, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
    invoke-virtual { p1, p2, p3, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 114
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 115
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 28
    iget-object p0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/Bar;)V
  .registers 1
  .line 28
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 28
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 28
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    return p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 28
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method public static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 7
  :L0
  .line 123
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 124
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 125
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
    move-result-object v1
  .line 126
    if-nez v1, :L2
    return-void
  :L2
  .line 127
    iget v2, v1, Lcom/innioasis/ipp/Bar$Spec;->list:I
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 128
    instance-of v2, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L3
    return-void
  :L3
  .line 129
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 130
    sget-object v2, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 131
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v4
  .line 132
    if-eqz v3, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
    if-ne v4, v5, :L6
    return-void
  :L6
  .line 133
    if-eqz v4, :L7
  .line 134
    new-instance v3, Lcom/innioasis/ipp/Bar;
    invoke-direct { v3, p0, v0, v1 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;Lcom/innioasis/ipp/Bar$Spec;)V
  .line 135
    invoke-virtual { v2, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 136
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 137
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 138
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, v3, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L8
  :L7
  .line 140
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 141
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 142
    invoke-virtual { p0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  .line 143
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, v3, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 144
    invoke-direct { v3 }, Lcom/innioasis/ipp/Bar;->stop()V
  :L8
  .line 146
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 147
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-eqz v0, :L9
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L9
  .line 149
    goto :L11
  :L10
  .line 148
    move-exception p0
  :L11
  .line 150
    return-void
.end method

.method private static blank(Landroid/view/View;)V
  .registers 4
  .line 199
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 200
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    const/4 v2, -1
    if-eqz v1, :L1
  .line 201
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 202
    iget p0, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-eq p0, v2, :L0
    sget-object p0, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  :L0
  .line 203
    goto :L2
  :L1
  .line 204
    new-instance v0, Lcom/innioasis/ipp/Rows$Flat;
    sget-object v1, Lcom/innioasis/ipp/Bar;->EMPTY:Landroid/graphics/drawable/Drawable;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 205
    iput v2, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 206
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 208
    return-void
.end method

.method public static bound(Landroidx/viewbinding/ViewBinding;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  .line 158
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
  :L1
  .line 159
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  :L3
  .line 160
    if-nez v0, :L4
    return-void
  :L4
  .line 161
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  .line 164
    iget-object p0, v0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 165
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L5
  .line 167
    goto :L7
  :L6
  .line 166
    move-exception p0
  :L7
  .line 168
    return-void
.end method

.method private clean(Landroid/view/View;)V
  .registers 4
  .line 182
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 183
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  .line 184
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-eqz v0, :L0
  .line 185
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 186
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L0
    const/4 v1, 4
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L0
  .line 188
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  .line 189
    return-void
.end method

.method private cursor()I
  .registers 2
  .line 271
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 272
    if-nez v0, :L0
    const/4 v0, -1
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v0
  :L1
    return v0
.end method

.method private cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 3
  .line 314
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 315
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

.method static defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 4
  .line 304
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 305
    if-nez v0, :L2
    const/4 p0, 0
    return p0
  :L2
  .line 306
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 307
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 308
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 309
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 310
    return v1
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 7
  .line 433
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 434
    if-nez p2, :L0
    return-void
  :L0
  .line 435
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    if-nez v0, :L1
    return-void
  :L1
  .line 436
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget v0, v0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
    invoke-virtual { p2, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 438
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    const/16 v2, 8
    if-eq v1, v2, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 439
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 440
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result p2
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v1
    add-int/2addr p2, v1
    int-to-float p2, p2
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v1
    add-int/2addr p3, v1
    int-to-float p3, p3
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 441
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 442
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 443
    return-void
  :L3
  .line 438
    return-void
.end method

.method private height(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 5
  .line 362
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
  .line 363
    const/4 v1, 0
    if-nez v0, :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-lez v2, :L0
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L0
  .line 364
    if-nez v0, :L1
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
  :L2
    return v1
.end method

.method public static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .catchall { :L0 .. :L6 } :L11
  .registers 7
  .line 256
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
  .line 257
    if-eqz v1, :L10
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-nez v2, :L2
    goto :L10
  :L2
  .line 258
    iget-boolean v2, v1, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 1
    if-eqz v2, :L3
    return v3
  :L3
  .line 259
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v2
    const/4 v4, 0
    cmpl-float v2, v2, v4
    if-nez v2, :L4
    return v0
  :L4
  .line 260
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/base/BaseActivity;
  .line 261
    if-nez v1, :L5
    return v0
  :L5
  .line 262
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 263
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
  :L6
  .line 264
    if-lez p1, :L7
    sub-int/2addr p0, v3
    if-lt v1, p0, :L9
    goto :L8
  :L7
    if-gtz v1, :L9
  :L8
    const/4 v0, 1
  :L9
    return v0
  :L10
  .line 257
    return v0
  :L11
  .line 265
    move-exception p0
  .line 266
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  .line 213
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 214
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
    const/4 v2, 1
    if-eqz v1, :L1
  .line 215
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  .line 216
    return v2
  :L1
  .line 218
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 219
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 220
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 221
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L4
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L3
    goto :L4
  :L3
  .line 226
    goto :L2
  :L4
  .line 222
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 223
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L5
  .line 224
    return v2
  :L6
  .line 228
    goto :L8
  :L7
  .line 227
    move-exception p0
  :L8
  .line 229
    return v0
.end method

.method private observe()V
  .registers 4
  .line 280
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 281
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
  .line 282
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 283
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 4
  .line 237
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 238
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
  .line 239
    if-eqz v0, :L2
  .line 240
    sget-object v1, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 241
    return-object v0
  :L2
  .line 243
    sget-object v0, Lcom/innioasis/ipp/Bar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 244
    if-nez p0, :L3
    move-object p0, v2
    goto :L4
  :L3
    check-cast p0, Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
  :L4
  .line 245
    if-eqz p0, :L5
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsValue(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    move-object v2, p0
  :L5
    return-object v2
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 287
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 289
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->isLayoutRequested()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 290
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 291
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 289
    return v1
  :L2
  .line 292
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 293
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  :L3
  .line 295
    const/4 p1, 1
    return p1
.end method

.method private static spec(Lcom/innioasis/y1/base/BaseActivity;)Lcom/innioasis/ipp/Bar$Spec;
  .registers 15
  .line 52
    instance-of v0, p0, Lcom/innioasis/y1/activity/MainActivity;
    const v1, 2131362491
    const v2, 2131100267
    const v3, 2131100252
    if-eqz v0, :L0
  .line 53
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v5, 2131362308
    const v6, 2131231052
    const v7, 2131231044
  .line 54
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v8
  .line 55
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
    filled-new-array { v1 }, [I
    move-result-object v10
    const v11, 2131362144
    move-object v4, v0
    invoke-direct/range { v4 .. v11 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 53
    return-object v0
  :L0
  .line 57
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v4, 2131362459
    const v5, 2131362437
    if-eqz v0, :L1
  .line 58
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231052
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v4, v5 }, [I
    move-result-object v12
    const v13, 2131361881
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L1
  .line 61
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v0, :L2
  .line 62
    new-instance v0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231050
    const v9, 2131231044
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v10
  .line 64
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v11
    filled-new-array { v1 }, [I
    move-result-object v12
    const v13, 2131362144
    move-object v6, v0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
  .line 62
    return-object v0
  :L2
  .line 66
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v0, :L3
  .line 67
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362310
    const v8, 2131231050
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v4, v5 }, [I
    move-result-object v12
    const v13, 2131361881
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L3
  .line 70
    instance-of p0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz p0, :L4
  .line 71
    new-instance p0, Lcom/innioasis/ipp/Bar$Spec;
    const v7, 2131362312
    const v8, 2131231050
    const/4 v9, 0
    const v10, -12779554
    const/4 v11, -1
    filled-new-array { v5 }, [I
    move-result-object v12
    const/4 v13, 0
    move-object v6, p0
    invoke-direct/range { v6 .. v13 }, Lcom/innioasis/ipp/Bar$Spec;-><init>(IIIII[II)V
    return-object p0
  :L4
  .line 74
    const/4 p0, 0
    return-object p0
.end method

.method private start()V
  .registers 3
  .line 446
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 447
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 448
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 449
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 450
    return-void
.end method

.method private stop()V
  .registers 2
  .line 453
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 454
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 455
    return-void
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 320
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
  .line 321
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 323
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 324
    if-eqz p2, :L0
  .line 325
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
    invoke-virtual { p2 }, Landroid/view/View;->getTranslationY()F
    move-result p2
    add-float/2addr p1, p2
    goto :L6
  :L0
  .line 327
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p2
    const/4 v2, 0
    if-lez p2, :L1
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object p2
    goto :L2
  :L1
    const/4 p2, 0
  :L2
  .line 328
    if-nez p2, :L3
    goto :L4
  :L3
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  :L4
  .line 329
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L5
    int-to-float p1, v0
    goto :L6
  :L5
    int-to-float p1, v1
  :L6
  .line 331
    int-to-float p2, v0
    int-to-float v0, v1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p2, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    return p1
.end method

.method private tint(Landroid/view/View;I)V
  .registers 8
  .line 342
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 343
    if-lez p2, :L14
    if-nez v0, :L0
    goto/16 :L14
  :L0
  .line 344
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v1
  .line 345
    nop
  .line 346
    iget-boolean v2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 0
    if-nez v2, :L4
    iget v2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-nez v2, :L4
  .line 347
    invoke-direct { p0, v0, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v0
    iget v2, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr v0, v2
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    const/high16 v2, 0x3F000000
    const/4 v4, 1
    cmpg-float v0, v0, v2
    if-gez v0, :L2
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p2
    if-ne v1, p2, :L1
    goto :L5
  :L1
    const/4 v4, 0
    goto :L5
  :L2
  .line 348
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v0
    int-to-float v0, v0
    invoke-virtual { p1 }, Landroid/view/View;->getTranslationY()F
    move-result v2
    add-float/2addr v0, v2
    iget v2, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr v0, v2
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    int-to-float p2, p2
    const/high16 v2, 0x40800000
    div-float/2addr p2, v2
    cmpg-float p2, v0, p2
    if-gtz p2, :L3
    goto :L5
  :L3
    const/4 v4, 0
    goto :L5
  :L4
  .line 350
    const/4 v4, 0
  :L5
    iget-object p2, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { p2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p2
    instance-of p2, p2, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz p2, :L6
    iget p2, p0, Lcom/innioasis/ipp/Bar;->rowText:I
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/Eq;->rowColor(II)I
    move-result p2
    goto :L7
  :L6
    iget p2, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L7
  .line 351
    nop
  :L8
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    array-length v0, v0
    if-ge v3, v0, :L13
  .line 352
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->spec:Lcom/innioasis/ipp/Bar$Spec;
    iget-object v0, v0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
    aget v0, v0, v3
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 353
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L9
    goto :L12
  :L9
  .line 354
    if-eqz v4, :L10
    iget v1, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L11
  :L10
    move v1, p2
  :L11
  .line 355
    check-cast v0, Landroid/widget/TextView;
  .line 356
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    if-eq v2, v1, :L12
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L12
  .line 351
    add-int/lit8 v3, v3, 1
    goto :L8
  :L13
  .line 358
    return-void
  :L14
  .line 343
    return-void
.end method

.method public doFrame(J)V
  .registers 10
  .line 458
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 459
    const/4 v1, 0
    if-eqz v0, :L8
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v2
    if-eqz v2, :L8
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-nez v2, :L0
    goto/16 :L8
  :L0
  .line 463
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 464
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
  .line 465
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 466
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 467
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
  .line 468
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L4
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L4
  .line 469
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 470
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float v3, p2, v3
  .line 471
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 472
    const/high16 v5, 0x41B00000
    mul-float v5, v5, v4
    const v6, 1169915904
    invoke-static { v6, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
    const/high16 v6, 0x442F0000
    invoke-static { v6, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 473
    mul-float v5, v5, v2
    invoke-static { v4, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  .line 474
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    const/4 v5, 0
    cmpg-float v3, v3, v5
    if-gez v3, :L3
    neg-float v2, v2
  :L3
    add-float/2addr v4, v2
    iput v4, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 475
    sub-float v2, p2, v4
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L4
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  :L4
  .line 477
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 478
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L6
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    cmpl-float p1, p2, p1
    if-eqz p1, :L5
    goto :L6
  :L5
  .line 481
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
    goto :L7
  :L6
  .line 479
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L7
  .line 483
    return-void
  :L8
  .line 460
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 461
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 173
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->clean(Landroid/view/View;)V
  :L1
  .line 175
    goto :L3
  :L2
  .line 174
    move-exception p1
  :L3
  .line 176
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 179
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 16
  :L0
  .line 397
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 398
    if-nez p3, :L1
    return-void
  :L1
  .line 399
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 400
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 401
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 402
    const/4 v2, 0
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 403
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
  .line 404
    invoke-virtual { v3 }, Landroid/view/View;->getRight()I
    move-result v3
  .line 405
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->height(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v5
  .line 406
    invoke-direct { p0, p2, v5 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v6
  .line 407
    invoke-direct { p0, p2, v5 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v7
  .line 408
    if-eqz v0, :L3
  .line 409
    nop
  :L2
    if-ge v2, p3, :L3
  .line 410
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v8
  .line 411
    invoke-virtual { v8 }, Landroid/view/View;->getTop()I
    move-result v9
    int-to-float v9, v9
    invoke-virtual { v8 }, Landroid/view/View;->getTranslationY()F
    move-result v10
    add-float/2addr v9, v10
    invoke-static { v9 }, Ljava/lang/Math;->round(F)I
    move-result v9
  .line 412
    invoke-virtual { v8 }, Landroid/view/View;->getLeft()I
    move-result v10
    invoke-virtual { v8 }, Landroid/view/View;->getRight()I
    move-result v11
    invoke-virtual { v8 }, Landroid/view/View;->getHeight()I
    move-result v8
    add-int/2addr v8, v9
    invoke-virtual { v0, v10, v9, v11, v8 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 413
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 409
    add-int/lit8 v2, v2, 1
    goto :L2
  :L3
  .line 416
    if-nez v6, :L4
  .line 417
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 418
    return-void
  :L4
  .line 420
    iget p3, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p3 }, Ljava/lang/Math;->round(F)I
    move-result p3
  .line 421
    if-eqz v1, :L5
  .line 422
    add-int/2addr v5, p3
    invoke-virtual { v1, v4, p3, v3, v5 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 423
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L5
  .line 425
    invoke-direct { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 426
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float p1, p1, v7
    if-eqz p1, :L6
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L6
  .line 428
    goto :L8
  :L7
  .line 427
    move-exception p1
  :L8
  .line 429
    return-void
.end method
