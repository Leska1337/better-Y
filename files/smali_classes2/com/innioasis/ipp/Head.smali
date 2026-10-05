.class public final Lcom/innioasis/ipp/Head;
.super Ljava/lang/Object;
.source "Head.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Head$Ride;,
    Lcom/innioasis/ipp/Head$Backdrop;
  }
.end annotation

.field private final static rides:Ljava/util/WeakHashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 35
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static attach(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  .line 40
    if-nez p0, :L0
    return-void
  :L0
  .line 41
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 42
    instance-of v1, v0, Landroid/view/View;
    if-nez v1, :L1
    return-void
  :L1
  .line 43
    check-cast v0, Landroid/view/View;
  .line 44
    const v1, 2131362180
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 45
    instance-of v2, v1, Landroid/widget/ListView;
    if-nez v2, :L2
    const v1, 2131362181
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  :L2
  .line 46
    instance-of v2, v1, Landroid/widget/ListView;
    if-nez v2, :L3
    return-void
  :L3
  .line 47
    check-cast v1, Landroid/widget/ListView;
  .line 48
    sget-object v2, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    invoke-virtual { v2, v1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 49
    instance-of v4, v3, Lcom/innioasis/ipp/Head$Ride;
    if-eqz v4, :L4
  .line 51
    check-cast v3, Lcom/innioasis/ipp/Head$Ride;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
  .line 52
    return-void
  :L4
  .line 54
    new-instance v3, Lcom/innioasis/ipp/Head$Ride;
    const v4, 2131362548
    invoke-virtual { v0, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-direct { v3, v1, p0, v0 }, Lcom/innioasis/ipp/Head$Ride;-><init>(Landroid/widget/ListView;Landroid/view/View;Landroid/view/View;)V
  .line 55
    invoke-virtual { v2, v1, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 56
    const/4 p0, 0
    invoke-virtual { v1, p0 }, Landroid/widget/ListView;->setClipToPadding(Z)V
  .line 57
    invoke-virtual { v1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 58
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
  :L5
  .line 60
    goto :L7
  :L6
  .line 59
    move-exception p0
  :L7
  .line 61
    return-void
.end method

.method public static backdrop(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 157
    if-nez p0, :L0
    return-void
  :L0
  .line 158
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 159
    if-eqz v0, :L4
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 160
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 161
    new-instance v2, Lcom/innioasis/ipp/Head$Backdrop;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/Head$Backdrop;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .line 162
    if-nez v1, :L2
  .line 163
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    goto :L3
  :L2
  .line 165
    const/4 v0, 2
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;
  .line 166
    const/4 v3, 0
    aput-object v2, v0, v3
  .line 167
    const/4 v2, 1
    aput-object v1, v0, v2
  .line 168
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 171
    goto :L6
  :L4
  .line 159
    return-void
  :L5
  .line 170
    move-exception p0
  :L6
  .line 172
    return-void
.end method

.method public static headerShowing(Landroid/widget/ListView;)Z
  .registers 2
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 141
    if-eqz p0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result v0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result p0
    if-ge v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static place(Landroid/widget/ListView;II)V
  .registers 5
  .line 82
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 83
    if-nez v0, :L0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setSelection(I)V
    return-void
  :L0
  .line 84
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
    move-result v1
    if-eqz v1, :L1
    const/4 p0, 1
    invoke-virtual { v0, p1, p2, p0 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
    return-void
  :L1
  .line 85
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 86
    return-void
.end method

.method public static rest(Landroid/widget/ListView;)V
  .registers 3
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 131
    const/4 v1, 0
    if-nez v0, :L0
  .line 132
    invoke-virtual { p0, v1, v1 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 133
    return-void
  :L0
  .line 135
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->wantPad()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 136
    return-void
.end method

.method public static restore(Landroid/widget/ListView;II)V
  .registers 5
  .line 93
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 94
    if-eqz v0, :L0
    const/4 v1, 1
    invoke-virtual { v0, p1, p2, v1 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
  :L0
  .line 95
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 96
    return-void
.end method

.method public static reveal(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  .line 104
    if-nez p0, :L0
    return-void
  :L0
  .line 105
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 106
    instance-of v0, p0, Landroid/view/View;
    if-nez v0, :L1
    return-void
  :L1
  .line 107
    move-object v0, p0
    check-cast v0, Landroid/view/View;
    const v1, 2131362180
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 108
    instance-of v1, v0, Landroid/widget/ListView;
    if-nez v1, :L2
    check-cast p0, Landroid/view/View;
    const v0, 2131362181
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L2
  .line 109
    instance-of p0, v0, Landroid/widget/ListView;
    if-nez p0, :L3
    return-void
  :L3
  .line 110
    check-cast v0, Landroid/widget/ListView;
  .line 111
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 113
    if-eqz p0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v1
    if-eqz v1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result p0
    if-nez p0, :L4
    goto :L6
  :L4
  .line 114
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
  :L5
  .line 116
    goto :L8
  :L6
  .line 113
    return-void
  :L7
  .line 115
    move-exception p0
  :L8
  .line 117
    return-void
.end method

.method public static ridden(Landroid/widget/ListView;)I
  .registers 1
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 122
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result p0
  :L1
    return p0
.end method

.method private static ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
  .registers 3
  .line 64
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 65
    sget-object v1, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 66
    instance-of v1, p0, Lcom/innioasis/ipp/Head$Ride;
    if-eqz v1, :L1
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/Head$Ride;
  :L1
    return-object v0
.end method

.method public static selectPinned(Landroid/widget/ListView;I)V
  .registers 3
  .line 146
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 147
    if-nez v0, :L0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setSelection(I)V
    return-void
  :L0
  .line 148
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->barHeight()I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 149
    return-void
.end method

.method public static top(Landroid/widget/ListView;)I
  .registers 2
  .line 71
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 72
    if-nez v0, :L0
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result p0
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->edge()I
    move-result p0
  :L1
    return p0
.end method
