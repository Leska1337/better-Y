.class public final Lcom/innioasis/ipp/Pad;
.super Ljava/lang/Object;
.source "Pad.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Pad$Inset;
  }
.end annotation

.field private final static IPP_H:I = 315

.field private final static IPP_MAIN_W:I = 213

.field private final static IPP_SET_W:I = 227

.field public final static KEY:Ljava/lang/String; = "fixed_menu_pad"

.field private final static MAIN_H:I = 307

.field private final static MAIN_W:I = 204

.field private final static MARGIN:I = 9

.field private final static SET_H:I = 305

.field private final static SET_W:I = 218

.field private final static SHIFT:I = 5

.field private final static STOCK_MAIN:I = 0

.field private final static STOCK_SET:I = 5

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/view/View;Z)V
  .registers 2
  .line 20
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Pad;->inset(Landroid/view/View;Z)V
    return-void
.end method

.method public static copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
  .registers 4
  .line 129
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->width:I
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->height:I
    invoke-direct { v0, v1, v2 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 130
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
  .line 131
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 132
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 133
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
  .line 134
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginStart()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginStart(I)V
  .line 135
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginEnd()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  .line 136
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideBegin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideBegin:I
  .line 137
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideEnd:I
  .line 138
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidePercent:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidePercent:F
  .line 139
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidelineUseRtl:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidelineUseRtl:Z
  .line 140
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 141
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
  .line 142
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
  .line 143
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 144
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 145
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
  .line 146
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
  .line 147
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
  .line 148
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I
  .line 149
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToTop:I
  .line 150
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBottom:I
  .line 151
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleConstraint:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleConstraint:I
  .line 152
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleRadius:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleRadius:I
  .line 153
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleAngle:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleAngle:F
  .line 154
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
  .line 155
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
  .line 156
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
  .line 157
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
  .line 158
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneLeftMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneLeftMargin:I
  .line 159
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I
  .line 160
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneRightMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneRightMargin:I
  .line 161
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I
  .line 162
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneStartMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneStartMargin:I
  .line 163
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneEndMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneEndMargin:I
  .line 164
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBaselineMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBaselineMargin:I
  .line 165
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineMargin:I
  .line 166
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
  .line 167
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
  .line 168
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;
  .line 169
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalWeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalWeight:F
  .line 170
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalWeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalWeight:F
  .line 171
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalChainStyle:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalChainStyle:I
  .line 172
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalChainStyle:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalChainStyle:I
  .line 173
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedWidth:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedWidth:Z
  .line 174
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedHeight:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedHeight:Z
  .line 175
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I
  .line 176
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I
  .line 177
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I
  .line 178
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I
  .line 179
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I
  .line 180
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I
  .line 181
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentWidth:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentWidth:F
  .line 182
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentHeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentHeight:F
  .line 183
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteX:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteX:I
  .line 184
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I
  .line 185
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->orientation:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->orientation:I
  .line 186
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constraintTag:Ljava/lang/String;
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constraintTag:Ljava/lang/String;
  .line 187
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->wrapBehaviorInParent:I
    iput p0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->wrapBehaviorInParent:I
  .line 188
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->validate()V
  .line 189
    return-object v0
.end method

.method private static inset(Landroid/view/View;Z)V
  .registers 5
  .line 89
    if-nez p0, :L0
    return-void
  :L0
  .line 90
    nop
  .line 91
    const v0, 2131362491
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 92
    if-nez v0, :L1
  .line 93
    const v0, 2131362459
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 94
    const/4 v1, 5
    goto :L2
  :L1
  .line 92
    const/4 v1, 0
  :L2
  .line 96
    if-eqz v0, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v2, :L3
    goto :L7
  :L3
  .line 97
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 98
    if-eqz p1, :L4
    goto :L5
  :L4
    add-int/lit8 v1, v1, 5
  :L5
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result p0
  .line 99
    iget p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne p1, p0, :L6
    invoke-virtual { v2 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result p1
    if-ne p1, p0, :L6
    return-void
  :L6
  .line 101
    iput p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 102
    invoke-virtual { v2, p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 103
    invoke-virtual { v0, v2 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 104
    return-void
  :L7
  .line 96
    return-void
.end method

.method public static list(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L18 } :L20
  .registers 9
  .line 39
    if-nez p0, :L0
    return-void
  :L0
  .line 40
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 41
    if-nez v0, :L1
    return-void
  :L1
  .line 42
    const-string v1, "fixed_menu_pad"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 0
    if-nez v1, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 44
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getId()I
    move-result v3
  .line 45
    const v4, 2131362310
    const v5, 2131362308
    if-eq v3, v5, :L4
    if-ne v3, v4, :L7
  :L4
  .line 46
    const v6, 2131362152
    invoke-virtual { p0, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getTag(I)Ljava/lang/Object;
    move-result-object v7
    if-nez v7, :L5
  .line 47
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v6, v7 }, Landroidx/recyclerview/widget/RecyclerView;->setTag(ILjava/lang/Object;)V
  .line 48
    new-instance v6, Lcom/innioasis/ipp/Pad$Inset;
    invoke-direct { v6 }, Lcom/innioasis/ipp/Pad$Inset;-><init>()V
    invoke-virtual { p0, v6 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  :L5
  .line 51
    const/4 v6, 0
  :L6
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v7
    if-ge v6, v7, :L7
    invoke-virtual { p0, v6 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v7
    invoke-static { v7, v1 }, Lcom/innioasis/ipp/Pad;->inset(Landroid/view/View;Z)V
    add-int/lit8 v6, v6, 1
    goto :L6
  :L7
  .line 55
    const/16 v6, 315
    if-ne v3, v5, :L10
  .line 56
    if-eqz v1, :L8
    const/16 v3, 204
    goto :L9
  :L8
    const/16 v3, 213
  :L9
  .line 57
    if-eqz v1, :L13
    const/16 v6, 307
    goto :L13
  :L10
  .line 58
    if-ne v3, v4, :L19
  .line 59
    if-eqz v1, :L11
    const/16 v3, 218
    goto :L12
  :L11
    const/16 v3, 227
  :L12
  .line 60
    if-eqz v1, :L13
    const/16 v6, 305
  :L13
  .line 65
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
  .line 66
    instance-of v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v5, :L14
    return-void
  :L14
  .line 67
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 68
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F
  .line 69
    invoke-static { v3, v5 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v3
  .line 70
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v6
  .line 71
    if-eqz v1, :L15
    const/16 v1, 9
    invoke-static { v1, v5 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v2
  :L15
  .line 72
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v1
    if-eqz v1, :L16
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    sub-int v3, v0, v2
  :L16
  .line 73
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-ne v0, v3, :L17
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-ne v0, v6, :L17
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne v0, v2, :L17
    return-void
  :L17
  .line 74
    iput v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 75
    iput v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 76
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 77
    invoke-virtual { p0, v4 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L18
  .line 79
    goto :L21
  :L19
  .line 62
    return-void
  :L20
  .line 78
    move-exception p0
  :L21
  .line 80
    return-void
.end method

.method private static px(IF)I
  .registers 2
  .line 120
    int-to-float p0, p0
    mul-float p0, p0, p1
    const/high16 p1, 0x3F000000
    add-float/2addr p0, p1
    float-to-int p0, p0
    return p0
.end method
