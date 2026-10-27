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

.field private final bar:Landroid/graphics/Paint;

.field private barY:F

.field private final bg:Landroid/graphics/Paint;

.field private fg:I

.field private fgSel:I

.field private first:I

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

.field private nameX:F

.field private names:[Ljava/lang/String;

.field private nums:[Ljava/lang/String;

.field private offset:I

.field private scrollY:F

.field private sel:I

.field private song:[I

.field songs:Ljava/util/List;

.field private final sub:Landroid/text/TextPaint;

.field private final text:Landroid/text/TextPaint;

.field private final tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;

.field private title:Ljava/lang/String;

.method constructor <init>(Landroid/content/Context;)V
  .registers 8
  .line 1126
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 1098
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
  .line 1099
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
  .line 1100
    new-instance v3, Landroid/text/TextPaint;
    invoke-direct { v3, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
  .line 1101
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
  .line 1102
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
  .line 1103
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
  .line 1104
    const-string v4, ""
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1105
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1112
    const/high16 v4, 0x41000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 1122
    const/4 v4, -1
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1123
    const/high16 v4, 0xFF000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  .line 1276
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 2
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
  .line 1277
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct { v4 }, Landroid/graphics/Rect;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
  .line 1387
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
  .line 1127
    const/high16 v4, 0x41900000
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1128
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v4, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1129
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 1130
    const/high16 v0, 0x41700000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1131
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1132
    const/high16 v0, 0x41800000
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1133
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 1134
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
  .line 1135
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->colours()V
  .line 1136
    return-void
.end method

.method private static approach(FFJFFF)F
  .registers 10
  .line 1358
    sub-float v0, p1, p0
  .line 1359
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v1
  .line 1360
    const/high16 v2, 0x3F000000
    cmpg-float v2, v1, v2
    if-gez v2, :L0
    return p1
  :L0
  .line 1361
    mul-float p4, p4, v1
    invoke-static { p6, p4 }, Ljava/lang/Math;->min(FF)F
    move-result p4
    invoke-static { p5, p4 }, Ljava/lang/Math;->max(FF)F
    move-result p4
  .line 1362
    long-to-float p2, p2
    mul-float p4, p4, p2
    const/high16 p2, 0x447A0000
    div-float/2addr p4, p2
  .line 1363
    cmpl-float p2, p4, v1
    if-ltz p2, :L1
    return p1
  :L1
  .line 1364
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
  .line 1369
    const/4 v0, 0
    cmpg-float v0, p2, v0
    if-gtz v0, :L0
    return p0
  :L0
  .line 1370
    const/high16 v0, 0x3F800000
    cmpl-float v0, p2, v0
    if-ltz v0, :L1
    return p1
  :L1
  .line 1371
    nop
  .line 1372
    const/4 v0, 0
    const/4 v1, 0
  :L2
    const/16 v2, 32
    if-ge v0, v2, :L3
  .line 1373
    ushr-int v2, p0, v0
    and-int/lit16 v2, v2, 255
    ushr-int v3, p1, v0
    and-int/lit16 v3, v3, 255
  .line 1374
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
  .line 1372
    add-int/lit8 v0, v0, 8
    goto :L2
  :L3
  .line 1376
    return v1
.end method

.method private colours()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 1141
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 1142
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1143
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100267
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1144
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 1145
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 1146
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v3, 2131100253
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 1145
    const/4 v3, 1
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1147
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  :L1
  .line 1149
    goto :L3
  :L2
  .line 1148
    move-exception v0
  :L3
  .line 1150
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1151
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1152
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    const v2, 16777215
    and-int/2addr v1, v2
    const/high16 v3, 0xB0000000
    or-int/2addr v1, v3
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1153
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    and-int/2addr v1, v2
    const/high16 v2, 0x50000000
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1154
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v0
  .line 1155
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    if-eqz v0, :L4
    goto :L5
  :L4
    const v0, -16714241
  :L5
    invoke-virtual { v1, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 1156
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->highlight()V
  .line 1157
    return-void
.end method

.method private mark(I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 1283
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
    if-eq p1, v0, :L3
  .line 1284
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markRes:I
  .line 1285
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L0
  .line 1287
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
  :L1
  .line 1289
    goto :L3
  :L2
  .line 1288
    move-exception p1
  :L3
  .line 1291
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method static playingPath()Ljava/lang/String;
  .catchall { :L0 .. :L4 } :L5
  .registers 2
  .line 1266
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1267
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1268
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1269
    move-exception v1
  .line 1270
    return-object v0
.end method

.method private rowOf(Ljava/lang/String;)I
  .registers 5
  .line 1257
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
  .line 1258
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
  .line 1257
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1260
    const/4 p1, -1
    return p1
.end method

.method private rows()I
  .registers 3
  .line 1420
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
  .line 1296
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1297
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1298
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1299
    return-void
.end method

.method private travel()Z
  .registers 16
  .line 1341
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    mul-int/lit8 v0, v0, 26
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    mul-int/lit8 v1, v1, 26
    int-to-float v9, v1
  .line 1342
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    const/4 v10, 0
    if-nez v1, :L0
  .line 1343
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1344
    iput v9, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1345
    return v10
  :L0
  .line 1347
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 1348
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
  .line 1349
    iput-wide v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  .line 1350
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    const/high16 v5, 0x41B00000
    const/high16 v6, 0x442F0000
    const v7, 1169915904
    move v2, v0
    move-wide v3, v13
    invoke-static/range { v1 .. v7 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->approach(FFJFFF)F
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
  .line 1351
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    const/high16 v6, 0x41600000
    const/high16 v7, 0x43C80000
    const v8, 1169915904
    move v3, v9
    move-wide v4, v13
    invoke-static/range { v2 .. v8 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->approach(FFJFFF)F
    move-result v1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
  .line 1352
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    cmpl-float v0, v2, v0
    if-nez v0, :L3
    cmpl-float v0, v1, v9
    if-eqz v0, :L4
  :L3
    const/4 v10, 1
  :L4
  .line 1353
    if-nez v10, :L5
    iput-wide v11, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->frameAt:J
  :L5
  .line 1354
    return v10
.end method

.method follow(Ljava/lang/String;)Z
  .registers 7
  .line 1221
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 1222
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1223
    if-gez p1, :L1
    return v1
  :L1
  .line 1224
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    const/4 v2, 1
    if-ne p1, v0, :L2
    return v2
  :L2
  .line 1225
    sub-int v0, p1, v0
    invoke-static { v0 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    const/4 v3, 4
    if-le v0, v3, :L3
    const/4 v1, 1
  :L3
  .line 1226
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1227
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1228
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
  .line 1229
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v3, v4, :L6
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1230
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v3, p1
    if-lt v0, v3, :L7
    sub-int/2addr v0, p1
    add-int/2addr v0, v2
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L7
  .line 1231
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p1
    if-eqz p1, :L8
    if-eqz v1, :L9
  :L8
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  :L9
  .line 1232
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1233
    return v2
  :L10
  .line 1221
    return v1
.end method

.method highlight()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 1162
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  :L1
  .line 1164
    goto :L3
  :L2
  .line 1163
    move-exception v0
  :L3
  .line 1165
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1166
    return-void
.end method

.method move(I)V
  .registers 7
  .line 1307
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L20
    array-length v0, v0
    if-nez v0, :L0
    goto/16 :L20
  :L0
  .line 1308
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L1
  .line 1310
    add-int/2addr v0, p1
  .line 1311
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
    aget v1, v1, v0
    if-ltz v1, :L1
  :L2
  .line 1312
    nop
  .line 1313
    const/4 v1, 0
    const/4 v2, 1
    if-ltz v0, :L3
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v3, v3
    if-lt v0, v3, :L12
  :L3
  .line 1314
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 1316
    if-lez p1, :L5
    goto :L6
  :L5
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v0, v0
    add-int/lit8 v1, v0, -1
  :L6
    move v0, v1
  :L7
  .line 1317
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
  .line 1318
    if-ltz v0, :L19
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length p1, p1
    if-ge v0, p1, :L19
    iget p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v0, p1, :L11
    goto :L19
  :L11
  .line 1319
    const/4 v1, 1
  :L12
  .line 1321
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1322
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1324
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
  .line 1325
    iget v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v3, v4, :L15
    iput v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L15
  .line 1326
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v3, p1
    if-lt v0, v3, :L16
    sub-int/2addr v0, p1
    add-int/2addr v0, v2
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L16
  .line 1329
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
  .line 1330
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1331
    return-void
  :L19
  .line 1318
    return-void
  :L20
  .line 1307
    return-void
.end method

.method near(I)V
  .registers 5
  .line 1240
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    if-eqz v0, :L7
    array-length v1, v0
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1241
    array-length v0, v0
    add-int/lit8 v0, v0, -1
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  :L1
  .line 1242
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge p1, v2, :L2
    aget v2, v1, p1
    if-gez v2, :L2
    add-int/lit8 p1, p1, 1
    goto :L1
  :L2
  .line 1243
    array-length v2, v1
    if-lt p1, v2, :L4
  .line 1244
    array-length p1, v1
    add-int/lit8 p1, p1, -1
  :L3
  .line 1245
    if-lez p1, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    aget v1, v1, p1
    if-gez v1, :L4
    add-int/lit8 p1, p1, -1
    goto :L3
  :L4
  .line 1247
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1248
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1249
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
  .line 1250
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ge v1, v0, :L5
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L5
  .line 1251
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v0, p1
    if-lt v1, v0, :L6
    sub-int/2addr v1, p1
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 1252
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1253
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1254
    return-void
  :L7
  .line 1240
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 25
  .line 1425
    move-object/from16 v0, p0
    move-object/from16 v7, p1
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v8
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v9
  .line 1426
    const/4 v2, 0
    const/4 v3, 0
    int-to-float v10, v8
    int-to-float v11, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    move v4, v10
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1427
    const/high16 v5, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1428
    const/4 v12, 1
    sub-int/2addr v9, v12
    int-to-float v3, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1429
    const/4 v3, 0
    const/high16 v4, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1430
    add-int/lit8 v9, v8, -1
    int-to-float v13, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v2, v13
    move v4, v10
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1431
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    add-int/lit8 v3, v8, -16
    int-to-float v10, v3
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    const/high16 v2, 0x41B00000
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    const/high16 v11, 0x41000000
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1433
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    const/high16 v2, 0x422C0000
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1435
    const/high16 v2, 0x40C00000
    const/high16 v3, 0x424C0000
    add-int/lit8 v1, v8, -6
    int-to-float v4, v1
    const/high16 v5, 0x42500000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 1436
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v1, :L0
    return-void
  :L0
  .line 1437
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->travel()Z
    move-result v14
  .line 1438
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v1
  .line 1439
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1441
    mul-int/lit8 v1, v1, 26
    const/16 v15, 54
    add-int/lit8 v6, v1, 54
    invoke-virtual { v7, v12, v15, v9, v6 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 1442
    const/high16 v1, 0x42580000
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->barY:F
    add-float/2addr v2, v1
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float v5, v2, v1
  .line 1443
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 1444
    const/high16 v16, 0x41D00000
    if-eqz v1, :L1
  .line 1445
    float-to-int v2, v5
    add-int/lit8 v3, v2, 26
    invoke-virtual { v1, v12, v2, v9, v3 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1446
    invoke-virtual { v1, v7 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    move v13, v5
    move v9, v6
    goto :L2
  :L1
  .line 1448
    const/high16 v2, 0x3F800000
    add-float v9, v5, v16
    iget-object v4, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    move v3, v5
    move-object/from16 v17, v4
    move v4, v13
    move v13, v5
    move v5, v9
    move v9, v6
    move-object/from16 v6, v17
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  :L2
  .line 1450
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    div-float v1, v1, v16
    float-to-int v1, v1
    const/4 v2, 0
    invoke-static { v2, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
  .line 1451
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object v3
  .line 1452
    if-nez v3, :L3
    const/4 v3, -1
    goto :L4
  :L3
    invoke-direct { v0, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result v3
  :L4
  .line 1453
    if-gez v3, :L5
    const/4 v4, 0
    goto :L6
  :L5
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result v4
  :L6
  .line 1454
    if-nez v4, :L7
    const/4 v4, 0
    goto :L8
  :L7
    invoke-direct { v0, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->mark(I)Landroid/graphics/Bitmap;
    move-result-object v4
  :L8
  .line 1455
    nop
  :L9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v6, v6
    if-ge v1, v6, :L19
  .line 1456
    mul-int/lit8 v6, v1, 26
    int-to-float v6, v6
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->scrollY:F
    sub-float/2addr v6, v2
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v2
    add-int/2addr v2, v15
  .line 1457
    if-lt v2, v9, :L10
    goto/16 :L19
  :L10
  .line 1458
    iget v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v1, v6, :L11
    const/4 v6, 1
    goto :L12
  :L11
    const/4 v6, 0
  :L12
  .line 1460
    add-float v12, v13, v16
    add-int/lit8 v15, v2, 26
    int-to-float v15, v15
    invoke-static { v12, v15 }, Ljava/lang/Math;->min(FF)F
    move-result v12
    int-to-float v5, v2
    invoke-static { v13, v5 }, Ljava/lang/Math;->max(FF)F
    move-result v18
    sub-float v12, v12, v18
    div-float v12, v12, v16
  .line 1461
    iget-object v11, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v11, v11, v1
  .line 1462
    move/from16 v19, v9
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v9, v9, v1
    if-nez v9, :L13
  .line 1464
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v11, v5, v10, v6 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v5
    invoke-interface { v5 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v5
    add-int/lit8 v2, v2, 19
    int-to-float v2, v2
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    const/high16 v9, 0x41000000
    invoke-virtual { v7, v5, v9, v2, v6 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1466
    move/from16 v22, v3
    move/from16 v20, v10
    move/from16 v21, v13
    const/4 v10, 0
    goto/16 :L18
  :L13
  .line 1468
    const/high16 v9, 0x41000000
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    move/from16 v20, v10
    iget v10, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    move/from16 v21, v13
    iget v13, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
    invoke-static { v10, v13, v12 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->blend(IIF)I
    move-result v10
    invoke-virtual { v9, v10 }, Landroid/text/TextPaint;->setColor(I)V
  .line 1469
    iget v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v10, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v12, " "
    invoke-virtual { v10, v12 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v10
    sub-float/2addr v9, v10
  .line 1470
    if-ne v1, v3, :L15
    if-eqz v4, :L15
  .line 1471
    add-int/lit8 v10, v2, 5
  .line 1472
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    float-to-int v9, v9
    add-int/lit8 v13, v9, -16
    move/from16 v22, v3
    add-int/lit8 v3, v10, 16
    invoke-virtual { v12, v13, v10, v9, v3 }, Landroid/graphics/Rect;->set(IIII)V
  .line 1473
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v9 }, Landroid/text/TextPaint;->getColor()I
    move-result v9
    if-eq v3, v9, :L14
  .line 1474
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3 }, Landroid/text/TextPaint;->getColor()I
    move-result v3
    iput v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
  .line 1475
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    new-instance v9, Landroid/graphics/PorterDuffColorFilter;
    iget v10, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markColour:I
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v9, v10, v12 }, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v3, v9 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  :L14
  .line 1478
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markTo:Landroid/graphics/Rect;
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->markPaint:Landroid/graphics/Paint;
    const/4 v10, 0
    invoke-virtual { v7, v4, v10, v3, v9 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 1479
    goto :L16
  :L15
  .line 1470
    move/from16 v22, v3
    const/4 v10, 0
  .line 1480
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v3, v3, v1
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v12, v3 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v12
    sub-float/2addr v9, v12
    add-int/lit8 v12, v2, 19
    int-to-float v12, v12
    iget-object v13, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v3, v9, v12, v13 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L16
  .line 1482
    add-int/lit8 v3, v8, -8
    int-to-float v3, v3
    iget v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float v9, v3, v9
  .line 1483
    if-eqz v6, :L17
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v6, v11 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v6
    cmpl-float v6, v6, v9
    if-lez v6, :L17
  .line 1485
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v9, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    const-string v12, "     "
    invoke-virtual { v9, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v9 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v6, v9 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v6
  .line 1486
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 1487
    iget v9, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    invoke-virtual { v7, v9, v5, v3, v15 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 1488
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v5, v5
    sub-float/2addr v3, v5
    add-int/lit8 v2, v2, 19
    int-to-float v2, v2
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v11, v3, v2, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1489
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v5, v5
    sub-float/2addr v3, v5
    add-float/2addr v3, v6
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v11, v3, v2, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 1490
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1491
    goto :L18
  :L17
  .line 1493
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v11, v3, v9, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    add-int/lit8 v2, v2, 19
    int-to-float v2, v2
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v3, v5, v2, v6 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L18
  .line 1455
    add-int/lit8 v1, v1, 1
    move/from16 v9, v19
    move/from16 v10, v20
    move/from16 v13, v21
    move/from16 v3, v22
    const/4 v2, 0
    const/high16 v11, 0x41000000
    const/4 v12, 1
    const/16 v15, 54
    goto/16 :L9
  :L19
  .line 1496
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 1497
    if-eqz v14, :L20
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postInvalidateOnAnimation()V
  :L20
  .line 1498
    return-void
.end method

.method restart()V
  .registers 4
  .line 1391
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1392
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  .line 1393
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 1394
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1395
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1396
    return-void
.end method

.method row()I
  .registers 2
  .line 1236
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    return v0
.end method

.method select(Ljava/lang/String;)Z
  .registers 5
  .line 1205
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    const/4 v1, 0
    if-eqz v0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1206
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rowOf(Ljava/lang/String;)I
    move-result p1
  .line 1207
    if-gez p1, :L1
    return v1
  :L1
  .line 1208
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1209
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 1210
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
  .line 1211
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1212
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1213
    const/4 p1, 1
    return p1
  :L2
  .line 1205
    return v1
.end method

.method setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .registers 6
  .line 1182
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1183
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
  .line 1184
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1185
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Back;->song:[I
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
  .line 1186
    nop
  .line 1187
    const/4 p1, 0
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L2
  .line 1188
    aget-object v2, v2, v1
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { p1, v2 }, Ljava/lang/Math;->max(FF)F
    move-result p1
  :L1
  .line 1187
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1190
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
  .line 1191
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1192
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1193
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v1, p1
    if-lez v1, :L3
    aget v1, p1, v0
    if-gez v1, :L3
    const/4 v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L3
  .line 1194
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length p1, p1
    if-lt v1, p1, :L4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L4
  .line 1195
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1196
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object p1
    const-string v0, "follow_playing"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L5
  .line 1197
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->playingPath()Ljava/lang/String;
    move-result-object p1
  .line 1198
    if-eqz p1, :L5
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->select(Ljava/lang/String;)Z
  :L5
  .line 1200
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 1201
    return-void
.end method

.method show(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 5
  .line 1169
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 1170
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Flow;->yearAt(Landroid/content/Context;)I
    move-result v1
  .line 1171
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/Flow;->albumLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 1172
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    invoke-static { p1, v0, v1 }, Lcom/innioasis/ipp/Flow;->artistLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 1173
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 1174
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 1175
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 1176
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 1177
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->settle()V
  .line 1178
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 1179
    return-void
.end method

.method tick()V
  .registers 5
  .line 1399
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
  .line 1400
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-nez v0, :L1
  .line 1401
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 1000
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1402
    return-void
  :L1
  .line 1404
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    aget-object v0, v0, v1
  .line 1405
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
  .line 1406
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    if-lez v1, :L3
  .line 1407
    add-int/lit8 v1, v1, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    goto :L5
  :L3
  .line 1409
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    add-int/lit8 v1, v1, 2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1410
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
  .line 1411
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 1412
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  :L4
  .line 1414
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  :L5
  .line 1416
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1417
    return-void
  :L6
  .line 1399
    return-void
.end method

.method track()I
  .registers 4
  .line 1303
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
