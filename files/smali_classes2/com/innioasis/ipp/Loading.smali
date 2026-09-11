.class public final Lcom/innioasis/ipp/Loading;
.super Ljava/lang/Object;
.source "Loading.java"

.field private final static BOX:I = -1

.field private final static FADE:F = 1.15F

.field private final static PROBE:I = 16707006

.field private final static RADIUS_DIP:I = 10

.field private final static TEXT:I = -15720094

.method private constructor <init>()V
  .registers 1
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static fade(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 7
  .line 72
    nop
  .line 73
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
  .line 74
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
  .line 75
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
  .line 76
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
  .line 73
    return-object v0
.end method

.method public static paint(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 43
    if-nez p0, :L0
    return-void
  :L0
  .line 45
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 46
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 47
    const/4 v2, -1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 48
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41200000
    mul-float v2, v2, v3
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 49
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 51
    const v1, 16707006
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v0
  .line 52
    if-ne v0, v1, :L1
    const v2, -15720094
    goto :L2
  :L1
    move v2, v0
  :L2
  .line 53
    const v3, 2131361970
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 54
    const v3, 2131362457
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 55
    if-eq v0, v1, :L3
  .line 56
    const v1, 2131362176
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 57
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L3
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  :L3
  .line 61
    goto :L5
  :L4
  .line 59
    move-exception p0
  :L5
  .line 62
    return-void
.end method

.method private static text(Landroid/view/View;II)V
  .registers 3
  .line 82
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 83
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 84
    return-void
.end method
