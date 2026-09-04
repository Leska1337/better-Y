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
  .line 69
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 66
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static attach(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  .line 79
    if-nez p0, :L0
    return-void
  :L0
  .line 80
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 81
    instance-of v1, v0, Landroid/view/View;
    if-nez v1, :L1
    return-void
  :L1
  .line 82
    check-cast v0, Landroid/view/View;
  .line 83
    const v1, 2131362180
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 84
    instance-of v2, v1, Landroid/widget/ListView;
    if-nez v2, :L2
    const v1, 2131362181
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  :L2
  .line 85
    instance-of v2, v1, Landroid/widget/ListView;
    if-nez v2, :L3
    return-void
  :L3
  .line 86
    check-cast v1, Landroid/widget/ListView;
  .line 87
    sget-object v2, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    invoke-virtual { v2, v1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 88
    instance-of v4, v3, Lcom/innioasis/ipp/Head$Ride;
    if-eqz v4, :L4
  .line 92
    check-cast v3, Lcom/innioasis/ipp/Head$Ride;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
  .line 93
    return-void
  :L4
  .line 95
    new-instance v3, Lcom/innioasis/ipp/Head$Ride;
    const v4, 2131362548
    invoke-virtual { v0, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-direct { v3, v1, p0, v0 }, Lcom/innioasis/ipp/Head$Ride;-><init>(Landroid/widget/ListView;Landroid/view/View;Landroid/view/View;)V
  .line 96
    invoke-virtual { v2, v1, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 97
    const/4 p0, 0
    invoke-virtual { v1, p0 }, Landroid/widget/ListView;->setClipToPadding(Z)V
  .line 98
    invoke-virtual { v1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 99
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
  :L5
  .line 102
    goto :L7
  :L6
  .line 100
    move-exception p0
  :L7
  .line 103
    return-void
.end method

.method public static backdrop(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 238
    if-nez p0, :L0
    return-void
  :L0
  .line 239
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 240
    if-eqz v0, :L4
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 241
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 242
    new-instance v2, Lcom/innioasis/ipp/Head$Backdrop;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/Head$Backdrop;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .line 243
    if-nez v1, :L2
  .line 244
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    goto :L3
  :L2
  .line 246
    const/4 v0, 2
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;
  .line 247
    const/4 v3, 0
    aput-object v2, v0, v3
  .line 248
    const/4 v2, 1
    aput-object v1, v0, v2
  .line 249
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 253
    goto :L6
  :L4
  .line 240
    return-void
  :L5
  .line 251
    move-exception p0
  :L6
  .line 254
    return-void
.end method

.method public static headerShowing(Landroid/widget/ListView;)Z
  .registers 2
  .line 215
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 216
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
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 135
    if-nez v0, :L0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setSelection(I)V
    return-void
  :L0
  .line 136
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
    move-result v1
    if-eqz v1, :L1
    const/4 p0, 1
    invoke-virtual { v0, p1, p2, p0 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
    return-void
  :L1
  .line 137
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 138
    return-void
.end method

.method public static rest(Landroid/widget/ListView;)V
  .registers 3
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 203
    const/4 v1, 0
    if-nez v0, :L0
  .line 204
    invoke-virtual { p0, v1, v1 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 205
    return-void
  :L0
  .line 207
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->wantPad()I
    move-result v0
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 208
    return-void
.end method

.method public static restore(Landroid/widget/ListView;II)V
  .registers 5
  .line 150
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 151
    if-eqz v0, :L0
    const/4 v1, 1
    invoke-virtual { v0, p1, p2, v1 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
  :L0
  .line 152
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 153
    return-void
.end method

.method public static reveal(Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  .line 167
    if-nez p0, :L0
    return-void
  :L0
  .line 168
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 169
    instance-of v0, p0, Landroid/view/View;
    if-nez v0, :L1
    return-void
  :L1
  .line 170
    move-object v0, p0
    check-cast v0, Landroid/view/View;
    const v1, 2131362180
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 171
    instance-of v1, v0, Landroid/widget/ListView;
    if-nez v1, :L2
    check-cast p0, Landroid/view/View;
    const v0, 2131362181
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L2
  .line 172
    instance-of p0, v0, Landroid/widget/ListView;
    if-nez p0, :L3
    return-void
  :L3
  .line 173
    check-cast v0, Landroid/widget/ListView;
  .line 174
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 177
    if-eqz p0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v1
    if-eqz v1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result p0
    if-nez p0, :L4
    goto :L6
  :L4
  .line 178
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
  :L5
  .line 181
    goto :L8
  :L6
  .line 177
    return-void
  :L7
  .line 179
    move-exception p0
  :L8
  .line 182
    return-void
.end method

.method public static ridden(Landroid/widget/ListView;)I
  .registers 1
  .line 189
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object p0
  .line 190
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
  .line 106
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 107
    sget-object v1, Lcom/innioasis/ipp/Head;->rides:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 108
    instance-of v1, p0, Lcom/innioasis/ipp/Head$Ride;
    if-eqz v1, :L1
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/Head$Ride;
  :L1
    return-object v0
.end method

.method public static selectPinned(Landroid/widget/ListView;I)V
  .registers 3
  .line 224
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 225
    if-nez v0, :L0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setSelection(I)V
    return-void
  :L0
  .line 226
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Head$Ride;->barHeight()I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 227
    return-void
.end method

.method public static top(Landroid/widget/ListView;)I
  .registers 2
  .line 117
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->ride(Landroid/widget/ListView;)Lcom/innioasis/ipp/Head$Ride;
    move-result-object v0
  .line 118
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
