.class public final Lcom/innioasis/ipp/Eq;
.super Ljava/lang/Object;
.source "Eq.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Eq$Track;,
    Lcom/innioasis/ipp/Eq$Stretch;
  }
.end annotation

.field private final static ACTIVE:I = -5374161

.field private final static BAR:I = -12779554

.field private final static KNOB_DP:I = 14

.field private final static MIN_SCALE:F = 0.5F

.field private final static OUTLINE_PX:I = 2

.field private final static SIZE:F = 16.0F

.field private final static SIZE_RESET:F = 14.0F

.field private final static SIZE_TITLE:F = 18.0F

.field private final static WIDEST:Ljava/lang/String; = "-15"

.field private final static WIDEST_PLUS:Ljava/lang/String; = "+15"

.field private static fitScale:F

.field private static host:Ljava/lang/ref/WeakReference;

.field private static sideH:I

.field private static sideW:I

.method static constructor <clinit>()V
  .registers 1
  .line 118
    const/high16 v0, 0x3F800000
    sput v0, Lcom/innioasis/ipp/Eq;->fitScale:F
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 35
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static active(Landroid/widget/TextView;)V
  .registers 2
  .line 49
    if-nez p0, :L0
    return-void
  :L0
  .line 50
    invoke-static { }, Lcom/innioasis/ipp/Eq;->activeColor()I
    move-result v0
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 51
    return-void
.end method

.method private static activeColor()I
  .registers 1
  .line 54
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 55
    if-eqz v0, :L0
    goto :L1
  :L0
    const v0, -5374161
  :L1
    return v0
.end method

.method private static bar()I
  .registers 1
  .line 87
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 88
    if-nez v0, :L0
    const v0, -12779554
  :L0
    return v0
.end method

.method private static channel(I)D
  .registers 5
  .line 312
    int-to-double v0, p0
    const-wide v2, 4643176031446892544L
    invoke-static { v0, v1 }, Ljava/lang/Double;->isNaN(D)Z
    div-double/2addr v0, v2
  .line 313
    const-wide v2, 4585821665623414051L
    cmpg-double p0, v0, v2
    if-gtz p0, :L0
    const-wide v2, 4623462931452961751L
    div-double/2addr v0, v2
    goto :L1
  :L0
    const-wide v2, 4588087156379966505L
    add-double/2addr v0, v2
    const-wide v2, 4607430116779522785L
    div-double/2addr v0, v2
    const-wide v2, 4612586738352862003L
    invoke-static { v0, v1, v2, v3 }, Ljava/lang/Math;->pow(DD)D
    move-result-wide v0
  :L1
    return-wide v0
.end method

.method private static contrast(II)D
  .registers 8
  .line 301
    invoke-static { p0 }, Lcom/innioasis/ipp/Eq;->luminance(I)D
    move-result-wide v0
  .line 302
    invoke-static { p1 }, Lcom/innioasis/ipp/Eq;->luminance(I)D
    move-result-wide p0
  .line 303
    invoke-static { v0, v1, p0, p1 }, Ljava/lang/Math;->max(DD)D
    move-result-wide v2
    const-wide v4, 4587366580439587226L
    add-double/2addr v2, v4
    invoke-static { v0, v1, p0, p1 }, Ljava/lang/Math;->min(DD)D
    move-result-wide p0
    add-double/2addr p0, v4
    div-double/2addr v2, p0
    return-wide v2
.end method

