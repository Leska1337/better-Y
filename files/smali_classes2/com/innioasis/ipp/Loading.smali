.class public final Lcom/innioasis/ipp/Loading;
.super Ljava/lang/Object;
.source "Loading.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Loading$Spin;
  }
.end annotation

.field private final static BOX:I = -1

.field private final static FADE:F = 1.15F

.field private final static FADE_STYLE:I = 2131887152

.field private final static PLATFORM_DIP:I = 48

.field private final static PROBE:I = 16707006

.field private final static RADIUS_DIP:I = 10

.field private final static RULE_MAX_DIP:I = 4

.field private final static TEXT:I = -15720094

.method private constructor <init>()V
  .registers 1
  .line 60
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object p0
    return-object p0
.end method

.method private static centre(Landroid/view/View;)V
  .registers 4
  .line 437
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 438
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 17
    if-eqz v1, :L0
  .line 439
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    goto :L1
  :L0
  .line 440
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;
    if-eqz v1, :L1
  .line 441
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  :L1
  .line 443
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 444
    instance-of v0, p0, Landroid/widget/LinearLayout;
    if-eqz v0, :L2
  .line 445
    check-cast p0, Landroid/widget/LinearLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
    goto :L3
  :L2
  .line 446
    instance-of v0, p0, Landroid/widget/RelativeLayout;
    if-eqz v0, :L3
  .line 447
    check-cast p0, Landroid/widget/RelativeLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/RelativeLayout;->setGravity(I)V
  :L3
  .line 449
    return-void
.end method

