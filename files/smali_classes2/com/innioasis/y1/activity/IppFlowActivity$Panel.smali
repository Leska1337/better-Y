.class final Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
.super Landroid/view/View;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Panel"
.end annotation

.field private final static GAP:Ljava/lang/String; = "     "

.field private final static HEAD:I = 54

.field private final static IDLE:I = 1000

.field private final static JUMP:I = 4

.field private final static LEAD:I = 38

.field private final static LIST_MAX:F = 6000.0F

.field private final static LIST_MIN:F = 400.0F

.field private final static LIST_RATE:F = 14.0F

.field private final static MARK:I = 16

.field private final static OMEGA:F = 30.0F

.field private final static ROW:I = 26

.field private final static STEP:I = 2

.field private final static TICK:I = 40

.field private artist:Ljava/lang/String;

.field private artistFit:Ljava/lang/String;

.field private artistMask:Landroid/graphics/Bitmap;

.field private final bar:Landroid/graphics/Paint;

.field private barV:F

.field private barY:F

.field private final bg:Landroid/graphics/Paint;

.field private bouncing:Z

.field private endAt:J

.field private fg:I

.field private fgSel:I

.field private first:I

.field private fitW:I

.field private fitted:[Ljava/lang/String;

.field private frameAt:J

.field private final head:Landroid/text/TextPaint;

.field private final hl:Landroid/view/View;

.field private lead:I

.field private final line:Landroid/graphics/Paint;

.field private mark:Landroid/graphics/Bitmap;

.field private markColour:I

.field private final markPaint:Landroid/graphics/Paint;

.field private markRes:I

.field private final markTo:Landroid/graphics/Rect;

.field private final maskPaint:Landroid/graphics/Paint;

.field private nameMask:[Landroid/graphics/Bitmap;

.field private nameX:F

.field private names:[Ljava/lang/String;

.field private numAt:[F

.field private numMask:[Landroid/graphics/Bitmap;

.field private nums:[Ljava/lang/String;

.field private offset:I

.field private postWrap:Z

.field private ran:Z

.field private scrollY:F

.field private sel:I

.field private selAt:J

.field private song:[I

.field songs:Ljava/util/List;

.field private final sub:Landroid/text/TextPaint;

.field private final text:Landroid/text/TextPaint;

.field private final tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;

.field private title:Ljava/lang/String;

.field private titleFit:Ljava/lang/String;

.field private titleMask:Landroid/graphics/Bitmap;

.method constructor <init>(Landroid/content/Context;)V
  .registers 8
  .line 1229
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 1167
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
  .line 1168
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
  .line 1169
    new-instance v3, Landroid/text/TextPaint;
    invoke-direct { v3, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
  .line 1170
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
  .line 1171
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
  .line 1172
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
  .line 1173
    const-string v4, ""
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1174
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1191
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
  .line 1215
    const/high16 v4, 0x41000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 1225
    const/4 v4, -1
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1226
    const/high16 v4, 0xFF000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  .line 1391
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 2
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
  .line 1392
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct { v4 }, Landroid/graphics/Rect;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
  .line 1565
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
  .line 1230
    const/high16 v4, 0x41900000
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1231
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v4, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1232
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 1233
    const/high16 v0, 0x41700000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1234
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1235
    const/high16 v0, 0x41800000
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1236
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1237
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
  .line 1238
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->colours()V
  .line 1239
    return-void
.end method

.method private static approach(FFJFFF)F
  .registers 10
  .line 1534
    sub-float v0, p1, p0
  .line 1535
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v1
  .line 1536
    const/high16 v2, 0x3F000000
    cmpg-float v2, v1, v2
    if-gez v2, :L0
    return p1
  :L0
  .line 1537
    mul-float p4, p4, v1
    invoke-static { p6, p4 }, Ljava/lang/Math;->min(FF)F
    move-result p4
    invoke-static { p5, p4 }, Ljava/lang/Math;->max(FF)F
    move-result p4
  .line 1538
    long-to-float p2, p2
    mul-float p4, p4, p2
    const/high16 p2, 0x447A0000
    div-float/2addr p4, p2
  .line 1539
    cmpl-float p2, p4, v1
    if-ltz p2, :L1
    return p1
  :L1
  .line 1540
    const/4 p1, 0
    cmpl-float p1, v0, p1
    if-lez p1, :L2
    goto :L3
  :L2
    neg-float p4, p4
  :L3
    add-float/2addr p0, p4
    return p0
.end method

.method private static blend(IIF)I
  .registers 8
  .line 1545
    const/4 v0, 0
    cmpg-float v0, p2, v0
    if-gtz v0, :L0
    return p0
  :L0
  .line 1546
    const/high16 v0, 0x3F800000
    cmpl-float v0, p2, v0
    if-ltz v0, :L1
    return p1
  :L1
  .line 1547
    nop
  .line 1548
    const/4 v0, 0
    const/4 v1, 0
  :L2
    const/16 v2, 32
    if-ge v0, v2, :L3
  .line 1549
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 1550
    int-to-float v4, v2
    sub-int/2addr v3, v2
    int-to-float v2, v3
    mul-float v2, v2, p2
    add-float/2addr v4, v2
    const/high16 v2, 0x3F000000
    add-float/2addr v4, v2
    float-to-int v2, v4
    and-int/lit16 v2, v2, 255
    shl-int/2addr v2, v0
    or-int/2addr v1, v2
  .line 1548
    add-int/lit8 v0, v0, 8
    goto :L2
  :L3
  .line 1552
    return v1
.end method

.method private colours()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 1244
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 1245
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1246
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100267
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1247
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1248
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 1249
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v3, 2131100253
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 1248
    const/4 v3, 1
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1250
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  :L1
  .line 1252
    goto :L3
  :L2
  .line 1251
    move-exception v0
  :L3
  .line 1253
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1254
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1255
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    const v2, 16777215
    and-int/2addr v1, v2
    const/high16 v3, 0xB0000000
    or-int/2addr v1, v3
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1256
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    and-int/2addr v1, v2
    const/high16 v2, 0x50000000
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1257
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v0
  .line 1258
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    if-eqz v0, :L4
    goto :L5
  :L4
    const v0, -16714241
  :L5
    invoke-virtual { v1, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1259
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->highlight()V
  .line 1260
    return-void
.end method

.method private drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .registers 7
  .line 1209
    if-nez p2, :L0
    return-void
  :L0
  .line 1210
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
    invoke-virtual { v0, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1211
    iget-object p5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3, p4, p5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 1212
    return-void
.end method

.method private fitHead(I)V
  .registers 9
  .line 1605
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitW:I
    if-eq p1, v0, :L0
  .line 1606
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitW:I
  .line 1607
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1608
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1609
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    if-eqz v0, :L0
  .line 1610
    array-length v0, v0
    new-array v0, v0, [Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
  .line 1611
    array-length v0, v0
    new-array v0, v0, [Landroid/graphics/Bitmap;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
  :L0
  .line 1614
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
    const/16 v1, 22
    const/16 v2, 30
    if-nez v0, :L1
  .line 1615
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    add-int/lit8 v4, p1, -16
    int-to-float v5, v4
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v0, v3, v5, v6 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1616
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    invoke-static { v0, v3, v4, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleMask:Landroid/graphics/Bitmap;
  :L1
  .line 1618
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
    if-nez v0, :L2
  .line 1619
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    add-int/lit8 p1, p1, -16
    int-to-float v4, p1
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v0, v3, v4, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1620
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-static { v0, v3, p1, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistMask:Landroid/graphics/Bitmap;
  :L2
  .line 1622
    return-void
.end method

.method private fitRow(II)V
  .registers 10
  .line 1626
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v0, v0, p1
    const/16 v1, 19
    const/16 v2, 26
    if-nez v0, :L1
  .line 1627
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v0, p1
    if-nez v3, :L0
  .line 1628
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v3, v3, p1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    add-int/lit8 p2, p2, -16
    int-to-float v5, p2
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v3, v4, v5, v6 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    aput-object v3, v0, p1
  .line 1629
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v3, p1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-static { v3, v4, p2, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object p2
    aput-object p2, v0, p1
  :L0
  .line 1631
    return-void
  :L1
  .line 1633
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
    aget-object v4, v3, p1
    if-nez v4, :L2
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    iget v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    aget v6, v6, p1
    sub-float/2addr v5, v6
    float-to-double v5, v5
    invoke-static { v5, v6 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v5, v5
    invoke-static { v0, v4, v5, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v0
    aput-object v0, v3, p1
  :L2
  .line 1634
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v0, p1
    if-nez v3, :L3
  .line 1635
    add-int/lit8 p2, p2, -8
    int-to-float p2, p2
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float/2addr p2, v3
  .line 1636
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v3, v3, p1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v3, v4, p2, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    aput-object v3, v0, p1
  .line 1637
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v3, p1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    float-to-int p2, p2
    invoke-static { v3, v4, p2, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object p2
    aput-object p2, v0, p1
  :L3
  .line 1639
    return-void
.end method

.method private mark(I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 1398
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
    if-eq p1, v0, :L3
  .line 1399
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
  .line 1400
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L0
  .line 1402
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L1
  .line 1404
    goto :L3
  :L2
  .line 1403
    move-exception p1
  :L3
  .line 1406
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method private static mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 8
  .line 1195
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L3
    if-gtz p2, :L0
    goto :L3
  :L0
  .line 1197
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;
    invoke-static { p2, p3, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p2
  .line 1198
    invoke-virtual { p1 }, Landroid/text/TextPaint;->getColor()I
    move-result p3
  .line 1199
    const/high16 v1, 0xFF000000
    invoke-virtual { p1, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1200
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, p2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    const/4 v2, 0
    int-to-float p4, p4
    invoke-virtual { v1, p0, v2, p4, p1 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1201
    invoke-virtual { p1, p3 }, Landroid/text/TextPaint;->setColor(I)V
  :L1
  .line 1202
    return-object p2
  :L2
  .line 1203
    move-exception p0
  .line 1204
    return-object v0
  :L3
  .line 1195
    return-object v0
.end method

.method static playingPath()Ljava/lang/String;
  .catchall { :L0 .. :L4 } :L5
  .registers 2
  .line 1381
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1382
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1383
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1384
    move-exception v1
  .line 1385
    return-object v0
.end method

.method private rowOf(Ljava/lang/String;)I
  .registers 5
  .line 1372
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
  .line 1373
    aget v1, v1, v0
    if-ltz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 1372
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1375
    const/4 p1, -1
    return p1
.end method

.method private rows()I
  .registers 3
  .line 1600
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v0
    add-int/lit8 v0, v0, -54
    div-int/lit8 v0, v0, 26
    const/4 v1, 1
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
    return v0
.end method

.method private settle()V
  .registers 3
  .line 1411
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1412
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
  .line 1413
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1414
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1415
    return-void
.end method

.method private shift(II)V
  .registers 5
  .line 1483
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ne v0, p1, :L0
    return-void
  :L0
  .line 1484
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float/2addr p1, v1
  .line 1485
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1486
    add-int/lit8 p2, p2, -1
    mul-int/lit8 p2, p2, 26
    int-to-float p2, p2
    invoke-static { p2, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    const/4 p2, 0
    invoke-static { p2, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1487
    return-void
.end method

.method private travel()Z
  .registers 16
  .line 1502
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v1, v1, 26
    int-to-float v1, v1
  .line 1503
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
    const/4 v9, 0
    if-nez v2, :L0
  .line 1504
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1505
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1506
    return v9
  :L0
  .line 1508
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 1509
    iget-wide v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
    const-wide/16 v10, 0
    cmp-long v6, v4, v10
    if-nez v6, :L1
    const-wide/16 v4, 16
    goto :L2
  :L1
    const-wide/16 v6, 50
    sub-long v4, v2, v4
    invoke-static { v6, v7, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v4
  :L2
  .line 1510
    iput-wide v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1511
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    const/4 v12, 0
    cmpl-float v3, v2, v0
    if-nez v3, :L3
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    cmpl-float v3, v3, v12
    if-eqz v3, :L4
  :L3
  .line 1512
    sub-float/2addr v2, v0
  .line 1513
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    const/high16 v6, 0x41F00000
    mul-float v7, v2, v6
    add-float/2addr v3, v7
  .line 1514
    long-to-float v7, v4
    const/high16 v8, 0x447A0000
    div-float/2addr v7, v8
  .line 1515
    const/high16 v8, 0xC1F00000
    mul-float v8, v8, v7
    float-to-double v13, v8
    invoke-static { v13, v14 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v13
    double-to-float v8, v13
  .line 1516
    mul-float v13, v3, v7
    add-float/2addr v2, v13
    mul-float v2, v2, v8
  .line 1517
    iget v13, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    mul-float v3, v3, v6
    mul-float v3, v3, v7
    sub-float/2addr v13, v3
    mul-float v13, v13, v8
    iput v13, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
  .line 1518
    add-float v3, v0, v2
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1519
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x3F000000
    cmpg-float v2, v2, v3
    if-gez v2, :L4
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    invoke-static { v2 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x41700000
    cmpg-float v2, v2, v3
    if-gez v2, :L4
  .line 1520
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1521
    iput v12, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
  :L4
  .line 1524
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    const/high16 v6, 0x41600000
    const/high16 v7, 0x43C80000
    const v8, 1169915904
    move v3, v1
    invoke-static/range { v2 .. v8 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->approach(FFJFFF)F
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1525
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    cmpl-float v0, v3, v0
    if-nez v0, :L6
    cmpl-float v0, v2, v1
    if-nez v0, :L6
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    cmpl-float v0, v0, v12
    if-eqz v0, :L5
    goto :L6
  :L5
    const/4 v0, 0
    goto :L7
  :L6
    const/4 v0, 1
  :L7
  .line 1526
    if-nez v0, :L8
  .line 1527
    iput-wide v10, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1528
    iput-boolean v9, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bouncing:Z
  :L8
  .line 1530
    return v0
.end method

.method follow(Ljava/lang/String;)Z
  .registers 8
  .line 1334
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L11
    if-nez p1, :L0
    goto :L11
  :L0
  .line 1335
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1336
    if-gez p1, :L1
    return v1
  :L1
  .line 1337
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    const/4 v2, 1
    if-ne p1, v0, :L2
    return v2
  :L2
  .line 1338
    sub-int v0, p1, v0
    invoke-static { v0 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    const/4 v3, 4
    if-le v0, v3, :L3
    const/4 v1, 1
  :L3
  .line 1339
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1340
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1341
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1342
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-lez v3, :L4
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    add-int/lit8 v5, v3, -1
    aget v4, v4, v5
    if-gez v4, :L4
    add-int/lit8 v4, v3, -1
    goto :L5
  :L4
    move v4, v3
  :L5
  .line 1343
    iget v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v4, v5, :L6
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1344
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v4, p1
    if-lt v3, v4, :L7
    sub-int/2addr v3, p1
    add-int/2addr v3, v2
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L7
  .line 1345
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v3
    if-eqz v3, :L9
    if-eqz v1, :L8
    goto :L9
  :L8
  .line 1346
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->shift(II)V
    goto :L10
  :L9
  .line 1345
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  :L10
  .line 1347
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1348
    return v2
  :L11
  .line 1334
    return v1
.end method

.method highlight()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 1265
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  :L1
  .line 1267
    goto :L3
  :L2
  .line 1266
    move-exception v0
  :L3
  .line 1268
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1269
    return-void
.end method

.method move(I)V
  .registers 12
  .line 1423
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L26
    array-length v0, v0
    if-nez v0, :L0
    goto/16 :L26
  :L0
  .line 1424
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postWrap:Z
    const/4 v1, 0
    if-eqz v0, :L2
  .line 1426
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iget-wide v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->selAt:J
    sub-long/2addr v2, v4
    const-wide/16 v4, 100
    cmp-long v0, v2, v4
    if-gez v0, :L1
    return-void
  :L1
  .line 1427
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postWrap:Z
  :L2
  .line 1429
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L3
  .line 1431
    add-int/2addr v0, p1
  .line 1432
    if-ltz v0, :L4
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v3, v2
    if-ge v0, v3, :L4
    aget v2, v2, v0
    if-ltz v2, :L3
  :L4
  .line 1433
    nop
  .line 1434
    const/4 v2, 1
    if-ltz v0, :L6
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v3, v3
    if-lt v0, v3, :L5
    goto :L6
  :L5
    const/4 p1, 0
    goto/16 :L17
  :L6
  .line 1435
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/high16 v3, 0x43700000
    if-nez v0, :L8
  .line 1437
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L7
  .line 1438
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bouncing:Z
  .line 1439
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    int-to-float p1, p1
    mul-float p1, p1, v3
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
  .line 1440
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  :L7
  .line 1442
    return-void
  :L8
  .line 1445
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 1446
    iget-wide v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->selAt:J
    iget-wide v8, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->endAt:J
    invoke-static { v6, v7, v8, v9 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v6
    sub-long v6, v4, v6
  .line 1447
    iput-wide v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->endAt:J
  .line 1448
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L10
    const-wide/16 v4, 300
    cmp-long v0, v6, v4
    if-lez v0, :L9
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v4, v4, 26
    int-to-float v4, v4
    cmpl-float v0, v0, v4
    if-nez v0, :L9
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v4, v4, 26
    int-to-float v4, v4
    cmpl-float v0, v0, v4
    if-nez v0, :L9
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    const/4 v4, 0
    cmpl-float v0, v0, v4
    if-eqz v0, :L10
  :L9
  .line 1450
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bouncing:Z
  .line 1451
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
    int-to-float p1, p1
    mul-float p1, p1, v3
    add-float/2addr v0, p1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barV:F
  .line 1452
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1453
    return-void
  :L10
  .line 1456
    if-lez p1, :L11
    const/4 v0, 0
    goto :L12
  :L11
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v0, v0
    sub-int/2addr v0, v2
  :L12
  .line 1457
    if-ltz v0, :L15
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v4, v3
    if-ge v0, v4, :L15
    aget v3, v3, v0
    if-gez v3, :L15
    if-lez p1, :L13
    const/4 v3, 1
    goto :L14
  :L13
    const/4 v3, -1
  :L14
    add-int/2addr v0, v3
    goto :L12
  :L15
  .line 1458
    if-ltz v0, :L25
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length p1, p1
    if-ge v0, p1, :L25
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v0, p1, :L16
    goto :L25
  :L16
  .line 1459
    nop
  .line 1460
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postWrap:Z
    const/4 p1, 1
  :L17
  .line 1462
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1463
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1464
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    iput-wide v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->selAt:J
  .line 1465
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bouncing:Z
  .line 1466
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v0
  .line 1468
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-lez v1, :L18
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    add-int/lit8 v5, v1, -1
    aget v4, v4, v5
    if-gez v4, :L18
    add-int/lit8 v4, v1, -1
    goto :L19
  :L18
    move v4, v1
  :L19
  .line 1469
    iget v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v4, v5, :L20
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L20
  .line 1470
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v4, v0
    if-lt v1, v4, :L21
    sub-int/2addr v1, v0
    add-int/2addr v1, v2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L21
  .line 1473
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    if-eqz v1, :L23
    if-nez p1, :L23
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 p1, p1, 26
    int-to-float p1, p1
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    sub-float/2addr p1, v1
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    const/high16 v1, 0x42D00000
    cmpl-float p1, p1, v1
    if-lez p1, :L22
    goto :L23
  :L22
  .line 1474
    invoke-direct { p0, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->shift(II)V
    goto :L24
  :L23
  .line 1473
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  :L24
  .line 1475
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1476
    return-void
  :L25
  .line 1458
    return-void
  :L26
  .line 1423
    return-void
.end method

.method near(I)V
  .registers 5
  .line 1355
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    if-eqz v0, :L7
    array-length v1, v0
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1356
    array-length v0, v0
    add-int/lit8 v0, v0, -1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  :L1
  .line 1357
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge p1, v2, :L2
    aget v2, v1, p1
    if-gez v2, :L2
    add-int/lit8 p1, p1, 1
    goto :L1
  :L2
  .line 1358
    array-length v2, v1
    if-lt p1, v2, :L4
  .line 1359
    array-length p1, v1
    add-int/lit8 p1, p1, -1
  :L3
  .line 1360
    if-lez p1, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    aget v1, v1, p1
    if-gez v1, :L4
    add-int/lit8 p1, p1, -1
    goto :L3
  :L4
  .line 1362
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1363
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1364
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v1, v1
    sub-int/2addr v1, p1
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    invoke-static { v1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v1
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1365
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ge v1, v0, :L5
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L5
  .line 1366
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v0, p1
    if-lt v1, v0, :L6
    sub-int/2addr v1, p1
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1367
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1368
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1369
    return-void
  :L7
  .line 1355
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 23
  .line 1656
    move-object/from16 v6, p0
    move-object/from16 v7, p1
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v8
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v9
  .line 1657
    invoke-direct { v6, v8 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitHead(I)V
  .line 1658
    const/4 v1, 0
    const/4 v2, 0
    int-to-float v10, v8
    int-to-float v11, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    move v3, v10
    move v4, v11
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1659
    const/high16 v4, 0x3F800000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1660
    const/4 v12, 1
    sub-int/2addr v9, v12
    int-to-float v2, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v4, v11
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1661
    const/4 v2, 0
    const/high16 v3, 0x3F800000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1662
    add-int/lit8 v9, v8, -1
    int-to-float v13, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v1, v13
    move v3, v10
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1663
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleMask:Landroid/graphics/Bitmap;
    const/high16 v3, 0x41000000
    const/4 v4, 0
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1664
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistMask:Landroid/graphics/Bitmap;
    const/high16 v4, 0x41A80000
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1665
    const/high16 v1, 0x40C00000
    const/high16 v2, 0x424C0000
    add-int/lit8 v0, v8, -6
    int-to-float v3, v0
    const/high16 v4, 0x42500000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1666
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v0, :L0
    return-void
  :L0
  .line 1667
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->travel()Z
    move-result v10
  .line 1668
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v0
  .line 1669
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1671
    mul-int/lit8 v0, v0, 26
    const/16 v11, 54
    add-int/lit8 v14, v0, 54
    invoke-virtual { v7, v12, v11, v9, v14 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 1672
    const/high16 v0, 0x42580000
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    add-float/2addr v1, v0
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float v15, v1, v0
  .line 1673
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 1674
    const/high16 v16, 0x41D00000
    if-eqz v0, :L1
  .line 1675
    float-to-int v1, v15
    add-int/lit8 v2, v1, 26
    invoke-virtual { v0, v12, v1, v9, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1676
    invoke-virtual { v0, v7 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    goto :L2
  :L1
  .line 1678
    const/high16 v1, 0x3F800000
    add-float v4, v15, v16
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    move v2, v15
    move v3, v13
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  :L2
  .line 1680
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    div-float v0, v0, v16
    float-to-int v0, v0
    const/4 v9, 0
    invoke-static { v9, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 1681
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v1
  .line 1682
    if-nez v1, :L3
    const/4 v1, -1
    const/4 v13, -1
    goto :L4
  :L3
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result v1
    move v13, v1
  :L4
  .line 1683
    if-gez v13, :L5
    const/4 v1, 0
    goto :L6
  :L5
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result v1
  :L6
  .line 1684
    if-nez v1, :L7
    const/4 v4, 0
    goto :L8
  :L7
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark(I)Landroid/graphics/Bitmap;
    move-result-object v1
    move-object v4, v1
  :L8
  .line 1685
    move v3, v0
  :L9
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v0, v0
    if-ge v3, v0, :L22
  .line 1686
    mul-int/lit8 v0, v3, 26
    int-to-float v0, v0
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    add-int/lit8 v2, v0, 54
  .line 1687
    if-lt v2, v14, :L10
    goto/16 :L22
  :L10
  .line 1688
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v3, v0, :L11
    const/16 v17, 1
    goto :L12
  :L11
    const/16 v17, 0
  :L12
  .line 1690
    iget-boolean v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bouncing:Z
    if-eqz v0, :L14
    if-eqz v17, :L13
    const/high16 v0, 0x3F800000
    goto :L15
  :L13
    const/4 v0, 0
    goto :L15
  :L14
  .line 1691
    add-float v0, v15, v16
    add-int/lit8 v1, v2, 26
    int-to-float v1, v1
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(FF)F
    move-result v0
    int-to-float v1, v2
    invoke-static { v15, v1 }, Ljava/lang/Math;->max(FF)F
    move-result v1
    sub-float/2addr v0, v1
    div-float v0, v0, v16
  :L15
  .line 1692
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v1, v1, v3
  .line 1693
    invoke-direct { v6, v3, v8 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitRow(II)V
  .line 1694
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v5, v5, v3
    if-nez v5, :L16
  .line 1696
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    aget-object v5, v0, v3
    const/high16 v17, 0x41000000
    int-to-float v2, v2
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v18
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    move/from16 v19, v2
    move-object v2, v5
    move v5, v3
    move/from16 v3, v17
    move-object v9, v4
    move/from16 v4, v19
    move v11, v5
    const/4 v12, 0
    move/from16 v5, v18
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1697
    move-object/from16 v20, v9
    goto/16 :L21
  :L16
  .line 1699
    move v11, v3
    move-object v9, v4
    const/4 v12, 0
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    iget v4, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    iget v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
    invoke-static { v4, v5, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->blend(IIF)I
    move-result v0
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1700
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v4, " "
    invoke-virtual { v3, v4 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v3
    sub-float/2addr v0, v3
  .line 1701
    if-ne v11, v13, :L18
    if-eqz v9, :L18
  .line 1702
    add-int/lit8 v3, v2, 5
  .line 1703
    iget-object v4, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    float-to-int v0, v0
    add-int/lit8 v5, v0, -16
    add-int/lit8 v12, v3, 16
    invoke-virtual { v4, v5, v3, v0, v12 }, Landroid/graphics/Rect;->set(IIII)V
  .line 1704
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3 }, Landroid/text/TextPaint;->getColor()I
    move-result v3
    if-eq v0, v3, :L17
  .line 1705
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v0
    iput v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
  .line 1706
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    new-instance v3, Landroid/graphics/PorterDuffColorFilter;
    iget v4, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v3, v4, v5 }, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v3 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  :L17
  .line 1709
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    const/4 v12, 0
    invoke-virtual { v7, v9, v12, v0, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 1710
    move-object v12, v1
    move-object/from16 v20, v9
    move v9, v2
    goto :L19
  :L18
  .line 1711
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
    aget-object v3, v0, v11
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    aget v4, v0, v11
    int-to-float v5, v2
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v18
    move-object/from16 v0, p0
    move-object v12, v1
    move-object/from16 v1, p1
    move-object/from16 v20, v9
    move v9, v2
    move-object v2, v3
    move v3, v4
    move v4, v5
    move/from16 v5, v18
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  :L19
  .line 1713
    if-eqz v17, :L20
    iget-boolean v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
    if-eqz v0, :L20
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v0, v0, v11
    if-eq v0, v12, :L20
  .line 1715
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "     "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v0
  .line 1716
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1717
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    int-to-float v2, v9
    add-int/lit8 v3, v8, -8
    int-to-float v3, v3
    add-int/lit8 v4, v9, 26
    int-to-float v4, v4
    invoke-virtual { v7, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 1718
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v2, v2
    sub-float/2addr v1, v2
    add-int/lit8 v2, v9, 19
    int-to-float v2, v2
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v12, v1, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1719
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v3, v3
    sub-float/2addr v1, v3
    add-float/2addr v1, v0
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v12, v1, v2, v0 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1720
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1721
    goto :L21
  :L20
  .line 1723
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    aget-object v2, v0, v11
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    int-to-float v4, v9
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  :L21
  .line 1685
    add-int/lit8 v3, v11, 1
    move-object/from16 v4, v20
    const/4 v9, 0
    const/16 v11, 54
    const/4 v12, 1
    goto/16 :L9
  :L22
  .line 1725
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1726
    if-eqz v10, :L23
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postInvalidateOnAnimation()V
  :L23
  .line 1727
    return-void
.end method

.method prepare()V
  .registers 6
  .line 1643
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v0
  .line 1644
    if-gtz v0, :L0
    return-void
  :L0
  .line 1645
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitHead(I)V
  .line 1646
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v1, :L1
    return-void
  :L1
  .line 1647
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    const/high16 v2, 0x41D00000
    div-float/2addr v1, v2
    float-to-int v1, v1
    const/4 v2, 0
    invoke-static { v2, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
  .line 1648
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v3, v3
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v4
    add-int/2addr v4, v1
    add-int/lit8 v4, v4, 1
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 1649
    nop
  :L2
    if-ge v1, v3, :L3
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitRow(II)V
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 1650
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L4
    goto :L5
  :L4
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result v2
  :L5
  .line 1651
    if-eqz v2, :L6
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark(I)Landroid/graphics/Bitmap;
  :L6
  .line 1652
    return-void
.end method

.method restart()V
  .registers 4
  .line 1569
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1570
    const/16 v1, 38
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  .line 1571
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
  .line 1572
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 1573
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1574
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1575
    return-void
.end method

.method row()I
  .registers 2
  .line 1351
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    return v0
.end method

.method select(Ljava/lang/String;)Z
  .registers 5
  .line 1318
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1319
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1320
    if-gez p1, :L1
    return v1
  :L1
  .line 1321
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1322
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1323
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v0, v0
    sub-int/2addr v0, p1
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    div-int/lit8 p1, p1, 2
    sub-int/2addr v2, p1
    invoke-static { v0, v2 }, Ljava/lang/Math;->min(II)I
    move-result p1
    invoke-static { v1, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1324
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1325
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1326
    const/4 p1, 1
    return p1
  :L2
  .line 1318
    return v1
.end method

.method setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .registers 7
  .line 1287
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1288
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
  .line 1289
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1290
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Back;->song:[I
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
  .line 1291
    nop
  .line 1292
    const/4 p1, 0
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L2
  .line 1293
    aget-object v2, v2, v1
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { p1, v2 }, Ljava/lang/Math;->max(FF)F
    move-result p1
  :L1
  .line 1292
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1295
    const/high16 v1, 0x41800000
    invoke-static { p1, v1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    const/high16 v1, 0x41000000
    add-float/2addr p1, v1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v2, " "
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    add-float/2addr p1, v1
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 1296
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v3, v1
    new-array v3, v3, [Ljava/lang/String;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
  .line 1297
    array-length v3, v1
    new-array v3, v3, [Landroid/graphics/Bitmap;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
  .line 1298
    array-length v3, v1
    new-array v3, v3, [Landroid/graphics/Bitmap;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
  .line 1299
    array-length v1, v1
    new-array v1, v1, [F
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
  .line 1300
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    sub-float/2addr p1, v1
  .line 1301
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L5
  .line 1302
    aget-object v2, v2, v1
    if-eqz v2, :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v4, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    sub-float v2, p1, v2
    aput v2, v3, v1
  :L4
  .line 1301
    add-int/lit8 v1, v1, 1
    goto :L3
  :L5
  .line 1304
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1305
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1306
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v1, p1
    if-lez v1, :L6
    aget v1, p1, v0
    if-gez v1, :L6
    const/4 v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L6
  .line 1307
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length p1, p1
    if-lt v1, p1, :L7
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L7
  .line 1308
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1309
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object p1
    const-string v0, "follow_playing"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L8
  .line 1310
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object p1
  .line 1311
    if-eqz p1, :L8
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->select(Ljava/lang/String;)Z
  :L8
  .line 1313
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1314
    return-void
.end method

.method show(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 5
  .line 1272
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 1273
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Flow;->yearAt(Landroid/content/Context;)I
    move-result v1
  .line 1274
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/Flow;->albumLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1275
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    invoke-static { p1, v0, v1 }, Lcom/innioasis/ipp/Flow;->artistLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1276
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1277
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1278
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1279
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1280
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1281
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1282
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1283
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1284
    return-void
.end method

.method tick()V
  .registers 5
  .line 1578
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->isShown()Z
    move-result v0
    if-eqz v0, :L6
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L6
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length v0, v0
    if-lt v1, v0, :L0
    goto :L6
  :L0
  .line 1579
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-nez v0, :L1
  .line 1580
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 1000
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1581
    return-void
  :L1
  .line 1583
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    aget-object v0, v0, v1
  .line 1584
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v1, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v2
    add-int/lit8 v2, v2, -8
    int-to-float v2, v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float/2addr v2, v3
    cmpg-float v1, v1, v2
    if-gtz v1, :L2
    return-void
  :L2
  .line 1585
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    const/4 v2, 1
    if-lez v1, :L3
  .line 1586
    sub-int/2addr v1, v2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    goto :L5
  :L3
  .line 1588
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    add-int/lit8 v1, v1, 2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1589
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
  .line 1590
    int-to-float v1, v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "     "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v0
    cmpl-float v0, v1, v0
    if-ltz v0, :L4
  .line 1591
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1592
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  :L4
  .line 1594
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  :L5
  .line 1596
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1597
    return-void
  :L6
  .line 1578
    return-void
.end method

.method track()I
  .registers 4
  .line 1419
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length v2, v0
    if-lt v1, v2, :L0
    goto :L1
  :L0
    aget v0, v0, v1
    goto :L2
  :L1
    const/4 v0, -1
  :L2
    return v0
.end method