.method public static editBox(Lcom/innioasis/y1/databinding/DialogEqEditBinding;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 93
    if-nez p0, :L0
    return-void
  :L0
  .line 95
    invoke-virtual { p0 }, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->getRoot()Landroidx/cardview/widget/CardView;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Eq;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 96
    iget-object v0, p0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Eq;->menuText(Z)I
    move-result v2
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 97
    iget-object p0, p0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->reset:Landroid/widget/TextView;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Eq;->editReset(Landroid/widget/TextView;Z)V
  :L1
  .line 99
    goto :L3
  :L2
  .line 98
    move-exception p0
  :L3
  .line 100
    return-void
.end method

.method public static editFit(Landroid/app/Dialog;Lcom/innioasis/y1/databinding/DialogEqEditBinding;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 21
  .line 137
    move-object/from16 v0, p1
    if-eqz p0, :L12
    if-nez v0, :L0
    goto/16 :L12
  :L0
  .line 139
    invoke-virtual/range { p0 .. p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v1
  .line 140
    if-nez v1, :L1
    return-void
  :L1
  .line 141
    iget-object v2, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
  .line 142
    iget v3, v2, Landroid/util/DisplayMetrics;->density:F
  .line 143
    iget v4, v2, Landroid/util/DisplayMetrics;->heightPixels:I
    const/high16 v5, 0x42000000
    mul-float v5, v5, v3
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
    sub-int/2addr v4, v5
  .line 144
    iget v5, v2, Landroid/util/DisplayMetrics;->widthPixels:I
    const/high16 v6, 0x41800000
    mul-float v7, v3, v6
    invoke-static { v7 }, Ljava/lang/Math;->round(F)I
    move-result v7
    sub-int/2addr v5, v7
  .line 145
    const/16 v7, 300
    invoke-static { v7, v5 }, Ljava/lang/Math;->min(II)I
    move-result v7
  .line 147
    invoke-virtual/range { p1 .. p1 }, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->getRoot()Landroidx/cardview/widget/CardView;
    move-result-object v8
  .line 148
    invoke-virtual { v8 }, Landroid/view/View;->getPaddingTop()I
    move-result v9
    invoke-virtual { v8 }, Landroid/view/View;->getPaddingBottom()I
    move-result v10
    add-int/2addr v9, v10
    const/high16 v10, 0x40800000
    mul-float v10, v10, v3
    invoke-static { v10 }, Ljava/lang/Math;->round(F)I
    move-result v10
    add-int/2addr v9, v10
    add-int/lit8 v9, v9, 4
  .line 149
    invoke-virtual { v8 }, Landroid/view/View;->getPaddingLeft()I
    move-result v10
    invoke-virtual { v8 }, Landroid/view/View;->getPaddingRight()I
    move-result v8
    add-int/2addr v10, v8
    const/high16 v8, 0x41F00000
    mul-float v8, v8, v3
    invoke-static { v8 }, Ljava/lang/Math;->round(F)I
    move-result v8
    add-int/2addr v10, v8
    add-int/lit8 v10, v10, 4
  .line 150
    const/high16 v8, 0x41600000
    mul-float v11, v3, v8
    invoke-static { v11 }, Ljava/lang/Math;->round(F)I
    move-result v11
  .line 151
    const/high16 v12, 0x41C00000
    mul-float v12, v12, v3
    invoke-static { v12 }, Ljava/lang/Math;->round(F)I
    move-result v12
  .line 152
    const/high16 v13, 0x433C0000
    mul-float v3, v3, v13
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 154
    new-instance v13, Landroid/text/TextPaint;
    iget-object v14, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    invoke-virtual { v14 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v14
    invoke-direct { v13, v14 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 155
    nop
  .line 156
    nop
  .line 157
    nop
  .line 158
    const/high16 v15, 0x3F800000
  :L2
  .line 160
    const/high16 v16, 0x41900000
    mul-float v14, v15, v16
    invoke-static { v13, v14, v2 }, Lcom/innioasis/ipp/Eq;->line(Landroid/text/TextPaint;FLandroid/util/DisplayMetrics;)I
    move-result v16
  .line 161
    mul-float v8, v15, v6
    invoke-static { v13, v8, v2 }, Lcom/innioasis/ipp/Eq;->line(Landroid/text/TextPaint;FLandroid/util/DisplayMetrics;)I
    move-result v17
  .line 162
    invoke-static { v13, v8, v2 }, Lcom/innioasis/ipp/Eq;->line(Landroid/text/TextPaint;FLandroid/util/DisplayMetrics;)I
    move-result v6
    invoke-static { v6, v11 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 163
    move/from16 v18, v11
    const/4 v11, 2
    invoke-static { v11, v8, v2 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result v8
    invoke-virtual { v13, v8 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 164
    const-string v8, "-15"
    invoke-virtual { v13, v8 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v8
    const-string v11, "+15"
    invoke-virtual { v13, v11 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v11
    invoke-static { v8, v11 }, Ljava/lang/Math;->max(FF)F
    move-result v8
    move-object v11, v1
    float-to-double v0, v8
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int v0, v0
    const/4 v1, 2
    add-int/2addr v0, v1
  .line 165
    sub-int v1, v4, v9
    sub-int v1, v1, v16
    sub-int/2addr v1, v12
    div-int/lit8 v1, v1, 5
  .line 166
    add-int v8, v0, v3
    add-int/2addr v8, v10
    invoke-static { v7, v8 }, Ljava/lang/Math;->max(II)I
    move-result v8
  .line 167
    move/from16 v16, v3
    add-int v3, v17, v6
    move/from16 v17, v7
    const/4 v7, 1
    if-gt v3, v1, :L3
    const/high16 v1, 0x41600000
    mul-float v3, v15, v1
    invoke-static { v13, v3, v2 }, Lcom/innioasis/ipp/Eq;->line(Landroid/text/TextPaint;FLandroid/util/DisplayMetrics;)I
    move-result v1
    if-gt v1, v12, :L3
    if-gt v8, v5, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 169
    if-nez v1, :L6
    const/high16 v1, 0x3F000000
    cmpg-float v1, v15, v1
    if-gtz v1, :L5
    goto :L6
  :L5
  .line 170
    const v0, 1028443341
    sub-float/2addr v15, v0
  .line 171
    move-object/from16 v0, p1
    move-object v1, v11
    move/from16 v3, v16
    move/from16 v7, v17
    move/from16 v11, v18
    const/high16 v6, 0x41800000
    const/high16 v8, 0x41600000
    goto :L2
  :L6
  .line 172
    if-le v8, v5, :L7
    goto :L8
  :L7
    move v5, v8
  :L8
  .line 173
    sput v15, Lcom/innioasis/ipp/Eq;->fitScale:F
  .line 174
    sput v0, Lcom/innioasis/ipp/Eq;->sideW:I
  .line 175
    sput v6, Lcom/innioasis/ipp/Eq;->sideH:I
  .line 177
    move-object/from16 v0, p1
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    const/4 v2, 2
    invoke-virtual { v1, v2, v14 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 178
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    invoke-virtual { v1, v7 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 179
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->title:Landroid/widget/TextView;
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 180
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->reset:Landroid/widget/TextView;
    const/high16 v2, 0x41600000
    mul-float v15, v15, v2
    const/4 v2, 2
    invoke-virtual { v1, v2, v15 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 181
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->reset:Landroid/widget/TextView;
    invoke-virtual { v1, v7 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 183
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/View;
  .line 184
    invoke-virtual { v1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 185
    const/4 v3, -1
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 186
    invoke-virtual { v1, v2 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 187
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
  .line 188
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;
  .line 189
    const/4 v2, 0
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I
  .line 190
    const/high16 v2, 0x3F800000
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 191
    iget-object v2, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 192
    iget-object v1, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v1 }, Lcom/innioasis/ipp/Eq;->stretch(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 194
    invoke-virtual { v11, v5, v4 }, Landroid/view/Window;->setLayout(II)V
  .line 195
    iget-object v0, v0, Lcom/innioasis/y1/databinding/DialogEqEditBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 196
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L9
  .line 198
    goto :L11
  :L10
  .line 197
    move-exception v0
  :L11
  .line 199
    return-void
  :L12
  .line 137
    return-void
.end method

.method public static editReset(Landroid/widget/TextView;Z)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 104
    if-nez p0, :L0
    return-void
  :L0
  .line 106
    const/4 v0, 0
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Eq;->menuText(Z)I
    move-result v0
  .line 107
    if-nez p1, :L2
    const p1, 16777215
    and-int/2addr p1, v0
    ushr-int/lit8 v0, v0, 24
    mul-int/lit8 v0, v0, 4
    div-int/lit8 v0, v0, 5
    shl-int/lit8 v0, v0, 24
    or-int/2addr v0, p1
  :L2
  .line 108
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { p1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 109
    invoke-virtual { p1, v0 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 110
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x40C00000
    mul-float v0, v0, v1
    invoke-virtual { p1, v0 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 111
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/Eq;->menuBg()I
    move-result p1
    const/high16 v0, 0xFF000000
    or-int/2addr p1, v0
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L3
  .line 114
    goto :L5
  :L4
  .line 113
    move-exception p0
  :L5
  .line 115
    return-void
.end method

.method public static editRow(Lcom/innioasis/y1/databinding/ItemEqEditBinding;II)V
  .catchall { :L2 .. :L11 } :L12
  .registers 10
  .line 213
    if-nez p0, :L0
    return-void
  :L0
  .line 215
    const/4 v0, 0
    const/4 v1, 1
    if-ne p1, p2, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 216
    invoke-static { v0 }, Lcom/innioasis/ipp/Eq;->menuText(Z)I
    move-result p2
  .line 217
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->hz:Landroid/widget/TextView;
    invoke-virtual { v2, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 218
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->hz:Landroid/widget/TextView;
    sget v3, Lcom/innioasis/ipp/Eq;->fitScale:F
    const/high16 v4, 0x41800000
    mul-float v3, v3, v4
    const/4 v4, 2
    invoke-virtual { v2, v4, v3 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 219
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->hz:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getMaxLines()I
    move-result v2
    if-eq v2, v1, :L3
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->hz:Landroid/widget/TextView;
    invoke-virtual { v2, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  :L3
  .line 220
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->leftText:Landroid/widget/TextView;
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 221
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->rightText:Landroid/widget/TextView;
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Eq;->side(Landroid/widget/TextView;I)V
  .line 222
    invoke-static { p0 }, Lcom/innioasis/ipp/Eq;->value(Lcom/innioasis/y1/databinding/ItemEqEditBinding;)I
    move-result v2
  .line 223
    iget-object v3, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->rightText:Landroid/widget/TextView;
    if-lez v2, :L4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "+"
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    goto :L5
  :L4
    invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v2
  :L5
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 225
    invoke-virtual { p0 }, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->getRoot()Landroid/widget/LinearLayout;
    move-result-object v2
  .line 226
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 227
    instance-of v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v5, :L7
  .line 228
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 229
    iget v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    const/4 v6, -1
    if-ne v5, v6, :L6
    iget v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    if-eqz v5, :L7
  :L6
  .line 230
    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 231
    iput v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 232
    invoke-virtual { v2, v3 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L7
  .line 236
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->seekbar:Landroid/widget/SeekBar;
  .line 237
    invoke-virtual { p0 }, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Eq;->bar()I
    move-result v2
  .line 239
    const v3, 16777215
    and-int/2addr p2, v3
    const/high16 v3, 0x33000000
    or-int/2addr p2, v3
  .line 240
    invoke-virtual { p0 }, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v3
  .line 241
    instance-of v5, v3, Lcom/innioasis/ipp/Eq$Track;
    if-eqz v5, :L8
    move-object v5, v3
    check-cast v5, Lcom/innioasis/ipp/Eq$Track;
    iget v5, v5, Lcom/innioasis/ipp/Eq$Track;->bar:I
    if-ne v5, v2, :L8
    check-cast v3, Lcom/innioasis/ipp/Eq$Track;
    iget v3, v3, Lcom/innioasis/ipp/Eq$Track;->track:I
    if-eq v3, p2, :L9
  :L8
  .line 242
    const/high16 v3, 0x40A00000
    mul-float v3, v3, v0
    invoke-static { v2, p2, v3 }, Lcom/innioasis/ipp/Eq$Track;->make(IIF)Lcom/innioasis/ipp/Eq$Track;
    move-result-object p2
    invoke-virtual { p0, p2 }, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 244
    new-instance p2, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { p2 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 245
    invoke-virtual { p2, v1 }, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V
  .line 246
    const/high16 v1, 0x41600000
    mul-float v0, v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 247
    invoke-virtual { p2, v0, v0 }, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V
  .line 248
    invoke-virtual { p2, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 249
    if-eqz p1, :L10
    invoke-static { v2 }, Lcom/innioasis/ipp/Eq;->outline(I)I
    move-result p1
    invoke-virtual { p2, v4, p1 }, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
  :L10
  .line 250
    invoke-virtual { p0, p2 }, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V
  :L11
  .line 252
    goto :L13
  :L12
  .line 251
    move-exception p0
  :L13
  .line 253
    return-void
.end method

.method private static line(Landroid/text/TextPaint;FLandroid/util/DisplayMetrics;)I
  .registers 4
  .line 203
    const/4 v0, 2
    invoke-static { v0, p1, p2 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result p1
    invoke-virtual { p0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 204
    invoke-virtual { p0 }, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;
    move-result-object p0
  .line 205
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I
    iget p0, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I
    sub-int/2addr p1, p0
    return p1
.end method

.method private static luminance(I)D
  .registers 7
  .line 307
    shr-int/lit8 v0, p0, 16
    and-int/lit16 v0, v0, 255
    invoke-static { v0 }, Lcom/innioasis/ipp/Eq;->channel(I)D
    move-result-wide v0
    const-wide v2, 4596827742536767164L
    mul-double v0, v0, v2
    shr-int/lit8 v2, p0, 8
    and-int/lit16 v2, v2, 255
    invoke-static { v2 }, Lcom/innioasis/ipp/Eq;->channel(I)D
    move-result-wide v2
    const-wide v4, 4604617168452267173L
    mul-double v2, v2, v4
    add-double/2addr v0, v2
    and-int/lit16 p0, p0, 255
  .line 308
    invoke-static { p0 }, Lcom/innioasis/ipp/Eq;->channel(I)D
    move-result-wide v2
    const-wide v4, 4589866978952703325L
    mul-double v2, v2, v4
    add-double/2addr v0, v2
  .line 307
    return-wide v0
.end method

.method private static menuBg()I
  .registers 1
  .line 79
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuBackground()I
    move-result v0
    return v0
.end method

.method private static menuText(Z)I
  .registers 1
  .line 83
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->menuText(Z)I
    move-result p0
    return p0
.end method

.method private static outline(I)I
  .registers 13
  .line 282
    invoke-static { }, Lcom/innioasis/ipp/Eq;->menuBg()I
    move-result v0
    const/high16 v1, 0xFF000000
    or-int/2addr v0, v1
  .line 283
    const/4 v2, 1
    invoke-static { v2 }, Lcom/innioasis/ipp/Eq;->menuText(Z)I
    move-result v2
    const/4 v3, 0
    invoke-static { v3 }, Lcom/innioasis/ipp/Eq;->menuText(Z)I
    move-result v4
    const/4 v5, -1
    filled-new-array { v2, v4, v5, v1 }, [I
    move-result-object v2
  .line 284
    aget v4, v2, v3
  .line 285
    nop
  .line 286
    const-wide/16 v5, 0
  :L0
    const/4 v7, 4
    if-ge v3, v7, :L3
  .line 287
    aget v7, v2, v3
    or-int/2addr v7, v1
  .line 288
    invoke-static { v7, v0 }, Lcom/innioasis/ipp/Eq;->contrast(II)D
    move-result-wide v8
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Eq;->contrast(II)D
    move-result-wide v10
    invoke-static { v8, v9, v10, v11 }, Ljava/lang/Math;->min(DD)D
    move-result-wide v8
  .line 290
    double-to-float v10, v8
    const/high16 v11, 0x40000000
    cmpl-float v10, v10, v11
    if-ltz v10, :L1
    return v7
  :L1
  .line 291
    cmpl-double v10, v8, v5
    if-lez v10, :L2
  .line 292
    nop
  .line 293
    move v4, v7
    move-wide v5, v8
  :L2
  .line 286
    add-int/lit8 v3, v3, 1
    goto :L0
  :L3
  .line 296
    return v4
.end method

.method static paint()V
  .catchall { :L2 .. :L7 } :L9
  .registers 5
  .line 344
    sget-object v0, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 345
    sput-object v1, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
  .line 346
    instance-of v1, v0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v1, :L2
    return-void
  :L2
  .line 348
    check-cast v0, Lcom/innioasis/y1/activity/EqActivity;
  .line 349
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 350
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
  .line 351
    instance-of v2, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;
    if-nez v2, :L4
    return-void
  :L4
  .line 352
    check-cast v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;
  .line 354
    invoke-static { }, Lcom/innioasis/y1/activity/EqActivity;->getEqList()Ljava/util/List;
    move-result-object v2
  .line 355
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity;->getMark()I
    move-result v0
  .line 356
    if-eqz v2, :L8
    if-ltz v0, :L8
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v0, v3, :L5
    goto :L8
  :L5
  .line 357
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 358
    instance-of v2, v0, Lcom/innioasis/y1/activity/EqActivity$EqData;
    if-nez v2, :L6
    return-void
  :L6
  .line 359
    check-cast v0, Lcom/innioasis/y1/activity/EqActivity$EqData;
  .line 361
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;->image:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity$EqData;->getIcon()I
    move-result v4
    invoke-virtual { v2, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 362
    iget-object v1, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;->text:Landroid/widget/TextView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity$EqData;->getStr()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 364
    goto :L10
  :L8
  .line 356
    return-void
  :L9
  .line 363
    move-exception v0
  :L10
  .line 365
    return-void
.end method

.method public static preview(Lcom/innioasis/y1/activity/EqActivity;)V
  .registers 2
  .line 41
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
  .line 42
    return-void
.end method

.method static rowColor(II)I
  .registers 3
  .line 60
    sget-object v0, Lcom/innioasis/y1/utils/EqSPUtils;->INSTANCE:Lcom/innioasis/y1/utils/EqSPUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/EqSPUtils;->getEqualizerInt()I
    move-result v0
    if-ne p0, v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Eq;->activeColor()I
    move-result p1
  :L0
    return p1
.end method

.method private static side(Landroid/widget/TextView;I)V
  .registers 4
  .line 267
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 268
    const/high16 p1, 0x41800000
    sget v0, Lcom/innioasis/ipp/Eq;->fitScale:F
    mul-float v0, v0, p1
    const/4 p1, 2
    invoke-virtual { p0, p1, v0 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 269
    invoke-virtual { p0 }, Landroid/widget/TextView;->getMaxLines()I
    move-result p1
    const/4 v0, 1
    if-eq p1, v0, :L0
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  :L0
  .line 270
    invoke-virtual { p0 }, Landroid/widget/TextView;->getGravity()I
    move-result p1
    const/16 v0, 17
    if-eq p1, v0, :L1
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setGravity(I)V
  :L1
  .line 271
    sget p1, Lcom/innioasis/ipp/Eq;->sideW:I
    if-gtz p1, :L2
    return-void
  :L2
  .line 272
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 273
    if-eqz p1, :L4
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
    sget v1, Lcom/innioasis/ipp/Eq;->sideW:I
    if-ne v0, v1, :L3
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I
    sget v1, Lcom/innioasis/ipp/Eq;->sideH:I
    if-eq v0, v1, :L4
  :L3
  .line 274
    sget v0, Lcom/innioasis/ipp/Eq;->sideW:I
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 275
    sget v0, Lcom/innioasis/ipp/Eq;->sideH:I
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 276
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L4
  .line 278
    return-void
.end method

.method public static stretch(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 373
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Eq$Stretch;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Eq$Stretch;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
    goto :L3
  :L2
  .line 374
    move-exception p0
    goto :L4
  :L3
  .line 375
    nop
  :L4
  .line 376
    return-void
.end method

.method public static underline(Landroid/widget/TextView;I)V
  .registers 4
  .line 65
    if-nez p0, :L0
    return-void
  :L0
  .line 66
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaintFlags()I
    move-result v0
  .line 67
    sget-object v1, Lcom/innioasis/y1/utils/EqSPUtils;->INSTANCE:Lcom/innioasis/y1/utils/EqSPUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/EqSPUtils;->getEqualizerInt()I
    move-result v1
    if-ne p1, v1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 68
    if-eqz p1, :L3
    or-int/lit8 p1, v0, 8
    goto :L4
  :L3
    and-int/lit8 p1, v0, -9
  :L4
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setPaintFlags(I)V
  .line 69
    return-void
.end method

.method private static value(Lcom/innioasis/y1/databinding/ItemEqEditBinding;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 257
    nop
  :L0
  .line 259
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->leftText:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v0
  :L1
  .line 262
    goto :L3
  :L2
  .line 260
    move-exception v0
  .line 261
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->seekbar:Landroid/widget/SeekBar;
    invoke-virtual { v0 }, Landroid/widget/SeekBar;->getMax()I
    move-result v0
    div-int/lit8 v0, v0, 2
    neg-int v0, v0
  :L3
  .line 263
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemEqEditBinding;->seekbar:Landroid/widget/SeekBar;
    invoke-virtual { p0 }, Landroid/widget/SeekBar;->getProgress()I
    move-result p0
    add-int/2addr p0, v0
    return p0
.end method