.method private static copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
  .registers 4
  .line 289
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->width:I
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->height:I
    invoke-direct { v0, v1, v2 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 290
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 291
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
  .line 292
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
  .line 293
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 294
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 295
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
  .line 296
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
  .line 297
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
  .line 298
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
  .line 299
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
  .line 300
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
  .line 301
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
  .line 302
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
  .line 303
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
  .line 304
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
  .line 305
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 306
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 307
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
  .line 308
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginStart()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginStart(I)V
  .line 309
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginEnd()I
    move-result p0
    invoke-virtual { v0, p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  .line 310
    return-object v0
.end method

.method private static dress(Landroid/view/View;IIZ)V
  .registers 7
  .line 189
    const v0, 16707006
    const/4 v1, 0
    if-eq p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 190
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L5
  .line 191
    check-cast p0, Landroid/widget/TextView;
  .line 192
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p2
  .line 193
    if-eqz p2, :L4
    invoke-interface { p2 }, Ljava/lang/CharSequence;->length()I
    move-result p2
    if-nez p2, :L2
    goto :L4
  :L2
  .line 197
    const/16 p2, 17
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 198
    if-eqz v0, :L3
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L3
  .line 199
    return-void
  :L4
  .line 194
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 195
    return-void
  :L5
  .line 201
    instance-of v2, p0, Landroid/widget/ProgressBar;
    if-eqz v2, :L7
  .line 204
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p2
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F
    const/high16 p3, 0x42400000
    mul-float p2, p2, p3
    float-to-int p2, p2
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Loading;->spin(Landroid/view/View;II)Z
    move-result p1
    if-nez p1, :L6
  .line 205
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->centre(Landroid/view/View;)V
  :L6
  .line 207
    return-void
  :L7
  .line 209
    instance-of v2, p0, Landroid/view/ViewGroup;
    if-eqz v2, :L11
  .line 213
    if-eqz p3, :L8
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 214
    check-cast p0, Landroid/view/ViewGroup;
  .line 215
    nop
  :L9
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-ge v1, v0, :L10
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v0, p1, p2, p3 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
    add-int/lit8 v1, v1, 1
    goto :L9
  :L10
  .line 216
    return-void
  :L11
  .line 218
    if-eqz v0, :L12
  .line 221
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p3
  .line 222
    if-eqz p3, :L12
    iget v0, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v0, :L12
    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-gt p3, p2, :L12
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  :L12
  .line 224
    return-void
.end method

.method private static fade(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 7
  .line 453
    nop
  .line 454
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;
    new-instance v1, Landroid/graphics/ColorMatrix;
    const/16 v2, 20
    new-array v2, v2, [F
    const/4 v3, 0
    const/4 v4, 0
    aput v4, v2, v3
    const/4 v3, 1
    aput v4, v2, v3
    const/4 v3, 2
    aput v4, v2, v3
    const/4 v3, 3
    aput v4, v2, v3
  .line 455
    invoke-static { p0 }, Landroid/graphics/Color;->red(I)I
    move-result v3
    int-to-float v3, v3
    const/4 v5, 4
    aput v3, v2, v5
    const/4 v3, 5
    aput v4, v2, v3
    const/4 v3, 6
    aput v4, v2, v3
    const/4 v3, 7
    aput v4, v2, v3
    const/16 v3, 8
    aput v4, v2, v3
  .line 456
    invoke-static { p0 }, Landroid/graphics/Color;->green(I)I
    move-result v3
    int-to-float v3, v3
    const/16 v5, 9
    aput v3, v2, v5
    const/16 v3, 10
    aput v4, v2, v3
    const/16 v3, 11
    aput v4, v2, v3
    const/16 v3, 12
    aput v4, v2, v3
    const/16 v3, 13
    aput v4, v2, v3
  .line 457
    invoke-static { p0 }, Landroid/graphics/Color;->blue(I)I
    move-result p0
    int-to-float p0, p0
    const/16 v3, 14
    aput p0, v2, v3
    const/16 p0, 15
    const v3, -1095758565
    aput v3, v2, p0
    const/16 p0, 16
    const v3, -1087582188
    aput v3, v2, p0
    const/16 p0, 17
    const v3, -1106886892
    aput v3, v2, p0
    const/16 p0, 18
    const v3, 1066611507
    aput v3, v2, p0
    const/16 p0, 19
    aput v4, v2, p0
    invoke-direct { v1, v2 }, Landroid/graphics/ColorMatrix;-><init>([F)V
    invoke-direct { v0, v1 }, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V
  .line 454
    return-object v0
.end method

.method public static hidden(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 170
    if-nez p0, :L0
    return-void
  :L0
  .line 172
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 173
    if-nez p0, :L1
    return-void
  :L1
  .line 175
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  .line 176
    const/4 v1, 2
    invoke-virtual { p0, v1 }, Landroid/view/Window;->clearFlags(I)V
  .line 177
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual { p0, v1 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 178
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
  .line 179
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L4
  .line 180
    check-cast p0, Landroid/view/ViewGroup;
  .line 181
    nop
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    const/4 v2, 4
    invoke-virtual { v1, v2 }, Landroid/view/View;->setVisibility(I)V
  :L3
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 185
    goto :L6
  :L5
  .line 183
    move-exception p0
  :L6
  .line 186
    return-void
.end method

.method private static holdsSpin(Landroid/view/View;)Z
  .registers 5
  .line 274
    instance-of v0, p0, Lcom/innioasis/ipp/Loading$Spin;
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 275
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v0, :L1
    return v2
  :L1
  .line 276
    check-cast p0, Landroid/view/ViewGroup;
  .line 277
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v0, v3, :L4
  .line 278
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v3
    if-eqz v3, :L3
    return v1
  :L3
  .line 277
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 280
    return v2
.end method

.method public static paint(Landroid/app/Dialog;Landroid/view/View;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 6
  .line 77
    if-nez p1, :L0
    return-void
  :L0
  .line 79
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 80
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 81
    const/4 v2, -1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 82
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41200000
    mul-float v2, v2, v3
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 83
    invoke-virtual { p1, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 85
    const v1, 16707006
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v0
  .line 86
    if-ne v0, v1, :L1
    const v2, -15720094
    goto :L2
  :L1
    move v2, v0
  :L2
  .line 87
    const v3, 2131361970
    invoke-static { p1, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 88
    const v3, 2131362457
    invoke-static { p1, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 89
    const v2, 2131362176
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 90
    const/4 v2, 0
    invoke-static { p1, v0, v2 }, Lcom/innioasis/ipp/Loading;->spin(Landroid/view/View;II)Z
    move-result v2
    if-eqz v2, :L5
  .line 91
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  :L4
  .line 92
    if-eqz p0, :L7
    const p1, 2131887152
    invoke-virtual { p0, p1 }, Landroid/view/Window;->setWindowAnimations(I)V
    goto :L7
  :L5
  .line 93
    if-eq v0, v1, :L7
    instance-of p0, p1, Landroid/widget/ImageView;
    if-eqz p0, :L7
  .line 94
    check-cast p1, Landroid/widget/ImageView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object p0
    invoke-virtual { p1, p0 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  :L6
    goto :L8
  :L7
  .line 93
    nop
  :L8
  .line 98
    goto :L10
  :L9
  .line 96
    move-exception p0
  :L10
  .line 99
    return-void
.end method

.method public static progress(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 11
  .line 122
    if-nez p0, :L0
    return-void
  :L0
  .line 124
    const-string v0, ""
    invoke-virtual { p0, v0 }, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V
  .line 125
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 126
    if-nez p0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  :L2
  .line 127
    if-nez v0, :L3
    return-void
  :L3
  .line 129
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 130
    const v2, 16707006
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v3
  .line 131
    const/4 v4, 0
    if-eq v3, v2, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
  .line 132
    invoke-virtual { v0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v6
    iget v6, v6, Landroid/util/DisplayMetrics;->density:F
  .line 133
    if-eqz v5, :L7
  .line 136
    new-instance v7, Landroid/graphics/Rect;
    invoke-direct { v7 }, Landroid/graphics/Rect;-><init>()V
  .line 137
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v8
  .line 138
    if-eqz v8, :L6
    invoke-virtual { v8, v7 }, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z
  :L6
  .line 139
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v8 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 140
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 141
    const/high16 v3, 0x41200000
    mul-float v3, v3, v6
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 142
    invoke-virtual { p0, v8 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 143
    iget v3, v7, Landroid/graphics/Rect;->left:I
    iget v8, v7, Landroid/graphics/Rect;->top:I
    iget v9, v7, Landroid/graphics/Rect;->right:I
    iget v7, v7, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v3, v8, v9, v7 }, Landroid/view/View;->setPadding(IIII)V
  :L7
  .line 147
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v1
  .line 148
    const/high16 v2, 0x40800000
    mul-float v6, v6, v2
    float-to-int v2, v6
  .line 149
    instance-of v3, v0, Landroid/view/ViewGroup;
    if-eqz v3, :L10
  .line 150
    move-object v3, v0
    check-cast v3, Landroid/view/ViewGroup;
  .line 151
    nop
  :L8
    invoke-virtual { v3 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v6
    if-ge v4, v6, :L9
    invoke-virtual { v3, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v6
    invoke-static { v6, v1, v2, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
    add-int/lit8 v4, v4, 1
    goto :L8
  :L9
  .line 152
    goto :L11
  :L10
  .line 153
    invoke-static { v0, v1, v2, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
  :L11
  .line 156
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L12
    const v0, 2131887152
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  :L12
  .line 159
    goto :L14
  :L13
  .line 157
    move-exception p0
  :L14
  .line 160
    return-void
.end method

.method private static spin(Landroid/view/View;II)Z
  .catchall { :L3 .. :L6 } :L8
  .registers 9
  .line 241
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
  :L1
  .line 242
    instance-of v2, v1, Landroid/view/ViewGroup;
    const/4 v3, 0
    if-nez v2, :L2
    return v3
  :L2
  .line 243
    check-cast v1, Landroid/view/ViewGroup;
  :L3
  .line 245
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 248
    instance-of v4, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    if-eqz v4, :L4
  .line 249
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v2 }, Lcom/innioasis/ipp/Loading;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object p2
  .line 250
    const/4 v2, 4
    goto :L5
  :L4
  .line 251
    instance-of v2, v1, Landroid/widget/LinearLayout;
    if-eqz v2, :L7
    if-lez p2, :L7
  .line 252
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, p2, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 253
    const/16 p2, 17
    iput p2, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 254
    move-object v4, v1
    check-cast v4, Landroid/widget/LinearLayout;
    invoke-virtual { v4, p2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 255
    nop
  .line 256
    nop
  .line 257
    const/16 p2, 8
    move-object p2, v2
    const/16 v2, 8
  :L5
  .line 260
    new-instance v4, Lcom/innioasis/ipp/Loading$Spin;
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-direct { v4, v5, p1 }, Lcom/innioasis/ipp/Loading$Spin;-><init>(Landroid/content/Context;I)V
  .line 261
    invoke-static { }, Landroid/view/View;->generateViewId()I
    move-result p1
    invoke-virtual { v4, p1 }, Lcom/innioasis/ipp/Loading$Spin;->setId(I)V
  .line 262
    invoke-virtual { v1, p0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result p1
    const/4 v5, 1
    add-int/2addr p1, v5
    invoke-virtual { v1, v4, p1, p2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 263
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 266
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L6
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L6
  .line 267
    return v5
  :L7
  .line 258
    return v3
  :L8
  .line 268
    move-exception p0
  .line 269
    return v3
.end method

.method private static text(Landroid/view/View;II)V
  .registers 3
  .line 463
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 464
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 465
    return-void
.end method
