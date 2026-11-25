.class public final Lcom/innioasis/ipp/Thumbs;
.super Ljava/lang/Object;
.source "Thumbs.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Thumbs$Half;,
    Lcom/innioasis/ipp/Thumbs$Fit;,
    Lcom/innioasis/ipp/Thumbs$Clear;,
    Lcom/innioasis/ipp/Thumbs$Shrink;
  }
.end annotation

.field private final static FIT:Lcom/innioasis/ipp/Thumbs$Fit;

.field private final static HALF:Lcom/innioasis/ipp/Thumbs$Half;

.field private final static POOL:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;

.field final static QUALITY:I = 90

.field private final static SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;

.field private final static WHOLE:Lcom/innioasis/ipp/Thumbs$Half;

.field private final static WHOLE_MAX:I = 2000000

.method static constructor <clinit>()V
  .registers 2
  .line 44
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Shrink;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Thumbs$Shrink;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;
  .line 45
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Half;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Thumbs$Half;-><init>(Z)V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->HALF:Lcom/innioasis/ipp/Thumbs$Half;
  .line 46
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Half;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Thumbs$Half;-><init>(Z)V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->WHOLE:Lcom/innioasis/ipp/Thumbs$Half;
  .line 47
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Fit;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Thumbs$Fit;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->FIT:Lcom/innioasis/ipp/Thumbs$Fit;
  .line 146
    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;
    invoke-direct { v0 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->POOL:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
  .registers 4
  .line 283
    invoke-interface { p0, p1, p2, p3 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->get(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 284
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    if-ne p3, p1, :L0
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  :L0
  .line 285
    return-object p0
.end method

.method static fit(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 6
  .line 247
    int-to-float p2, p2
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
    int-to-float v0, v0
    div-float/2addr p2, v0
    int-to-float p3, p3
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
    int-to-float v0, v0
    div-float/2addr p3, v0
    invoke-static { p2, p3 }, Ljava/lang/Math;->min(FF)F
    move-result p2
  .line 248
    const/high16 p3, 0x3F800000
    cmpl-float p3, p2, p3
    if-ltz p3, :L0
    return-object p1
  :L0
  .line 249
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p3
    int-to-float p3, p3
    mul-float p3, p3, p2
    invoke-static { p3 }, Ljava/lang/Math;->round(F)I
    move-result p3
    const/4 v0, 1
    invoke-static { v0, p3 }, Ljava/lang/Math;->max(II)I
    move-result p3
  .line 250
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
    int-to-float v1, v1
    mul-float v1, v1, p2
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result p2
    invoke-static { v0, p2 }, Ljava/lang/Math;->max(II)I
    move-result p2
  .line 251
    invoke-static { p0, p1, p3, p2 }, Lcom/innioasis/ipp/Thumbs;->shrink(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static full(Ljava/lang/String;Landroid/app/Activity;)Landroid/graphics/Bitmap;
  .catchall { :L1 .. :L8 } :L9
  .registers 6
  .line 132
    const/4 v0, 0
    if-eqz p0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 133
    const v1, 2131362088
  :L1
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 134
    const/4 v2, 0
    if-nez v1, :L2
    const/4 v3, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Landroid/view/View;->getWidth()I
    move-result v3
  :L3
  .line 135
    if-nez v1, :L4
    goto :L5
  :L4
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v2
  :L5
  .line 136
    if-lez v3, :L6
    if-gtz v2, :L7
  :L6
  .line 137
    invoke-virtual { p1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 138
    invoke-virtual { p1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget v2, p1, Landroid/util/DisplayMetrics;->heightPixels:I
  :L7
  .line 140
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Thumbs;->read(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 141
    move-exception p0
  .line 142
    return-object v0
  :L10
  .line 132
    return-object v0
.end method

.method private static isJpeg(Ljava/lang/String;)Z
  .registers 2
  .line 179
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
  .line 180
    const-string v0, ".jpg"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, ".jpeg"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static left(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 151
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lcom/innioasis/ipp/Thumbs$Clear;
    invoke-virtual { p0 }, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
    move-result-object p0
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Thumbs$Clear;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 153
    goto :L3
  :L2
  .line 152
    move-exception p0
  :L3
  .line 154
    return-void
.end method

.method public static photo(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/Object;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 7
  .line 52
    if-eqz p0, :L8
    if-eqz p1, :L8
    if-nez p2, :L0
    goto :L8
  :L0
  .line 53
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 54
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p2
  .line 55
    if-eqz p2, :L1
    iget v1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-lez v1, :L1
    iget v1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
    goto :L2
  :L1
    const/high16 v1, 0x42C80000
    mul-float v1, v1, v0
    float-to-int v1, v1
  :L2
  .line 56
    if-eqz p2, :L3
    iget v2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v2, :L3
    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I
    goto :L4
  :L3
    const/high16 p2, 0x42960000
    mul-float v0, v0, p2
    float-to-int p2, v0
  :L4
  .line 57
    invoke-static { p0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object p0
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Thumbs;->tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
  .line 58
    invoke-virtual { p0, v1, p2 }, Lcom/bumptech/glide/RequestBuilder;->override(II)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 59
    check-cast p3, Lcom/bumptech/glide/request/target/Target;
    invoke-virtual { p0, p3 }, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;
  :L5
  .line 61
    goto :L7
  :L6
  .line 60
    move-exception p0
  :L7
  .line 62
    return-void
  :L8
  .line 52
    return-void
.end method

.method public static preset(Landroid/widget/ImageView;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 78
    if-nez p0, :L0
    return-void
  :L0
  .line 79
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object v0
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object v0
    const-string v1, ""
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Thumbs;->tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
  :L1
  .line 82
    goto :L3
  :L2
  .line 80
    move-exception v0
  .line 81
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L3
  .line 83
    return-void
.end method

.method public static read(Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .registers 12
  .line 108
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 109
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 110
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 111
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
  .line 112
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
  .line 113
    const/4 v3, 0
    if-lez v2, :L6
    if-gtz v0, :L0
    goto :L6
  :L0
  .line 114
    nop
  .line 115
    invoke-static { p0 }, Lcom/innioasis/ipp/Thumbs;->isJpeg(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
  :L1
  .line 116
    mul-int/lit8 v4, v1, 2
    div-int v5, v2, v4
    mul-int/lit8 v6, p1, 2
    if-lt v5, v6, :L3
    div-int v5, v0, v4
    mul-int/lit8 v6, p2, 2
    if-lt v5, v6, :L3
    move v1, v4
    goto :L1
  :L2
  .line 118
    div-int v4, v2, v1
    int-to-long v4, v4
    div-int v6, v0, v1
    int-to-long v6, v6
    mul-long v4, v4, v6
    const-wide/32 v6, 2000000
    cmp-long v8, v4, v6
    if-lez v8, :L3
    mul-int/lit8 v1, v1, 2
    goto :L2
  :L3
  .line 120
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 121
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 122
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 123
    if-nez p0, :L4
    return-object v3
  :L4
  .line 124
    sget-object v0, Lcom/innioasis/ipp/Thumbs;->POOL:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;
    invoke-static { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Thumbs;->fit(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 125
    if-eq p1, p0, :L5
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->recycle()V
  :L5
  .line 126
    return-object p1
  :L6
  .line 113
    return-object v3
.end method

.method static shrink(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 14
  .line 256
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 257
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 258
    if-ne v0, p2, :L0
    if-ne v1, p3, :L0
    return-object p1
  :L0
  .line 259
    int-to-float v2, p2
    int-to-float v3, v0
    div-float v3, v2, v3
    int-to-float v4, p3
    int-to-float v5, v1
    div-float v5, v4, v5
    invoke-static { v3, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v3
  .line 260
    div-float/2addr v2, v3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
    invoke-static { v0, v2 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 261
    div-float/2addr v4, v3
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v3
    invoke-static { v1, v3 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 262
    new-instance v4, Landroid/graphics/Rect;
    sub-int/2addr v0, v2
    div-int/lit8 v0, v0, 2
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
    add-int/2addr v2, v0
    add-int/2addr v3, v1
    invoke-direct { v4, v0, v1, v2, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 263
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;
    move-result-object v0
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    if-ne v0, v1, :L1
  .line 264
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    goto :L2
  :L1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
  :L2
  .line 265
    new-instance v1, Landroid/graphics/Paint;
    const/4 v2, 6
    invoke-direct { v1, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 266
    move-object v2, p1
  :L3
  .line 267
    invoke-virtual { v4 }, Landroid/graphics/Rect;->width()I
    move-result v3
    mul-int/lit8 v5, p2, 2
    const/4 v6, 0
    if-lt v3, v5, :L5
    invoke-virtual { v4 }, Landroid/graphics/Rect;->height()I
    move-result v3
    mul-int/lit8 v5, p3, 2
    if-lt v3, v5, :L5
  .line 268
    invoke-virtual { v4 }, Landroid/graphics/Rect;->width()I
    move-result v3
    div-int/lit8 v3, v3, 2
  .line 269
    invoke-virtual { v4 }, Landroid/graphics/Rect;->height()I
    move-result v5
    div-int/lit8 v5, v5, 2
  .line 270
    invoke-static { p0, v3, v5, v0 }, Lcom/innioasis/ipp/Thumbs;->blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 271
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v7 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v9, Landroid/graphics/Rect;
    invoke-direct { v9, v6, v6, v3, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v8, v2, v4, v9, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 272
    if-eq v2, p1, :L4
    invoke-interface { p0, v2 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V
  :L4
  .line 273
    nop
  .line 274
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct { v4, v6, v6, v3, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 275
    move-object v2, v7
    goto :L3
  :L5
  .line 276
    invoke-static { p0, p2, p3, v0 }, Lcom/innioasis/ipp/Thumbs;->blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 277
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v5, Landroid/graphics/Rect;
    invoke-direct { v5, v6, v6, p2, p3 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v3, v2, v4, v5, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 278
    if-eq v2, p1, :L6
    invoke-interface { p0, v2 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V
  :L6
  .line 279
    return-object v0
.end method

.method public static theme(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 88
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/Thumbs;->themeBox(Landroid/content/Context;)[I
    move-result-object v0
  .line 90
    invoke-static { p0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object p0
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v1 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
  .line 91
    invoke-static { p1 }, Lcom/innioasis/ipp/Thumbs;->isJpeg(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->HALF:Lcom/innioasis/ipp/Thumbs$Half;
    goto :L2
  :L1
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->WHOLE:Lcom/innioasis/ipp/Thumbs$Half;
  :L2
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->downsample(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 92
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->FIT:Lcom/innioasis/ipp/Thumbs$Fit;
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->transform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 93
    const/16 p1, 90
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->encodeQuality(I)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 94
    const/4 p1, 0
    aget p1, v0, p1
    const/4 v1, 1
    aget v0, v0, v1
    invoke-virtual { p0, p1, v0 }, Lcom/bumptech/glide/RequestBuilder;->override(II)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 95
    check-cast p2, Lcom/bumptech/glide/request/target/Target;
    invoke-virtual { p0, p2 }, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;
  :L3
  .line 97
    goto :L5
  :L4
  .line 96
    move-exception p0
  :L5
  .line 98
    return-void
  :L6
  .line 88
    return-void
.end method

.method public static themeBox(Landroid/content/Context;)[I
  .registers 3
  .line 102
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F
  .line 103
    const/high16 v0, 0x42C80000
    mul-float v0, v0, p0
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    const/high16 v1, 0x42960000
    mul-float p0, p0, v1
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
    filled-new-array { v0, p0 }, [I
    move-result-object p0
    return-object p0
.end method

.method private static tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
  .registers 3
  .line 172
    sget-object v0, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestBuilder;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 173
    invoke-static { p1 }, Lcom/innioasis/ipp/Thumbs;->isJpeg(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L0
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->HALF:Lcom/innioasis/ipp/Thumbs$Half;
    goto :L1
  :L0
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->WHOLE:Lcom/innioasis/ipp/Thumbs$Half;
  :L1
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->downsample(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 174
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->transform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 175
    const/16 p1, 90
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->encodeQuality(I)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
    return-object p0
.end method

.method public static wallpaper(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 67
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-nez p2, :L0
    goto :L4
  :L0
  .line 68
    invoke-static { p0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object p0
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Thumbs;->tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
  .line 69
    sget-object p1, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->RESOURCE:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->diskCacheStrategy(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 70
    invoke-virtual { p0, p2 }, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
  :L1
  .line 72
    goto :L3
  :L2
  .line 71
    move-exception p0
  :L3
  .line 73
    return-void
  :L4
  .line 67
    return-void
.end method
