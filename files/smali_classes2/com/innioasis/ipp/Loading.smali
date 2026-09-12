.class public final Lcom/innioasis/ipp/Loading;
.super Ljava/lang/Object;
.source "Loading.java"

.field private final static BOX:I = -1

.field private final static FADE:F = 1.15F

.field private final static PROBE:I = 16707006

.field private final static RADIUS_DIP:I = 10

.field private final static RULE_MAX_DIP:I = 4

.field private final static TEXT:I = -15720094

.method private constructor <init>()V
  .registers 1
  .line 44
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static centre(Landroid/view/View;)V
  .registers 4
  .line 178
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 179
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 17
    if-eqz v1, :L0
  .line 180
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    goto :L1
  :L0
  .line 181
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;
    if-eqz v1, :L1
  .line 182
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  :L1
  .line 184
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 185
    instance-of v0, p0, Landroid/widget/LinearLayout;
    if-eqz v0, :L2
  .line 186
    check-cast p0, Landroid/widget/LinearLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
    goto :L3
  :L2
  .line 187
    instance-of v0, p0, Landroid/widget/RelativeLayout;
    if-eqz v0, :L3
  .line 188
    check-cast p0, Landroid/widget/RelativeLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/RelativeLayout;->setGravity(I)V
  :L3
  .line 190
    return-void
.end method

.method private static dress(Landroid/view/View;IIZ)V
  .registers 7
  .line 138
    const v0, 16707006
    const/4 v1, 0
    if-eq p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 139
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L5
  .line 140
    check-cast p0, Landroid/widget/TextView;
  .line 141
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p2
  .line 142
    if-eqz p2, :L4
    invoke-interface { p2 }, Ljava/lang/CharSequence;->length()I
    move-result p2
    if-nez p2, :L2
    goto :L4
  :L2
  .line 146
    const/16 p2, 17
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 147
    if-eqz v0, :L3
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L3
  .line 148
    return-void
  :L4
  .line 143
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 144
    return-void
  :L5
  .line 150
    instance-of v2, p0, Landroid/widget/ProgressBar;
    if-eqz v2, :L7
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->centre(Landroid/view/View;)V
  .line 154
    if-eqz v0, :L6
  .line 155
    check-cast p0, Landroid/widget/ProgressBar;
    invoke-virtual { p0 }, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
  .line 156
    if-eqz p0, :L6
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p0, p1, p2 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L6
  .line 158
    return-void
  :L7
  .line 160
    instance-of v2, p0, Landroid/view/ViewGroup;
    if-eqz v2, :L11
  .line 164
    if-eqz p3, :L8
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 165
    check-cast p0, Landroid/view/ViewGroup;
  .line 166
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
  .line 167
    return-void
  :L11
  .line 169
    if-eqz v0, :L12
  .line 172
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p3
  .line 173
    if-eqz p3, :L12
    iget v0, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v0, :L12
    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-gt p3, p2, :L12
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  :L12
  .line 175
    return-void
.end method

.method private static fade(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 7
  .line 194
    nop
  .line 195
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
  .line 196
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
  .line 197
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
  .line 198
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
  .line 195
    return-object v0
.end method

.method public static paint(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 58
    if-nez p0, :L0
    return-void
  :L0
  .line 60
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 61
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 62
    const/4 v2, -1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 63
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41200000
    mul-float v2, v2, v3
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 64
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 66
    const v1, 16707006
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v0
  .line 67
    if-ne v0, v1, :L1
    const v2, -15720094
    goto :L2
  :L1
    move v2, v0
  :L2
  .line 68
    const v3, 2131361970
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 69
    const v3, 2131362457
    invoke-static { p0, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 70
    if-eq v0, v1, :L3
  .line 71
    const v1, 2131362176
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 72
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L3
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  :L3
  .line 76
    goto :L5
  :L4
  .line 74
    move-exception p0
  :L5
  .line 77
    return-void
.end method

.method public static progress(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L11 } :L12
  .registers 10
  .line 99
    if-nez p0, :L0
    return-void
  :L0
  .line 101
    const-string v0, ""
    invoke-virtual { p0, v0 }, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V
  .line 102
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 103
    if-nez p0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  :L2
  .line 104
    if-nez v0, :L3
    return-void
  :L3
  .line 106
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 107
    const v2, 16707006
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v3
  .line 108
    const/4 v4, 0
    if-eq v3, v2, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
  .line 109
    invoke-virtual { v0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v6
    iget v6, v6, Landroid/util/DisplayMetrics;->density:F
  .line 110
    if-eqz v5, :L7
  .line 113
    new-instance v7, Landroid/graphics/Rect;
    invoke-direct { v7 }, Landroid/graphics/Rect;-><init>()V
  .line 114
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v8
  .line 115
    if-eqz v8, :L6
    invoke-virtual { v8, v7 }, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z
  :L6
  .line 116
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v8 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 117
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 118
    const/high16 v3, 0x41200000
    mul-float v3, v3, v6
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 119
    invoke-virtual { p0, v8 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 120
    iget p0, v7, Landroid/graphics/Rect;->left:I
    iget v3, v7, Landroid/graphics/Rect;->top:I
    iget v8, v7, Landroid/graphics/Rect;->right:I
    iget v7, v7, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, p0, v3, v8, v7 }, Landroid/view/View;->setPadding(IIII)V
  :L7
  .line 124
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result p0
  .line 125
    const/high16 v1, 0x40800000
    mul-float v6, v6, v1
    float-to-int v1, v6
  .line 126
    instance-of v2, v0, Landroid/view/ViewGroup;
    if-eqz v2, :L10
  .line 127
    check-cast v0, Landroid/view/ViewGroup;
  .line 128
    nop
  :L8
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v4, v2, :L9
    invoke-virtual { v0, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, p0, v1, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
    add-int/lit8 v4, v4, 1
    goto :L8
  :L9
  .line 129
    goto :L11
  :L10
  .line 130
    invoke-static { v0, p0, v1, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
  :L11
  .line 134
    goto :L13
  :L12
  .line 132
    move-exception p0
  :L13
  .line 135
    return-void
.end method

.method private static text(Landroid/view/View;II)V
  .registers 3
  .line 204
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 205
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 206
    return-void
.end method
