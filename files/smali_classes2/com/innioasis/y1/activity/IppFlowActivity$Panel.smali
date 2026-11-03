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

.field private final static BAR_MAX:F = 6000.0F

.field private final static BAR_MIN:F = 700.0F

.field private final static BAR_RATE:F = 22.0F

.field private final static GAP:Ljava/lang/String; = "     "

.field private final static HEAD:I = 54

.field private final static IDLE:I = 1000

.field private final static JUMP:I = 4

.field private final static LEAD:I = 38

.field private final static LIST_MAX:F = 6000.0F

.field private final static LIST_MIN:F = 400.0F

.field private final static LIST_RATE:F = 14.0F

.field private final static MARK:I = 16

.field private final static ROW:I = 26

.field private final static STEP:I = 2

.field private final static TICK:I = 40

.field private artist:Ljava/lang/String;

.field private artistFit:Ljava/lang/String;

.field private artistMask:Landroid/graphics/Bitmap;

.field private final bar:Landroid/graphics/Paint;

.field private barY:F

.field private final bg:Landroid/graphics/Paint;

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

.field private ran:Z

.field private scrollY:F

.field private sel:I

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
  .line 1186
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 1124
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
  .line 1125
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
  .line 1126
    new-instance v3, Landroid/text/TextPaint;
    invoke-direct { v3, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
  .line 1127
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
  .line 1128
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
  .line 1129
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
  .line 1130
    const-string v4, ""
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1131
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1148
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
  .line 1172
    const/high16 v4, 0x41000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 1182
    const/4 v4, -1
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1183
    const/high16 v4, 0xFF000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  .line 1346
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 2
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
  .line 1347
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct { v4 }, Landroid/graphics/Rect;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
  .line 1459
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
  .line 1187
    const/high16 v4, 0x41900000
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1188
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v4, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1189
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 1190
    const/high16 v0, 0x41700000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1191
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1192
    const/high16 v0, 0x41800000
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1193
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1194
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
  .line 1195
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->colours()V
  .line 1196
    return-void
.end method

.method private static approach(FFJFFF)F
  .registers 10
  .line 1428
    sub-float v0, p1, p0
  .line 1429
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v1
  .line 1430
    const/high16 v2, 0x3F000000
    cmpg-float v2, v1, v2
    if-gez v2, :L0
    return p1
  :L0
  .line 1431
    mul-float p4, p4, v1
    invoke-static { p6, p4 }, Ljava/lang/Math;->min(FF)F
    move-result p4
    invoke-static { p5, p4 }, Ljava/lang/Math;->max(FF)F
    move-result p4
  .line 1432
    long-to-float p2, p2
    mul-float p4, p4, p2
    const/high16 p2, 0x447A0000
    div-float/2addr p4, p2
  .line 1433
    cmpl-float p2, p4, v1
    if-ltz p2, :L1
    return p1
  :L1
  .line 1434
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
  .line 1439
    const/4 v0, 0
    cmpg-float v0, p2, v0
    if-gtz v0, :L0
    return p0
  :L0
  .line 1440
    const/high16 v0, 0x3F800000
    cmpl-float v0, p2, v0
    if-ltz v0, :L1
    return p1
  :L1
  .line 1441
    nop
  .line 1442
    const/4 v0, 0
    const/4 v1, 0
  :L2
    const/16 v2, 32
    if-ge v0, v2, :L3
  .line 1443
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 1444
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
  .line 1442
    add-int/lit8 v0, v0, 8
    goto :L2
  :L3
  .line 1446
    return v1
.end method

.method private colours()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 1201
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 1202
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1203
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100267
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1204
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1205
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 1206
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v3, 2131100253
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 1205
    const/4 v3, 1
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1207
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  :L1
  .line 1209
    goto :L3
  :L2
  .line 1208
    move-exception v0
  :L3
  .line 1210
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1211
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1212
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    const v2, 16777215
    and-int/2addr v1, v2
    const/high16 v3, 0xB0000000
    or-int/2addr v1, v3
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1213
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    and-int/2addr v1, v2
    const/high16 v2, 0x50000000
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1214
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v0
  .line 1215
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    if-eqz v0, :L4
    goto :L5
  :L4
    const v0, -16714241
  :L5
    invoke-virtual { v1, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1216
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->highlight()V
  .line 1217
    return-void
.end method

.method private drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .registers 7
  .line 1166
    if-nez p2, :L0
    return-void
  :L0
  .line 1167
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
    invoke-virtual { v0, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1168
    iget-object p5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->maskPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3, p4, p5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 1169
    return-void
.end method

.method private mark(I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 1353
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
    if-eq p1, v0, :L3
  .line 1354
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
  .line 1355
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L0
  .line 1357
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L1
  .line 1359
    goto :L3
  :L2
  .line 1358
    move-exception p1
  :L3
  .line 1361
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method private static mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 8
  .line 1152
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L3
    if-gtz p2, :L0
    goto :L3
  :L0
  .line 1154
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;
    invoke-static { p2, p3, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p2
  .line 1155
    invoke-virtual { p1 }, Landroid/text/TextPaint;->getColor()I
    move-result p3
  .line 1156
    const/high16 v1, 0xFF000000
    invoke-virtual { p1, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1157
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, p2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    const/4 v2, 0
    int-to-float p4, p4
    invoke-virtual { v1, p0, v2, p4, p1 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1158
    invoke-virtual { p1, p3 }, Landroid/text/TextPaint;->setColor(I)V
  :L1
  .line 1159
    return-object p2
  :L2
  .line 1160
    move-exception p0
  .line 1161
    return-object v0
  :L3
  .line 1152
    return-object v0
.end method

.method static playingPath()Ljava/lang/String;
  .catchall { :L0 .. :L4 } :L5
  .registers 2
  .line 1336
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1337
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1338
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1339
    move-exception v1
  .line 1340
    return-object v0
.end method

.method private rowOf(Ljava/lang/String;)I
  .registers 5
  .line 1327
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
  .line 1328
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
  .line 1327
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1330
    const/4 p1, -1
    return p1
.end method

.method private rows()I
  .registers 3
  .line 1494
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
  .line 1366
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1367
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1368
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1369
    return-void
.end method

.method private travel()Z
  .registers 16
  .line 1411
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v1, v1, 26
    int-to-float v9, v1
  .line 1412
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    const/4 v10, 0
    if-nez v1, :L0
  .line 1413
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1414
    iput v9, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1415
    return v10
  :L0
  .line 1417
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 1418
    iget-wide v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
    const-wide/16 v11, 0
    cmp-long v5, v3, v11
    if-nez v5, :L1
    const-wide/16 v3, 16
    goto :L2
  :L1
    const-wide/16 v5, 50
    sub-long v3, v1, v3
    invoke-static { v5, v6, v3, v4 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v3
  :L2
    move-wide v13, v3
  .line 1419
    iput-wide v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1420
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    const/high16 v5, 0x41B00000
    const/high16 v6, 0x442F0000
    const v7, 1169915904
    move v2, v0
    move-wide v3, v13
    invoke-static/range { v1 .. v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->approach(FFJFFF)F
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1421
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    const/high16 v6, 0x41600000
    const/high16 v7, 0x43C80000
    const v8, 1169915904
    move v3, v9
    move-wide v4, v13
    invoke-static/range { v2 .. v8 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->approach(FFJFFF)F
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1422
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    cmpl-float v0, v2, v0
    if-nez v0, :L3
    cmpl-float v0, v1, v9
    if-eqz v0, :L4
  :L3
    const/4 v10, 1
  :L4
  .line 1423
    if-nez v10, :L5
    iput-wide v11, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  :L5
  .line 1424
    return v10
.end method

.method follow(Ljava/lang/String;)Z
  .registers 7
  .line 1291
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 1292
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1293
    if-gez p1, :L1
    return v1
  :L1
  .line 1294
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    const/4 v2, 1
    if-ne p1, v0, :L2
    return v2
  :L2
  .line 1295
    sub-int v0, p1, v0
    invoke-static { v0 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    const/4 v3, 4
    if-le v0, v3, :L3
    const/4 v1, 1
  :L3
  .line 1296
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1297
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1298
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-lez v0, :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    add-int/lit8 v4, v0, -1
    aget v3, v3, v4
    if-gez v3, :L4
    add-int/lit8 v3, v0, -1
    goto :L5
  :L4
    move v3, v0
  :L5
  .line 1299
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v3, v4, :L6
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1300
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v3, p1
    if-lt v0, v3, :L7
    sub-int/2addr v0, p1
    add-int/2addr v0, v2
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L7
  .line 1301
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p1
    if-eqz p1, :L8
    if-eqz v1, :L9
  :L8
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  :L9
  .line 1302
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1303
    return v2
  :L10
  .line 1291
    return v1
.end method

.method highlight()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 1222
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  :L1
  .line 1224
    goto :L3
  :L2
  .line 1223
    move-exception v0
  :L3
  .line 1225
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1226
    return-void
.end method

.method move(I)V
  .registers 7
  .line 1377
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L20
    array-length v0, v0
    if-nez v0, :L0
    goto/16 :L20
  :L0
  .line 1378
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L1
  .line 1380
    add-int/2addr v0, p1
  .line 1381
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
    aget v1, v1, v0
    if-ltz v1, :L1
  :L2
  .line 1382
    nop
  .line 1383
    const/4 v1, 0
    const/4 v2, 1
    if-ltz v0, :L3
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v3, v3
    if-lt v0, v3, :L12
  :L3
  .line 1384
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 1386
    if-lez p1, :L5
    goto :L6
  :L5
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v0, v0
    add-int/lit8 v1, v0, -1
  :L6
    move v0, v1
  :L7
  .line 1387
    if-ltz v0, :L10
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v3, v1
    if-ge v0, v3, :L10
    aget v1, v1, v0
    if-gez v1, :L10
    if-lez p1, :L8
    const/4 v1, 1
    goto :L9
  :L8
    const/4 v1, -1
  :L9
    add-int/2addr v0, v1
    goto :L7
  :L10
  .line 1388
    if-ltz v0, :L19
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length p1, p1
    if-ge v0, p1, :L19
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v0, p1, :L11
    goto :L19
  :L11
  .line 1389
    const/4 v1, 1
  :L12
  .line 1391
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1392
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1394
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-lez v0, :L13
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    add-int/lit8 v4, v0, -1
    aget v3, v3, v4
    if-gez v3, :L13
    add-int/lit8 v3, v0, -1
    goto :L14
  :L13
    move v3, v0
  :L14
  .line 1395
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v3, v4, :L15
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L15
  .line 1396
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v3, p1
    if-lt v0, v3, :L16
    sub-int/2addr v0, p1
    add-int/2addr v0, v2
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L16
  .line 1399
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p1
    if-eqz p1, :L17
    if-nez v1, :L17
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 p1, p1, 26
    int-to-float p1, p1
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    sub-float/2addr p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    const/high16 v0, 0x42D00000
    cmpl-float p1, p1, v0
    if-lez p1, :L18
  :L17
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  :L18
  .line 1400
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1401
    return-void
  :L19
  .line 1388
    return-void
  :L20
  .line 1377
    return-void
.end method

.method near(I)V
  .registers 5
  .line 1310
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    if-eqz v0, :L7
    array-length v1, v0
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1311
    array-length v0, v0
    add-int/lit8 v0, v0, -1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  :L1
  .line 1312
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge p1, v2, :L2
    aget v2, v1, p1
    if-gez v2, :L2
    add-int/lit8 p1, p1, 1
    goto :L1
  :L2
  .line 1313
    array-length v2, v1
    if-lt p1, v2, :L4
  .line 1314
    array-length p1, v1
    add-int/lit8 p1, p1, -1
  :L3
  .line 1315
    if-lez p1, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    aget v1, v1, p1
    if-gez v1, :L4
    add-int/lit8 p1, p1, -1
    goto :L3
  :L4
  .line 1317
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1318
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1319
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
  .line 1320
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ge v1, v0, :L5
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L5
  .line 1321
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v0, p1
    if-lt v1, v0, :L6
    sub-int/2addr v1, p1
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1322
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1323
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1324
    return-void
  :L7
  .line 1310
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 28
  .line 1499
    move-object/from16 v6, p0
    move-object/from16 v7, p1
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v8
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v9
  .line 1500
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitW:I
    const/4 v10, 0
    if-eq v8, v0, :L0
  .line 1501
    iput v8, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitW:I
  .line 1502
    iput-object v10, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1503
    iput-object v10, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1504
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    if-eqz v0, :L0
  .line 1505
    array-length v0, v0
    new-array v0, v0, [Ljava/lang/String;
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
  .line 1506
    array-length v0, v0
    new-array v0, v0, [Landroid/graphics/Bitmap;
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
  :L0
  .line 1509
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
    const/16 v1, 22
    const/16 v2, 30
    if-nez v0, :L1
  .line 1510
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    add-int/lit8 v4, v8, -16
    int-to-float v5, v4
    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v0, v3, v5, v11 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1511
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    invoke-static { v0, v3, v4, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleMask:Landroid/graphics/Bitmap;
  :L1
  .line 1513
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
    if-nez v0, :L2
  .line 1514
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    add-int/lit8 v4, v8, -16
    int-to-float v5, v4
    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v0, v3, v5, v11 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1515
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-static { v0, v3, v4, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistMask:Landroid/graphics/Bitmap;
  :L2
  .line 1517
    const/4 v1, 0
    const/4 v2, 0
    int-to-float v11, v8
    int-to-float v12, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    move v3, v11
    move v4, v12
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1518
    const/high16 v4, 0x3F800000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1519
    const/4 v13, 1
    sub-int/2addr v9, v13
    int-to-float v2, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v4, v12
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1520
    const/4 v2, 0
    const/high16 v3, 0x3F800000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1521
    add-int/lit8 v9, v8, -1
    int-to-float v14, v9
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v1, v14
    move v3, v11
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1522
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleMask:Landroid/graphics/Bitmap;
    const/high16 v3, 0x41000000
    const/4 v4, 0
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1523
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistMask:Landroid/graphics/Bitmap;
    const/high16 v4, 0x41A80000
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1524
    const/high16 v1, 0x40C00000
    const/high16 v2, 0x424C0000
    add-int/lit8 v0, v8, -6
    int-to-float v3, v0
    const/high16 v4, 0x42500000
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1525
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v0, :L3
    return-void
  :L3
  .line 1526
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->travel()Z
    move-result v11
  .line 1527
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v0
  .line 1528
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1530
    const/16 v12, 26
    mul-int/lit8 v0, v0, 26
    const/16 v15, 54
    add-int/lit8 v5, v0, 54
    invoke-virtual { v7, v13, v15, v9, v5 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 1531
    const/high16 v0, 0x42580000
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    add-float/2addr v1, v0
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float v4, v1, v0
  .line 1532
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 1533
    const/high16 v16, 0x41D00000
    if-eqz v0, :L4
  .line 1534
    float-to-int v1, v4
    add-int/lit8 v2, v1, 26
    invoke-virtual { v0, v13, v1, v9, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1535
    invoke-virtual { v0, v7 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    move v14, v4
    move v9, v5
    goto :L5
  :L4
  .line 1537
    const/high16 v1, 0x3F800000
    add-float v9, v4, v16
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    move-object/from16 v0, p1
    move v2, v4
    move-object/from16 v17, v3
    move v3, v14
    move v14, v4
    move v4, v9
    move v9, v5
    move-object/from16 v5, v17
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  :L5
  .line 1539
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    div-float v0, v0, v16
    float-to-int v0, v0
    const/4 v5, 0
    invoke-static { v5, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 1540
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v1
  .line 1541
    if-nez v1, :L6
    const/4 v1, -1
    const/4 v4, -1
    goto :L7
  :L6
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result v1
    move v4, v1
  :L7
  .line 1542
    if-gez v4, :L8
    const/4 v1, 0
    goto :L9
  :L8
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result v1
  :L9
  .line 1543
    if-nez v1, :L10
    move-object v3, v10
    goto :L11
  :L10
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark(I)Landroid/graphics/Bitmap;
    move-result-object v1
    move-object v3, v1
  :L11
  .line 1544
    move v2, v0
  :L12
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v0, v0
    if-ge v2, v0, :L27
  .line 1545
    mul-int/lit8 v0, v2, 26
    int-to-float v0, v0
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    add-int/lit8 v1, v0, 54
  .line 1546
    if-lt v1, v9, :L13
    goto/16 :L27
  :L13
  .line 1547
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v2, v0, :L14
    const/16 v17, 1
    goto :L15
  :L14
    const/16 v17, 0
  :L15
  .line 1549
    add-float v0, v14, v16
    add-int/lit8 v5, v1, 26
    int-to-float v5, v5
    invoke-static { v0, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v0
    int-to-float v13, v1
    invoke-static { v14, v13 }, Ljava/lang/Math;->max(FF)F
    move-result v19
    sub-float v0, v0, v19
    div-float v0, v0, v16
  .line 1550
    iget-object v15, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v15, v15, v2
  .line 1551
    iget-object v10, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v10, v10, v2
    if-nez v10, :L17
  .line 1553
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v1, v0, v2
    if-nez v1, :L16
  .line 1554
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    add-int/lit8 v5, v8, -16
    int-to-float v10, v5
    sget-object v12, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v15, v1, v10, v12 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    aput-object v1, v0, v2
  .line 1555
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v1, v1, v2
    iget-object v10, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    const/16 v12, 19
    const/16 v15, 26
    invoke-static { v1, v10, v5, v15, v12 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v1
    aput-object v1, v0, v2
  :L16
  .line 1557
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    aget-object v5, v0, v2
    const/high16 v10, 0x41000000
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v12
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    move v15, v2
    move-object v2, v5
    move-object v5, v3
    move v3, v10
    move v10, v4
    move v4, v13
    move-object v13, v5
    const/16 v18, 0
    move v5, v12
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  .line 1558
    move/from16 v21, v8
    move/from16 v24, v9
    move/from16 v25, v10
    move-object/from16 v23, v13
    move v10, v15
    const/16 v8, 26
    const/16 v20, 0
    goto/16 :L26
  :L17
  .line 1560
    move-object v12, v3
    move v10, v4
    const/16 v18, 0
    move v4, v2
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    move/from16 v22, v5
    iget v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
    invoke-static { v3, v5, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->blend(IIF)I
    move-result v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1561
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v3, " "
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    sub-float/2addr v0, v2
  .line 1562
    if-ne v4, v10, :L19
    if-eqz v12, :L19
  .line 1563
    add-int/lit8 v2, v1, 5
  .line 1564
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    float-to-int v0, v0
    add-int/lit8 v5, v0, -16
    move/from16 v23, v1
    add-int/lit8 v1, v2, 16
    invoke-virtual { v3, v5, v2, v0, v1 }, Landroid/graphics/Rect;->set(IIII)V
  .line 1565
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v1 }, Landroid/text/TextPaint;->getColor()I
    move-result v1
    if-eq v0, v1, :L18
  .line 1566
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v0
    iput v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
  .line 1567
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;
    iget v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2, v3 }, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  :L18
  .line 1570
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    const/4 v5, 0
    invoke-virtual { v7, v12, v5, v0, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 1571
    move-object/from16 v20, v5
    move/from16 v24, v9
    move/from16 v25, v10
    move/from16 v9, v23
    move v10, v4
    move-object/from16 v23, v12
    move/from16 v12, v22
    goto :L22
  :L19
  .line 1562
    move/from16 v23, v1
    const/4 v5, 0
  .line 1572
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
    aget-object v1, v0, v4
    if-nez v1, :L20
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v1, v1, v4
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v5, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    aget v5, v5, v4
    sub-float/2addr v3, v5
    move/from16 v24, v9
    move/from16 v25, v10
    float-to-double v9, v3
    invoke-static { v9, v10 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v9
    double-to-int v3, v9
    const/16 v5, 19
    const/16 v9, 26
    invoke-static { v1, v2, v3, v9, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v1
    aput-object v1, v0, v4
    goto :L21
  :L20
    move/from16 v24, v9
    move/from16 v25, v10
  :L21
  .line 1573
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
    aget-object v2, v0, v4
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    aget v3, v0, v4
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    move/from16 v9, v23
    move-object/from16 v1, p1
    move v10, v4
    move v4, v13
    move-object/from16 v23, v12
    move/from16 v12, v22
    const/16 v20, 0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  :L22
  .line 1575
    add-int/lit8 v0, v8, -8
    int-to-float v0, v0
    iget v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float v1, v0, v1
  .line 1576
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v2, v10
    if-nez v3, :L23
  .line 1577
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v15, v3, v1, v4 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    aput-object v3, v2, v10
  .line 1578
    iget-object v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v3, v3, v10
    iget-object v4, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    float-to-int v1, v1
    move/from16 v21, v8
    const/16 v5, 19
    const/16 v8, 26
    invoke-static { v3, v4, v1, v8, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mask(Ljava/lang/String;Landroid/text/TextPaint;III)Landroid/graphics/Bitmap;
    move-result-object v1
    aput-object v1, v2, v10
    goto :L24
  :L23
  .line 1576
    move/from16 v21, v8
    const/16 v8, 26
  :L24
  .line 1580
    if-eqz v17, :L25
    iget-boolean v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
    if-eqz v1, :L25
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
    aget-object v1, v1, v10
    if-eq v1, v15, :L25
  .line 1582
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "     "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
  .line 1583
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1584
    iget v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    invoke-virtual { v7, v2, v13, v0, v12 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 1585
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v2, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v2, v2
    sub-float/2addr v0, v2
    add-int/lit8 v2, v9, 19
    int-to-float v2, v2
    iget-object v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v15, v0, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1586
    iget v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v3, v3
    sub-float/2addr v0, v3
    add-float/2addr v0, v1
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v15, v0, v2, v1 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1587
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1588
    goto :L26
  :L25
  .line 1590
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
    aget-object v2, v0, v10
    iget v3, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getColor()I
    move-result v5
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    move v4, v13
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->drawMask(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFI)V
  :L26
  .line 1544
    add-int/lit8 v2, v10, 1
    move-object/from16 v10, v20
    move/from16 v8, v21
    move-object/from16 v3, v23
    move/from16 v9, v24
    move/from16 v4, v25
    const/4 v5, 0
    const/16 v12, 26
    const/4 v13, 1
    const/16 v15, 54
    goto/16 :L12
  :L27
  .line 1592
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1593
    if-eqz v11, :L28
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postInvalidateOnAnimation()V
  :L28
  .line 1594
    return-void
.end method

.method restart()V
  .registers 4
  .line 1463
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1464
    const/16 v1, 38
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  .line 1465
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
  .line 1466
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 1467
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1468
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1469
    return-void
.end method

.method row()I
  .registers 2
  .line 1306
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    return v0
.end method

.method select(Ljava/lang/String;)Z
  .registers 5
  .line 1275
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1276
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1277
    if-gez p1, :L1
    return v1
  :L1
  .line 1278
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1279
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1280
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
  .line 1281
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1282
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1283
    const/4 p1, 1
    return p1
  :L2
  .line 1275
    return v1
.end method

.method setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .registers 7
  .line 1244
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1245
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
  .line 1246
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1247
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Back;->song:[I
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
  .line 1248
    nop
  .line 1249
    const/4 p1, 0
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L2
  .line 1250
    aget-object v2, v2, v1
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { p1, v2 }, Ljava/lang/Math;->max(FF)F
    move-result p1
  :L1
  .line 1249
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1252
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
  .line 1253
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v3, v1
    new-array v3, v3, [Ljava/lang/String;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fitted:[Ljava/lang/String;
  .line 1254
    array-length v3, v1
    new-array v3, v3, [Landroid/graphics/Bitmap;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameMask:[Landroid/graphics/Bitmap;
  .line 1255
    array-length v3, v1
    new-array v3, v3, [Landroid/graphics/Bitmap;
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numMask:[Landroid/graphics/Bitmap;
  .line 1256
    array-length v1, v1
    new-array v1, v1, [F
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
  .line 1257
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    sub-float/2addr p1, v1
  .line 1258
    const/4 v1, 0
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L5
  .line 1259
    aget-object v2, v2, v1
    if-eqz v2, :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->numAt:[F
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v4, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    sub-float v2, p1, v2
    aput v2, v3, v1
  :L4
  .line 1258
    add-int/lit8 v1, v1, 1
    goto :L3
  :L5
  .line 1261
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1262
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1263
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v1, p1
    if-lez v1, :L6
    aget v1, p1, v0
    if-gez v1, :L6
    const/4 v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L6
  .line 1264
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length p1, p1
    if-lt v1, p1, :L7
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L7
  .line 1265
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1266
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object p1
    const-string v0, "follow_playing"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L8
  .line 1267
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object p1
  .line 1268
    if-eqz p1, :L8
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->select(Ljava/lang/String;)Z
  :L8
  .line 1270
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1271
    return-void
.end method

.method show(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 5
  .line 1229
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 1230
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Flow;->yearAt(Landroid/content/Context;)I
    move-result v1
  .line 1231
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/Flow;->albumLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1232
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    invoke-static { p1, v0, v1 }, Lcom/innioasis/ipp/Flow;->artistLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1233
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->titleFit:Ljava/lang/String;
  .line 1234
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artistFit:Ljava/lang/String;
  .line 1235
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1236
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1237
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1238
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1239
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1240
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1241
    return-void
.end method

.method tick()V
  .registers 5
  .line 1472
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
  .line 1473
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-nez v0, :L1
  .line 1474
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 1000
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1475
    return-void
  :L1
  .line 1477
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    aget-object v0, v0, v1
  .line 1478
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
  .line 1479
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    const/4 v2, 1
    if-lez v1, :L3
  .line 1480
    sub-int/2addr v1, v2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    goto :L5
  :L3
  .line 1482
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    add-int/lit8 v1, v1, 2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1483
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->ran:Z
  .line 1484
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
  .line 1485
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1486
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  :L4
  .line 1488
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  :L5
  .line 1490
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1491
    return-void
  :L6
  .line 1472
    return-void
.end method

.method track()I
  .registers 4
  .line 1373
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
