.class public final Lcom/innioasis/ipp/Pad;
.super Ljava/lang/Object;
.source "Pad.java"

.field private final static IPP_H:I = 315

.field private final static IPP_MAIN_W:I = 213

.field private final static IPP_SET_W:I = 227

.field public final static KEY:Ljava/lang/String; = "fixed_menu_pad"

.field private final static MAIN_H:I = 307

.field private final static MAIN_W:I = 204

.field private final static MARGIN:I = 9

.field private final static SET_H:I = 305

.field private final static SET_W:I = 218

.method private constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
  .registers 4
  .line 102
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->width:I
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->height:I
    invoke-direct { v0, v1, v2 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 103
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftMargin:I
  .line 104
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 105
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 106
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomMargin:I
  .line 107
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginStart()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginStart(I)V
  .line 108
    invoke-virtual { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->getMarginEnd()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  .line 109
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideBegin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideBegin:I
  .line 110
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guideEnd:I
  .line 111
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidePercent:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidePercent:F
  .line 112
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidelineUseRtl:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->guidelineUseRtl:Z
  .line 113
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 114
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToRight:I
  .line 115
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToLeft:I
  .line 116
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 117
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 118
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I
  .line 119
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I
  .line 120
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I
  .line 121
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I
  .line 122
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToTop:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToTop:I
  .line 123
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBottom:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBottom:I
  .line 124
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleConstraint:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleConstraint:I
  .line 125
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleRadius:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleRadius:I
  .line 126
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleAngle:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleAngle:F
  .line 127
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToEnd:I
  .line 128
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I
  .line 129
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToStart:I
  .line 130
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I
  .line 131
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneLeftMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneLeftMargin:I
  .line 132
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I
  .line 133
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneRightMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneRightMargin:I
  .line 134
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I
  .line 135
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneStartMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneStartMargin:I
  .line 136
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneEndMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneEndMargin:I
  .line 137
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBaselineMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBaselineMargin:I
  .line 138
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineMargin:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineMargin:I
  .line 139
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalBias:F
  .line 140
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F
  .line 141
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;
  .line 142
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalWeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalWeight:F
  .line 143
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalWeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalWeight:F
  .line 144
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalChainStyle:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalChainStyle:I
  .line 145
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalChainStyle:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalChainStyle:I
  .line 146
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedWidth:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedWidth:Z
  .line 147
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedHeight:Z
    iput-boolean v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedHeight:Z
  .line 148
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I
  .line 149
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I
  .line 150
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I
  .line 151
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I
  .line 152
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I
  .line 153
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I
  .line 154
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentWidth:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentWidth:F
  .line 155
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentHeight:F
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentHeight:F
  .line 156
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteX:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteX:I
  .line 157
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I
  .line 158
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->orientation:I
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->orientation:I
  .line 159
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constraintTag:Ljava/lang/String;
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constraintTag:Ljava/lang/String;
  .line 160
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->wrapBehaviorInParent:I
    iput p0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->wrapBehaviorInParent:I
  .line 161
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->validate()V
  .line 162
    return-object v0
.end method

.method public static list(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L13 } :L15
  .registers 8
  .line 57
    if-nez p0, :L0
    return-void
  :L0
  .line 58
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 59
    if-nez v0, :L1
    return-void
  :L1
  .line 60
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
  .line 62
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getId()I
    move-result v3
  .line 65
    const v4, 2131362308
    const/16 v5, 315
    if-ne v3, v4, :L6
  .line 66
    if-eqz v1, :L4
    const/16 v3, 204
    goto :L5
  :L4
    const/16 v3, 213
  :L5
  .line 67
    if-eqz v1, :L9
    const/16 v5, 307
    goto :L9
  :L6
  .line 68
    const v4, 2131362310
    if-ne v3, v4, :L14
  .line 69
    if-eqz v1, :L7
    const/16 v3, 218
    goto :L8
  :L7
    const/16 v3, 227
  :L8
  .line 70
    if-eqz v1, :L9
    const/16 v5, 305
  :L9
  .line 75
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
  .line 76
    instance-of v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v6, :L10
    return-void
  :L10
  .line 77
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 78
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 79
    invoke-static { v3, v0 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v3
  .line 80
    invoke-static { v5, v0 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v5
  .line 81
    if-eqz v1, :L11
    const/16 v1, 9
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Pad;->px(IF)I
    move-result v2
  :L11
  .line 82
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-ne v0, v3, :L12
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-ne v0, v5, :L12
    iget v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne v0, v2, :L12
    return-void
  :L12
  .line 83
    iput v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 84
    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 85
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 86
    invoke-virtual { p0, v4 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L13
  .line 89
    goto :L16
  :L14
  .line 72
    return-void
  :L15
  .line 87
    move-exception p0
  :L16
  .line 90
    return-void
.end method

.method private static px(IF)I
  .registers 2
  .line 93
    int-to-float p0, p0
    mul-float p0, p0, p1
    const/high16 p1, 0x3F000000
    add-float/2addr p0, p1
    float-to-int p0, p0
    return p0
.end method
