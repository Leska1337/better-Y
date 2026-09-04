.class public final Lcom/innioasis/ipp/HelpDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "HelpDialog.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/HelpDialog$Page;
  }
.end annotation

.field private final static BODY_MAX:I = 268

.field private final static BODY_MIN:I = 60

.field private final static BOX:I = -1

.field private final static CORNER:F = 10.0F

.field private final static INK:I = -16777216

.field private final static PAD_X:I = 10

.field private final static PAD_Y:I = 8

.field private final static SLACK_Y:I = 10

.field private final static W_MAX:I = 460

.field private final static W_MIN:I = 200

.field private final activity:Landroid/app/Activity;

.field private final blocks:Ljava/util/List;

.field private body:Landroid/widget/TextView;

.field private bodyMax:I

.field private cap:Landroid/widget/TextView;

.field private contentW:I

.field private foot:Landroid/widget/TextView;

.field private head:Landroid/widget/TextView;

.field private hole:Landroid/widget/LinearLayout;

.field private page:I

.field private pages:Ljava/util/List;

.field private shot:Landroid/widget/ImageView;

.field private textH:I

.field private final title:Ljava/lang/String;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
  .registers 5
  .line 114
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 98
    const/16 v0, 268
    iput v0, p0, Lcom/innioasis/ipp/HelpDialog;->bodyMax:I
  .line 115
    iput-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
  .line 116
    iput-object p2, p0, Lcom/innioasis/ipp/HelpDialog;->title:Ljava/lang/String;
  .line 117
    iput-object p3, p0, Lcom/innioasis/ipp/HelpDialog;->blocks:Ljava/util/List;
  .line 118
    return-void
.end method

.method private font()Landroid/graphics/Typeface;
  .registers 2
  .line 212
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    return-object v0
.end method

