.class final Lcom/innioasis/ipp/Thumbs$Fit;
.super Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;
.source "Thumbs.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Thumbs;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Fit"
.end annotation

.field private final static ID:[B

.method static constructor <clinit>()V
  .registers 1
  .line 226
    const-string v0, "com.innioasis.ipp.Thumbs.Fit.1"
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Thumbs$Fit;->ID:[B
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 225
    invoke-direct { p0 }, Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;-><init>()V
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
  .registers 2
  .line 233
    instance-of p1, p1, Lcom/innioasis/ipp/Thumbs$Fit;
    return p1
.end method

.method public hashCode()I
  .registers 2
  .line 237
    const v0, 1793659
    return v0
.end method

.method protected transform(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
  .registers 5
  .line 229
    invoke-static { p1, p2, p3, p4 }, Lcom/innioasis/ipp/Thumbs;->fit(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object p1
    return-object p1
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
  .registers 3
  .line 241
    sget-object v0, Lcom/innioasis/ipp/Thumbs$Fit;->ID:[B
    invoke-virtual { p1, v0 }, Ljava/security/MessageDigest;->update([B)V
  .line 242
    return-void
.end method
