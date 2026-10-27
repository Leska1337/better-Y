.class public final Lcom/innioasis/ipp/FlowView;
.super Landroid/view/View;
.source "FlowView.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/FlowView$Card;
  }
.end annotation

.field private final static ANCHOR:I = 142

.field private final static ANGLES:[F

.field private final static ARTIST_ALPHA:I = 176

.field private final static BASE:I = 202

.field private final static EDGE_OUT:F = 2.0F

.field public final static FADE_MS:I = 200

.field private final static FAR:I = 10

.field private final static HURRY_RATE:F = 14.0F

.field private final static HURRY_VMIN:F = 6.0F

.field private final static RATE:F = 8.0F

.field private final static SIDE:I = 6

.field private final static STEPS:[F

.field private final static VMAX:F = 30.0F

.field private final static VMIN:F = 2.5F

.field private angle:F

.field private final artist:Landroid/text/TextPaint;

.field private artistLine:Ljava/lang/String;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private final dst:[F

.field private final erase:Landroid/graphics/Paint;

.field private final fade:Landroid/graphics/Paint;

.field private fading:Z

.field private h:I

.field private hidden:I

.field private hurry:Z

.field private items:Ljava/util/List;

.field private labels:F

.field private last:J

.field private lineArtist:Ljava/lang/String;

.field private lineOf:Lcom/innioasis/ipp/Flow$Item;

.field private lineYear:Ljava/lang/String;

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private final m:Landroid/graphics/Matrix;

.field private final name:Landroid/text/TextPaint;

.field private nameLine:Ljava/lang/String;

.field private offX:F

.field private offY:F

.field private onRest:Ljava/lang/Runnable;

.field private pos:F

.field private final reflFrom:Landroid/graphics/Rect;

.field private final reflTo:Landroid/graphics/RectF;

.field private sAlpha:I

.field private sAngle:F

.field private sCx:F

.field private sCy:F

.field private final seamFrom:Landroid/graphics/Rect;

.field private final seamTo:Landroid/graphics/RectF;

.field private shadow:I

.field private side:I

.field private final slideFrom:Landroid/graphics/Rect;

.field private final slideTo:Landroid/graphics/RectF;

.field private spacing:F

.field private spread:F

.field private final src:[F

.field private target:I

.field private w:I

.field private wasMoving:Z

.field private yearAt:I

.method static constructor <clinit>()V
  .registers 2
  .line 37
    const/4 v0, 3
    new-array v1, v0, [F
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/FlowView;->ANGLES:[F
  .line 38
    new-array v0, v0, [F
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/FlowView;->STEPS:[F
    return-void
  :L0
  .array-data 4
      1116471296
      1117126656
      1117782016
  .end array-data
  :L1
  .array-data 4
      1109393408
      1115684864
      1109393408
  .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
  .registers 13
  .line 93
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 74
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 79
    new-instance v0, Landroid/graphics/Matrix;
    invoke-direct { v0 }, Landroid/graphics/Matrix;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
  .line 80
    const/16 v0, 8
    new-array v1, v0, [F
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->src:[F
  .line 81
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
  .line 82
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
  .line 83
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
  .line 85
    new-instance v2, Landroid/text/TextPaint;
    const/4 v3, 1
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
  .line 86
    new-instance v4, Landroid/text/TextPaint;
    invoke-direct { v4, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
  .line 236
    const/high16 v5, 0x3F800000
    iput v5, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 405
    new-instance v6, Landroid/graphics/Rect;
    const/4 v7, 0
    const/16 v8, 184
    invoke-direct { v6, v7, v7, v8, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->slideFrom:Landroid/graphics/Rect;
  .line 406
    new-instance v9, Landroid/graphics/RectF;
    invoke-direct { v9, v6 }, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V
    iput-object v9, p0, Lcom/innioasis/ipp/FlowView;->slideTo:Landroid/graphics/RectF;
  .line 407
    sget-object v6, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
  .line 408
    new-instance v6, Landroid/graphics/Rect;
    const/16 v9, 180
    const/16 v10, 182
    invoke-direct { v6, v7, v9, v8, v10 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->seamFrom:Landroid/graphics/Rect;
  .line 409
    new-instance v7, Landroid/graphics/RectF;
    invoke-direct { v7, v6 }, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V
    iput-object v7, p0, Lcom/innioasis/ipp/FlowView;->seamTo:Landroid/graphics/RectF;
  .line 410
    new-instance v6, Landroid/graphics/RectF;
    const/high16 v7, 0x43380000
    const/high16 v8, 0x43360000
    const/4 v9, 0
    const/high16 v10, 0x42B80000
    invoke-direct { v6, v9, v10, v7, v8 }, Landroid/graphics/RectF;-><init>(FFFF)V
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
  .line 411
    invoke-static { }, Lcom/innioasis/ipp/FlowView;->fadePaint()Landroid/graphics/Paint;
    move-result-object v6
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->fade:Landroid/graphics/Paint;
  .line 94
    invoke-static { p1 }, Lcom/innioasis/ipp/Flow;->count(Landroid/content/Context;)I
    move-result v6
    invoke-virtual { p0, v6 }, Lcom/innioasis/ipp/FlowView;->setCount(I)V
  .line 96
    const/4 v6, 0
    invoke-virtual { p0, v1, v6 }, Lcom/innioasis/ipp/FlowView;->setLayerType(ILandroid/graphics/Paint;)V
  .line 97
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v6 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 98
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->textColor(Landroid/content/Context;)I
    move-result p1
  .line 99
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
  .line 100
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 101
    const/high16 v0, 0x41B00000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 102
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v0, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 103
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 104
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 105
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    const/high16 v1, 0x40000000
    invoke-virtual { v2, v1, v9, v5, v0 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 106
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 107
    const/high16 p1, 0x41980000
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 108
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 109
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 110
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-virtual { v4, v1, v9, v5, p1 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 111
    return-void
.end method

.method static synthetic access$000()Landroid/graphics/Paint;
  .registers 1
  .line 33
    invoke-static { }, Lcom/innioasis/ipp/FlowView;->fadePaint()Landroid/graphics/Paint;
    move-result-object v0
    return-object v0
.end method

.method private advance()Z
  .registers 8
  .line 254
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 255
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
  .line 256
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 257
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float/2addr v0, v1
  .line 258
    const/4 v1, 0
    const/4 v3, 0
    cmpl-float v4, v0, v1
    if-nez v4, :L2
    return v3
  :L2
  .line 259
    iget-boolean v4, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
    if-eqz v4, :L3
    const/high16 v4, 0x40C00000
    goto :L4
  :L3
    const/high16 v4, 0x40200000
  :L4
  .line 260
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v5
    iget-boolean v6, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
    if-eqz v6, :L5
    const/high16 v6, 0x41600000
    goto :L6
  :L5
    const/high16 v6, 0x41000000
  :L6
    mul-float v5, v5, v6
    const/high16 v6, 0x41F00000
    invoke-static { v6, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
  .line 259
    invoke-static { v4, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v4
  .line 261
    mul-float v4, v4, v2
  .line 262
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpl-float v2, v4, v2
    if-ltz v2, :L7
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    goto :L10
  :L7
  .line 263
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpl-float v0, v0, v1
    if-lez v0, :L8
    goto :L9
  :L8
    neg-float v4, v4
  :L9
    add-float/2addr v2, v4
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  :L10
  .line 264
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v2, v1
    cmpl-float v2, v0, v2
    if-nez v2, :L11
    iput-boolean v3, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  :L11
  .line 265
    int-to-float v1, v1
    cmpl-float v0, v0, v1
    if-eqz v0, :L12
    const/4 v3, 1
  :L12
    return v3
.end method

.method private corner(IFFFF)V
  .registers 9
  .line 479
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
    mul-float p4, p4, p2
    add-float/2addr v0, p4
  .line 480
    iget p4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v1, p4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    add-float/2addr v1, v2
    mul-float p2, p2, p5
    add-float/2addr v1, p2
  .line 481
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
  .line 482
    add-int/lit8 p1, p1, 1
    const/high16 p5, 0x430E0000
    sub-float/2addr p3, p5
    int-to-float p4, p4
    mul-float p3, p3, p4
    div-float/2addr p3, v1
    add-float/2addr p3, p5
    aput p3, p2, p1
  .line 483
    return-void
.end method

.method private static fadePaint()Landroid/graphics/Paint;
  .registers 3
  .line 414
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 415
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 416
    return-object v0
.end method

.method private static faded(II)I
  .registers 3
  .line 125
    ushr-int/lit8 v0, p0, 24
    mul-int v0, v0, p1
    div-int/lit16 v0, v0, 255
    shl-int/lit8 p1, v0, 24
    const v0, 16777215
    and-int/2addr p0, v0
    or-int/2addr p0, p1
    return p0
.end method

.method private fit()V
  .registers 7
  .line 151
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v0, :L1
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->h:I
    if-gtz v0, :L0
    goto :L1
  :L0
  .line 152
    nop
  .line 153
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->angle:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v0
    double-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->angle:F
    float-to-double v1, v1
    invoke-static { v1, v2 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v1
    double-to-float v1, v1
  .line 155
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
    add-float/2addr v2, v3
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v4, v3
    iget v5, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    add-float/2addr v4, v5
    const/high16 v5, 0x42B40000
    mul-float v1, v1, v5
    sub-float/2addr v4, v1
    mul-float v2, v2, v4
    int-to-float v1, v3
    div-float/2addr v2, v1
    mul-float v0, v0, v5
    sub-float/2addr v2, v0
  .line 156
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spacing:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->side:I
    add-int/lit8 v1, v1, -1
    int-to-float v1, v1
    mul-float v0, v0, v1
    sub-float/2addr v2, v0
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->offX:F
  .line 157
    return-void
  :L1
  .line 151
    return-void
.end method

.method private lines(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 5
  .line 312
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    iget-object v1, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 313
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->lineOf:Lcom/innioasis/ipp/Flow$Item;
    if-ne p1, v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->lineArtist:Ljava/lang/String;
    if-ne v0, v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->lineYear:Ljava/lang/String;
    if-ne v1, v2, :L0
    return-void
  :L0
  .line 314
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->lineOf:Lcom/innioasis/ipp/Flow$Item;
  .line 315
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->lineArtist:Ljava/lang/String;
  .line 316
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->lineYear:Ljava/lang/String;
  .line 317
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->yearAt:I
    invoke-static { p1, v1, v2 }, Lcom/innioasis/ipp/Flow;->albumLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->nameLine:Ljava/lang/String;
  .line 318
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->yearAt:I
    invoke-static { v0, v1, p1 }, Lcom/innioasis/ipp/Flow;->artistLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->artistLine:Ljava/lang/String;
  .line 319
    return-void
.end method

.method private static lum(I)I
  .registers 3
  .line 129
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
  .line 326
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result v0
  .line 327
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float p1, p1, v2
    if-gez p1, :L0
    const/high16 p1, 0xBF800000
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 328
    cmpg-float v3, v0, v1
    if-gtz v3, :L2
  .line 329
    neg-float v3, p1
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->angle:F
    mul-float v3, v3, v4
    mul-float v3, v3, v0
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 330
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    mul-float p1, p1, v3
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 331
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    goto :L3
  :L2
  .line 333
    neg-float v3, p1
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->angle:F
    mul-float v3, v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 334
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->spacing:F
    sub-float v5, v0, v1
    mul-float v4, v4, v5
    add-float/2addr v3, v4
    mul-float p1, p1, v3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 335
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
  :L3
  .line 337
    const/high16 p1, 0x40C00000
    sub-float/2addr p1, v0
    const/high16 v0, 0x40000000
    div-float/2addr p1, v0
  .line 338
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
  .line 339
    return-void
.end method

.method private quad(FFF)V
  .registers 9
  .line 424
    nop
  .line 425
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    const/4 v1, 0
    const/4 v2, 0
    aput v2, v0, v1
    const/4 v3, 1
    aput p1, v0, v3
  .line 426
    const/4 v3, 2
    const/high16 v4, 0x43380000
    aput v4, v0, v3
    const/4 v3, 3
    aput p1, v0, v3
  .line 427
    const/4 p1, 4
    aput v4, v0, p1
    const/4 p1, 5
    aput p2, v0, p1
  .line 428
    const/4 p1, 6
    aput v2, v0, p1
    const/4 p1, 7
    aput p2, v0, p1
  .line 429
    cmpl-float p1, p3, v2
    if-eqz p1, :L1
  :L0
    const/16 p1, 8
    if-ge v1, p1, :L1
    iget-object p1, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    aget p2, p1, v1
    add-float/2addr p2, p3
    aput p2, p1, v1
    add-int/lit8 v1, v1, 2
    goto :L0
  :L1
  .line 430
    return-void
.end method

.method private slide(Landroid/graphics/Canvas;II)V
  .registers 26
  .line 342
    move-object/from16 v6, p0
    move-object/from16 v7, p1
    move/from16 v0, p2
    if-ltz v0, :L13
    move/from16 v1, p3
    if-ge v0, v1, :L13
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->hidden:I
    if-ne v0, v1, :L0
    goto/16 :L13
  :L0
  .line 343
    int-to-float v1, v0
    iget v2, v6, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v2, v1, v2
    invoke-direct { v6, v2 }, Lcom/innioasis/ipp/FlowView;->place(F)V
  .line 344
    iget v2, v6, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    if-gtz v2, :L1
    return-void
  :L1
  .line 345
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v8
  .line 346
    if-nez v8, :L2
    return-void
  :L2
  .line 347
    iget v2, v6, Lcom/innioasis/ipp/FlowView;->sAlpha:I
  .line 348
    iget-object v3, v6, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v3, v0 }, Lcom/innioasis/ipp/Flow$Loader;->age(I)J
    move-result-wide v3
  .line 349
    const-wide/16 v9, 200
    cmp-long v0, v3, v9
    if-gez v0, :L4
  .line 350
    int-to-long v11, v2
    const-wide/16 v13, 0
    cmp-long v0, v3, v13
    if-gez v0, :L3
    move-wide v3, v13
  :L3
    mul-long v11, v11, v3
    div-long/2addr v11, v9
    long-to-int v2, v11
  .line 351
    const/4 v0, 1
    iput-boolean v0, v6, Lcom/innioasis/ipp/FlowView;->fading:Z
    move v9, v2
    goto :L5
  :L4
  .line 349
    move v9, v2
  :L5
  .line 353
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v2, v0
    invoke-static { v2, v3 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v2
    double-to-float v10, v2
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v2, v0
    invoke-static { v2, v3 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v2
    double-to-float v11, v2
  .line 354
    iget v0, v6, Lcom/innioasis/ipp/FlowView;->spread:F
    const/4 v12, 0
    cmpl-float v2, v0, v12
    if-lez v2, :L7
    iget v2, v6, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpg-float v1, v1, v2
    if-gez v1, :L6
    neg-float v0, v0
  :L6
    iget v1, v6, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    move v13, v0
    goto :L8
  :L7
    const/4 v13, 0
  :L8
  .line 355
    nop
  .line 356
    nop
  .line 358
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v0, v9 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 362
    const/4 v1, 0
    const/high16 v14, 0xC2B80000
    const/high16 v3, 0x43480000
    move-object/from16 v0, p0
    move v2, v14
    move v4, v10
    move v5, v11
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 363
    const/4 v1, 2
    const/high16 v2, 0x42B80000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 364
    const/4 v1, 4
    const/high16 v3, 0x434A0000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 365
    const/4 v1, 6
    move v2, v14
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 366
    const/16 v0, 180
    int-to-float v0, v0
    const/16 v1, 182
    int-to-float v15, v1
    invoke-direct { v6, v0, v15, v13 }, Lcom/innioasis/ipp/FlowView;->quad(FFF)V
  .line 367
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->src:[F
    const/16 v18, 0
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/16 v20, 0
    const/16 v21, 4
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move-object/from16 v19, v2
    invoke-virtual/range { v16 .. v21 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result v0
    if-nez v0, :L9
    return-void
  :L9
  .line 368
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 369
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    invoke-virtual { v7, v0 }, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V
  .line 370
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->seamFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->seamTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 371
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    mul-int/lit8 v1, v9, 112
    const/16 v5, 255
    div-int/2addr v1, v5
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 372
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->seamFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->seamTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 373
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 377
    const/4 v1, 0
    const/high16 v3, 0x434A0000
    move-object/from16 v0, p0
    move v2, v14
    move v4, v10
    move v5, v11
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 378
    const/4 v1, 2
    const/high16 v2, 0x42B80000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 379
    const/4 v1, 4
    const/high16 v3, 0x43920000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 380
    const/4 v1, 6
    move v2, v14
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 381
    const/16 v0, 92
    int-to-float v0, v0
    invoke-direct { v6, v15, v0, v13 }, Lcom/innioasis/ipp/FlowView;->quad(FFF)V
  .line 382
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->src:[F
    const/16 v18, 0
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/16 v20, 0
    const/16 v21, 4
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move-object/from16 v19, v2
    invoke-virtual/range { v16 .. v21 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result v0
    if-nez v0, :L10
    return-void
  :L10
  .line 383
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v0, v9 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 384
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 385
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    invoke-virtual { v7, v0 }, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V
  .line 386
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 387
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 388
    invoke-static { }, Lcom/innioasis/ipp/Flow;->fade()Landroid/graphics/Bitmap;
    move-result-object v0
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->fade:Landroid/graphics/Paint;
    const/4 v3, 0
    invoke-virtual { v7, v0, v3, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 389
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 392
    const/4 v1, 0
    const/high16 v3, 0x41A00000
    move-object/from16 v0, p0
    move v2, v14
    move v4, v10
    move v5, v11
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 393
    const/4 v1, 2
    const/high16 v2, 0x42B80000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 394
    const/4 v1, 4
    const/high16 v3, 0x434C0000
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 395
    const/4 v1, 6
    move v2, v14
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 396
    const/high16 v0, 0x43380000
    invoke-direct { v6, v12, v0, v13 }, Lcom/innioasis/ipp/FlowView;->quad(FFF)V
  .line 397
    iget-object v14, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v15, v6, Lcom/innioasis/ipp/FlowView;->src:[F
    const/16 v16, 0
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/16 v18, 0
    const/16 v19, 4
    move-object/from16 v17, v0
    invoke-virtual/range { v14 .. v19 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result v0
    if-nez v0, :L11
    return-void
  :L11
  .line 398
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 399
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    invoke-virtual { v7, v0 }, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V
  .line 400
    const/16 v0, 255
    if-ge v9, v0, :L12
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->slideFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->slideTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  :L12
  .line 401
    iget-object v0, v6, Lcom/innioasis/ipp/FlowView;->slideFrom:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/ipp/FlowView;->slideTo:Landroid/graphics/RectF;
    iget-object v2, v6, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v7, v8, v0, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 402
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 403
    return-void
  :L13
  .line 342
    return-void
.end method

.method private static textColor(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 116
    const/4 v0, -1
  :L0
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 117
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v2, 0
    invoke-virtual { p0, v1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 118
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L1
    return p0
  :L2
  .line 119
    move-exception p0
  .line 120
    return v0
.end method

.method public count()I
  .registers 2
  .line 186
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
  .line 222
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    div-int/lit8 v0, v0, 2
    add-int/lit8 v0, v0, -90
    return v0
.end method

.method public coverTop()I
  .registers 2
  .line 224
    const/16 v0, 22
    return v0
.end method

.method public getLabels()F
  .registers 2
  .line 244
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->labels:F
    return v0
.end method

.method public getSpread()F
  .registers 2
  .line 234
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    return v0
.end method

.method public goTo(I)V
  .registers 6
  .line 204
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 205
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 206
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v1, :L1
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    int-to-float v1, v1
    cmpl-float v1, v2, v1
    if-nez v1, :L1
    return-void
  :L1
  .line 207
    int-to-float v1, p1
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v2, v1, v2
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x41200000
    cmpl-float v2, v2, v3
    if-lez v2, :L4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpl-float v1, v1, v2
    if-lez v1, :L2
    add-int/lit8 v1, p1, -10
    goto :L3
  :L2
    add-int/lit8 v1, p1, 10
  :L3
    int-to-float v1, v1
    iput v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  :L4
  .line 208
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 209
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  .line 210
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 211
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 212
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 213
    return-void
  :L5
  .line 204
    return-void
.end method

.method public hide(I)V
  .registers 2
  .line 217
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 218
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 219
    return-void
.end method

.method public hurry()V
  .registers 3
  .line 175
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v1, v1
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    return-void
  :L0
  .line 176
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  .line 177
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 178
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 11
  .line 270
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->advance()Z
    move-result v0
  .line 271
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
  .line 272
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result v2
  .line 273
    if-lez v2, :L3
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v3, :L3
  .line 274
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 276
    const/4 v4, 7
  :L0
    if-ltz v4, :L2
  .line 277
    sub-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  .line 278
    if-eqz v4, :L1
    add-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  :L1
  .line 276
    add-int/lit8 v4, v4, -1
    goto :L0
  :L2
  .line 280
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    add-int/lit8 v2, v2, -1
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-interface { v4, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 281
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
  .line 282
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
  .line 283
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { v6, v4 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 284
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    mul-int/lit16 v7, v4, 176
    div-int/lit16 v7, v7, 255
    invoke-virtual { v6, v7 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 285
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v7
    const/4 v8, 0
    invoke-virtual { v6, v3, v8, v5, v7 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 286
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v4
    invoke-virtual { v6, v3, v8, v5, v4 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 287
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/FlowView;->lines(Lcom/innioasis/ipp/Flow$Item;)V
  .line 288
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->nameLine:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->w:I
    add-int/lit8 v4, v4, -24
    int-to-float v4, v4
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v3, v4, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->h:I
    add-int/lit8 v3, v3, -46
    int-to-float v3, v3
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { p1, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 290
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->artistLine:Ljava/lang/String;
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
    add-int/lit8 v3, v3, -19
    int-to-float v3, v3
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    invoke-virtual { p1, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L3
  .line 293
    if-nez v0, :L4
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
    if-eqz p1, :L5
  :L4
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  :L5
  .line 294
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
    if-eqz p1, :L6
    if-nez v0, :L6
    iget-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    if-eqz p1, :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/FlowView;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 295
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
  .line 296
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 5
  .line 248
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->w:I
  .line 249
    iput p2, p0, Lcom/innioasis/ipp/FlowView;->h:I
  .line 250
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->fit()V
  .line 251
    return-void
.end method

.method public resting()Z
  .registers 3
  .line 171
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

.method public setCount(I)V
  .registers 5
  .line 134
    const/4 v0, 3
    const/4 v1, 1
    const/4 v2, 2
    if-gt p1, v0, :L0
    const/4 v0, 0
    goto :L2
  :L0
    const/4 v0, 5
    if-gt p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 2
  :L2
  .line 135
    sub-int/2addr p1, v1
    div-int/2addr p1, v2
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->side:I
  .line 136
    sget-object p1, Lcom/innioasis/ipp/FlowView;->ANGLES:[F
    aget p1, p1, v0
    float-to-double v1, p1
    invoke-static { v1, v2 }, Ljava/lang/Math;->toRadians(D)D
    move-result-wide v1
    double-to-float p1, v1
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->angle:F
  .line 137
    sget-object v1, Lcom/innioasis/ipp/FlowView;->STEPS:[F
    aget v0, v1, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->spacing:F
  .line 138
    nop
  .line 139
    float-to-double v0, p1
    invoke-static { v0, v1 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v0
    double-to-float p1, v0
    const/high16 v0, 0x3F800000
    sub-float/2addr v0, p1
    const/high16 p1, 0x42B40000
    mul-float v0, v0, p1
    const/high16 v1, 0x43340000
    add-float/2addr v0, v1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->offX:F
  .line 140
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->angle:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v0
    double-to-float v0, v0
    mul-float v0, v0, p1
    const/high16 p1, 0x42340000
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->offY:F
  .line 141
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->fit()V
  .line 142
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 143
    return-void
.end method

.method public setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .registers 4
  .line 160
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
  .line 161
    iput-object p2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 162
    iput p3, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 163
    int-to-float p1, p3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  .line 164
    invoke-virtual { p2, p3 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 165
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 166
    return-void
.end method

.method public setLabels(F)V
  .registers 2
  .line 240
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 241
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 242
    return-void
.end method

.method public setOnRest(Ljava/lang/Runnable;)V
  .registers 2
  .line 184
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    return-void
.end method

.method public setSpread(F)V
  .registers 2
  .line 230
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->spread:F
  .line 231
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 232
    return-void
.end method

.method public setYears(I)V
  .registers 3
  .line 305
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->yearAt:I
    if-ne v0, p1, :L0
    return-void
  :L0
  .line 306
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->yearAt:I
  .line 307
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->lineOf:Lcom/innioasis/ipp/Flow$Item;
  .line 308
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 309
    return-void
.end method

.method public step(I)V
  .registers 4
  .line 189
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L2
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 190
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
  .line 191
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v1, :L1
    return-void
  :L1
  .line 192
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 193
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  .line 194
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 195
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 196
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 197
    return-void
  :L2
  .line 189
    return-void
.end method

.method public target()I
  .registers 2
  .line 168
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    return v0
.end method