.method private paginate(I)Ljava/util/List;
  .registers 25
  .line 226
    move-object/from16 v0, p0
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 227
    iget-object v2, v0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
  .line 228
    nop
  .line 229
    invoke-virtual { v2 }, Landroid/text/TextPaint;->getFontSpacing()F
    move-result v3
    const v4, 1065772646
    mul-float v11, v3, v4
  .line 230
    move/from16 v3, p1
    int-to-float v3, v3
    div-float/2addr v3, v11
    float-to-int v3, v3
  .line 231
    const/4 v4, 1
    if-ge v3, v4, :L0
    const/4 v12, 1
    goto :L1
  :L0
    move v12, v3
  :L1
  .line 232
    nop
  .line 233
    nop
  .line 235
    const/4 v13, 0
    const/4 v3, 0
    const/4 v14, 0
    const/4 v15, 0
    const/16 v16, 0
  :L2
    iget-object v3, v0, Lcom/innioasis/ipp/HelpDialog;->blocks:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    const/4 v10, 0
    const/16 v4, 440
    if-ge v15, v3, :L22
  .line 236
    iget-object v3, v0, Lcom/innioasis/ipp/HelpDialog;->blocks:Ljava/util/List;
    invoke-interface { v3, v15 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    move-object v9, v3
    check-cast v9, Lcom/innioasis/ipp/Help$Block;
  .line 237
    iget-object v3, v9, Lcom/innioasis/ipp/Help$Block;->img:Ljava/lang/String;
    if-eqz v3, :L11
  .line 238
    new-instance v3, Lcom/innioasis/ipp/HelpDialog$Page;
    iget-object v5, v9, Lcom/innioasis/ipp/Help$Block;->img:Ljava/lang/String;
    iget-object v6, v9, Lcom/innioasis/ipp/Help$Block;->cap:Ljava/lang/String;
    invoke-direct { v3, v10, v5, v6 }, Lcom/innioasis/ipp/HelpDialog$Page;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-interface { v1, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 239
    iget-object v3, v0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    iget-object v5, v9, Lcom/innioasis/ipp/Help$Block;->img:Ljava/lang/String;
    invoke-static { v3, v5 }, Lcom/innioasis/ipp/Help;->size(Landroid/content/Context;Ljava/lang/String;)[I
    move-result-object v3
  .line 240
    if-nez v3, :L3
    int-to-float v3, v4
    goto :L4
  :L3
    aget v3, v3, v13
    int-to-float v3, v3
  :L4
  .line 241
    int-to-float v4, v4
    cmpl-float v5, v3, v4
    if-lez v5, :L5
    move v3, v4
  :L5
  .line 242
    cmpl-float v5, v3, v14
    if-lez v5, :L6
    move v14, v3
  :L6
  .line 243
    iget-object v3, v9, Lcom/innioasis/ipp/Help$Block;->cap:Ljava/lang/String;
    if-eqz v3, :L10
  .line 244
    iget-object v3, v0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    iget-object v5, v9, Lcom/innioasis/ipp/Help$Block;->cap:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v3
  .line 245
    cmpl-float v5, v3, v4
    if-lez v5, :L7
    goto :L8
  :L7
    move v4, v3
  :L8
  .line 246
    cmpl-float v3, v4, v14
    if-lez v3, :L9
    move v14, v4
  :L9
  .line 247
    move/from16 v18, v11
    goto/16 :L21
  :L10
  .line 243
    move/from16 v18, v11
    goto/16 :L21
  :L11
  .line 250
    new-instance v8, Landroid/text/StaticLayout;
    iget-object v4, v9, Lcom/innioasis/ipp/Help$Block;->text:Ljava/lang/String;
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const v17, 1065772646
    const/16 v18, 0
    const/16 v19, 0
    const/16 v6, 440
    move-object v3, v8
    move-object v5, v2
    move-object/from16 p1, v8
    move/from16 v8, v17
    move-object v13, v9
    move/from16 v9, v18
    move/from16 v18, v11
    move-object v11, v10
    move/from16 v10, v19
    invoke-direct/range { v3 .. v10 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 252
    invoke-virtual/range { p1 .. p1 }, Landroid/text/StaticLayout;->getLineCount()I
    move-result v10
  .line 253
    const/4 v3, 0
  :L12
    if-ge v3, v10, :L14
  .line 254
    move-object/from16 v9, p1
    invoke-virtual { v9, v3 }, Landroid/text/StaticLayout;->getLineWidth(I)F
    move-result v4
  .line 255
    cmpl-float v5, v4, v14
    if-lez v5, :L13
    move v14, v4
  :L13
  .line 253
    add-int/lit8 v3, v3, 1
    move-object/from16 p1, v9
    goto :L12
  :L14
  .line 257
    move-object/from16 v9, p1
    move/from16 v8, v16
    const/4 v3, 0
  :L15
  .line 258
    if-ge v3, v10, :L20
  .line 259
    add-int v4, v3, v12
  .line 260
    if-le v4, v10, :L16
    move/from16 v16, v10
    goto :L17
  :L16
    move/from16 v16, v4
  :L17
  .line 261
    iget-object v4, v13, Lcom/innioasis/ipp/Help$Block;->text:Ljava/lang/String;
    invoke-virtual { v9, v3 }, Landroid/text/StaticLayout;->getLineStart(I)I
    move-result v3
    add-int/lit8 v5, v16, -1
    invoke-virtual { v9, v5 }, Landroid/text/StaticLayout;->getLineEnd(I)I
    move-result v5
    invoke-virtual { v4, v3, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
  .line 262
    new-instance v3, Lcom/innioasis/ipp/HelpDialog$Page;
    invoke-direct { v3, v4, v11, v11 }, Lcom/innioasis/ipp/HelpDialog$Page;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-interface { v1, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 267
    new-instance v19, Landroid/text/StaticLayout;
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const v20, 1065772646
    const/16 v21, 0
    const/16 v22, 0
    const/16 v6, 440
    move-object/from16 v3, v19
    move-object v5, v2
    move v11, v8
    move/from16 v8, v20
    move-object/from16 v20, v9
    move/from16 v9, v21
    move/from16 v21, v10
    move/from16 v10, v22
    invoke-direct/range { v3 .. v10 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 269
    invoke-virtual/range { v19 .. v19 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v3
    if-le v3, v11, :L18
    invoke-virtual/range { v19 .. v19 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v3
    move v8, v3
    goto :L19
  :L18
    move v8, v11
  :L19
  .line 270
    nop
  .line 271
    move/from16 v3, v16
    move-object/from16 v9, v20
    move/from16 v10, v21
    const/4 v11, 0
    goto :L15
  :L20
  .line 258
    move v11, v8
    move/from16 v16, v11
  :L21
  .line 235
    add-int/lit8 v15, v15, 1
    move/from16 v11, v18
    const/4 v13, 0
    goto/16 :L2
  :L22
  .line 273
    move/from16 v18, v11
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L23
    new-instance v2, Lcom/innioasis/ipp/HelpDialog$Page;
    const-string v3, ""
    const/4 v5, 0
    invoke-direct { v2, v3, v5, v5 }, Lcom/innioasis/ipp/HelpDialog$Page;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L23
  .line 275
    float-to-double v2, v14
    invoke-static { v2, v3 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v2
    double-to-int v2, v2
    add-int/lit8 v2, v2, 4
    iput v2, v0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
  .line 276
    if-le v2, v4, :L24
    iput v4, v0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
  :L24
  .line 277
    iget v2, v0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
    const/16 v3, 180
    if-ge v2, v3, :L25
    iput v3, v0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
  :L25
  .line 278
    add-int/lit8 v2, v16, 2
    iput v2, v0, Lcom/innioasis/ipp/HelpDialog;->textH:I
  .line 279
    const/4 v3, 3
    if-ge v2, v3, :L26
    move/from16 v3, v18
    float-to-double v2, v3
    invoke-static { v2, v3 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v2
    double-to-int v2, v2
    iput v2, v0, Lcom/innioasis/ipp/HelpDialog;->textH:I
  :L26
  .line 280
    return-object v1
.end method

.method private paint(Landroid/widget/TextView;)V
  .registers 4
  .line 208
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/high16 v1, 0xFF000000
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v0
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 209
    return-void
.end method

.method private resize(I)V
  .registers 4
  .line 360
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    if-nez v0, :L0
    return-void
  :L0
  .line 361
    iget v1, p0, Lcom/innioasis/ipp/HelpDialog;->bodyMax:I
    if-le p1, v1, :L1
    move p1, v1
  :L1
  .line 362
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 363
    if-eqz v0, :L3
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L2
    goto :L3
  :L2
  .line 364
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 365
    iget-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 366
    return-void
  :L3
  .line 363
    return-void
.end method

.method private room()I
  .catchall { :L0 .. :L3 } :L7
  .registers 12
  .line 326
    const/16 v0, 268
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 327
    iget v2, p0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v3
    sub-int/2addr v2, v3
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v3
    sub-int/2addr v2, v3
  .line 328
    const/4 v3, 1
    if-ge v2, v3, :L1
    iget v2, p0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
  :L1
    move v5, v2
  .line 329
    new-instance v10, Landroid/text/StaticLayout;
    iget-object v2, p0, Lcom/innioasis/ipp/HelpDialog;->title:Ljava/lang/String;
    if-nez v2, :L2
    const-string v2, ""
  :L2
    move-object v3, v2
    iget-object v2, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v4
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v7, 0x3F800000
    const/4 v8, 0
    const/4 v9, 0
    move-object v2, v10
    invoke-direct/range { v2 .. v9 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 331
    invoke-virtual { v10 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v2
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v3
    add-int/2addr v2, v3
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result v3
    add-int/2addr v2, v3
  .line 332
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/text/TextPaint;->getFontSpacing()F
    move-result v3
    float-to-double v3, v3
    invoke-static { v3, v4 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v3
    double-to-int v3, v3
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
  .line 333
    invoke-virtual { v4 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v4
    add-int/2addr v3, v4
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-virtual { v4 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result v4
  :L3
    add-int/2addr v3, v4
  .line 334
    add-int/lit8 v1, v1, -20
    add-int/lit8 v1, v1, -16
    sub-int/2addr v1, v2
    sub-int/2addr v1, v3
  .line 335
    if-le v1, v0, :L4
    goto :L5
  :L4
    move v0, v1
  :L5
  .line 336
    const/16 v1, 60
    if-ge v0, v1, :L6
    const/16 v0, 60
  :L6
  .line 337
    return v0
  :L7
  .line 338
    move-exception v1
  .line 339
    return v0
.end method

.method private shotHeight(Landroid/graphics/Bitmap;Ljava/lang/String;)I
  .registers 12
  .line 345
    iget v0, p0, Lcom/innioasis/ipp/HelpDialog;->bodyMax:I
  .line 346
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v1
    if-lez v1, :L0
  .line 347
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
    int-to-long v0, v0
    iget v2, p0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
    int-to-long v2, v2
    mul-long v0, v0, v2
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    int-to-long v2, v2
    div-long/2addr v0, v2
    long-to-int v0, v0
  .line 348
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
    if-le v0, v1, :L0
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
  :L0
  .line 350
    if-eqz p2, :L1
  .line 351
    new-instance p1, Landroid/text/StaticLayout;
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v6, 0x3F800000
    const/4 v7, 0
    const/4 v8, 0
    move-object v1, p1
    move-object v2, p2
    invoke-direct/range { v1 .. v8 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 353
    invoke-virtual { p1 }, Landroid/text/StaticLayout;->getHeight()I
    move-result p1
    iget-object p2, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { p2 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result p2
    add-int/2addr p1, p2
    add-int/2addr v0, p1
  :L1
  .line 355
    iget p1, p0, Lcom/innioasis/ipp/HelpDialog;->bodyMax:I
    if-le v0, p1, :L2
    move v0, p1
  :L2
    return v0
.end method

.method private show(I)V
  .registers 8
  .line 286
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    if-eqz v0, :L18
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L18
  :L0
  .line 287
    const/4 v0, 0
    if-gez p1, :L1
    const/4 p1, 0
  :L1
  .line 288
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L2
    iget-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result p1
    add-int/lit8 p1, p1, -1
  :L2
  .line 289
    iput p1, p0, Lcom/innioasis/ipp/HelpDialog;->page:I
  .line 290
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    invoke-interface { v1, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/HelpDialog$Page;
  .line 292
    iget-object v1, p1, Lcom/innioasis/ipp/HelpDialog$Page;->img:Ljava/lang/String;
    const-string v2, ""
    const/16 v3, 8
    if-eqz v1, :L14
  .line 293
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    iget-object v4, p1, Lcom/innioasis/ipp/HelpDialog$Page;->img:Ljava/lang/String;
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Help;->image(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 294
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    invoke-virtual { v4, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 295
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    if-nez v1, :L3
    const/16 v5, 8
    goto :L4
  :L3
    const/4 v5, 0
  :L4
    invoke-virtual { v4, v5 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 296
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    if-nez v1, :L5
    const/4 v5, 0
    goto :L6
  :L5
    const/16 v5, 8
  :L6
    invoke-virtual { v4, v5 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 297
    if-nez v1, :L7
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v4, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 298
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    iget-object v5, p1, Lcom/innioasis/ipp/HelpDialog$Page;->cap:Ljava/lang/String;
    if-nez v5, :L8
    move-object v5, v2
    goto :L9
  :L8
    iget-object v5, p1, Lcom/innioasis/ipp/HelpDialog$Page;->cap:Ljava/lang/String;
  :L9
    invoke-virtual { v4, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 299
    iget-object v4, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    iget-object v5, p1, Lcom/innioasis/ipp/HelpDialog$Page;->cap:Ljava/lang/String;
    if-eqz v5, :L10
    if-nez v1, :L11
  :L10
    const/16 v0, 8
  :L11
    invoke-virtual { v4, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 302
    if-nez v1, :L12
    iget p1, p0, Lcom/innioasis/ipp/HelpDialog;->textH:I
    goto :L13
  :L12
    iget-object p1, p1, Lcom/innioasis/ipp/HelpDialog$Page;->cap:Ljava/lang/String;
    invoke-direct { p0, v1, p1 }, Lcom/innioasis/ipp/HelpDialog;->shotHeight(Landroid/graphics/Bitmap;Ljava/lang/String;)I
    move-result p1
  :L13
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->resize(I)V
  .line 303
    goto :L15
  :L14
  .line 304
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 305
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    const/4 v4, 0
    invoke-virtual { v1, v4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 306
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 307
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 308
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    iget-object p1, p1, Lcom/innioasis/ipp/HelpDialog$Page;->text:Ljava/lang/String;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 309
    iget p1, p0, Lcom/innioasis/ipp/HelpDialog;->textH:I
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->resize(I)V
  :L15
  .line 312
    iget-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L16
    goto :L17
  :L16
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iget v1, p0, Lcom/innioasis/ipp/HelpDialog;->page:I
    add-int/lit8 v1, v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " / "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  :L17
    invoke-virtual { p1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 313
    return-void
  :L18
  .line 286
    return-void
.end method

.method public longDown(II)V
  .registers 4
  .line 385
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v0
    if-ne p1, v0, :L0
    const/4 p1, 3
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    instance-of p2, p1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p2, :L0
  .line 387
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseActivity;->askShutdown()V
  :L0
  .line 389
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 393
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 11
  .line 122
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 124
    new-instance p1, Landroid/widget/LinearLayout;
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { p1, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 125
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 126
    const/16 v1, 10
    const/16 v2, 8
    invoke-virtual { p1, v1, v2, v1, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 127
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 128
    const/high16 v3, 0x41200000
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 129
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v4, -1
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v3
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 130
    invoke-virtual { p1, v1 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 132
    new-instance v1, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
  .line 133
    const/high16 v3, 0x41700000
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 134
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-direct { p0 }, Lcom/innioasis/ipp/HelpDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v1, v3, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 135
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    const/16 v3, 17
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 136
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    const/16 v5, 12
    const/4 v6, 4
    const/4 v7, 0
    invoke-virtual { v1, v6, v7, v6, v5 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 137
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    iget-object v5, p0, Lcom/innioasis/ipp/HelpDialog;->title:Ljava/lang/String;
    invoke-virtual { v1, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 138
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/HelpDialog;->paint(Landroid/widget/TextView;)V
  .line 139
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->head:Landroid/widget/TextView;
    const/4 v5, -2
    invoke-virtual { p1, v1, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 141
    new-instance v1, Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v6 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
  .line 142
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 143
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v3 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 145
    new-instance v1, Landroid/widget/TextView;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
  .line 146
    const/high16 v6, 0x41600000
    invoke-virtual { v1, v6 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 147
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-direct { p0 }, Lcom/innioasis/ipp/HelpDialog;->font()Landroid/graphics/Typeface;
    move-result-object v6
    invoke-virtual { v1, v6 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 148
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v1, v7 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 149
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    const/4 v6, 0
    const v8, 1065772646
    invoke-virtual { v1, v6, v8 }, Landroid/widget/TextView;->setLineSpacing(FF)V
  .line 152
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 153
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/HelpDialog;->paint(Landroid/widget/TextView;)V
  .line 154
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->body:Landroid/widget/TextView;
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v4, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v6, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 156
    new-instance v1, Landroid/widget/ImageView;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
  .line 157
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 158
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 159
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 160
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v0, v4, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 161
    const/high16 v1, 0x3F800000
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 162
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->shot:Landroid/widget/ImageView;
    invoke-virtual { v1, v6, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 164
    new-instance v0, Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
  .line 165
    const/high16 v1, 0x41400000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 166
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-direct { p0 }, Lcom/innioasis/ipp/HelpDialog;->font()Landroid/graphics/Typeface;
    move-result-object v6
    invoke-virtual { v0, v6 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 167
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v0, v7 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 168
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 169
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    const/4 v6, 2
    const/4 v8, 5
    invoke-virtual { v0, v6, v8, v6, v7 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 170
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 171
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/HelpDialog;->paint(Landroid/widget/TextView;)V
  .line 172
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->cap:Landroid/widget/TextView;
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v4, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v6, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 174
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->hole:Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v8, 268
    invoke-direct { v6, v4, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v0, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 176
    new-instance v0, Landroid/widget/TextView;
    iget-object v6, p0, Lcom/innioasis/ipp/HelpDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
  .line 177
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 178
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-direct { p0 }, Lcom/innioasis/ipp/HelpDialog;->font()Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 179
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 180
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-virtual { v0, v7, v2, v7, v7 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 181
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/HelpDialog;->paint(Landroid/widget/TextView;)V
  .line 182
    iget-object v0, p0, Lcom/innioasis/ipp/HelpDialog;->foot:Landroid/widget/TextView;
    invoke-virtual { p1, v0, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 184
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->setContentView(Landroid/view/View;)V
  .line 191
    invoke-direct { p0, v8 }, Lcom/innioasis/ipp/HelpDialog;->paginate(I)Ljava/util/List;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
  .line 192
    invoke-direct { p0 }, Lcom/innioasis/ipp/HelpDialog;->room()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/HelpDialog;->bodyMax:I
  .line 193
    if-ge p1, v8, :L0
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->paginate(I)Ljava/util/List;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/HelpDialog;->pages:Ljava/util/List;
  :L0
  .line 195
    invoke-virtual { p0 }, Lcom/innioasis/ipp/HelpDialog;->getWindow()Landroid/view/Window;
    move-result-object p1
  .line 196
    if-eqz p1, :L1
  .line 197
    invoke-virtual { p1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 198
    iget v1, p0, Lcom/innioasis/ipp/HelpDialog;->contentW:I
    add-int/lit8 v1, v1, 20
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 199
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 200
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L1
  .line 203
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/HelpDialog;->show(I)V
  .line 204
    return-void
.end method

.method public shortUp(I)V
  .registers 4
  .line 372
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 373
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    if-eq p1, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L3
  :L0
  .line 375
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L2
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L1
    goto :L2
  :L1
  .line 377
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L4
  .line 378
    invoke-virtual { p0 }, Lcom/innioasis/ipp/HelpDialog;->dismiss()V
    goto :L4
  :L2
  .line 376
    iget p1, p0, Lcom/innioasis/ipp/HelpDialog;->page:I
    add-int/lit8 p1, p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->show(I)V
    goto :L4
  :L3
  .line 374
    iget p1, p0, Lcom/innioasis/ipp/HelpDialog;->page:I
    add-int/lit8 p1, p1, -1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/HelpDialog;->show(I)V
  :L4
  .line 380
    return-void
.end method
