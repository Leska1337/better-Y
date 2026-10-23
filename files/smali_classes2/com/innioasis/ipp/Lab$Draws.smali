.class final Lcom/innioasis/ipp/Lab$Draws;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Draws"
.end annotation

.field private n:I

.field private final screen:Ljava/lang/ref/WeakReference;

.field private final t0:J

.method constructor <init>(Landroid/app/Activity;)V
  .registers 4
  .line 91
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 88
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Lab$Draws;->t0:J
  .line 91
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Draws;->screen:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method private static backs(Ljava/lang/StringBuilder;Landroid/view/View;)V
  .registers 5
  .line 113
    invoke-virtual { p1 }, Landroid/view/View;->getId()I
    move-result v0
    const v1, 2131361890
    if-ne v0, v1, :L0
  .line 114
    const-string v0, " back"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Lab$Draws;->view(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
  .line 115
    invoke-virtual { p1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    if-eqz v0, :L0
    const-string v0, " bg"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    invoke-static { v1 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v1
    const v2, 65535
    and-int/2addr v1, v2
    invoke-static { v1 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 117
    instance-of v0, p1, Landroid/view/ViewGroup;
    if-eqz v0, :L2
  .line 118
    check-cast p1, Landroid/view/ViewGroup;
  .line 119
    const/4 v0, 0
  :L1
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
    invoke-virtual { p1, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Lab$Draws;->backs(Ljava/lang/StringBuilder;Landroid/view/View;)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 121
    return-void
.end method

.method private static view(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
  .registers 7
  .line 124
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 125
    if-nez p2, :L0
    const-string p1, "=-"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    return-void
  :L0
  .line 126
    const/16 p1, 61
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p2 }, Landroid/view/View;->getVisibility()I
    move-result v0
    const-string v1, ""
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "v"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p2 }, Landroid/view/View;->getVisibility()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ","
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 127
    invoke-virtual { p2 }, Landroid/view/View;->getLeft()I
    move-result v0
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const/16 v0, 44
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result v0
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const/16 v0, 32
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 128
    invoke-virtual { p2 }, Landroid/view/View;->getWidth()I
    move-result v0
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const/16 v0, 120
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p2 }, Landroid/view/View;->getHeight()I
    move-result v2
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 129
    invoke-virtual { p2 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v2
    if-eqz v2, :L3
    const-string v1, " REQ"
  :L3
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 130
    instance-of p1, p2, Landroid/widget/ImageView;
    if-eqz p1, :L4
  .line 131
    move-object p1, p2
    check-cast p1, Landroid/widget/ImageView;
    invoke-virtual { p1 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    goto :L5
  :L4
    invoke-virtual { p2 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object p1
  :L5
  .line 132
    if-eqz p1, :L6
  .line 133
    const-string v1, " d"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { p1 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v2
    const v3, 65535
    and-int/2addr v2, v3
    invoke-static { v2 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 134
    const/16 v2, 58
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result p1
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  :L6
  .line 136
    instance-of p1, p2, Landroid/widget/TextView;
    if-eqz p1, :L7
    const-string p1, " '"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    check-cast p2, Landroid/widget/TextView;
    invoke-virtual { p2 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 p1, 39
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L7
  .line 137
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 8
  .line 94
    iget-object v0, p0, Lcom/innioasis/ipp/Lab$Draws;->screen:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
  .line 95
    const/4 v1, 1
    if-eqz v0, :L6
    iget v2, p0, Lcom/innioasis/ipp/Lab$Draws;->n:I
    add-int/2addr v2, v1
    iput v2, p0, Lcom/innioasis/ipp/Lab$Draws;->n:I
    const/16 v3, 40
    if-le v2, v3, :L0
    goto/16 :L6
  :L0
  .line 97
    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "draw "
    invoke-direct { v2, v3 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " #"
  .line 98
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget v3, p0, Lcom/innioasis/ipp/Lab$Draws;->n:I
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " +"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    iget-wide v5, p0, Lcom/innioasis/ipp/Lab$Draws;->t0:J
    sub-long/2addr v3, v5
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "ms"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 99
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v3
  .line 100
    const-string v4, " decorReq="
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v3 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
  .line 101
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Lab$Draws;->backs(Ljava/lang/StringBuilder;Landroid/view/View;)V
  .line 102
    const-string v4, " winBg="
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v3 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v5
    if-nez v5, :L1
    const-string v3, "-"
    goto :L2
  :L1
    invoke-virtual { v3 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    invoke-static { v3 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v3
    const v5, 65535
    and-int/2addr v3, v5
    invoke-static { v3 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v3
  :L2
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 103
    const-string v3, " img"
    const v4, 2131362323
    invoke-virtual { v0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Lab$Draws;->view(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
  .line 104
    const-string v3, " cl"
    const v4, 2131361954
    invoke-virtual { v0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Lab$Draws;->view(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
  .line 105
    const-string v3, " title"
    const v4, 2131362326
    invoke-virtual { v0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v2, v3, v0 }, Lcom/innioasis/ipp/Lab$Draws;->view(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
  .line 106
    const-string v0, "ipplab"
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v2 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L3
  .line 108
    goto :L5
  :L4
  .line 107
    move-exception v0
  :L5
  .line 109
    return v1
  :L6
  .line 95
    return v1
.end method
