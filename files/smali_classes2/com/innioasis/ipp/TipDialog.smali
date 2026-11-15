.class public final Lcom/innioasis/ipp/TipDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "TipDialog.java"

.field private final static BOX:I = -7564110

.field private final static CLOSE:I = 1

.field private final static CORNER:F = 10.0F

.field private final static TICK:I

.field private final activity:Landroid/app/Activity;

.field private body:Landroid/widget/TextView;

.field private final closeText:Ljava/lang/String;

.field private final labels:[Landroid/widget/TextView;

.field private off:Z

.field private final pref:Ljava/lang/String;

.field private final rows:[Landroid/view/View;

.field private sel:I

.field private final text:Ljava/lang/String;

.field private tick:Landroid/widget/ImageView;

.field private final tickText:Ljava/lang/String;

.method private constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 60
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 37
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
  .line 38
    const/4 v0, 2
    new-array v1, v0, [Landroid/view/View;
    iput-object v1, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
  .line 39
    new-array v0, v0, [Landroid/widget/TextView;
    iput-object v0, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
  .line 61
    iput-object p1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
  .line 62
    iput-object p2, p0, Lcom/innioasis/ipp/TipDialog;->text:Ljava/lang/String;
  .line 63
    iput-object p3, p0, Lcom/innioasis/ipp/TipDialog;->closeText:Ljava/lang/String;
  .line 64
    iput-object p4, p0, Lcom/innioasis/ipp/TipDialog;->tickText:Ljava/lang/String;
  .line 65
    iput-object p5, p0, Lcom/innioasis/ipp/TipDialog;->pref:Ljava/lang/String;
  .line 66
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 139
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private paint()V
  .registers 10
  .line 143
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100267
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 144
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v4, 0
    invoke-virtual { v2, v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 145
    const/4 v0, 0
  :L0
    const/4 v2, 2
    if-ge v0, v2, :L14
  .line 146
    iget v2, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    const/4 v3, 1
    if-ne v0, v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 147
    if-ne v0, v3, :L7
  .line 148
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    const v5, 2131230870
    const v6, 2131230869
    if-eqz v2, :L3
    const v7, 2131230870
    goto :L4
  :L3
    const v7, 2131230869
  :L4
    invoke-virtual { v3, v7 }, Landroid/widget/TextView;->setBackgroundResource(I)V
  .line 149
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v7, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v7, v7, v0
  .line 150
    if-eqz v2, :L5
    goto :L6
  :L5
    const v5, 2131230869
  :L6
  .line 149
    invoke-virtual { v3, v7, v5, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetBackground(Landroid/widget/TextView;IZ)V
  .line 151
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v5, v5, v0
    const/4 v6, -1
    invoke-virtual { v3, v5, v6, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetTextColor(Landroid/widget/TextView;IZ)V
  .line 152
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, v0
    invoke-static { v2 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 153
    goto :L13
  :L7
  .line 155
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v3 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    if-eqz v2, :L8
  .line 156
    const v5, 2131100253
    goto :L9
  :L8
    const v5, 2131100267
  :L9
  .line 155
    invoke-virtual { v3, v5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
  .line 157
    iget-object v5, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v5, v5, v0
    const/4 v6, 0
    invoke-virtual { v5, v6 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 158
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v6, v6, v0
  .line 159
    const v7, 2131231051
    if-eqz v2, :L10
    const v8, 2131231051
    goto :L11
  :L10
    const/4 v8, 0
  :L11
  .line 158
    invoke-virtual { v5, v6, v8, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 160
    if-eqz v2, :L12
    iget-object v5, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v5, v5, v0
    invoke-virtual { v5 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v5
    if-nez v5, :L12
  .line 161
    iget-object v5, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v5, v5, v0
    invoke-virtual { v5, v7 }, Landroid/view/View;->setBackgroundResource(I)V
  :L12
  .line 163
    iget-object v5, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v5, v5, v0
    invoke-static { v5 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 164
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v6, v6, v0
    invoke-virtual { v5, v6, v3, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 165
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 166
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    iget-boolean v3, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L13
  .line 145
    add-int/lit8 v0, v0, 1
    goto/16 :L0
  :L14
  .line 168
    return-void
.end method

.method public static show(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/innioasis/ipp/TipDialog;
  .catchall { :L0 .. :L7 } :L9
  .registers 11
  .line 46
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-static { p0, p2, v0 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :L1
    return-object v1
  :L1
  .line 47
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p1
  .line 48
    if-eqz p1, :L8
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    if-eqz v2, :L8
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L2
    goto :L8
  :L2
  .line 49
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v2, :L3
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v2, v2
    if-lez v2, :L3
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v0, v2, v0
    goto :L4
  :L3
    const-string v0, "OK"
  :L4
    move-object v5, v0
  .line 50
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v0, :L5
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v0, v0
    const/4 v2, 1
    if-le v0, v2, :L5
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v0, v0, v2
    goto :L6
  :L5
    const-string v0, ""
  :L6
    move-object v6, v0
  .line 51
    new-instance v0, Lcom/innioasis/ipp/TipDialog;
    iget-object p1, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    move-object v2, v0
    move-object v3, p0
    move-object v7, p2
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/TipDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .line 52
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->show()V
  :L7
  .line 53
    return-object v0
  :L8
  .line 48
    return-object v1
  :L9
  .line 54
    move-exception p0
  .line 55
    return-object v1
.end method

.method public longDown(II)V
  .registers 3
  .line 192
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 196
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 14
  .line 70
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 71
    new-instance p1, Landroid/widget/LinearLayout;
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { p1, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 72
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 73
    const/16 v1, 10
    const/16 v2, 8
    invoke-virtual { p1, v1, v2, v1, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 74
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v1
  .line 75
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v3 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 76
    const/high16 v4, 0x41200000
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 77
    if-nez v1, :L0
    const v1, -7564110
    goto :L1
  :L0
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L1
    invoke-virtual { v3, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 78
    invoke-virtual { p1, v3 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 80
    new-instance v1, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
  .line 81
    const/high16 v3, 0x41600000
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 82
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 83
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v4, 4
    const/4 v5, 2
    invoke-virtual { v1, v4, v5, v4, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 84
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 85
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->text:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 86
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v2, -1
    const/4 v6, -2
    invoke-virtual { p1, v1, v2, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 88
    new-instance v1, Landroid/widget/LinearLayout;
    iget-object v7, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v7 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 89
    const/4 v7, 0
    invoke-virtual { v1, v7 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 90
    const/16 v8, 16
    invoke-virtual { v1, v8 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 91
    const/4 v9, 5
    const/4 v10, 3
    invoke-virtual { v1, v9, v10, v9, v10 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 92
    const-string v9, "ipp_flat"
    invoke-virtual { v1, v9 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 93
    new-instance v10, Landroid/widget/ImageView;
    iget-object v11, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v10, v11 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v10, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
  .line 94
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v11
    invoke-virtual { v10, v11 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 95
    iget-object v10, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    sget-object v11, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v10, v11 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 96
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v8, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 97
    const/4 v8, 6
    iput v8, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 98
    iget-object v11, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    invoke-virtual { v1, v11, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 99
    new-instance v10, Landroid/widget/TextView;
    iget-object v11, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v10, v11 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 100
    invoke-virtual { v10, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 101
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v10, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 102
    invoke-virtual { v10, v5 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 103
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->tickText:Ljava/lang/String;
    invoke-virtual { v10, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 104
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v7, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 105
    const/high16 v5, 0x3F800000
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 106
    invoke-virtual { v1, v10, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 107
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aput-object v1, v3, v7
  .line 108
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aput-object v10, v3, v7
  .line 109
    invoke-virtual { p1, v1, v2, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 111
    new-instance v1, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 112
    invoke-virtual { v1, v9 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 113
    const/high16 v3, 0x41700000
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 114
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 115
    const/16 v3, 17
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 116
    invoke-virtual { v1, v8, v4, v8, v4 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 117
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 118
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->closeText:Ljava/lang/String;
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 119
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aput-object v1, v4, v0
  .line 120
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aput-object v1, v4, v0
  .line 121
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v4 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 122
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 123
    invoke-virtual { v0, v7, v8, v7, v7 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 124
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v6, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 125
    invoke-virtual { p1, v0, v2, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 127
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/TipDialog;->setContentView(Landroid/view/View;)V
  .line 128
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->getWindow()Landroid/view/Window;
    move-result-object p1
  .line 129
    if-eqz p1, :L2
  .line 130
    invoke-virtual { p1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 131
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131165784
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v1
    const v2, 1071225242
    mul-float v1, v1, v2
    float-to-int v1, v1
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 132
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 133
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L2
  .line 135
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
  .line 136
    return-void
.end method

.method public shortUp(I)V
  .registers 5
  .line 172
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 173
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    const/4 v2, 1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-eq p1, v1, :L4
  .line 174
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L4
  :L0
  .line 177
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L3
  .line 178
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-nez p1, :L1
  .line 179
    iget-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    xor-int/2addr p1, v2
    iput-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
  .line 180
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
    goto :L7
  :L1
  .line 182
    iget-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    if-eqz p1, :L2
    iget-object p1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->pref:Ljava/lang/String;
    invoke-static { p1, v0, v2 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L2
  .line 183
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
    goto :L7
  :L3
  .line 185
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L7
  .line 186
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
    goto :L7
  :L4
  .line 175
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-nez p1, :L5
    goto :L6
  :L5
    const/4 v2, 0
  :L6
    iput v2, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
  .line 176
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
  :L7
  .line 188
    return-void
.end method
