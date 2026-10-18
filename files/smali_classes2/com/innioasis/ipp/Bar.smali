.class public final Lcom/innioasis/ipp/Bar;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Bar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Bar$Tinter;
  }
.end annotation

.field private final static BARS:Ljava/util/WeakHashMap;

.field private final static JUMP:I = 4

.field private final static RATE:F = 22.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 700.0F

.field private final activity:Ljava/lang/ref/WeakReference;

.field private last:J

.field private lastPos:I

.field private final rowProbe:Landroid/view/View;

.field private final rowRes:I

.field private final rowText:I

.field private running:Z

.field private final rv:Ljava/lang/ref/WeakReference;

.field private final selProbe:Landroid/view/View;

.field private final selRes:I

.field private final selText:I

.field private snap:Z

.field private final tinter:Lcom/innioasis/ipp/Bar$Tinter;

.field private y:F

.method static constructor <clinit>()V
  .registers 1
  .line 37
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;IIII)V
  .registers 10
  .line 54
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 47
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 50
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 250
    new-instance v0, Lcom/innioasis/ipp/Bar$Tinter;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$Tinter;-><init>(Lcom/innioasis/ipp/Bar;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
  .line 55
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
  .line 56
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
  .line 57
    iput p3, p0, Lcom/innioasis/ipp/Bar;->selRes:I
  .line 58
    iput p4, p0, Lcom/innioasis/ipp/Bar;->rowRes:I
  .line 59
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 60
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
  .line 61
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
  .line 62
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v2, 1
    invoke-virtual { v1, p2, p3, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 63
    sget-object p2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 p3, 0
    invoke-virtual { p2, v0, p4, p3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 65
    new-instance p2, Landroid/widget/TextView;
    invoke-direct { p2, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 66
    sget-object p4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, p5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p5
    invoke-virtual { p4, p2, p5, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 67
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p4
    iput p4, p0, Lcom/innioasis/ipp/Bar;->selText:I
  .line 68
    sget-object p4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1, p6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p1
    invoke-virtual { p4, p2, p1, p3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 69
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  .line 70
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

.method static synthetic access$200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 28
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  .registers 3
  .line 28
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
    return-void
.end method

.method private static attach(Landroidx/recyclerview/widget/RecyclerView;IIII)V
  .catchall { :L0 .. :L7 } :L8
  .registers 16
  .line 80
    if-eqz p0, :L10
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v0
    instance-of v0, v0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L1
    goto :L10
  :L1
  .line 81
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 82
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
  .line 83
    if-eqz v1, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
    if-ne v2, v3, :L4
    return-void
  :L4
  .line 84
    if-eqz v2, :L5
  .line 85
    new-instance v1, Lcom/innioasis/ipp/Bar;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v3
    move-object v6, v3
    check-cast v6, Lcom/innioasis/y1/base/BaseActivity;
    move-object v4, v1
    move-object v5, p0
    move v7, p1
    move v8, p2
    move v9, p3
    move v10, p4
    invoke-direct/range { v4 .. v10 }, Lcom/innioasis/ipp/Bar;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/base/BaseActivity;IIII)V
  .line 86
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 87
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 88
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p1, p2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    goto :L6
  :L5
  .line 90
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 91
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 92
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    iget-object p2, v1, Lcom/innioasis/ipp/Bar;->tinter:Lcom/innioasis/ipp/Bar$Tinter;
    invoke-virtual { p1, p2 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 93
    invoke-direct { v1 }, Lcom/innioasis/ipp/Bar;->stop()V
  :L6
  .line 95
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 96
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    if-eqz p1, :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L7
  .line 98
    goto :L9
  :L8
  .line 97
    move-exception p0
  :L9
  .line 99
    return-void
  :L10
  .line 80
    return-void
.end method

.method private cursor()I
  .registers 2
  .line 168
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 169
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
  .line 211
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p1
  .line 212
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
  .line 201
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  :L1
  .line 202
    if-nez v0, :L2
    const/4 p0, 0
    return p0
  :L2
  .line 203
    iput p1, v0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 204
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Bar;->snap:Z
  .line 205
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 206
    invoke-direct { v0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 207
    return v1
.end method

.method private drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 6
  .line 316
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 317
    if-nez p2, :L0
    return-void
  :L0
  .line 318
    const v0, 2131362144
    invoke-virtual { p2, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 319
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
  .line 320
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 321
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
  .line 322
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 323
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 324
    return-void
  :L2
  .line 319
    return-void
.end method

.method public static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .catchall { :L0 .. :L6 } :L11
  .registers 7
  .line 153
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
  .line 154
    if-eqz v1, :L10
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    if-nez v2, :L2
    goto :L10
  :L2
  .line 155
    iget-boolean v2, v1, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 1
    if-eqz v2, :L3
    return v3
  :L3
  .line 156
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v2
    const/4 v4, 0
    cmpl-float v2, v2, v4
    if-nez v2, :L4
    return v0
  :L4
  .line 157
    iget-object v1, v1, Lcom/innioasis/ipp/Bar;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/base/BaseActivity;
  .line 158
    if-nez v1, :L5
    return v0
  :L5
  .line 159
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 160
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
  :L6
  .line 161
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
  .line 154
    return v0
  :L11
  .line 162
    move-exception p0
  .line 163
    return v0
.end method

.method static landed(Landroid/view/View;)Z
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  .line 123
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 124
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
    const/4 v2, 1
    if-eqz v1, :L1
  .line 125
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 126
    return v2
  :L1
  .line 128
    sget-object v1, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 129
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 130
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Bar;
  .line 131
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L4
    iget-object v4, v3, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L3
    goto :L4
  :L3
  .line 136
    goto :L2
  :L4
  .line 132
    iget-object p0, v3, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 133
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidate()V
  :L5
  .line 134
    return v2
  :L6
  .line 138
    goto :L8
  :L7
  .line 137
    move-exception p0
  :L8
  .line 139
    return v0
.end method

.method public static main(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 5
  .line 74
    const v0, 2131100252
    const v1, 2131100267
    const v2, 2131231052
    const v3, 2131231044
    invoke-static { p0, v2, v3, v0, v1 }, Lcom/innioasis/ipp/Bar;->attach(Landroidx/recyclerview/widget/RecyclerView;IIII)V
  .line 76
    return-void
.end method

.method private observe()V
  .registers 4
  .line 177
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result v0
  .line 178
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
  .line 179
    iput v0, p0, Lcom/innioasis/ipp/Bar;->lastPos:I
  .line 180
    return-void
.end method

.method private static of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
  .registers 2
  .line 143
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 144
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Bar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Bar;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method public static row(Landroid/view/View;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 107
    if-nez p0, :L0
    return-void
  :L0
  .line 108
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 109
    instance-of v1, v0, Landroid/view/View;
    if-nez v1, :L1
    return-void
  :L1
  .line 110
    check-cast v0, Landroid/view/View;
  .line 111
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->of(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v1
  .line 112
    if-nez v1, :L2
    return-void
  :L2
  .line 113
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    if-eqz v2, :L3
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 114
    const/4 v2, 4
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 115
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p0
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Bar;->tint(Landroid/view/View;I)V
  :L4
  .line 117
    goto :L6
  :L5
  .line 116
    move-exception p0
  :L6
  .line 118
    return-void
.end method

.method private settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 5
  .line 184
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-eqz v0, :L2
  .line 186
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->isLayoutRequested()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 187
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 188
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    goto :L3
  :L1
  .line 186
    return v1
  :L2
  .line 189
    iget v0, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L3
  .line 190
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/Bar;->y:F
  :L3
  .line 192
    const/4 p1, 1
    return p1
.end method

.method private start()V
  .registers 3
  .line 327
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 328
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 329
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 330
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 331
    return-void
.end method

.method private stop()V
  .registers 2
  .line 334
    iget-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 335
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 336
    return-void
.end method

.method private target(Landroidx/recyclerview/widget/RecyclerView;I)F
  .registers 6
  .line 217
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
  .line 218
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
    sub-int/2addr v1, p2
  .line 220
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Bar;->cursorRow(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
  .line 221
    if-eqz p2, :L0
  .line 222
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
    invoke-virtual { p2 }, Landroid/view/View;->getTranslationY()F
    move-result p2
    add-float/2addr p1, p2
    goto :L6
  :L0
  .line 224
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
  .line 225
    if-nez p2, :L3
    goto :L4
  :L3
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v2
  :L4
  .line 226
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p1
    if-ge p1, v2, :L5
    int-to-float p1, v0
    goto :L6
  :L5
    int-to-float p1, v1
  :L6
  .line 228
    int-to-float p2, v0
    int-to-float v0, v1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p2, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    return p1
.end method

.method private tint(Landroid/view/View;I)V
  .registers 9
  .line 237
    const v0, 2131362491
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 238
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 239
    instance-of v2, v0, Landroid/widget/TextView;
    if-eqz v2, :L6
    if-lez p2, :L6
    if-nez v1, :L0
    goto :L6
  :L0
  .line 240
    nop
  .line 241
    iget-boolean v2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    const/4 v3, 0
    if-nez v2, :L2
    iget v2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-nez v2, :L2
  .line 242
    invoke-direct { p0, v1, p2 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v2
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr v2, v4
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v4, 0x3F000000
    const/4 v5, 1
    cmpg-float v2, v2, v4
    if-gez v2, :L1
    invoke-virtual { v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result p1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->cursor()I
    move-result p2
    if-ne p1, p2, :L2
    const/4 v3, 1
    goto :L2
  :L1
  .line 243
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result v1
    int-to-float v1, v1
    invoke-virtual { p1 }, Landroid/view/View;->getTranslationY()F
    move-result p1
    add-float/2addr v1, p1
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float/2addr v1, p1
    invoke-static { v1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    int-to-float p2, p2
    const/high16 v1, 0x40800000
    div-float/2addr p2, v1
    cmpg-float p1, p1, p2
    if-gtz p1, :L2
    const/4 v3, 1
  :L2
  .line 245
    if-eqz v3, :L3
    iget p1, p0, Lcom/innioasis/ipp/Bar;->selText:I
    goto :L4
  :L3
    iget p1, p0, Lcom/innioasis/ipp/Bar;->rowText:I
  :L4
  .line 246
    check-cast v0, Landroid/widget/TextView;
  .line 247
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    if-eq p2, p1, :L5
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L5
  .line 248
    return-void
  :L6
  .line 239
    return-void
.end method

.method public doFrame(J)V
  .registers 10
  .line 339
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 340
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
  .line 344
    const-wide/32 v2, 1000000
    div-long/2addr p1, v2
  .line 345
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
  .line 346
    iput-wide p1, p0, Lcom/innioasis/ipp/Bar;->last:J
  .line 347
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 348
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/View;->getHeight()I
    move-result p1
  .line 349
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L4
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result p2
    if-eqz p2, :L4
  .line 350
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p2
  .line 351
    iget v3, p0, Lcom/innioasis/ipp/Bar;->y:F
    sub-float v3, p2, v3
  .line 352
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 353
    const/high16 v5, 0x41B00000
    mul-float v5, v5, v4
    const v6, 1169915904
    invoke-static { v6, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
    const/high16 v6, 0x442F0000
    invoke-static { v6, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 354
    mul-float v5, v5, v2
    invoke-static { v4, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  .line 355
    iget v4, p0, Lcom/innioasis/ipp/Bar;->y:F
    const/4 v5, 0
    cmpg-float v3, v3, v5
    if-gez v3, :L3
    neg-float v2, v2
  :L3
    add-float/2addr v4, v2
    iput v4, p0, Lcom/innioasis/ipp/Bar;->y:F
  .line 356
    sub-float v2, p2, v4
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L4
    iput p2, p0, Lcom/innioasis/ipp/Bar;->y:F
  :L4
  .line 358
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 359
    iget-boolean p2, p0, Lcom/innioasis/ipp/Bar;->snap:Z
    if-nez p2, :L6
    iget p2, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result p1
    cmpl-float p1, p2, p1
    if-eqz p1, :L5
    goto :L6
  :L5
  .line 362
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
    goto :L7
  :L6
  .line 360
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L7
  .line 364
    return-void
  :L8
  .line 341
    iput-boolean v1, p0, Lcom/innioasis/ipp/Bar;->running:Z
  .line 342
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 16
  :L0
  .line 280
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 281
    if-nez p3, :L1
    return-void
  :L1
  .line 282
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->observe()V
  .line 283
    iget-object v0, p0, Lcom/innioasis/ipp/Bar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 284
    iget-object v1, p0, Lcom/innioasis/ipp/Bar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 285
    const/4 v2, 0
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 286
    invoke-virtual { v3 }, Landroid/view/View;->getLeft()I
    move-result v4
  .line 287
    invoke-virtual { v3 }, Landroid/view/View;->getRight()I
    move-result v5
  .line 288
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v3
  .line 289
    invoke-direct { p0, p2, v3 }, Lcom/innioasis/ipp/Bar;->settle(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v6
  .line 290
    invoke-direct { p0, p2, v3 }, Lcom/innioasis/ipp/Bar;->target(Landroidx/recyclerview/widget/RecyclerView;I)F
    move-result v7
  .line 291
    if-eqz v0, :L3
  .line 292
    nop
  :L2
    if-ge v2, p3, :L3
  .line 293
    invoke-virtual { p2, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v8
  .line 294
    invoke-virtual { v8 }, Landroid/view/View;->getTop()I
    move-result v9
    int-to-float v9, v9
    invoke-virtual { v8 }, Landroid/view/View;->getTranslationY()F
    move-result v10
    add-float/2addr v9, v10
    invoke-static { v9 }, Ljava/lang/Math;->round(F)I
    move-result v9
  .line 295
    invoke-virtual { v8 }, Landroid/view/View;->getLeft()I
    move-result v10
    invoke-virtual { v8 }, Landroid/view/View;->getRight()I
    move-result v11
    invoke-virtual { v8 }, Landroid/view/View;->getHeight()I
    move-result v8
    add-int/2addr v8, v9
    invoke-virtual { v0, v10, v9, v11, v8 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 296
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 292
    add-int/lit8 v2, v2, 1
    goto :L2
  :L3
  .line 299
    if-nez v6, :L4
  .line 300
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  .line 301
    return-void
  :L4
  .line 303
    iget p3, p0, Lcom/innioasis/ipp/Bar;->y:F
    invoke-static { p3 }, Ljava/lang/Math;->round(F)I
    move-result p3
  .line 304
    if-eqz v1, :L5
  .line 305
    add-int/2addr v3, p3
    invoke-virtual { v1, v4, p3, v5, v3 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 306
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L5
  .line 308
    invoke-direct { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Bar;->drawArrow(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 309
    iget p1, p0, Lcom/innioasis/ipp/Bar;->y:F
    cmpl-float p1, p1, v7
    if-eqz p1, :L6
    invoke-direct { p0 }, Lcom/innioasis/ipp/Bar;->start()V
  :L6
  .line 311
    goto :L8
  :L7
  .line 310
    move-exception p1
  :L8
  .line 312
    return-void
.end method
