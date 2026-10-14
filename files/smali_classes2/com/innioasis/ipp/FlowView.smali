.class public final Lcom/innioasis/ipp/FlowView;
.super Landroid/view/View;
.source "FlowView.java"

.field private final static ANCHOR:I = 142

.field private final static ANGLE:F = 0.0F

.field private final static ARTIST_ALPHA:I = 176

.field private final static BASE:I = 202

.field public final static FADE_MS:I = 200

.field private final static RATE:F = 8.0F

.field private final static SIDE:I = 6

.field private final static SPACING:F = 40.0F

.field private final static VMAX:F = 30.0F

.field private final static VMIN:F = 2.5F

.field private final artist:Landroid/text/TextPaint;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private final dst:[F

.field private final erase:Landroid/graphics/Paint;

.field private fading:Z

.field private h:I

.field private hidden:I

.field private items:Ljava/util/List;

.field private labels:F

.field private last:J

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private final m:Landroid/graphics/Matrix;

.field private final name:Landroid/text/TextPaint;

.field private final offX:F

.field private final offY:F

.field private onRest:Ljava/lang/Runnable;

.field private pos:F

.field private sAlpha:I

.field private sAngle:F

.field private sCx:F

.field private sCy:F

.field private shadow:I

.field private spread:F

.field private final src:[F

.field private target:I

.field private w:I

.field private wasMoving:Z

.method static constructor <clinit>()V
  .registers 2
  .line 32
    const-wide v0, 4634626229029306368L
    invoke-static { v0, v1 }, Ljava/lang/Math;->toRadians(D)D
    move-result-wide v0
    double-to-float v0, v0
    sput v0, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
  .registers 12
  .line 76
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 57
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 62
    new-instance v0, Landroid/graphics/Matrix;
    invoke-direct { v0 }, Landroid/graphics/Matrix;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
  .line 63
    const/16 v0, 8
    new-array v1, v0, [F
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->src:[F
  .line 64
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
  .line 65
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
  .line 66
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
  .line 68
    new-instance v2, Landroid/text/TextPaint;
    const/4 v3, 1
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
  .line 69
    new-instance v4, Landroid/text/TextPaint;
    invoke-direct { v4, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
  .line 169
    const/high16 v5, 0x3F800000
    iput v5, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 77
    sget v6, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    float-to-double v7, v6
    invoke-static { v7, v8 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v7
    double-to-float v7, v7
    sub-float v7, v5, v7
    const/high16 v8, 0x42B40000
    mul-float v7, v7, v8
    const/high16 v9, 0x43340000
    add-float/2addr v7, v9
    iput v7, p0, Lcom/innioasis/ipp/FlowView;->offX:F
  .line 78
    float-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v6
    double-to-float v6, v6
    mul-float v6, v6, v8
    const/high16 v7, 0x42340000
    add-float/2addr v6, v7
    iput v6, p0, Lcom/innioasis/ipp/FlowView;->offY:F
  .line 80
    const/4 v6, 0
    invoke-virtual { p0, v1, v6 }, Lcom/innioasis/ipp/FlowView;->setLayerType(ILandroid/graphics/Paint;)V
  .line 81
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v6 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 82
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->textColor(Landroid/content/Context;)I
    move-result p1
  .line 83
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->lum(I)I
    move-result v0
    const/16 v1, 128
    if-le v0, v1, :L0
    const/high16 v0, 0xC0000000
    goto :L1
  :L0
    const v0, -2130706433
  :L1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
  .line 84
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 85
    const/high16 v0, 0x41A00000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 86
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v0, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 87
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 88
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 89
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    const/high16 v1, 0x40000000
    const/4 v3, 0
    invoke-virtual { v2, v1, v3, v5, v0 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 90
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 91
    const/high16 p1, 0x41880000
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 92
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 93
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 94
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-virtual { v4, v1, v3, v5, p1 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 95
    return-void
.end method

.method private advance()Z
  .registers 8
  .line 186
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 187
    iget-wide v2, p0, Lcom/innioasis/ipp/FlowView;->last:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-nez v6, :L0
    const v2, 1015222895
    goto :L1
  :L0
    sub-long v2, v0, v2
    long-to-float v2, v2
    const/high16 v3, 0x447A0000
    div-float/2addr v2, v3
    const v3, 1036831949
    invoke-static { v3, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  :L1
  .line 188
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 189
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float/2addr v0, v1
  .line 190
    const/4 v1, 0
    const/4 v3, 0
    cmpl-float v4, v0, v3
    if-nez v4, :L2
    return v1
  :L2
  .line 191
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v4
    const/high16 v5, 0x41000000
    mul-float v4, v4, v5
    const/high16 v5, 0x41F00000
    invoke-static { v5, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    const/high16 v5, 0x40200000
    invoke-static { v5, v4 }, Ljava/lang/Math;->max(FF)F
    move-result v4
  .line 192
    mul-float v4, v4, v2
  .line 193
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpl-float v2, v4, v2
    if-ltz v2, :L3
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    goto :L6
  :L3
  .line 194
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpl-float v0, v0, v3
    if-lez v0, :L4
    goto :L5
  :L4
    neg-float v4, v4
  :L5
    add-float/2addr v2, v4
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  :L6
  .line 195
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v2, v2
    cmpl-float v0, v0, v2
    if-eqz v0, :L7
    const/4 v1, 1
  :L7
    return v1
.end method

.method private corner(IFFFF)V
  .registers 9
  .line 289
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
    mul-float p4, p4, p2
    add-float/2addr v0, p4
  .line 290
    iget p4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v1, p4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    add-float/2addr v1, v2
    mul-float p2, p2, p5
    add-float/2addr v1, p2
  .line 291
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    iget p5, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float p5, p5
    const/high16 v2, 0x40000000
    div-float/2addr p5, v2
    int-to-float v2, p4
    mul-float v2, v2, v0
    div-float/2addr v2, v1
    add-float/2addr p5, v2
    aput p5, p2, p1
  .line 292
    add-int/lit8 p1, p1, 1
    const/high16 p5, 0x430E0000
    sub-float/2addr p3, p5
    int-to-float p4, p4
    mul-float p3, p3, p4
    div-float/2addr p3, v1
    add-float/2addr p3, p5
    aput p3, p2, p1
  .line 293
    return-void
.end method

.method private static faded(II)I
  .registers 3
  .line 109
    ushr-int/lit8 v0, p0, 24
    mul-int v0, v0, p1
    div-int/lit16 v0, v0, 255
    shl-int/lit8 p1, v0, 24
    const v0, 16777215
    and-int/2addr p0, v0
    or-int/2addr p0, p1
    return p0
.end method

.method private static lum(I)I
  .registers 3
  .line 113
    shr-int/lit8 v0, p0, 16
    and-int/lit16 v0, v0, 255
    mul-int/lit16 v0, v0, 299
    shr-int/lit8 v1, p0, 8
    and-int/lit16 v1, v1, 255
    mul-int/lit16 v1, v1, 587
    add-int/2addr v0, v1
    and-int/lit16 p0, p0, 255
    mul-int/lit8 p0, p0, 114
    add-int/2addr v0, p0
    div-int/lit16 v0, v0, 1000
    return v0
.end method

.method private place(F)V
  .registers 8
  .line 232
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result v0
  .line 233
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float p1, p1, v2
    if-gez p1, :L0
    const/high16 p1, 0xBF800000
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 234
    cmpg-float v3, v0, v1
    if-gtz v3, :L2
  .line 235
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    mul-float v3, v3, v0
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 236
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    mul-float p1, p1, v3
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 237
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    goto :L3
  :L2
  .line 239
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 240
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    const/high16 v4, 0x42200000
    sub-float v5, v0, v1
    mul-float v5, v5, v4
    add-float/2addr v3, v5
    mul-float p1, p1, v3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 241
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
  :L3
  .line 243
    const/high16 p1, 0x40C00000
    sub-float/2addr p1, v0
    const/high16 v0, 0x40000000
    div-float/2addr p1, v0
  .line 244
    cmpl-float v0, p1, v1
    if-ltz v0, :L4
    const/16 p1, 255
    goto :L6
  :L4
    cmpg-float v0, p1, v2
    if-gtz v0, :L5
    const/4 p1, 0
    goto :L6
  :L5
    const/high16 v0, 0x437F0000
    mul-float p1, p1, v0
    float-to-int p1, p1
  :L6
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
  .line 245
    return-void
.end method

.method private slide(Landroid/graphics/Canvas;II)V
  .registers 22
  .line 248
    move-object/from16 v6, p0
    move-object/from16 v7, p1
    move/from16 v0, p2
    if-ltz v0, :L11
    move/from16 v1, p3
    if-ge v0, v1, :L11
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->hidden:I
    if-ne v0, v1, :L0
    goto/16 :L11
  :L0
  .line 249
    int-to-float v8, v0
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v1, v8, v1
    invoke-direct { v6, v1 }, Lcom/innioasis/ipp/FlowView;->place(F)V
  .line 250
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    if-gtz v1, :L1
    return-void
  :L1
  .line 251
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 252
    if-nez v9, :L2
    return-void
  :L2
  .line 253
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->sAlpha:I
  .line 254
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Flow$Loader;->age(I)J
    move-result-wide v2
  .line 255
    const/4 v10, 1
    const-wide/16 v4, 200
    cmp-long v0, v2, v4
    if-gez v0, :L4
  .line 256
    int-to-long v0, v1
    const-wide/16 v11, 0
    cmp-long v13, v2, v11
    if-gez v13, :L3
    move-wide v2, v11
  :L3
    mul-long v0, v0, v2
    div-long/2addr v0, v4
    long-to-int v1, v0
  .line 257
    iput-boolean v10, v6, Lcom/innioasis/ipp/FlowView;->fading:Z
    move v11, v1
    goto :L5
  :L4
  .line 255
    move v11, v1
  :L5
  .line 259
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v0
    double-to-float v12, v0
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v0
    double-to-float v13, v0
  .line 260
    nop
  .line 261
    const/high16 v14, 0x41A00000
  .line 262
    const/high16 v15, 0x43920000
  .line 263
    const/4 v1, 0
    const/high16 v16, 0xC2B80000
    const/high16 v3, 0x41A00000
    move-object/from16 v0, p0
    move/from16 v2, v16
    move v4, v12
    move v5, v13
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 264
    const/4 v1, 2
    const/high16 v2, 0x42B80000
    move v3, v14
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 265
    const/4 v1, 4
    const/high16 v3, 0x43920000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 266
    const/4 v1, 6
    move/from16 v2, v16
    move v3, v15
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 267
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->spread:F
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v3, v0, v2
    if-lez v3, :L8
  .line 268
    iget v3, v6, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpg-float v3, v8, v3
    if-gez v3, :L6
    neg-float v0, v0
  :L6
    iget v3, v6, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v3, v3
    mul-float v0, v0, v3
  .line 269
    const/4 v3, 0
  :L7
    const/16 v4, 8
    if-ge v3, v4, :L8
    iget-object v4, v6, Lcom/innioasis/ipp/FlowView;->dst:[F
    aget v5, v4, v3
    add-float/2addr v5, v0
    aput v5, v4, v3
    add-int/lit8 v3, v3, 2
    goto :L7
  :L8
  .line 271
    invoke-virtual { v9 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
    invoke-virtual { v9 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 272
    iget-object v13, v6, Lcom/innioasis/ipp/FlowView;->src:[F
    aput v2, v13, v1
    aput v2, v13, v10
  .line 273
    int-to-float v0, v0
    const/4 v1, 2
    aput v0, v13, v1
    const/4 v1, 3
    aput v2, v13, v1
  .line 274
    const/4 v1, 4
    aput v0, v13, v1
    int-to-float v0, v3
    const/4 v1, 5
    aput v0, v13, v1
  .line 275
    const/4 v1, 6
    aput v2, v13, v1
    const/4 v1, 7
    aput v0, v13, v1
  .line 276
    iget-object v12, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    const/4 v14, 0
    iget-object v15, v6, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/16 v16, 0
    const/16 v17, 4
    invoke-virtual/range { v12 .. v17 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result v0
    if-nez v0, :L9
    return-void
  :L9
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mask()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 279
    if-eqz v0, :L10
  .line 280
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v1, v11 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 281
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v7, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  :L10
  .line 283
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v0, v11 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 284
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v7, v9, v0, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  .line 285
    return-void
  :L11
  .line 248
    return-void
.end method

.method private static textColor(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 100
    const/4 v0, -1
  :L0
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 101
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v2, 0
    invoke-virtual { p0, v1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 102
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L1
    return p0
  :L2
  .line 103
    move-exception p0
  .line 104
    return v0
.end method

.method public count()I
  .registers 2
  .line 136
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  :L1
    return v0
.end method

.method public coverLeft()I
  .registers 2
  .line 155
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    div-int/lit8 v0, v0, 2
    add-int/lit8 v0, v0, -90
    return v0
.end method

.method public coverTop()I
  .registers 2
  .line 157
    const/16 v0, 22
    return v0
.end method

.method public getLabels()F
  .registers 2
  .line 177
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->labels:F
    return v0
.end method

.method public getSpread()F
  .registers 2
  .line 167
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    return v0
.end method

.method public hide(I)V
  .registers 2
  .line 150
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 151
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 152
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 11
  .line 200
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->advance()Z
    move-result v0
  .line 201
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
  .line 202
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result v2
  .line 203
    if-lez v2, :L3
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v3, :L3
  .line 204
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 206
    const/4 v4, 7
  :L0
    if-ltz v4, :L2
  .line 207
    sub-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  .line 208
    if-eqz v4, :L1
    add-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  :L1
  .line 206
    add-int/lit8 v4, v4, -1
    goto :L0
  :L2
  .line 210
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    add-int/lit8 v2, v2, -1
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-interface { v4, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 211
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
  .line 212
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    mul-float v4, v4, v3
    const/high16 v5, 0x3F800000
    invoke-static { v5, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    sub-float v4, v5, v4
    const/high16 v6, 0x437F0000
    mul-float v4, v4, v6
    iget v6, p0, Lcom/innioasis/ipp/FlowView;->labels:F
    mul-float v4, v4, v6
    float-to-int v4, v4
  .line 213
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { v6, v4 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 214
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    mul-int/lit16 v7, v4, 176
    div-int/lit16 v7, v7, 255
    invoke-virtual { v6, v7 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 215
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v7
    const/4 v8, 0
    invoke-virtual { v6, v3, v8, v5, v7 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 216
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v4
    invoke-virtual { v6, v3, v8, v5, v4 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 217
    iget-object v3, v1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v5, p0, Lcom/innioasis/ipp/FlowView;->w:I
    add-int/lit8 v5, v5, -24
    int-to-float v5, v5
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v3, v4, v5, v6 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    add-int/lit8 v4, v4, -40
    int-to-float v4, v4
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { p1, v3, v2, v4, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 219
    iget-object v1, v1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->w:I
    add-int/lit8 v4, v4, -24
    int-to-float v4, v4
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v3, v4, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->h:I
    add-int/lit8 v3, v3, -14
    int-to-float v3, v3
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    invoke-virtual { p1, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L3
  .line 222
    if-nez v0, :L4
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
    if-eqz p1, :L5
  :L4
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  :L5
  .line 223
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
    if-eqz p1, :L6
    if-nez v0, :L6
    iget-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    if-eqz p1, :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/FlowView;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 224
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
  .line 225
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 5
  .line 181
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->w:I
  .line 182
    iput p2, p0, Lcom/innioasis/ipp/FlowView;->h:I
  .line 183
    return-void
.end method

.method public resting()Z
  .registers 3
  .line 128
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v1, v1
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .registers 4
  .line 117
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
  .line 118
    iput-object p2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 119
    iput p3, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 120
    int-to-float p1, p3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  .line 121
    invoke-virtual { p2, p3 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 122
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 123
    return-void
.end method

.method public setLabels(F)V
  .registers 2
  .line 173
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 174
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 175
    return-void
.end method

.method public setOnRest(Ljava/lang/Runnable;)V
  .registers 2
  .line 134
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    return-void
.end method

.method public setSpread(F)V
  .registers 2
  .line 163
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->spread:F
  .line 164
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 165
    return-void
.end method

.method public step(I)V
  .registers 4
  .line 139
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L2
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 140
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    add-int/2addr v1, p1
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 141
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v0, :L1
    return-void
  :L1
  .line 142
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 143
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 144
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 145
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 146
    return-void
  :L2
  .line 139
    return-void
.end method

.method public target()I
  .registers 2
  .line 125
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    return v0
.end method
