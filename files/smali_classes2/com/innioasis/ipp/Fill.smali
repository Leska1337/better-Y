.class public final Lcom/innioasis/ipp/Fill;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "Fill.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Fill$Below;
  }
.end annotation

.field private final static DONE:Ljava/util/WeakHashMap;

.field private final static FILL:Lcom/innioasis/ipp/Fill;

.field private final static HAIR:I = 2

.method static constructor <clinit>()V
  .registers 1
  .line 27
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Fill;->DONE:Ljava/util/WeakHashMap;
  .line 28
    new-instance v0, Lcom/innioasis/ipp/Fill;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Fill;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Fill;->FILL:Lcom/innioasis/ipp/Fill;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 25
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIIIII)V
  .registers 8
  .line 23
    invoke-static/range { p0 .. p7 }, Lcom/innioasis/ipp/Fill;->tile(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIIIII)V
    return-void
.end method

.method private static add(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 56
    sget-object v0, Lcom/innioasis/ipp/Fill;->DONE:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    return-void
  :L0
  .line 57
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 58
    sget-object v0, Lcom/innioasis/ipp/Fill;->FILL:Lcom/innioasis/ipp/Fill;
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 59
    return-void
.end method

.method static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 33
    const v0, 16908290
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Fill;->walk(Landroid/view/View;)V
  .line 34
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v0, :L1
    const v0, 2131361987
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Fill;->rows(Landroid/view/View;)V
  :L1
  .line 36
    goto :L3
  :L2
  .line 35
    move-exception p0
  :L3
  .line 37
    return-void
.end method

.method static list(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 51
    invoke-static { p0 }, Lcom/innioasis/ipp/Fill;->add(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 52
    return-void
.end method

.method public static rows(Landroid/view/View;)V
  .registers 3
  .line 63
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Fill;->DONE:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 64
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 65
    new-instance v0, Lcom/innioasis/ipp/Fill$Below;
    move-object v1, p0
    check-cast v1, Landroid/view/ViewGroup;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Fill$Below;-><init>(Landroid/view/ViewGroup;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 66
    return-void
  :L1
  .line 63
    return-void
.end method

.method private static tile(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIIIII)V
  .registers 9
  :L0
  .line 76
    add-int/2addr p4, p5
    if-ge p4, p7, :L1
  .line 77
    add-int v0, p4, p6
    invoke-virtual { p1, p2, p4, p3, v0 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 78
    invoke-virtual { p1, p0 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    goto :L0
  :L1
  .line 80
    return-void
.end method

.method private static vertical(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 69
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
  .line 70
    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v0, :L0
    instance-of v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 71
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result p0
    const/4 v0, 1
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 70
    return v0
.end method

.method private static walk(Landroid/view/View;)V
  .registers 3
  .line 40
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
  .line 41
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Fill;->add(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 42
    return-void
  :L0
  .line 44
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-nez v0, :L1
    return-void
  :L1
  .line 45
    check-cast p0, Landroid/view/ViewGroup;
  .line 46
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L3
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Fill;->walk(Landroid/view/View;)V
    add-int/lit8 v0, v0, 1
    goto :L2
  :L3
  .line 47
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L12 } :L15
  .registers 14
  :L0
  .line 129
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p3
  .line 130
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 131
    if-eqz p3, :L14
    if-eqz v0, :L14
    invoke-static { p2 }, Lcom/innioasis/ipp/Fill;->vertical(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
    if-nez v1, :L1
    goto/16 :L14
  :L1
  .line 132
    invoke-static { }, Lcom/innioasis/ipp/Theme;->rowBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v3
  .line 133
    if-nez v3, :L2
    return-void
  :L2
  .line 134
    nop
  .line 135
    nop
  .line 136
    nop
  .line 137
    const/4 v1, 0
    const/4 v2, -1
    const/4 v4, 0
    move-object v2, v1
    const/4 v4, -1
    const/4 v5, 0
  :L3
    if-ge v5, p3, :L5
  .line 138
    invoke-virtual { p2, v5 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 139
    invoke-virtual { p2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v7
  .line 140
    if-le v7, v4, :L4
  .line 141
    nop
  .line 142
    nop
  .line 143
    move-object v2, v1
    move-object v1, v6
    move v4, v7
  :L4
  .line 137
    add-int/lit8 v5, v5, 1
    goto :L3
  :L5
  .line 146
    if-eqz v1, :L13
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p3
    add-int/lit8 p3, p3, -1
    if-eq v4, p3, :L6
    goto :L13
  :L6
  .line 147
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v8
  .line 148
    if-gtz v8, :L7
    return-void
  :L7
  .line 149
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result p3
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p2
    sub-int v9, p3, p2
  .line 150
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result p2
    int-to-float p2, p2
    invoke-virtual { v1 }, Landroid/view/View;->getTranslationY()F
    move-result p3
    add-float/2addr p2, p3
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result v6
  .line 152
    if-eqz v2, :L8
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result p2
    int-to-float p2, p2
    invoke-virtual { v2 }, Landroid/view/View;->getTranslationY()F
    move-result p3
    add-float/2addr p2, p3
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    sub-int p2, v6, p2
    goto :L9
  :L8
    move p2, v8
  :L9
  .line 153
    if-ge p2, v8, :L10
    move v7, v8
    goto :L11
  :L10
    move v7, p2
  :L11
  .line 154
    invoke-virtual { v1 }, Landroid/view/View;->getLeft()I
    move-result v4
    invoke-virtual { v1 }, Landroid/view/View;->getRight()I
    move-result v5
    move-object v2, p1
    invoke-static/range { v2 .. v9 }, Lcom/innioasis/ipp/Fill;->tile(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIIIII)V
  :L12
  .line 156
    goto :L16
  :L13
  .line 146
    return-void
  :L14
  .line 131
    return-void
  :L15
  .line 155
    move-exception p1
  :L16
  .line 157
    return-void
.end method
