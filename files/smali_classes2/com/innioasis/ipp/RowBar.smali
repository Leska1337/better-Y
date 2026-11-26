.class public final Lcom/innioasis/ipp/RowBar;
.super Landroid/graphics/drawable/Drawable;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Lcom/innioasis/ipp/Loop$Bumper;
.source "RowBar.java"

.field private final static BARS:Ljava/util/WeakHashMap;

.field private final static HAIR:I = 2

.field private final static OMEGA:F = 30.0F

.field private final static ROWS:Ljava/util/WeakHashMap;

.field private bouncing:Z

.field private final col:Ljava/lang/ref/WeakReference;

.field private cur:I

.field private hb:F

.field private last:J

.field private movedTo:F

.field private final rowProbe:Landroid/view/View;

.field private final rowText:I

.field private running:Z

.field private final selProbe:Landroid/view/View;

.field private final selText:I

.field private under:Landroid/graphics/drawable/Drawable;

.field private vel:F

.field private y:F

.method static constructor <clinit>()V
  .registers 1
  .line 33
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/RowBar;->BARS:Ljava/util/WeakHashMap;
  .line 34
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/RowBar;->ROWS:Ljava/util/WeakHashMap;
    return-void
.end method

.method private constructor <init>(Landroid/view/ViewGroup;IIII)V
  .registers 10
  .line 50
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 43
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->cur:I
  .line 44
    const/high16 v0, 0x7FC00000
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
  .line 51
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
  .line 52
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
  .line 53
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/RowBar;->selProbe:Landroid/view/View;
  .line 54
    new-instance v1, Landroid/view/View;
    invoke-direct { v1, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/RowBar;->rowProbe:Landroid/view/View;
  .line 55
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 56
    const/4 v3, 1
    invoke-virtual { v2, v0, p2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 57
    const/4 p2, 0
    invoke-virtual { v2, v1, p3, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 59
    new-instance p3, Landroid/widget/TextView;
    invoke-direct { p3, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 60
    invoke-virtual { v2, p3, p4, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 61
    invoke-virtual { p3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/RowBar;->selText:I
  .line 62
    invoke-virtual { v2, p3, p5, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 63
    invoke-virtual { p3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/RowBar;->rowText:I
  .line 64
    return-void
.end method

.method private arrowOf(I)Landroid/view/View;
  .registers 3
  .line 147
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object p1
  .line 148
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    const v0, 2131361881
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L1
    return-object p1
.end method

.method private cover(Landroid/view/View;Z)F
  .registers 7
  .line 242
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    if-nez v0, :L6
    iget-boolean v0, p0, Lcom/innioasis/ipp/RowBar;->bouncing:Z
    if-eqz v0, :L0
    goto :L6
  :L0
  .line 243
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->cur:I
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v0
  .line 244
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    int-to-float v0, v0
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
    sub-float/2addr v0, v3
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    const/high16 v3, 0x3F000000
    cmpg-float v0, v0, v3
    if-gez v0, :L3
    if-eqz p2, :L1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    return v1
  :L3
  .line 245
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p2
    int-to-float p2, p2
    invoke-virtual { p1 }, Landroid/view/View;->getBottom()I
    move-result p1
    int-to-float p1, p1
  .line 246
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    add-float/2addr v0, v3
    invoke-static { p1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v0
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { p2, v3 }, Ljava/lang/Math;->max(FF)F
    move-result v3
    sub-float/2addr v0, v3
  .line 247
    cmpg-float v3, v0, v2
    if-lez v3, :L5
    cmpg-float v3, p1, p2
    if-gtz v3, :L4
    goto :L5
  :L4
    sub-float/2addr p1, p2
    div-float/2addr v0, p1
    invoke-static { v1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  :L5
    return v2
  :L6
  .line 242
    if-eqz p2, :L7
    goto :L8
  :L7
    const/4 v1, 0
  :L8
    return v1
.end method

.method public static dateTime(Landroid/app/Activity;I)V
  .registers 10
  .line 68
    const v0, 2131361987
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 69
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L0
    return-void
  :L0
  .line 70
    move-object v2, v0
    check-cast v2, Landroid/view/ViewGroup;
    const v4, 2131231050
    const v5, 2131231044
  .line 71
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v0, 2131100252
    invoke-virtual { p0, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
    const/4 v7, -1
  .line 70
    move v3, p1
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/RowBar;->update(Landroid/view/ViewGroup;IIIII)Z
  .line 72
    return-void
.end method

.method private dress()V
  .registers 3
  .line 129
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 130
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    if-ne v1, p0, :L0
    goto :L1
  :L0
  .line 131
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/ipp/RowBar;->under:Landroid/graphics/drawable/Drawable;
  .line 132
    invoke-virtual { v0, p0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 133
    return-void
  :L1
  .line 130
    return-void
.end method

.method static landed(Landroid/view/View;)Z
  .registers 6
  .line 110
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 111
    invoke-static { p0 }, Lcom/innioasis/ipp/RowBar;->owns(Landroid/view/View;)Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L1
  .line 112
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  .line 113
    return v2
  :L1
  .line 115
    sget-object v1, Lcom/innioasis/ipp/RowBar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 116
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 117
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/RowBar;
  .line 118
    iget-object v4, v3, Lcom/innioasis/ipp/RowBar;->selProbe:Landroid/view/View;
    if-eq p0, v4, :L4
    iget-object v4, v3, Lcom/innioasis/ipp/RowBar;->rowProbe:Landroid/view/View;
    if-ne p0, v4, :L3
    goto :L4
  :L3
  .line 123
    goto :L2
  :L4
  .line 119
    iget-object p0, v3, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/view/View;
  .line 120
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroid/view/View;->postInvalidate()V
  :L5
  .line 121
    return v2
  :L6
  .line 124
    return v0
.end method

.method private static mix(IIF)I
  .registers 8
  .line 262
    nop
  .line 263
    const/4 v0, 0
    const/4 v1, 0
  :L0
    const/16 v2, 32
    if-ge v0, v2, :L1
  .line 264
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 265
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
  .line 263
    add-int/lit8 v0, v0, 8
    goto :L0
  :L1
  .line 267
    return v1
.end method

.method static owns(Landroid/view/View;)Z
  .registers 2
  .line 105
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/RowBar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private row(I)Landroid/view/View;
  .registers 8
  .line 136
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 137
    nop
  .line 138
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-eqz v0, :L4
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L4
  .line 139
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 140
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v4
    if-lez v4, :L1
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v4
    const/4 v5, 2
    if-gt v4, v5, :L1
    goto :L3
  :L1
  .line 141
    add-int/lit8 v4, v2, 1
    if-ne v2, p1, :L2
    return-object v3
  :L2
    move v2, v4
  :L3
  .line 138
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 143
    const/4 p1, 0
    return-object p1
.end method

.method private start()V
  .registers 3
  .line 175
    iget-boolean v0, p0, Lcom/innioasis/ipp/RowBar;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 176
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/RowBar;->running:Z
  .line 177
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/RowBar;->last:J
  .line 178
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 179
    return-void
.end method

.method private static tint(Landroid/view/View;I)V
  .registers 4
  .line 251
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L1
  .line 252
    check-cast p0, Landroid/widget/TextView;
  .line 253
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    if-eq v0, p1, :L0
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 254
    return-void
  :L1
  .line 256
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-nez v0, :L2
    return-void
  :L2
  .line 257
    check-cast p0, Landroid/view/ViewGroup;
  .line 258
    const/4 v0, 0
  :L3
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/RowBar;->tint(Landroid/view/View;I)V
    add-int/lit8 v0, v0, 1
    goto :L3
  :L4
  .line 259
    return-void
.end method

.method public static update(Landroid/view/ViewGroup;IIIII)Z
  .catchall { :L0 .. :L8 } :L9
  .registers 15
  .line 77
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 78
    sget-object v1, Lcom/innioasis/ipp/RowBar;->BARS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/RowBar;
  .line 79
    if-nez v2, :L2
  .line 80
    new-instance v2, Lcom/innioasis/ipp/RowBar;
    move-object v3, v2
    move-object v4, p0
    move v5, p2
    move v6, p3
    move v7, p4
    move v8, p5
    invoke-direct/range { v3 .. v8 }, Lcom/innioasis/ipp/RowBar;-><init>(Landroid/view/ViewGroup;IIII)V
  .line 81
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 82
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p2
    invoke-virtual { p2, v2 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L2
  .line 84
    invoke-direct { v2 }, Lcom/innioasis/ipp/RowBar;->dress()V
  .line 85
    const/4 p2, 0
  :L3
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result p3
    if-ge p2, p3, :L4
  .line 86
    invoke-virtual { p0, p2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object p3
  .line 87
    sget-object p4, Lcom/innioasis/ipp/RowBar;->ROWS:Ljava/util/WeakHashMap;
    invoke-virtual { p4, p3, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 88
    invoke-static { p3 }, Lcom/innioasis/ipp/Bar;->blank(Landroid/view/View;)V
  .line 85
    add-int/lit8 p2, p2, 1
    goto :L3
  :L4
  .line 90
    invoke-direct { v2, p1 }, Lcom/innioasis/ipp/RowBar;->arrowOf(I)Landroid/view/View;
    move-result-object p2
  .line 91
    if-eqz p2, :L5
    invoke-virtual { p2 }, Landroid/view/View;->getVisibility()I
    move-result p3
    if-nez p3, :L5
    const/4 p3, 4
    invoke-virtual { p2, p3 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 92
    iget p2, v2, Lcom/innioasis/ipp/RowBar;->cur:I
    const/4 p3, 1
    if-eq p1, p2, :L6
    if-ltz p2, :L6
    sub-int p2, p1, p2
    invoke-static { p2 }, Ljava/lang/Math;->abs(I)I
    move-result p2
    if-le p2, p3, :L6
    const/high16 p2, 0x7FC00000
    iput p2, v2, Lcom/innioasis/ipp/RowBar;->y:F
  :L6
  .line 93
    iget p2, v2, Lcom/innioasis/ipp/RowBar;->cur:I
    if-eq p1, p2, :L7
    iput-boolean v0, v2, Lcom/innioasis/ipp/RowBar;->bouncing:Z
  :L7
  .line 94
    iput p1, v2, Lcom/innioasis/ipp/RowBar;->cur:I
  .line 95
    invoke-direct { v2 }, Lcom/innioasis/ipp/RowBar;->start()V
  .line 96
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->invalidate()V
  :L8
  .line 97
    return p3
  :L9
  .line 98
    move-exception p0
  .line 99
    return v0
.end method

.method public at()I
  .registers 2
  .line 165
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->cur:I
    return v0
.end method

.method public bump(I)V
  .registers 4
  .line 152
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 153
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/View;->hasWindowFocus()Z
    move-result v0
    if-eqz v0, :L2
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { v0 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 154
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/RowBar;->bouncing:Z
  .line 156
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
    cmpl-float v1, v0, v1
    if-eqz v1, :L1
  .line 157
    const/4 v1, 0
    iput v1, p0, Lcom/innioasis/ipp/RowBar;->vel:F
  .line 158
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
  :L1
  .line 160
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->vel:F
    int-to-float p1, p1
    const/high16 v1, 0x43700000
    mul-float p1, p1, v1
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/ipp/RowBar;->vel:F
  .line 161
    invoke-direct { p0 }, Lcom/innioasis/ipp/RowBar;->start()V
  .line 162
    return-void
  :L2
  .line 153
    return-void
.end method

.method public count()I
  .registers 3
  .line 169
    const/4 v0, 0
  :L0
  .line 170
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :L1
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 171
    return v0
.end method

.method public doFrame(J)V
  .registers 13
  .line 182
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 183
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->cur:I
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v1
  .line 184
    const/4 v2, 0
    if-eqz v0, :L11
    if-eqz v1, :L11
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L11
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v3
    if-nez v3, :L0
    goto/16 :L11
  :L0
  .line 188
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 189
    iget-wide v3, p0, Lcom/innioasis/ipp/RowBar;->last:J
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-nez v7, :L1
    const v3, 1015222895
    goto :L2
  :L1
    sub-long v3, p1, v3
    long-to-float v3, v3
    const/high16 v4, 0x447A0000
    div-float/2addr v3, v4
    const v4, 1028443341
    invoke-static { v4, v3 }, Ljava/lang/Math;->min(FF)F
    move-result v3
  :L2
  .line 190
    iput-wide p1, p0, Lcom/innioasis/ipp/RowBar;->last:J
  .line 191
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result p1
    int-to-float p1, p1
  .line 192
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result p2
  .line 193
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { v1 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v1
    if-eqz v1, :L3
  .line 194
    iput p1, p0, Lcom/innioasis/ipp/RowBar;->y:F
  .line 195
    int-to-float v1, p2
    iput v1, p0, Lcom/innioasis/ipp/RowBar;->hb:F
  :L3
  .line 197
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iget v4, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
    const/4 v5, 0
    cmpl-float v4, v1, v4
    if-eqz v4, :L4
    iput v5, p0, Lcom/innioasis/ipp/RowBar;->vel:F
  :L4
  .line 198
    sub-float/2addr v1, p1
  .line 199
    invoke-static { v1 }, Ljava/lang/Math;->abs(F)F
    move-result v4
  .line 200
    iget v6, p0, Lcom/innioasis/ipp/RowBar;->vel:F
    const/high16 v7, 0x41F00000
    mul-float v8, v1, v7
    add-float/2addr v6, v8
  .line 201
    const/high16 v8, 0xC1F00000
    mul-float v8, v8, v3
    float-to-double v8, v8
    invoke-static { v8, v9 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v8
    double-to-float v8, v8
  .line 202
    mul-float v9, v6, v3
    add-float/2addr v1, v9
    mul-float v1, v1, v8
  .line 203
    iget v9, p0, Lcom/innioasis/ipp/RowBar;->vel:F
    mul-float v6, v6, v7
    mul-float v6, v6, v3
    sub-float/2addr v9, v6
    mul-float v9, v9, v8
    iput v9, p0, Lcom/innioasis/ipp/RowBar;->vel:F
  .line 204
    cmpl-float v3, v4, v5
    if-nez v3, :L5
    int-to-float v3, p2
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    goto :L6
  :L5
  .line 205
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    int-to-float v6, p2
    sub-float/2addr v6, v3
    invoke-static { v1 }, Ljava/lang/Math;->abs(F)F
    move-result v7
    div-float/2addr v7, v4
    const/high16 v4, 0x3F800000
    sub-float v7, v4, v7
    invoke-static { v4, v7 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    invoke-static { v5, v4 }, Ljava/lang/Math;->max(FF)F
    move-result v4
    mul-float v6, v6, v4
    add-float/2addr v3, v6
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->hb:F
  :L6
  .line 206
    add-float v3, p1, v1
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
  .line 207
    invoke-static { v1 }, Ljava/lang/Math;->abs(F)F
    move-result v1
    const/high16 v3, 0x3F000000
    cmpg-float v1, v1, v3
    if-gez v1, :L7
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->vel:F
    invoke-static { v1 }, Ljava/lang/Math;->abs(F)F
    move-result v1
    const/high16 v3, 0x41700000
    cmpg-float v1, v1, v3
    if-gez v1, :L7
  .line 208
    iput p1, p0, Lcom/innioasis/ipp/RowBar;->y:F
  .line 209
    int-to-float v1, p2
    iput v1, p0, Lcom/innioasis/ipp/RowBar;->hb:F
  .line 210
    iput v5, p0, Lcom/innioasis/ipp/RowBar;->vel:F
  :L7
  .line 212
    iget v1, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iput v1, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
  .line 213
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->invalidate()V
  .line 214
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->y:F
    cmpl-float p1, v0, p1
    if-nez p1, :L9
    iget p1, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    int-to-float p2, p2
    cmpl-float p1, p1, p2
    if-nez p1, :L9
    iget p1, p0, Lcom/innioasis/ipp/RowBar;->vel:F
    cmpl-float p1, p1, v5
    if-eqz p1, :L8
    goto :L9
  :L8
  .line 219
    iput-boolean v2, p0, Lcom/innioasis/ipp/RowBar;->running:Z
  .line 220
    iput-boolean v2, p0, Lcom/innioasis/ipp/RowBar;->bouncing:Z
    goto :L10
  :L9
  .line 216
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  .line 217
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L10
  .line 222
    return-void
  :L11
  .line 185
    iput-boolean v2, p0, Lcom/innioasis/ipp/RowBar;->running:Z
  .line 186
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 10
  :L0
  .line 273
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->under:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :L1
  .line 274
    invoke-virtual { p0 }, Lcom/innioasis/ipp/RowBar;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  .line 275
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->under:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L1
  .line 277
    iget-object v0, p0, Lcom/innioasis/ipp/RowBar;->rowProbe:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 278
    iget-object v1, p0, Lcom/innioasis/ipp/RowBar;->selProbe:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 279
    const/4 v2, 0
    const/4 v3, 0
  :L2
  .line 280
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v4
  .line 281
    if-nez v4, :L11
  .line 287
    iget v0, p0, Lcom/innioasis/ipp/RowBar;->cur:I
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v0
  .line 288
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v3
    if-nez v3, :L3
    goto/16 :L10
  :L3
  .line 290
    iget-object v3, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/view/View;
  .line 291
    if-eqz v3, :L4
    invoke-virtual { v3 }, Landroid/view/View;->hasWindowFocus()Z
    move-result v3
    if-eqz v3, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->bumper(Lcom/innioasis/ipp/Loop$Bumper;)V
  :L4
  .line 293
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { v3 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v3
    if-eqz v3, :L5
  .line 294
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v3
    int-to-float v3, v3
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
  .line 295
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v3
    int-to-float v3, v3
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->hb:F
  .line 296
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
    iput v3, p0, Lcom/innioasis/ipp/RowBar;->movedTo:F
  :L5
  .line 298
    iget v3, p0, Lcom/innioasis/ipp/RowBar;->y:F
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 299
    iget v4, p0, Lcom/innioasis/ipp/RowBar;->hb:F
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    add-int/2addr v4, v3
  .line 300
    if-eqz v1, :L6
  .line 301
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v5
    invoke-virtual { v0 }, Landroid/view/View;->getRight()I
    move-result v6
    invoke-virtual { v1, v5, v3, v6, v4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 302
    invoke-virtual { v1, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L6
  .line 304
    const v1, 2131361881
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 305
    instance-of v5, v1, Landroid/widget/ImageView;
    if-eqz v5, :L9
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v5
    const/16 v6, 8
    if-eq v5, v6, :L9
    invoke-virtual { v1 }, Landroid/view/View;->getWidth()I
    move-result v5
    if-lez v5, :L9
  .line 306
    nop
  .line 307
    move-object v6, v1
    const/4 v5, 0
  :L7
    if-eqz v6, :L8
    if-eq v6, v0, :L8
  .line 308
    invoke-virtual { v6 }, Landroid/view/View;->getLeft()I
    move-result v7
    add-int/2addr v2, v7
  .line 309
    invoke-virtual { v6 }, Landroid/view/View;->getTop()I
    move-result v7
    add-int/2addr v5, v7
  .line 307
    invoke-virtual { v6 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v6
    check-cast v6, Landroid/view/View;
    goto :L7
  :L8
  .line 311
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 312
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v6
    invoke-virtual { v0 }, Landroid/view/View;->getRight()I
    move-result v7
    invoke-virtual { p1, v6, v3, v7, v4 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 313
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v0
    add-int/2addr v0, v2
    int-to-float v0, v0
    add-int/2addr v3, v5
    int-to-float v2, v3
    invoke-virtual { p1, v0, v2 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 314
    invoke-virtual { v1, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 315
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L9
  .line 318
    goto :L14
  :L10
  .line 288
    return-void
  :L11
  .line 282
    if-eqz v0, :L12
  .line 283
    invoke-virtual { v4 }, Landroid/view/View;->getLeft()I
    move-result v5
    invoke-virtual { v4 }, Landroid/view/View;->getTop()I
    move-result v6
    invoke-virtual { v4 }, Landroid/view/View;->getRight()I
    move-result v7
    invoke-virtual { v4 }, Landroid/view/View;->getBottom()I
    move-result v4
    invoke-virtual { v0, v5, v6, v7, v4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 284
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L12
  .line 279
    add-int/lit8 v3, v3, 1
    goto/16 :L2
  :L13
  .line 317
    move-exception p1
  :L14
  .line 319
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 331
    const/4 v0, -3
    return v0
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L9 } :L10
  .registers 8
  .line 227
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/RowBar;->col:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 228
    if-nez v1, :L1
    return v0
  :L1
  .line 229
    invoke-direct { p0 }, Lcom/innioasis/ipp/RowBar;->dress()V
  .line 230
    const/4 v1, 0
    const/4 v2, 0
  :L2
  .line 231
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/RowBar;->row(I)Landroid/view/View;
    move-result-object v3
  .line 232
    if-nez v3, :L3
  .line 237
    goto :L11
  :L3
  .line 233
    iget v4, p0, Lcom/innioasis/ipp/RowBar;->cur:I
    if-ne v2, v4, :L4
    const/4 v4, 1
    goto :L5
  :L4
    const/4 v4, 0
  :L5
    invoke-direct { p0, v3, v4 }, Lcom/innioasis/ipp/RowBar;->cover(Landroid/view/View;Z)F
    move-result v4
  .line 234
    const/high16 v5, 0x3F800000
    cmpl-float v5, v4, v5
    if-ltz v5, :L6
    iget v4, p0, Lcom/innioasis/ipp/RowBar;->selText:I
    goto :L8
  :L6
    const/4 v5, 0
    cmpg-float v5, v4, v5
    if-gtz v5, :L7
    iget v4, p0, Lcom/innioasis/ipp/RowBar;->rowText:I
    goto :L8
  :L7
    iget v5, p0, Lcom/innioasis/ipp/RowBar;->rowText:I
    iget v6, p0, Lcom/innioasis/ipp/RowBar;->selText:I
    invoke-static { v5, v6, v4 }, Lcom/innioasis/ipp/RowBar;->mix(IIF)I
    move-result v4
  :L8
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/RowBar;->tint(Landroid/view/View;I)V
  :L9
  .line 230
    add-int/lit8 v2, v2, 1
    goto :L2
  :L10
  .line 236
    move-exception v1
  :L11
  .line 238
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 323
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 327
    return-void
.end method
