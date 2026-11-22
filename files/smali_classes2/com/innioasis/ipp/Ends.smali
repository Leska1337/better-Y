.class public final Lcom/innioasis/ipp/Ends;
.super Ljava/lang/Object;
.source "Ends.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Ends$Sliced;
  }
.end annotation

.field private final static CAPS:Ljava/util/WeakHashMap;

.field private final static PLAIN:[I

.field private final static RES:Ljava/util/HashMap;

.field private final static TOL:I = 12

.method static constructor <clinit>()V
  .registers 1
  .line 26
    const/4 v0, 0
    new-array v0, v0, [I
    sput-object v0, Lcom/innioasis/ipp/Ends;->PLAIN:[I
  .line 27
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Ends;->CAPS:Ljava/util/WeakHashMap;
  .line 78
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Ends;->RES:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static caps(Landroid/graphics/Bitmap;)[I
  .catchall { :L0 .. :L1 } :L9
  .catchall { :L3 .. :L5 } :L4
  .catchall { :L10 .. :L11 } :L9
  .registers 3
  .line 82
    sget-object v0, Lcom/innioasis/ipp/Ends;->CAPS:Ljava/util/WeakHashMap;
    monitor-enter v0
  :L0
  .line 83
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 84
    monitor-exit v0
  :L1
  .line 85
    if-nez v1, :L6
  .line 86
    invoke-static { p0 }, Lcom/innioasis/ipp/Ends;->measure(Landroid/graphics/Bitmap;)[I
    move-result-object v1
  .line 87
    if-nez v1, :L2
    sget-object v1, Lcom/innioasis/ipp/Ends;->PLAIN:[I
  :L2
  .line 88
    monitor-enter v0
  :L3
  .line 89
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 90
    monitor-exit v0
    goto :L6
  :L4
    move-exception p0
    monitor-exit v0
  :L5
    throw p0
  :L6
  .line 92
    sget-object p0, Lcom/innioasis/ipp/Ends;->PLAIN:[I
    if-ne v1, p0, :L7
    const/4 p0, 0
    goto :L8
  :L7
    move-object p0, v1
    check-cast p0, [I
  :L8
    return-object p0
  :L9
  .line 84
    move-exception p0
  :L10
    monitor-exit v0
  :L11
    throw p0
.end method

.method static drawable(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
  .registers 7
  .line 41
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ends;->resBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 42
    if-eqz v0, :L0
  .line 43
    invoke-static { v0 }, Lcom/innioasis/ipp/Ends;->caps(Landroid/graphics/Bitmap;)[I
    move-result-object v1
  .line 44
    new-instance v2, Lcom/innioasis/ipp/Ends$Sliced;
    const/4 v3, 0
    aget v3, v1, v3
    const/4 v4, 1
    aget v1, v1, v4
    invoke-direct { v2, p0, v0, v3, v1 }, Lcom/innioasis/ipp/Ends$Sliced;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;II)V
  .line 45
    iput p1, v2, Lcom/innioasis/ipp/Ends$Sliced;->res:I
  .line 46
    return-object v2
  :L0
  .line 48
    invoke-virtual { p0, p1 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object p0
    return-object p0
.end method

.method private static measure(Landroid/graphics/Bitmap;)[I
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 98
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v1
  .line 99
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v9
  .line 100
    const/16 v2, 8
    if-lt v1, v2, :L9
    const/4 v2, 2
    if-ge v9, v2, :L1
    goto :L9
  :L1
  .line 101
    div-int/lit8 v10, v1, 2
  .line 102
    new-array v11, v9, [I
  .line 103
    new-array v12, v9, [I
  .line 104
    const/4 v4, 0
    const/4 v5, 1
    const/4 v7, 0
    const/4 v8, 1
    move-object v2, p0
    move-object v3, v11
    move v6, v10
    invoke-virtual/range { v2 .. v9 }, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V
  .line 105
    move v2, v10
  :L2
  .line 106
    if-lez v2, :L3
    add-int/lit8 v3, v2, -1
    invoke-static { p0, v3, v11, v12 }, Lcom/innioasis/ipp/Ends;->same(Landroid/graphics/Bitmap;I[I[I)Z
    move-result v3
    if-eqz v3, :L3
    add-int/lit8 v2, v2, -1
    goto :L2
  :L3
  .line 107
    nop
  :L4
  .line 108
    add-int/lit8 v3, v1, -1
    if-ge v10, v3, :L5
    add-int/lit8 v4, v10, 1
    invoke-static { p0, v4, v11, v12 }, Lcom/innioasis/ipp/Ends;->same(Landroid/graphics/Bitmap;I[I[I)Z
    move-result v5
    if-eqz v5, :L5
    move v10, v4
    goto :L4
  :L5
  .line 109
    if-nez v2, :L6
    if-ne v10, v3, :L6
    return-object v0
  :L6
  .line 110
    sub-int p0, v10, v2
    add-int/lit8 p0, p0, 1
    div-int/lit8 v1, v1, 4
    if-ge p0, v1, :L7
    return-object v0
  :L7
  .line 111
    sub-int/2addr v3, v10
    filled-new-array { v2, v3 }, [I
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 100
    return-object v0
  :L10
  .line 112
    move-exception p0
  .line 113
    return-object v0
.end method

.method static of(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
  .registers 6
  .line 31
    invoke-static { p1 }, Lcom/innioasis/ipp/Ends;->caps(Landroid/graphics/Bitmap;)[I
    move-result-object v0
  .line 32
    if-nez v0, :L0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct { v0, p0, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    goto :L1
  :L0
    new-instance v1, Lcom/innioasis/ipp/Ends$Sliced;
    const/4 v2, 0
    aget v2, v0, v2
    const/4 v3, 1
    aget v0, v0, v3
    invoke-direct { v1, p0, p1, v2, v0 }, Lcom/innioasis/ipp/Ends$Sliced;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;II)V
    move-object v0, v1
  :L1
    return-object v0
.end method

.method static res(Landroid/view/View;I)Z
  .registers 5
  .line 53
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 54
    instance-of v1, v0, Lcom/innioasis/ipp/Ends$Sliced;
    const/4 v2, 1
    if-eqz v1, :L0
    check-cast v0, Lcom/innioasis/ipp/Ends$Sliced;
    iget v0, v0, Lcom/innioasis/ipp/Ends$Sliced;->res:I
    if-ne v0, p1, :L0
    return v2
  :L0
  .line 55
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Ends;->resBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
    if-nez v0, :L1
    const/4 p0, 0
    return p0
  :L1
  .line 56
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Ends;->drawable(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
    move-result-object p1
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 57
    return v2
.end method

.method private static resBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L6 .. :L8 } :L7
  .catchall { :L13 .. :L14 } :L12
  .registers 6
  .line 62
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 64
    sget-object v1, Lcom/innioasis/ipp/Ends;->RES:Ljava/util/HashMap;
    monitor-enter v1
  :L0
  .line 65
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 66
    monitor-exit v1
  :L1
  .line 67
    const/4 v3, 0
    if-nez v2, :L9
  .line 68
    invoke-virtual { p0, p1 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object p0
  .line 69
    instance-of p1, p0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz p1, :L2
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p0
    goto :L3
  :L2
    move-object p0, v3
  :L3
  .line 70
    if-eqz p0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Ends;->caps(Landroid/graphics/Bitmap;)[I
    move-result-object p1
    if-eqz p1, :L4
    goto :L5
  :L4
    sget-object p0, Lcom/innioasis/ipp/Ends;->PLAIN:[I
  :L5
    move-object v2, p0
  .line 71
    monitor-enter v1
  :L6
  .line 72
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 73
    monitor-exit v1
    goto :L9
  :L7
    move-exception p0
    monitor-exit v1
  :L8
    throw p0
  :L9
  .line 75
    sget-object p0, Lcom/innioasis/ipp/Ends;->PLAIN:[I
    if-ne v2, p0, :L10
    goto :L11
  :L10
    move-object v3, v2
    check-cast v3, Landroid/graphics/Bitmap;
  :L11
    return-object v3
  :L12
  .line 66
    move-exception p0
  :L13
    monitor-exit v1
  :L14
    throw p0
.end method

.method private static same(Landroid/graphics/Bitmap;I[I[I)Z
  .registers 12
  .line 119
    const/4 v2, 0
    const/4 v3, 1
    const/4 v5, 0
    const/4 v6, 1
    array-length v7, p3
    move-object v0, p0
    move-object v1, p3
    move v4, p1
    invoke-virtual/range { v0 .. v7 }, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V
  .line 120
    const/4 p0, 0
    const/4 p1, 0
  :L0
    array-length v0, p3
    if-ge p1, v0, :L4
  .line 121
    aget v0, p3, p1
  .line 122
    aget v1, p2, p1
  .line 123
    const/4 v2, 0
  :L1
    const/16 v3, 32
    if-ge v2, v3, :L3
  .line 124
    ushr-int v3, v0, v2
    and-int/lit16 v3, v3, 255
    ushr-int v4, v1, v2
    and-int/lit16 v4, v4, 255
    sub-int/2addr v3, v4
    invoke-static { v3 }, Ljava/lang/Math;->abs(I)I
    move-result v3
    const/16 v4, 12
    if-le v3, v4, :L2
    return p0
  :L2
  .line 123
    add-int/lit8 v2, v2, 8
    goto :L1
  :L3
  .line 120
    add-int/lit8 p1, p1, 1
    goto :L0
  :L4
  .line 127
    const/4 p0, 1
    return p0
.end method
