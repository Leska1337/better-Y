.class public final Lcom/innioasis/ipp/Preview;
.super Ljava/lang/Object;
.source "Preview.java"

.field private final static BLACK:I = -15592942

.field private final static DARK:I = 1

.field public final static KEY:Ljava/lang/String; = "preview_text"

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method private constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static all(Landroid/view/ViewGroup;I)V
  .registers 5
  .line 95
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
  .line 96
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 97
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L1
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L1
  .line 95
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 99
    return-void
.end method

.method static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 4
  :L0
  .line 55
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->color(Landroid/content/Context;)I
    move-result v0
  .line 56
    if-nez v0, :L1
    const/4 v1, -1
    goto :L2
  :L1
    move v1, v0
  :L2
  .line 57
    instance-of v2, p0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v2, :L3
  .line 58
    const v0, 2131362326
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 59
    const v0, 2131362097
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto/16 :L12
  :L3
  .line 60
    instance-of v2, p0, Lcom/innioasis/y1/activity/AboutActivity;
    if-eqz v2, :L4
  .line 61
    const v0, 2131362098
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 62
    const v0, 2131362099
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto/16 :L12
  :L4
  .line 63
    instance-of v2, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v2, :L5
  .line 64
    const v0, 2131362437
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto/16 :L12
  :L5
  .line 65
    instance-of v2, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v2, :L7
  .line 66
    const v0, 2131362087
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 67
    if-eqz p0, :L6
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup;
    if-eqz v0, :L6
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->all(Landroid/view/ViewGroup;I)V
  :L6
  .line 68
    goto :L12
  :L7
    instance-of v2, p0, Lcom/innioasis/y1/activity/BrightnessActivity;
    if-eqz v2, :L9
  .line 69
    const v0, 2131361908
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 70
    if-eqz p0, :L8
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup;
    if-eqz v0, :L8
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->all(Landroid/view/ViewGroup;I)V
  :L8
  .line 71
    goto :L12
  :L9
    instance-of v2, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v2, :L10
  .line 72
    const v0, 2131362373
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 73
    const v0, 2131362371
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 74
    const v0, 2131362372
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto :L12
  :L10
  .line 75
    instance-of v2, p0, Lcom/innioasis/y1/activity/DateTwoLevelActivity;
    if-eqz v2, :L11
  .line 76
    const v0, 2131361988
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 77
    const v0, 2131362476
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 78
    const v0, 2131362477
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 79
    const v0, 2131362478
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto :L12
  :L11
  .line 80
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L12
  .line 81
    const v1, 2131362085
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 82
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L12
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Preview;->tint(Landroid/widget/ImageView;I)V
  :L12
  .line 85
    goto :L14
  :L13
  .line 84
    move-exception p0
  :L14
  .line 86
    return-void
.end method

.method private static color(Landroid/content/Context;)I
  .registers 2
  .line 43
    const-string v0, "preview_text"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 44
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 45
    const/4 v0, 2
    if-ne p0, v0, :L3
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 47
    if-eqz p0, :L1
    const/high16 v0, 0xFF000000
    or-int/2addr p0, v0
    goto :L2
  :L1
    const/4 p0, -1
  :L2
    return p0
  :L3
  .line 49
    const/4 p0, 0
    return p0
.end method

.method private static text(Landroid/app/Activity;II)V
  .registers 3
  .line 89
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 90
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 91
    return-void
.end method

.method private static tint(Landroid/widget/ImageView;I)V
  .registers 7
  .line 106
    if-nez p1, :L0
  .line 107
    invoke-virtual { p0 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 108
    return-void
  :L0
  .line 110
    new-instance v0, Landroid/graphics/ColorMatrix;
    const/16 v1, 20
    new-array v1, v1, [F
    const/4 v2, 0
    const/4 v3, 0
    aput v3, v1, v2
    const/4 v2, 1
    aput v3, v1, v2
    const/4 v2, 2
    aput v3, v1, v2
    const/4 v2, 3
    aput v3, v1, v2
  .line 111
    invoke-static { p1 }, Landroid/graphics/Color;->red(I)I
    move-result v2
    int-to-float v2, v2
    const/4 v4, 4
    aput v2, v1, v4
    const/4 v2, 5
    aput v3, v1, v2
    const/4 v2, 6
    aput v3, v1, v2
    const/4 v2, 7
    aput v3, v1, v2
    const/16 v2, 8
    aput v3, v1, v2
  .line 112
    invoke-static { p1 }, Landroid/graphics/Color;->green(I)I
    move-result v2
    int-to-float v2, v2
    const/16 v4, 9
    aput v2, v1, v4
    const/16 v2, 10
    aput v3, v1, v2
    const/16 v2, 11
    aput v3, v1, v2
    const/16 v2, 12
    aput v3, v1, v2
    const/16 v2, 13
    aput v3, v1, v2
  .line 113
    invoke-static { p1 }, Landroid/graphics/Color;->blue(I)I
    move-result p1
    int-to-float p1, p1
    const/16 v2, 14
    aput p1, v1, v2
    const/16 p1, 15
    aput v3, v1, p1
    const/16 p1, 16
    aput v3, v1, p1
    const/16 p1, 17
    aput v3, v1, p1
    const/16 p1, 18
    const/high16 v2, 0x3F800000
    aput v2, v1, p1
    const/16 p1, 19
    aput v3, v1, p1
    invoke-direct { v0, v1 }, Landroid/graphics/ColorMatrix;-><init>([F)V
  .line 116
    new-instance p1, Landroid/graphics/ColorMatrixColorFilter;
    invoke-direct { p1, v0 }, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  .line 117
    return-void
.end method
