.class public final Lcom/innioasis/ipp/FlowView;
.super Landroid/view/View;
.source "FlowView.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/FlowView$Card;
  }
.end annotation

.field private final static ANCHOR:I = 142

.field private final static ANGLE:F = 0.0F

.field private final static ARTIST_ALPHA:I = 176

.field private final static BASE:I = 202

.field public final static FADE_MS:I = 200

.field private final static HURRY_RATE:F = 14.0F

.field private final static HURRY_VMIN:F = 6.0F

.field private final static RATE:F = 8.0F

.field private final static SIDE:I = 6

.field private final static SLOW_FRAME:J = 40L

.field private final static SPACING:F = 40.0F

.field private final static VMAX:F = 30.0F

.field private final static VMIN:F = 2.5F

.field public static volatile busyGc:Z

.field public static volatile busyPic:Z

.field public static volatile busyTracks:Z

.field private final artist:Landroid/text/TextPaint;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private final dst:[F

.field private final erase:Landroid/graphics/Paint;

.field private fFrames:I

.field private fLate:I

.field private fSlow:I

.field private fStart:J

.field private fSteps:I

.field private fWorst:J

.field private final fade:Landroid/graphics/Paint;

.field private fading:Z

.field private h:I

.field private hidden:I

.field private hurry:Z

.field private items:Ljava/util/List;

.field private labels:F

.field private last:J

.field private latMax:J

.field private latSum:J

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private final m:Landroid/graphics/Matrix;

.field private moving0:Z

.field private final name:Landroid/text/TextPaint;

.field private final offX:F

.field private final offY:F

.field private onRest:Ljava/lang/Runnable;

.field private pos:F

.field private prevAnim:Z

.field private prevDraw:J

.field private final reflFrom:Landroid/graphics/Rect;

.field private final reflTo:Landroid/graphics/RectF;

.field private sAlpha:I

.field private sAngle:F

.field private sCx:F

.field private sCy:F

.field private shadow:I

.field private spread:F

.field private final src:[F

.field private stepAt:J

.field private stepKey:J

.field private stepPending:Z

.field private target:I

.field private w:I

.field private wasMoving:Z

.method static constructor <clinit>()V
  .registers 2
  .line 34
    const-wide v0, 4634626229029306368L
    invoke-static { v0, v1 }, Ljava/lang/Math;->toRadians(D)D
    move-result-wide v0
    double-to-float v0, v0
    sput v0, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
  .registers 13
  .line 82
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 63
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 68
    new-instance v0, Landroid/graphics/Matrix;
    invoke-direct { v0 }, Landroid/graphics/Matrix;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
  .line 69
    const/16 v0, 8
    new-array v1, v0, [F
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->src:[F
  .line 70
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
  .line 71
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
  .line 72
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
  .line 74
    new-instance v2, Landroid/text/TextPaint;
    const/4 v3, 1
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
  .line 75
    new-instance v4, Landroid/text/TextPaint;
    invoke-direct { v4, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
  .line 190
    const/high16 v5, 0x3F800000
    iput v5, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 396
    new-instance v6, Landroid/graphics/Rect;
    const/16 v7, 184
    const/16 v8, 182
    const/4 v9, 0
    const/16 v10, 92
    invoke-direct { v6, v9, v10, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
  .line 397
    new-instance v7, Landroid/graphics/RectF;
    invoke-direct { v7, v6 }, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V
    iput-object v7, p0, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
  .line 398
    invoke-static { }, Lcom/innioasis/ipp/FlowView;->fadePaint()Landroid/graphics/Paint;
    move-result-object v6
    iput-object v6, p0, Lcom/innioasis/ipp/FlowView;->fade:Landroid/graphics/Paint;
  .line 83
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
  .line 84
    float-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v6
    double-to-float v6, v6
    mul-float v6, v6, v8
    const/high16 v7, 0x42340000
    add-float/2addr v6, v7
    iput v6, p0, Lcom/innioasis/ipp/FlowView;->offY:F
  .line 86
    const/4 v6, 0
    invoke-virtual { p0, v1, v6 }, Lcom/innioasis/ipp/FlowView;->setLayerType(ILandroid/graphics/Paint;)V
  .line 87
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v6 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 88
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->textColor(Landroid/content/Context;)I
    move-result p1
  .line 89
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
  .line 90
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 91
    const/high16 v0, 0x41A00000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 92
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v0, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 93
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 94
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 95
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    const/high16 v1, 0x40000000
    const/4 v3, 0
    invoke-virtual { v2, v1, v3, v5, v0 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 96
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 97
    const/high16 p1, 0x41880000
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 98
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 99
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 100
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-virtual { v4, v1, v3, v5, p1 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 101
    return-void
.end method

.method static synthetic access$000()Landroid/graphics/Paint;
  .registers 1
  .line 32
    invoke-static { }, Lcom/innioasis/ipp/FlowView;->fadePaint()Landroid/graphics/Paint;
    move-result-object v0
    return-object v0
.end method

.method private advance()Z
  .registers 8
  .line 207
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 208
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
  .line 209
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 210
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float/2addr v0, v1
  .line 211
    const/4 v1, 0
    const/4 v3, 0
    cmpl-float v4, v0, v1
    if-nez v4, :L2
    return v3
  :L2
  .line 212
    iget-boolean v4, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
    if-eqz v4, :L3
    const/high16 v4, 0x40C00000
    goto :L4
  :L3
    const/high16 v4, 0x40200000
  :L4
  .line 213
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
  .line 212
    invoke-static { v4, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v4
  .line 214
    mul-float v4, v4, v2
  .line 215
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpl-float v2, v4, v2
    if-ltz v2, :L7
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    goto :L10
  :L7
  .line 216
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
  .line 217
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v2, v1
    cmpl-float v2, v0, v2
    if-nez v2, :L11
    iput-boolean v3, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  :L11
  .line 218
    int-to-float v1, v1
    cmpl-float v0, v0, v1
    if-eqz v0, :L12
    const/4 v3, 1
  :L12
    return v3
.end method

.method private busy()Ljava/lang/String;
  .registers 9
  .line 241
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 242
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    if-eqz v1, :L1
  .line 243
    iget-boolean v1, v1, Lcom/innioasis/ipp/Flow$Loader;->busy:Z
    if-eqz v1, :L0
    const-string v1, ", slide"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    iget-object v2, v2, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 244
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    iget-wide v3, v3, Lcom/innioasis/ipp/Flow$Loader;->doneAt:J
    sub-long/2addr v1, v3
  .line 245
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    iget-wide v3, v3, Lcom/innioasis/ipp/Flow$Loader;->doneAt:J
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-lez v7, :L1
    const-wide/16 v3, 300
    cmp-long v5, v1, v3
    if-gez v5, :L1
    const-string v3, ", last slide "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " ms ago"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    iget-object v2, v2, Lcom/innioasis/ipp/Flow$Loader;->doneHow:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 247
    sget-boolean v1, Lcom/innioasis/ipp/FlowView;->busyTracks:Z
    if-eqz v1, :L2
    const-string v1, ", tracks"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L2
  .line 248
    sget-boolean v1, Lcom/innioasis/ipp/FlowView;->busyPic:Z
    if-eqz v1, :L3
    const-string v1, ", picture"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 249
    sget-boolean v1, Lcom/innioasis/ipp/FlowView;->busyGc:Z
    if-eqz v1, :L4
    const-string v1, ", gc"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 250
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private corner(IFFFF)V
  .registers 9
  .line 458
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
    mul-float p4, p4, p2
    add-float/2addr v0, p4
  .line 459
    iget p4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v1, p4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    add-float/2addr v1, v2
    mul-float p2, p2, p5
    add-float/2addr v1, p2
  .line 460
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
  .line 461
    add-int/lit8 p1, p1, 1
    const/high16 p5, 0x430E0000
    sub-float/2addr p3, p5
    int-to-float p4, p4
    mul-float p3, p3, p4
    div-float/2addr p3, v1
    add-float/2addr p3, p5
    aput p3, p2, p1
  .line 462
    return-void
.end method

.method private draw0(Landroid/graphics/Canvas;)V
  .registers 11
  .line 301
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->advance()Z
    move-result v0
  .line 302
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->moving0:Z
  .line 303
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
  .line 304
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result v2
  .line 305
    if-lez v2, :L3
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v3, :L3
  .line 306
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 308
    const/4 v4, 7
  :L0
    if-ltz v4, :L2
  .line 309
    sub-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  .line 310
    if-eqz v4, :L1
    add-int v5, v3, v4
    invoke-direct { p0, p1, v5, v2 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  :L1
  .line 308
    add-int/lit8 v4, v4, -1
    goto :L0
  :L2
  .line 312
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    add-int/lit8 v2, v2, -1
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-interface { v4, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 313
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
  .line 314
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
  .line 315
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { v6, v4 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 316
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    mul-int/lit16 v7, v4, 176
    div-int/lit16 v7, v7, 255
    invoke-virtual { v6, v7 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 317
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v7
    const/4 v8, 0
    invoke-virtual { v6, v3, v8, v5, v7 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 318
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    iget v7, p0, Lcom/innioasis/ipp/FlowView;->shadow:I
    invoke-static { v7, v4 }, Lcom/innioasis/ipp/FlowView;->faded(II)I
    move-result v4
    invoke-virtual { v6, v3, v8, v5, v4 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 319
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
  .line 321
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
  .line 324
    if-nez v0, :L4
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
    if-eqz p1, :L5
  :L4
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  :L5
  .line 325
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
    if-eqz p1, :L6
    if-nez v0, :L6
    iget-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    if-eqz p1, :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/FlowView;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 326
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->wasMoving:Z
  .line 327
    return-void
.end method

.method private static fadePaint()Landroid/graphics/Paint;
  .registers 3
  .line 401
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 402
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 403
    return-object v0
.end method

.method private static faded(II)I
  .registers 3
  .line 115
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
  .line 119
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
  .line 334
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result v0
  .line 335
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float p1, p1, v2
    if-gez p1, :L0
    const/high16 p1, 0xBF800000
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 336
    cmpg-float v3, v0, v1
    if-gtz v3, :L2
  .line 337
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    mul-float v3, v3, v0
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 338
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    mul-float p1, p1, v3
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 339
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    goto :L3
  :L2
  .line 341
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 342
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    const/high16 v4, 0x42200000
    sub-float v5, v0, v1
    mul-float v5, v5, v4
    add-float/2addr v3, v5
    mul-float p1, p1, v3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 343
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
  :L3
  .line 345
    const/high16 p1, 0x40C00000
    sub-float/2addr p1, v0
    const/high16 v0, 0x40000000
    div-float/2addr p1, v0
  .line 346
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
  .line 347
    return-void
.end method

.method private quad(FFF)V
  .registers 9
  .line 411
    nop
  .line 412
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    const/4 v1, 0
    const/4 v2, 0
    aput v2, v0, v1
    const/4 v3, 1
    aput p1, v0, v3
  .line 413
    const/4 v3, 2
    const/high16 v4, 0x43380000
    aput v4, v0, v3
    const/4 v3, 3
    aput p1, v0, v3
  .line 414
    const/4 p1, 4
    aput v4, v0, p1
    const/4 p1, 5
    aput p2, v0, p1
  .line 415
    const/4 p1, 6
    aput v2, v0, p1
    const/4 p1, 7
    aput p2, v0, p1
  .line 416
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
  .line 417
    return-void
.end method

.method private static say(Ljava/lang/String;)V
  .registers 2
  .line 236
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 237
    const-string v0, "ippflow"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 238
    return-void
.end method

.method private slide(Landroid/graphics/Canvas;II)V
  .registers 16
  .line 350
    if-ltz p2, :L11
    if-ge p2, p3, :L11
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
    if-ne p2, p3, :L0
    goto/16 :L11
  :L0
  .line 351
    int-to-float p3, p2
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v0, p3, v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/FlowView;->place(F)V
  .line 352
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    if-gtz v0, :L1
    return-void
  :L1
  .line 353
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p2 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 354
    if-nez v0, :L2
    return-void
  :L2
  .line 355
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
  .line 356
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v2, p2 }, Lcom/innioasis/ipp/Flow$Loader;->age(I)J
    move-result-wide v2
  .line 357
    const-wide/16 v4, 200
    cmp-long p2, v2, v4
    if-gez p2, :L4
  .line 358
    int-to-long v6, v1
    const-wide/16 v8, 0
    cmp-long p2, v2, v8
    if-gez p2, :L3
    move-wide v2, v8
  :L3
    mul-long v6, v6, v2
    div-long/2addr v6, v4
    long-to-int v1, v6
  .line 359
    const/4 p2, 1
    iput-boolean p2, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
  :L4
  .line 361
    iget p2, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v2, p2
    invoke-static { v2, v3 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v2
    double-to-float p2, v2
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v2, v2
    invoke-static { v2, v3 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v2
    double-to-float v2, v2
  .line 362
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    const/4 v10, 0
    cmpl-float v4, v3, v10
    if-lez v4, :L6
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpg-float p3, p3, v4
    if-gez p3, :L5
    neg-float v3, v3
  :L5
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float p3, p3
    mul-float v3, v3, p3
    goto :L7
  :L6
    const/4 v3, 0
  :L7
  .line 363
    nop
  .line 366
    const/4 v5, 0
    const/high16 p3, 0xC2B80000
    const/high16 v7, 0x41A00000
    move-object v4, p0
    move v6, p3
    move v8, p2
    move v9, v2
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 367
    const/4 v5, 2
    const/high16 v6, 0x42B80000
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 368
    const/4 v5, 4
    const/high16 v7, 0x434A0000
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 369
    const/4 v5, 6
    move v6, p3
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 370
    const/high16 v11, 0x43360000
    invoke-direct { p0, v10, v11, v3 }, Lcom/innioasis/ipp/FlowView;->quad(FFF)V
  .line 371
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    const/4 v6, 0
    iget-object v7, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/4 v8, 0
    const/4 v9, 4
    invoke-virtual/range { v4 .. v9 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result v4
    if-nez v4, :L8
    return-void
  :L8
  .line 372
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { v4, v1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 373
    const/16 v4, 255
    if-ge v1, v4, :L9
  .line 374
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { v4, v1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 375
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  :L9
  .line 377
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  .line 381
    const/4 v5, 0
    const/high16 v7, 0x434A0000
    move-object v4, p0
    move v6, p3
    move v8, p2
    move v9, v2
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 382
    const/4 v5, 2
    const/high16 v6, 0x42B80000
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 383
    const/4 v5, 4
    const/high16 v7, 0x43920000
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 384
    const/4 v5, 6
    move v6, p3
    invoke-direct/range { v4 .. v9 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 385
    const/high16 p2, 0x42B80000
    invoke-direct { p0, v11, p2, v3 }, Lcom/innioasis/ipp/FlowView;->quad(FFF)V
  .line 386
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    const/4 v6, 0
    iget-object v7, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/4 v8, 0
    const/4 v9, 4
    invoke-virtual/range { v4 .. v9 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result p2
    if-nez p2, :L10
    return-void
  :L10
  .line 387
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 388
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V
  .line 389
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { p2, v1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 390
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, p2, p3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 391
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->reflFrom:Landroid/graphics/Rect;
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, p2, p3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 392
    invoke-static { }, Lcom/innioasis/ipp/Flow;->fade()Landroid/graphics/Bitmap;
    move-result-object p2
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->reflTo:Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->fade:Landroid/graphics/Paint;
    const/4 v1, 0
    invoke-virtual { p1, p2, v1, p3, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 393
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 394
    return-void
  :L11
  .line 350
    return-void
.end method

.method private static textColor(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 106
    const/4 v0, -1
  :L0
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 107
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v2, 0
    invoke-virtual { p0, v1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 108
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L1
    return p0
  :L2
  .line 109
    move-exception p0
  .line 110
    return v0
.end method

.method public count()I
  .registers 2
  .line 149
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
  .line 176
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    div-int/lit8 v0, v0, 2
    add-int/lit8 v0, v0, -90
    return v0
.end method

.method public coverTop()I
  .registers 2
  .line 178
    const/16 v0, 22
    return v0
.end method

.method public getLabels()F
  .registers 2
  .line 198
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->labels:F
    return v0
.end method

.method public getSpread()F
  .registers 2
  .line 188
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    return v0
.end method

.method public hide(I)V
  .registers 2
  .line 171
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 172
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 173
    return-void
.end method

.method public hurry()V
  .registers 3
  .line 138
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v1, v1
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    return-void
  :L0
  .line 139
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  .line 140
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 141
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 14
  .line 255
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 256
    iget-boolean v2, p0, Lcom/innioasis/ipp/FlowView;->prevAnim:Z
    const-string v3, " ms"
    const-wide/16 v4, 0
    const/4 v6, 1
    const/4 v7, 0
    if-eqz v2, :L2
  .line 257
    iget-wide v8, p0, Lcom/innioasis/ipp/FlowView;->prevDraw:J
    sub-long v8, v0, v8
  .line 258
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->fFrames:I
    add-int/2addr v2, v6
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->fFrames:I
  .line 259
    iget-wide v10, p0, Lcom/innioasis/ipp/FlowView;->fWorst:J
    cmp-long v2, v8, v10
    if-lez v2, :L0
    iput-wide v8, p0, Lcom/innioasis/ipp/FlowView;->fWorst:J
  :L0
  .line 260
    const-wide/16 v10, 40
    cmp-long v2, v8, v10
    if-ltz v2, :L1
  .line 261
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->fSlow:I
    add-int/2addr v2, v6
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->fSlow:I
  .line 262
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v10, "flow frame "
    invoke-virtual { v2, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->busy()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/FlowView;->say(Ljava/lang/String;)V
  :L1
  .line 264
    goto :L3
  :L2
  .line 265
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->fStart:J
  .line 266
    iput v7, p0, Lcom/innioasis/ipp/FlowView;->fFrames:I
  .line 267
    iput v7, p0, Lcom/innioasis/ipp/FlowView;->fSlow:I
  .line 268
    iput-wide v4, p0, Lcom/innioasis/ipp/FlowView;->fWorst:J
  .line 269
    iput v7, p0, Lcom/innioasis/ipp/FlowView;->fSteps:I
  .line 270
    iput v7, p0, Lcom/innioasis/ipp/FlowView;->fLate:I
  .line 271
    iput-wide v4, p0, Lcom/innioasis/ipp/FlowView;->latMax:J
  .line 272
    iput-wide v4, p0, Lcom/innioasis/ipp/FlowView;->latSum:J
  :L3
  .line 274
    iget-boolean v2, p0, Lcom/innioasis/ipp/FlowView;->stepPending:Z
    if-eqz v2, :L5
  .line 275
    iput-boolean v7, p0, Lcom/innioasis/ipp/FlowView;->stepPending:Z
  .line 276
    iget-wide v8, p0, Lcom/innioasis/ipp/FlowView;->stepKey:J
    sub-long v8, v0, v8
  .line 277
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->fSteps:I
    add-int/2addr v2, v6
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->fSteps:I
  .line 278
    iget-wide v10, p0, Lcom/innioasis/ipp/FlowView;->latSum:J
    add-long/2addr v10, v8
    iput-wide v10, p0, Lcom/innioasis/ipp/FlowView;->latSum:J
  .line 279
    iget-wide v10, p0, Lcom/innioasis/ipp/FlowView;->latMax:J
    cmp-long v2, v8, v10
    if-lez v2, :L4
    iput-wide v8, p0, Lcom/innioasis/ipp/FlowView;->latMax:J
  :L4
  .line 280
    const-wide/16 v10, 60
    cmp-long v2, v8, v10
    if-ltz v2, :L5
  .line 281
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->fLate:I
    add-int/2addr v2, v6
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->fLate:I
  .line 282
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v10, "flow step late "
    invoke-virtual { v2, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v8, " ms, key to step "
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-wide v8, p0, Lcom/innioasis/ipp/FlowView;->stepAt:J
    iget-wide v10, p0, Lcom/innioasis/ipp/FlowView;->stepKey:J
    sub-long/2addr v8, v10
    invoke-virtual { v2, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->busy()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/FlowView;->say(Ljava/lang/String;)V
  :L5
  .line 285
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->prevDraw:J
  .line 286
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/FlowView;->draw0(Landroid/graphics/Canvas;)V
  .line 287
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
  .line 288
    sub-long/2addr v8, v0
    const-wide/16 v10, 15
    cmp-long p1, v8, v10
    if-ltz p1, :L6
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "flow draw "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->say(Ljava/lang/String;)V
  :L6
  .line 289
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->moving0:Z
    if-nez p1, :L8
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->fading:Z
    if-eqz p1, :L7
    goto :L8
  :L7
    const/4 v6, 0
  :L8
  .line 290
    iget-boolean p1, p0, Lcom/innioasis/ipp/FlowView;->prevAnim:Z
    if-eqz p1, :L10
    if-nez v6, :L10
  .line 291
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "frames flow scroll worst "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget-wide v2, p0, Lcom/innioasis/ipp/FlowView;->fWorst:J
    invoke-virtual { p1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v2, " ms, "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->fFrames:I
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v2, " frames in "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget-wide v2, p0, Lcom/innioasis/ipp/FlowView;->fStart:J
    sub-long/2addr v0, v2
    invoke-virtual { p1, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " ms, slow "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->fSlow:I
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, "; steps "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->fSteps:I
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, ", key to frame max "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget-wide v0, p0, Lcom/innioasis/ipp/FlowView;->latMax:J
    invoke-virtual { p1, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " mean "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 293
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->fSteps:I
    if-lez v0, :L9
    iget-wide v1, p0, Lcom/innioasis/ipp/FlowView;->latSum:J
    int-to-long v3, v0
    div-long v4, v1, v3
  :L9
    invoke-virtual { p1, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, ", late "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->fLate:I
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  .line 291
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->say(Ljava/lang/String;)V
  :L10
  .line 295
    iput-boolean v6, p0, Lcom/innioasis/ipp/FlowView;->prevAnim:Z
  .line 296
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 5
  .line 202
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->w:I
  .line 203
    iput p2, p0, Lcom/innioasis/ipp/FlowView;->h:I
  .line 204
    return-void
.end method

.method public resting()Z
  .registers 3
  .line 134
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
  .line 123
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
  .line 124
    iput-object p2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 125
    iput p3, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 126
    int-to-float p1, p3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  .line 127
    invoke-virtual { p2, p3 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 128
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 129
    return-void
.end method

.method public setLabels(F)V
  .registers 2
  .line 194
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->labels:F
  .line 195
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 196
    return-void
.end method

.method public setOnRest(Ljava/lang/Runnable;)V
  .registers 2
  .line 147
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->onRest:Ljava/lang/Runnable;
    return-void
.end method

.method public setSpread(F)V
  .registers 2
  .line 184
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->spread:F
  .line 185
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 186
    return-void
.end method

.method public step(I)V
  .registers 14
  .line 152
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 153
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 1
    sub-int/2addr v0, v1
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->target:I
    add-int/2addr v2, p1
    invoke-static { v0, v2 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 154
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v2, :L1
    return-void
  :L1
  .line 155
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 156
    iput-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->hurry:Z
  .line 157
    iget-boolean v0, p0, Lcom/innioasis/ipp/FlowView;->stepPending:Z
    const-wide/16 v2, 0
    if-nez v0, :L4
  .line 158
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 159
    invoke-static { }, Lcom/innioasis/ipp/Open;->lastKey()J
    move-result-wide v6
  .line 160
    cmp-long v0, v6, v2
    if-lez v0, :L2
    cmp-long v0, v6, v4
    if-gtz v0, :L2
    sub-long v8, v4, v6
    const-wide/16 v10, 1000
    cmp-long v0, v8, v10
    if-gez v0, :L2
    goto :L3
  :L2
    move-wide v6, v4
  :L3
    iput-wide v6, p0, Lcom/innioasis/ipp/FlowView;->stepKey:J
  .line 161
    iput-wide v4, p0, Lcom/innioasis/ipp/FlowView;->stepAt:J
  .line 162
    iput-boolean v1, p0, Lcom/innioasis/ipp/FlowView;->stepPending:Z
  :L4
  .line 164
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 165
    iput-wide v2, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 166
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 167
    return-void
  :L5
  .line 152
    return-void
.end method

.method public target()I
  .registers 2
  .line 131
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    return v0
.end method
