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
  .line 384
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 385
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 17
    if-eqz v1, :L0
  .line 386
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    goto :L1
  :L0
  .line 387
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;
    if-eqz v1, :L1
  .line 388
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  :L1
  .line 390
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 391
    instance-of v0, p0, Landroid/widget/LinearLayout;
    if-eqz v0, :L2
  .line 392
    check-cast p0, Landroid/widget/LinearLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
    goto :L3
  :L2
  .line 393
    instance-of v0, p0, Landroid/widget/RelativeLayout;
    if-eqz v0, :L3
  .line 394
    check-cast p0, Landroid/widget/RelativeLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/RelativeLayout;->setGravity(I)V
  :L3
  .line 396
    return-void
.end method

.method private static dress(Landroid/view/View;IIZ)V
  .registers 7
  .line 184
    const v0, 16707006
    const/4 v1, 0
    if-eq p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 185
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L5
  .line 186
    check-cast p0, Landroid/widget/TextView;
  .line 187
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p2
  .line 188
    if-eqz p2, :L4
    invoke-interface { p2 }, Ljava/lang/CharSequence;->length()I
    move-result p2
    if-nez p2, :L2
    goto :L4
  :L2
  .line 192
    const/16 p2, 17
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 193
    if-eqz v0, :L3
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L3
  .line 194
    return-void
  :L4
  .line 189
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 190
    return-void
  :L5
  .line 196
    instance-of v2, p0, Landroid/widget/ProgressBar;
    if-eqz v2, :L7
  .line 199
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
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->centre(Landroid/view/View;)V
  :L6
  .line 202
    return-void
  :L7
  .line 204
    instance-of v2, p0, Landroid/view/ViewGroup;
    if-eqz v2, :L11
  .line 208
    if-eqz p3, :L8
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 209
    check-cast p0, Landroid/view/ViewGroup;
  .line 210
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
  .line 211
    return-void
  :L11
  .line 213
    if-eqz v0, :L12
  .line 216
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p3
  .line 217
    if-eqz p3, :L12
    iget v0, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v0, :L12
    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-gt p3, p2, :L12
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  :L12
  .line 219
    return-void
.end method

.method private static fade(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 7
  .line 400
    nop
  .line 401
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
  .line 402
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
  .line 403
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
  .line 404
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
  .line 401
    return-object v0
.end method

.method public static hidden(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 165
    if-nez p0, :L0
    return-void
  :L0
  .line 167
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 168
    if-nez p0, :L1
    return-void
  :L1
  .line 170
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  .line 171
    const/4 v1, 2
    invoke-virtual { p0, v1 }, Landroid/view/Window;->clearFlags(I)V
  .line 172
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual { p0, v1 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 173
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
  .line 174
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L4
  .line 175
    check-cast p0, Landroid/view/ViewGroup;
  .line 176
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
  .line 180
    goto :L6
  :L5
  .line 178
    move-exception p0
  :L6
  .line 181
    return-void
.end method

.method private static holdsSpin(Landroid/view/View;)Z
  .registers 5
  .line 262
    instance-of v0, p0, Lcom/innioasis/ipp/Loading$Spin;
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 263
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v0, :L1
    return v2
  :L1
  .line 264
    check-cast p0, Landroid/view/ViewGroup;
  .line 265
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v0, v3, :L4
  .line 266
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v3
    if-eqz v3, :L3
    return v1
  :L3
  .line 265
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 268
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
  .line 119
    if-nez p0, :L0
    return-void
  :L0
  .line 121
    const-string v0, ""
    invoke-virtual { p0, v0 }, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V
  .line 122
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 123
    if-nez p0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  :L2
  .line 124
    if-nez v0, :L3
    return-void
  :L3
  .line 126
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 127
    const v2, 16707006
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v3
  .line 128
    const/4 v4, 0
    if-eq v3, v2, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
  .line 129
    invoke-virtual { v0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v6
    iget v6, v6, Landroid/util/DisplayMetrics;->density:F
  .line 130
    if-eqz v5, :L7
  .line 133
    new-instance v7, Landroid/graphics/Rect;
    invoke-direct { v7 }, Landroid/graphics/Rect;-><init>()V
  .line 134
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v8
  .line 135
    if-eqz v8, :L6
    invoke-virtual { v8, v7 }, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z
  :L6
  .line 136
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v8 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 137
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 138
    const/high16 v3, 0x41200000
    mul-float v3, v3, v6
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 139
    invoke-virtual { p0, v8 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 140
    iget v3, v7, Landroid/graphics/Rect;->left:I
    iget v8, v7, Landroid/graphics/Rect;->top:I
    iget v9, v7, Landroid/graphics/Rect;->right:I
    iget v7, v7, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v3, v8, v9, v7 }, Landroid/view/View;->setPadding(IIII)V
  :L7
  .line 144
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v1
  .line 145
    const/high16 v2, 0x40800000
    mul-float v6, v6, v2
    float-to-int v2, v6
  .line 146
    instance-of v3, v0, Landroid/view/ViewGroup;
    if-eqz v3, :L10
  .line 147
    move-object v3, v0
    check-cast v3, Landroid/view/ViewGroup;
  .line 148
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
  .line 149
    goto :L11
  :L10
  .line 150
    invoke-static { v0, v1, v2, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
  :L11
  .line 153
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L12
    const v0, 2131887152
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  :L12
  .line 156
    goto :L14
  :L13
  .line 154
    move-exception p0
  :L14
  .line 157
    return-void
.end method

.method private static spin(Landroid/view/View;II)Z
  .catchall { :L3 .. :L6 } :L8
  .registers 9
  .line 230
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
  :L1
  .line 231
    instance-of v2, v1, Landroid/view/ViewGroup;
    const/4 v3, 0
    if-nez v2, :L2
    return v3
  :L2
  .line 232
    check-cast v1, Landroid/view/ViewGroup;
  :L3
  .line 234
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 237
    instance-of v4, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    if-eqz v4, :L4
  .line 238
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v2 }, Lcom/innioasis/ipp/Pad;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object p2
  .line 239
    const/4 v2, 4
    goto :L5
  :L4
  .line 240
    instance-of v2, v1, Landroid/widget/LinearLayout;
    if-eqz v2, :L7
    if-lez p2, :L7
  .line 241
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, p2, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 242
    const/16 p2, 17
    iput p2, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 243
    move-object v4, v1
    check-cast v4, Landroid/widget/LinearLayout;
    invoke-virtual { v4, p2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 244
    nop
  .line 245
    nop
  .line 246
    const/16 p2, 8
    move-object p2, v2
    const/16 v2, 8
  :L5
  .line 249
    new-instance v4, Lcom/innioasis/ipp/Loading$Spin;
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-direct { v4, v5, p1 }, Lcom/innioasis/ipp/Loading$Spin;-><init>(Landroid/content/Context;I)V
  .line 250
    invoke-static { }, Landroid/view/View;->generateViewId()I
    move-result p1
    invoke-virtual { v4, p1 }, Lcom/innioasis/ipp/Loading$Spin;->setId(I)V
  .line 251
    invoke-virtual { v1, p0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result p1
    const/4 v5, 1
    add-int/2addr p1, v5
    invoke-virtual { v1, v4, p1, p2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 252
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 254
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L6
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L6
  .line 255
    return v5
  :L7
  .line 247
    return v3
  :L8
  .line 256
    move-exception p0
  .line 257
    return v3
.end method

.method private static text(Landroid/view/View;II)V
  .registers 3
  .line 410
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 411
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 412
    return-void
.end method
