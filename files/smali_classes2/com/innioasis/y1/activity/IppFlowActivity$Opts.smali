.class final Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
.super Landroid/widget/FrameLayout;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Opts"
.end annotation
.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static GROUP:Ljava/lang/String; = "coverflow"

.field private final static HAIR_ALPHA:I = 520093696

.field private final static KEYS:[Ljava/lang/String;

.field private final static NUMS:[[I

.field private final static ROWS:I = 5

.field private final static TEXT_MIN_SP:F = 14.0F

.field private final static TEXT_SP:F = 22.0F

.field private final static TEXT_START:I = 10

.field private final col:Lcom/innioasis/ipp/Column;

.field private fitted:Z

.field private group:I

.field private final items:[Landroid/view/View;

.field private final labels:[Ljava/lang/String;

.field private final lines:[Landroid/widget/LinearLayout;

.field private final names:[Landroid/widget/TextView;

.field private title:Ljava/lang/String;

.field private final vals:[Landroid/widget/TextView;

.field private final values:[[Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 7
  .line 987
    const/4 v0, 4
    new-array v1, v0, [Ljava/lang/String;
    const-string v2, "flow_count"
    const/4 v3, 0
    aput-object v2, v1, v3
    const-string v2, "flow_group"
    const/4 v4, 1
    aput-object v2, v1, v4
    const-string v2, "flow_year"
    const/4 v5, 2
    aput-object v2, v1, v5
    const-string v2, "flow_start"
    const/4 v6, 3
    aput-object v2, v1, v6
    sput-object v1, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
  .line 989
    new-array v0, v0, [[I
    sget-object v1, Lcom/innioasis/ipp/Flow;->COUNTS:[I
    aput-object v1, v0, v3
    const/4 v1, 0
    aput-object v1, v0, v4
    filled-new-array { v3, v4, v5 }, [I
    move-result-object v1
    aput-object v1, v0, v5
    filled-new-array { v3, v4 }, [I
    move-result-object v1
    aput-object v1, v0, v6
    sput-object v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->NUMS:[[I
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
  .registers 13
  .line 1008
    invoke-direct { p0, p1 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 998
    sget-object v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v1, v0
    new-array v1, v1, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->labels:[Ljava/lang/String;
  .line 999
    array-length v1, v0
    new-array v1, v1, [[Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
  .line 1000
    array-length v1, v0
    new-array v1, v1, [Landroid/widget/LinearLayout;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->lines:[Landroid/widget/LinearLayout;
  .line 1001
    array-length v1, v0
    new-array v1, v1, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->names:[Landroid/widget/TextView;
  .line 1002
    array-length v1, v0
    new-array v1, v1, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->vals:[Landroid/widget/TextView;
  .line 1003
    array-length v0, v0
    new-array v0, v0, [Landroid/view/View;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->items:[Landroid/view/View;
  .line 1009
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->names(Landroid/content/Context;)V
  .line 1010
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1011
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1012
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0x1F000000
    or-int/2addr v0, v1
  .line 1013
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v2, v2
    const/4 v4, -1
    if-ge v1, v2, :L1
  .line 1014
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 1015
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 1016
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 1017
    const/16 v5, 16
    invoke-virtual { v2, v5 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 1018
    const/16 v6, 10
    const/4 v7, 5
    invoke-virtual { v2, v6, v3, v7, v3 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 1019
    new-instance v6, Landroid/widget/TextView;
    invoke-direct { v6, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1020
    sget-object v7, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v8, 1
    invoke-virtual { v6, v7, v8 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 1021
    invoke-virtual { v6, v3 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 1022
    invoke-virtual { v6, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 1023
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->labels:[Ljava/lang/String;
    aget-object v7, v7, v1
    invoke-virtual { v6, v7 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 1024
    const v7, 2131362459
    invoke-virtual { v6, v7 }, Landroid/widget/TextView;->setId(I)V
  .line 1025
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v7, v3, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 1026
    const/high16 v9, 0x3F800000
    iput v9, v7, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 1027
    invoke-virtual { v2, v6, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 1028
    new-instance v7, Landroid/widget/TextView;
    invoke-direct { v7, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 1029
    sget-object v9, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v7, v9, v8 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 1030
    invoke-virtual { v7, v3 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 1031
    invoke-virtual { v7, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 1032
    const/4 v5, 6
    invoke-virtual { v7, v5, v3, v5, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 1033
    const v5, 2131362437
    invoke-virtual { v7, v5 }, Landroid/widget/TextView;->setId(I)V
  .line 1034
    const/4 v5, -2
    invoke-virtual { v2, v7, v5, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 1035
    new-instance v9, Landroid/widget/LinearLayout;
    invoke-direct { v9, p1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 1036
    invoke-virtual { v9, v8 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 1037
    new-instance v10, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { v10, v4, v5 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v10 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 1038
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v4, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v2, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 1039
    new-instance v5, Landroid/view/View;
    invoke-direct { v5, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 1040
    invoke-virtual { v5, v0 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 1041
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v4, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v5, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 1042
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->items:[Landroid/view/View;
    aput-object v9, v4, v1
  .line 1043
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->lines:[Landroid/widget/LinearLayout;
    aput-object v2, v4, v1
  .line 1044
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->names:[Landroid/widget/TextView;
    aput-object v6, v2, v1
  .line 1045
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->vals:[Landroid/widget/TextView;
    aput-object v7, v2, v1
  .line 1013
    add-int/lit8 v1, v1, 1
    goto/16 :L0
  :L1
  .line 1047
    new-instance v0, Lcom/innioasis/ipp/Column;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->items:[Landroid/view/View;
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Opts;)V
    invoke-direct { v0, p1, v1, v2 }, Lcom/innioasis/ipp/Column;-><init>(Landroid/content/Context;[Landroid/view/View;Lcom/innioasis/ipp/Column$Painter;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
  .line 1048
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
    invoke-virtual { p0, v1, v4, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->addView(Landroid/view/View;II)V
  .line 1049
    move-object v5, p1
    check-cast v5, Landroid/app/Activity;
    const/4 v6, 0
    const v7, 2131231052
    const v8, -12779554
    const/4 v9, -1
    move-object v4, v0
    invoke-virtual/range { v4 .. v9 }, Lcom/innioasis/ipp/Column;->bar(Landroid/app/Activity;ZIII)V
  .line 1050
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppFlowActivity$Opts;I)V
  .registers 2
  .line 985
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->paint(I)V
    return-void
.end method

.method private fit()V
  .registers 21
  .line 1062
    move-object/from16 v0, p0
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v1
  .line 1063
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getWidth()I
    move-result v2
  .line 1064
    iget-boolean v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->fitted:Z
    if-nez v3, :L12
    if-gtz v1, :L0
    goto/16 :L12
  :L0
  .line 1065
    const/4 v3, 1
    iput-boolean v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->fitted:Z
  .line 1066
    div-int/lit8 v1, v1, 5
    sub-int/2addr v1, v3
  .line 1067
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v4
    iget v4, v4, Landroid/util/DisplayMetrics;->scaledDensity:F
  .line 1068
    nop
  .line 1069
    new-instance v13, Landroid/text/TextPaint;
    invoke-direct { v13, v3 }, Landroid/text/TextPaint;-><init>(I)V
  .line 1070
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v5, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v13, v5 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    const/high16 v5, 0x41B00000
    const/high16 v14, 0x41B00000
  :L1
  .line 1071
    const/high16 v5, 0x41600000
    const/4 v15, 0
    cmpl-float v5, v14, v5
    if-lez v5, :L9
  .line 1072
    mul-float v5, v14, v4
    invoke-virtual { v13, v5 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 1073
    nop
  .line 1074
    const/4 v5, 1
    const/4 v12, 0
  :L2
    sget-object v6, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v6, v6
    if-ge v12, v6, :L7
    if-eqz v5, :L7
  .line 1075
    nop
  .line 1076
    const/4 v5, 0
    const/4 v6, 0
  :L3
    iget-object v7, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    aget-object v7, v7, v12
    array-length v8, v7
    if-ge v6, v8, :L4
    aget-object v7, v7, v6
    invoke-virtual { v13, v7 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v7
    invoke-static { v5, v7 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    add-int/lit8 v6, v6, 1
    goto :L3
  :L4
  .line 1077
    add-int/lit8 v6, v2, -10
    add-int/lit8 v6, v6, -5
    add-int/lit8 v6, v6, -6
    add-int/lit8 v6, v6, -6
    float-to-double v7, v5
    invoke-static { v7, v8 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v7
    double-to-int v5, v7
    sub-int v11, v6, v5
  .line 1078
    new-instance v16, Landroid/text/StaticLayout;
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->labels:[Ljava/lang/String;
    aget-object v6, v5, v12
    invoke-static { v3, v11 }, Ljava/lang/Math;->max(II)I
    move-result v8
    sget-object v9, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v10, 0x3F800000
    const/16 v17, 0
    const/16 v18, 0
    move-object/from16 v5, v16
    move-object v7, v13
    move/from16 v19, v11
    move/from16 v11, v17
    move/from16 v17, v12
    move/from16 v12, v18
    invoke-direct/range { v5 .. v12 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 1080
    if-lez v19, :L5
    invoke-virtual/range { v16 .. v16 }, Landroid/text/StaticLayout;->getLineCount()I
    move-result v5
    const/4 v6, 2
    if-gt v5, v6, :L5
    invoke-virtual/range { v16 .. v16 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v5
    if-gt v5, v1, :L5
    const/4 v5, 1
    goto :L6
  :L5
    const/4 v5, 0
  :L6
  .line 1074
    add-int/lit8 v12, v17, 1
    goto :L2
  :L7
  .line 1082
    if-eqz v5, :L8
    goto :L9
  :L8
  .line 1071
    const/high16 v5, 0x3F800000
    sub-float/2addr v14, v5
    goto :L1
  :L9
  .line 1084
    nop
  :L10
    sget-object v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v2, v2
    if-ge v15, v2, :L11
  .line 1085
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->names:[Landroid/widget/TextView;
    aget-object v2, v2, v15
    invoke-virtual { v2, v14 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 1086
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->vals:[Landroid/widget/TextView;
    aget-object v2, v2, v15
    invoke-virtual { v2, v14 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 1087
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->lines:[Landroid/widget/LinearLayout;
    aget-object v2, v2, v15
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 1084
    add-int/lit8 v15, v15, 1
    goto :L10
  :L11
  .line 1089
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->requestLayout()V
  .line 1090
    return-void
  :L12
  .line 1064
    return-void
.end method

.method private names(Landroid/content/Context;)V
  .registers 10
  .line 1108
    const v0, 2131821167
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->title:Ljava/lang/String;
  .line 1109
    invoke-static { p1 }, Lcom/innioasis/ipp/Help;->rows(Landroid/content/Context;)Ljava/util/List;
    move-result-object v0
  .line 1110
    nop
  .line 1111
    const/4 v1, 0
    const/4 v2, 0
    const/4 v3, 0
  :L0
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L6
  .line 1112
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Help$Row;
  .line 1113
    iget-boolean v5, v4, Lcom/innioasis/ipp/Help$Row;->group:Z
    if-eqz v5, :L1
  .line 1114
    const-string v3, "coverflow"
    iget-object v5, v4, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v3, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
  .line 1115
    if-eqz v3, :L5
    iget-object v5, v4, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    if-eqz v5, :L5
    iget-object v4, v4, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->title:Ljava/lang/String;
    goto :L5
  :L1
  .line 1118
    const/4 v5, 0
  :L2
    if-eqz v3, :L5
    sget-object v6, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v7, v6
    if-ge v5, v7, :L5
  .line 1119
    aget-object v6, v6, v5
    iget-object v7, v4, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
    invoke-virtual { v6, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L3
    goto :L4
  :L3
  .line 1120
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->labels:[Ljava/lang/String;
    iget-object v7, v4, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    aput-object v7, v6, v5
  .line 1121
    iget-object v6, v4, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v6, :L4
    sget-object v6, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->NUMS:[[I
    aget-object v7, v6, v5
    if-eqz v7, :L4
    iget-object v7, v4, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v7, v7
    aget-object v6, v6, v5
    array-length v6, v6
    if-ne v7, v6, :L4
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    iget-object v7, v4, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aput-object v7, v6, v5
  :L4
  .line 1118
    add-int/lit8 v5, v5, 1
    goto :L2
  :L5
  .line 1111
    add-int/lit8 v2, v2, 1
    goto :L0
  :L6
  .line 1124
    const/4 v0, 0
  :L7
    sget-object v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    array-length v3, v2
    if-ge v0, v3, :L13
  .line 1125
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->labels:[Ljava/lang/String;
    aget-object v4, v3, v0
    if-nez v4, :L8
    aget-object v2, v2, v0
    aput-object v2, v3, v0
  :L8
  .line 1126
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    aget-object v3, v2, v0
    if-eqz v3, :L9
    goto :L12
  :L9
  .line 1127
    sget-object v3, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->NUMS:[[I
    aget-object v3, v3, v0
    if-nez v3, :L10
  .line 1128
    const/4 v3, 2
    new-array v3, v3, [Ljava/lang/String;
    const v4, 2131821019
    invoke-virtual { p1, v4 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    aput-object v4, v3, v1
    const v4, 2131821018
    invoke-virtual { p1, v4 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    const/4 v5, 1
    aput-object v4, v3, v5
    aput-object v3, v2, v0
  .line 1129
    goto :L12
  :L10
  .line 1131
    array-length v3, v3
    new-array v3, v3, [Ljava/lang/String;
    aput-object v3, v2, v0
  .line 1132
    const/4 v2, 0
  :L11
    sget-object v3, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->NUMS:[[I
    aget-object v3, v3, v0
    array-length v4, v3
    if-ge v2, v4, :L12
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    aget-object v4, v4, v0
    aget v3, v3, v2
    invoke-static { v3 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v3
    aput-object v3, v4, v2
    add-int/lit8 v2, v2, 1
    goto :L11
  :L12
  .line 1124
    add-int/lit8 v0, v0, 1
    goto :L7
  :L13
  .line 1134
    return-void
.end method

.method private paint(I)V
  .registers 8
  .line 1094
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    const/4 v1, 0
    if-ne p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 1095
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getContext()Landroid/content/Context;
    move-result-object v2
    sget-object v3, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    aget-object v3, v3, p1
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
  .line 1096
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->vals:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    if-ltz v2, :L2
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    aget-object v4, v4, p1
    array-length v5, v4
    if-ge v2, v5, :L2
    aget-object v2, v4, v2
    goto :L3
  :L2
    const-string v2, ""
  :L3
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 1097
    if-eqz v0, :L4
    const v2, -12779554
    goto :L5
  :L4
    const/4 v2, -1
  :L5
  .line 1098
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Column;->barred()Z
    move-result v3
    if-nez v3, :L7
  .line 1099
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->lines:[Landroid/widget/LinearLayout;
    aget-object v4, v4, p1
    if-eqz v0, :L6
    const v1, 2131231052
  :L6
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L7
  .line 1101
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->names:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1102
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->vals:[Landroid/widget/TextView;
    aget-object p1, v3, p1
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 1103
    return-void
.end method

.method change()V
  .registers 6
  .line 1155
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
  .line 1156
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getContext()Landroid/content/Context;
    move-result-object v1
    sget-object v2, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->KEYS:[Ljava/lang/String;
    aget-object v3, v2, v0
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
  .line 1157
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getContext()Landroid/content/Context;
    move-result-object v3
    aget-object v2, v2, v0
    add-int/lit8 v1, v1, 1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->values:[[Ljava/lang/String;
    aget-object v4, v4, v0
    array-length v4, v4
    rem-int/2addr v1, v4
    invoke-static { v3, v2, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 1158
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Column;->repaint(I)V
  .line 1159
    return-void
.end method

.method move(I)V
  .registers 3
  .line 1150
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Column;->step(I)V
  .line 1151
    return-void
.end method

.method open()V
  .registers 3
  .line 1143
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "flow_group"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->group:I
  .line 1144
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->fit()V
  .line 1145
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->setVisibility(I)V
  .line 1146
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Column;->set(I)V
  .line 1147
    return-void
.end method

.method regrouped()Z
  .registers 3
  .line 1140
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "flow_group"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->group:I
    if-eq v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method title()Ljava/lang/String;
  .registers 2
  .line 1105
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->title:Ljava/lang/String;
    return-object v0
.end method
