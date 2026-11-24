.class public final Lcom/innioasis/ipp/Thumbs;
.super Ljava/lang/Object;
.source "Thumbs.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Thumbs$Clear;,
    Lcom/innioasis/ipp/Thumbs$Half;,
    Lcom/innioasis/ipp/Thumbs$Shrink;
  }
.end annotation

.field private final static HALF:Lcom/innioasis/ipp/Thumbs$Half;

.field final static QUALITY:I = 90

.field private final static SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;

.field private final static WHOLE:Lcom/innioasis/ipp/Thumbs$Half;

.field private final static WHOLE_MAX:I = 2000000

.method static constructor <clinit>()V
  .registers 2
  .line 41
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Shrink;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Thumbs$Shrink;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;
  .line 42
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Half;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Thumbs$Half;-><init>(Z)V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->HALF:Lcom/innioasis/ipp/Thumbs$Half;
  .line 43
    new-instance v0, Lcom/innioasis/ipp/Thumbs$Half;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Thumbs$Half;-><init>(Z)V
    sput-object v0, Lcom/innioasis/ipp/Thumbs;->WHOLE:Lcom/innioasis/ipp/Thumbs$Half;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 34
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
  .registers 4
  .line 187
    invoke-interface { p0, p1, p2, p3 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->get(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 188
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    if-ne p3, p1, :L0
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  :L0
  .line 189
    return-object p0
.end method

.method private static isJpeg(Ljava/lang/String;)Z
  .registers 2
  .line 112
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
  .line 113
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
  .line 84
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
  .line 86
    goto :L3
  :L2
  .line 85
    move-exception p0
  :L3
  .line 87
    return-void
.end method

.method public static photo(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/Object;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 7
  .line 48
    if-eqz p0, :L8
    if-eqz p1, :L8
    if-nez p2, :L0
    goto :L8
  :L0
  .line 49
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 50
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p2
  .line 51
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
  .line 52
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
  .line 53
    invoke-static { p0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object p0
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Thumbs;->tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
  .line 54
    invoke-virtual { p0, v1, p2 }, Lcom/bumptech/glide/RequestBuilder;->override(II)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 55
    check-cast p3, Lcom/bumptech/glide/request/target/Target;
    invoke-virtual { p0, p3 }, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;
  :L5
  .line 57
    goto :L7
  :L6
  .line 56
    move-exception p0
  :L7
  .line 58
    return-void
  :L8
  .line 48
    return-void
.end method

.method public static preset(Landroid/widget/ImageView;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 74
    if-nez p0, :L0
    return-void
  :L0
  .line 75
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
  .line 78
    goto :L3
  :L2
  .line 76
    move-exception v0
  .line 77
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L3
  .line 79
    return-void
.end method

.method static shrink(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 14
  .line 160
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 161
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 162
    if-ne v0, p2, :L0
    if-ne v1, p3, :L0
    return-object p1
  :L0
  .line 163
    int-to-float v2, p2
    int-to-float v3, v0
    div-float v3, v2, v3
    int-to-float v4, p3
    int-to-float v5, v1
    div-float v5, v4, v5
    invoke-static { v3, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v3
  .line 164
    div-float/2addr v2, v3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
    invoke-static { v0, v2 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 165
    div-float/2addr v4, v3
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v3
    invoke-static { v1, v3 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 166
    new-instance v4, Landroid/graphics/Rect;
    sub-int/2addr v0, v2
    div-int/lit8 v0, v0, 2
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
    add-int/2addr v2, v0
    add-int/2addr v3, v1
    invoke-direct { v4, v0, v1, v2, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 167
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;
    move-result-object v0
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    if-ne v0, v1, :L1
  .line 168
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    goto :L2
  :L1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
  :L2
  .line 169
    new-instance v1, Landroid/graphics/Paint;
    const/4 v2, 6
    invoke-direct { v1, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 170
    move-object v2, p1
  :L3
  .line 171
    invoke-virtual { v4 }, Landroid/graphics/Rect;->width()I
    move-result v3
    mul-int/lit8 v5, p2, 2
    const/4 v6, 0
    if-lt v3, v5, :L5
    invoke-virtual { v4 }, Landroid/graphics/Rect;->height()I
    move-result v3
    mul-int/lit8 v5, p3, 2
    if-lt v3, v5, :L5
  .line 172
    invoke-virtual { v4 }, Landroid/graphics/Rect;->width()I
    move-result v3
    div-int/lit8 v3, v3, 2
  .line 173
    invoke-virtual { v4 }, Landroid/graphics/Rect;->height()I
    move-result v5
    div-int/lit8 v5, v5, 2
  .line 174
    invoke-static { p0, v3, v5, v0 }, Lcom/innioasis/ipp/Thumbs;->blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 175
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v7 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v9, Landroid/graphics/Rect;
    invoke-direct { v9, v6, v6, v3, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v8, v2, v4, v9, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 176
    if-eq v2, p1, :L4
    invoke-interface { p0, v2 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V
  :L4
  .line 177
    nop
  .line 178
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct { v4, v6, v6, v3, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 179
    move-object v2, v7
    goto :L3
  :L5
  .line 180
    invoke-static { p0, p2, p3, v0 }, Lcom/innioasis/ipp/Thumbs;->blank(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 181
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v5, Landroid/graphics/Rect;
    invoke-direct { v5, v6, v6, p2, p3 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v3, v2, v4, v5, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 182
    if-eq v2, p1, :L6
    invoke-interface { p0, v2 }, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V
  :L6
  .line 183
    return-object v0
.end method

.method private static tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
  .registers 3
  .line 105
    sget-object v0, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestBuilder;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 106
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
  .line 107
    sget-object p1, Lcom/innioasis/ipp/Thumbs;->SHRINK:Lcom/innioasis/ipp/Thumbs$Shrink;
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->transform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 108
    const/16 p1, 90
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->encodeQuality(I)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
    return-object p0
.end method

.method public static wallpaper(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 63
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-nez p2, :L0
    goto :L4
  :L0
  .line 64
    invoke-static { p0 }, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    move-result-object p0
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0 }, Lcom/bumptech/glide/RequestManager;->load(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Thumbs;->tile(Lcom/bumptech/glide/RequestBuilder;Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    move-result-object p0
  .line 65
    sget-object p1, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->RESOURCE:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    invoke-virtual { p0, p1 }, Lcom/bumptech/glide/RequestBuilder;->diskCacheStrategy(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/BaseRequestOptions;
    move-result-object p0
    check-cast p0, Lcom/bumptech/glide/RequestBuilder;
  .line 66
    invoke-virtual { p0, p2 }, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
  :L1
  .line 68
    goto :L3
  :L2
  .line 67
    move-exception p0
  :L3
  .line 69
    return-void
  :L4
  .line 63
    return-void
.end method
