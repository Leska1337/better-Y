.class final Lcom/innioasis/ipp/Fixed$Box;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Fixed.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fixed;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Box"
.end annotation

.field attachedAt:J

.field private healAt:J

.field private healDue:Z

.field laying:Z

.field private lh:I

.field private lw:I

.field private mb:I

.field private ml:I

.field private mr:I

.field private mt:I

.field private passing:Z

.field private posted:Z

.field private selfLaying:Z

.field private final v:Landroid/view/ViewGroup;

.method constructor <init>(Landroid/view/ViewGroup;)V
  .registers 2
  .line 82
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    return-void
.end method

.method private contained()Z
  .registers 5
  .line 95
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
    if-eqz v0, :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    if-eqz v0, :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 98
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 99
    if-eqz v0, :L6
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed$Box;->lw:I
    if-ne v2, v3, :L6
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed$Box;->lh:I
    if-eq v2, v3, :L1
    goto :L6
  :L1
  .line 100
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    const/4 v3, -2
    if-eq v2, v3, :L5
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v2, v3, :L2
    goto :L5
  :L2
  .line 103
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v2, :L4
  .line 104
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 105
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed$Box;->ml:I
    if-ne v2, v3, :L3
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed$Box;->mt:I
    if-ne v2, v3, :L3
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed$Box;->mr:I
    if-ne v2, v3, :L3
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    iget v2, p0, Lcom/innioasis/ipp/Fixed$Box;->mb:I
    if-eq v0, v2, :L4
  :L3
    return v1
  :L4
  .line 107
    const/4 v0, 1
    return v0
  :L5
  .line 101
    return v1
  :L6
  .line 99
    return v1
  :L7
  .line 96
    return v1
.end method

.method private static force(Landroid/view/View;)V
  .registers 3
  .line 177
    if-eqz p0, :L3
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-ne v0, v1, :L0
    goto :L3
  :L0
  .line 178
    invoke-virtual { p0 }, Landroid/view/View;->forceLayout()V
  .line 179
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L2
  .line 180
    check-cast p0, Landroid/view/ViewGroup;
  .line 181
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Fixed$Box;->force(Landroid/view/View;)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 183
    return-void
  :L3
  .line 177
    return-void
.end method

.method laid()V
  .registers 6
  .line 113
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->selfLaying:Z
    if-nez v0, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/innioasis/ipp/Fixed$Box;->attachedAt:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 1000
    cmp-long v4, v0, v2
    if-gez v4, :L0
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->healDue:Z
  :L0
  .line 114
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 115
    if-nez v0, :L1
    return-void
  :L1
  .line 116
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput v1, p0, Lcom/innioasis/ipp/Fixed$Box;->lw:I
  .line 117
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    iput v1, p0, Lcom/innioasis/ipp/Fixed$Box;->lh:I
  .line 118
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v1, :L2
  .line 119
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 120
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput v1, p0, Lcom/innioasis/ipp/Fixed$Box;->ml:I
  .line 121
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iput v1, p0, Lcom/innioasis/ipp/Fixed$Box;->mt:I
  .line 122
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iput v1, p0, Lcom/innioasis/ipp/Fixed$Box;->mr:I
  .line 123
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    iput v0, p0, Lcom/innioasis/ipp/Fixed$Box;->mb:I
  :L2
  .line 125
    return-void
.end method

.method public onPreDraw()Z
  .registers 10
  .line 162
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->healDue:Z
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 163
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->healDue:Z
  .line 164
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 165
    iget-wide v4, p0, Lcom/innioasis/ipp/Fixed$Box;->healAt:J
    sub-long v4, v2, v4
    const-wide/16 v6, 300
    cmp-long v8, v4, v6
    if-ltz v8, :L5
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v4 }, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;
    move-result-object v4
    instance-of v4, v4, Landroid/view/ViewGroup;
    if-nez v4, :L1
    goto :L5
  :L1
  .line 166
    iput-wide v2, p0, Lcom/innioasis/ipp/Fixed$Box;->healAt:J
  .line 167
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 168
    const/4 v2, 0
  :L2
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L4
  .line 169
    invoke-virtual { v1, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 170
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    if-eq v3, v4, :L3
    invoke-static { v3 }, Lcom/innioasis/ipp/Fixed$Box;->force(Landroid/view/View;)V
  :L3
  .line 168
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 172
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->requestLayout()V
  .line 173
    return v0
  :L5
  .line 165
    return v1
.end method

.method public run()V
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L6 .. :L7 } :L8
  .registers 7
  .line 129
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->posted:Z
  .line 130
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->isLayoutRequested()Z
    move-result v1
    if-nez v1, :L0
    return-void
  :L0
  .line 132
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    if-eqz v1, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    invoke-interface { v1 }, Landroid/view/ViewParent;->isLayoutRequested()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 133
    invoke-direct { p0 }, Lcom/innioasis/ipp/Fixed$Box;->contained()Z
    move-result v1
    const/4 v2, 1
    if-nez v1, :L5
  .line 134
    iput-boolean v2, p0, Lcom/innioasis/ipp/Fixed$Box;->passing:Z
  :L2
  .line 136
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->requestLayout()V
  :L3
  .line 138
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->passing:Z
  .line 139
    nop
  .line 140
    return-void
  :L4
  .line 138
    move-exception v1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->passing:Z
  .line 139
    throw v1
  :L5
  .line 142
    iput-boolean v2, p0, Lcom/innioasis/ipp/Fixed$Box;->selfLaying:Z
  :L6
  .line 144
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v2
    const/high16 v3, 0x40000000
    invoke-static { v2, v3 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v2
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
  .line 145
    invoke-virtual { v4 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v4
    invoke-static { v4, v3 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v3
  .line 144
    invoke-virtual { v1, v2, v3 }, Landroid/view/ViewGroup;->measure(II)V
  .line 146
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getLeft()I
    move-result v2
    iget-object v3, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v3 }, Landroid/view/ViewGroup;->getTop()I
    move-result v3
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v4 }, Landroid/view/ViewGroup;->getRight()I
    move-result v4
    iget-object v5, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v5 }, Landroid/view/ViewGroup;->getBottom()I
    move-result v5
    invoke-virtual { v1, v2, v3, v4, v5 }, Landroid/view/ViewGroup;->layout(IIII)V
  :L7
  .line 148
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->selfLaying:Z
  .line 149
    nop
  .line 150
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->invalidate()V
  .line 151
    return-void
  :L8
  .line 148
    move-exception v1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->selfLaying:Z
  .line 149
    throw v1
.end method

.method take()Z
  .registers 3
  .line 85
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
    if-nez v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->passing:Z
    if-nez v0, :L2
    invoke-direct { p0 }, Lcom/innioasis/ipp/Fixed$Box;->contained()Z
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 86
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->forceLayout()V
  .line 87
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed$Box;->posted:Z
    const/4 v1, 1
    if-nez v0, :L1
  .line 88
    iput-boolean v1, p0, Lcom/innioasis/ipp/Fixed$Box;->posted:Z
  .line 89
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Box;->v:Landroid/view/ViewGroup;
    invoke-virtual { v0, p0 }, Landroid/view/ViewGroup;->postOnAnimation(Ljava/lang/Runnable;)V
  :L1
  .line 91
    return v1
  :L2
  .line 85
    const/4 v0, 0
    return v0
.end method
