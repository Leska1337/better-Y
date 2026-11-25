.class final Lcom/innioasis/ipp/Thumbs$Half;
.super Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
.source "Thumbs.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Thumbs;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Half"
.end annotation

.field private final whole:Z

.method constructor <init>(Z)V
  .registers 2
  .line 190
    invoke-direct { p0 }, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;-><init>()V
  .line 191
    iput-boolean p1, p0, Lcom/innioasis/ipp/Thumbs$Half;->whole:Z
  .line 192
    return-void
.end method

.method public getSampleSizeRounding(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;
  .registers 5
  .line 201
    sget-object p1, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;->QUALITY:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;
    return-object p1
.end method

.method public getScaleFactor(IIII)F
  .registers 11
  .line 195
    iget-boolean v0, p0, Lcom/innioasis/ipp/Thumbs$Half;->whole:Z
    const/high16 v1, 0x3F800000
    if-eqz v0, :L0
    int-to-long v2, p1
    int-to-long v4, p2
    mul-long v2, v2, v4
    const-wide/32 v4, 2000000
    cmp-long v0, v2, v4
    if-gtz v0, :L0
    return v1
  :L0
  .line 196
    int-to-float p3, p3
    int-to-float p1, p1
    div-float/2addr p3, p1
    int-to-float p1, p4
    int-to-float p2, p2
    div-float/2addr p1, p2
    invoke-static { p3, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    const/high16 p2, 0x40000000
    mul-float p1, p1, p2
  .line 197
    invoke-static { v1, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    return p1
.end method
