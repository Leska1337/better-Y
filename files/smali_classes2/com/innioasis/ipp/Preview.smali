.class public final Lcom/innioasis/ipp/Preview;
.super Ljava/lang/Object;
.source "Preview.java"

.field private final static BLACK:I = -15592942

.field private final static DARK:I = 1

.field public final static KEY:Ljava/lang/String; = "preview_text"

.field private final static OUTLINE_DP:F = 2.5F

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
  .line 169
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
  .line 170
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 171
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L1
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L1
  .line 169
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 173
    return-void
.end method

.method static apply(Landroid/app/Activity;)V
  .catchall { :L0 .. :L14 } :L15
  .registers 5
  :L0
  .line 81
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->color(Landroid/content/Context;)I
    move-result v0
  .line 82
    if-nez v0, :L1
    const/4 v1, -1
    goto :L2
  :L1
    move v1, v0
  :L2
  .line 83
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Preview;->nothings(Landroid/view/View;)V
  .line 84
    instance-of v2, p0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v2, :L3
  .line 85
    const v0, 2131362326
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 86
    const v0, 2131362097
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto/16 :L14
  :L3
  .line 87
    instance-of v2, p0, Lcom/innioasis/y1/activity/AboutActivity;
    if-eqz v2, :L5
  .line 88
    const v0, 2131362098
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 89
    const v2, 2131362099
    invoke-static { p0, v2, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 90
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L4
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Preview;->version(Landroid/view/View;)V
  :L4
  .line 91
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->outline(Landroid/content/Context;I)I
    move-result v1
  .line 92
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Preview;->edge(Landroid/view/View;I)V
  .line 93
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->edge(Landroid/view/View;I)V
  .line 94
    goto/16 :L14
  :L5
    instance-of v2, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v2, :L6
  .line 95
    const v0, 2131362437
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto/16 :L14
  :L6
  .line 96
    instance-of v2, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v2, :L8
  .line 97
    const v0, 2131362087
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 98
    if-eqz p0, :L7
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup;
    if-eqz v0, :L7
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->all(Landroid/view/ViewGroup;I)V
  :L7
  .line 99
    goto/16 :L14
  :L8
    instance-of v2, p0, Lcom/innioasis/y1/activity/BrightnessActivity;
    if-eqz v2, :L11
  .line 100
    const v0, 2131361908
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 101
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-eqz v2, :L10
  .line 102
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 103
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Preview;->all(Landroid/view/ViewGroup;I)V
  .line 104
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Preview;->outline(Landroid/content/Context;I)I
    move-result p0
  .line 105
    const/4 v1, 0
  :L9
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L10
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Preview;->edge(Landroid/view/View;I)V
    add-int/lit8 v1, v1, 1
    goto :L9
  :L10
  .line 107
    goto :L14
  :L11
    instance-of v2, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v2, :L12
  .line 108
    const v0, 2131362373
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 109
    const v0, 2131362371
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 110
    const v0, 2131362372
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto :L14
  :L12
  .line 111
    instance-of v2, p0, Lcom/innioasis/y1/activity/DateTwoLevelActivity;
    if-eqz v2, :L13
  .line 112
    const v0, 2131361988
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 113
    const v0, 2131362476
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 114
    const v0, 2131362477
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
  .line 115
    const v0, 2131362478
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Preview;->text(Landroid/app/Activity;II)V
    goto :L14
  :L13
  .line 116
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L14
  .line 117
    const v1, 2131362085
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 118
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L14
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Preview;->tint(Landroid/widget/ImageView;I)V
  :L14
  .line 121
    goto :L16
  :L15
  .line 120
    move-exception p0
  :L16
  .line 122
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

.method private static edge(Landroid/view/View;I)V
  .registers 4
  .line 143
    instance-of v0, p0, Lcom/innioasis/ipp/Outline;
    if-nez v0, :L0
    return-void
  :L0
  .line 144
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/Outline;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x40200000
    mul-float p0, p0, v1
    invoke-virtual { v0, p1, p0 }, Lcom/innioasis/ipp/Outline;->setOutline(IF)V
  .line 145
    return-void
.end method

.method public static fg(Landroid/content/Context;)I
  .registers 1
  .line 54
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->color(Landroid/content/Context;)I
    move-result p0
  .line 55
    if-nez p0, :L0
    const/4 p0, -1
  :L0
    return p0
.end method

.method static nothing(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 61
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 62
    invoke-static { v0 }, Lcom/innioasis/ipp/Preview;->fg(Landroid/content/Context;)I
    move-result v1
  .line 63
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 64
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Preview;->outline(Landroid/content/Context;I)I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Preview;->edge(Landroid/view/View;I)V
  :L1
  .line 66
    goto :L3
  :L2
  .line 65
    move-exception p0
  :L3
  .line 67
    return-void
.end method

.method private static nothings(Landroid/view/View;)V
  .registers 3
  .line 70
    instance-of v0, p0, Lcom/innioasis/ipp/Nothing;
    if-eqz v0, :L0
  .line 71
    check-cast p0, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->nothing(Landroid/widget/TextView;)V
    goto :L2
  :L0
  .line 72
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L2
  .line 73
    check-cast p0, Landroid/view/ViewGroup;
  .line 74
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Preview;->nothings(Landroid/view/View;)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 76
    return-void
.end method

.method private static outline(Landroid/content/Context;I)I
  .registers 4
  .line 129
    const-string v0, "preview_text"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 130
    const/4 v1, 1
    if-ne v0, v1, :L0
    const/4 p0, -1
    return p0
  :L0
  .line 131
    const/4 v1, 2
    if-ne v0, v1, :L4
  .line 132
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeSelColor()I
    move-result v0
  .line 133
    if-eqz v0, :L1
    const/high16 p0, 0xFF000000
    or-int/2addr p0, v0
    goto :L2
  :L1
  .line 134
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v0, 2131100252
    invoke-virtual { p0, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p0
  :L2
  .line 135
    xor-int/2addr p1, p0
    const v0, 16777215
    and-int/2addr p1, v0
    if-nez p1, :L3
    const/4 p0, 0
  :L3
    return p0
  :L4
  .line 137
    const p0, -15592942
    return p0
.end method

.method private static text(Landroid/app/Activity;II)V
  .registers 3
  .line 163
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 164
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 165
    return-void
.end method

.method private static tint(Landroid/widget/ImageView;I)V
  .registers 7
  .line 180
    if-nez p1, :L0
  .line 181
    invoke-virtual { p0 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 182
    return-void
  :L0
  .line 184
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
  .line 185
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
  .line 186
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
  .line 187
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
  .line 190
    new-instance p1, Landroid/graphics/ColorMatrixColorFilter;
    invoke-direct { p1, v0 }, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  .line 191
    return-void
.end method

.method private static version(Landroid/view/View;)V
  .registers 4
  .line 152
    instance-of v0, p0, Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 153
    check-cast p0, Landroid/widget/TextView;
  .line 154
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 155
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const v2, 2131821013
    invoke-virtual { v0, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ": "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const v2, 2131821014
    invoke-virtual { v0, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 156
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v1
  .line 157
    if-nez v1, :L1
    const-string v1, ""
    goto :L2
  :L1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
  :L2
  .line 158
    invoke-virtual { v1, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 159
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L4
    goto :L5
  :L4
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\n"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L5
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 160
    return-void
.end method
