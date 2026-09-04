.class public final Lcom/innioasis/ipp/Scroll;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Scroll.java"

.field private final static TAG:I = 2131821013

.field private doubled:Z

.field private final h:Landroid/os/Handler;

.field private last:Ljava/lang/String;

.field private period:I

.field private final tv:Landroid/widget/TextView;

.field private x:I

.method public constructor <init>(Landroid/widget/TextView;)V
  .registers 3
  .line 80
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 81
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
  .line 82
    new-instance p1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { p1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
  .line 83
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 84
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 85
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 86
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 87
    return-void
.end method

.method public static marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .catchall { :L1 .. :L4 } :L5
  .registers 5
  .line 37
    if-nez p0, :L0
  .line 38
    return-void
  :L0
  .line 41
    const v0, 2131821013
  :L1
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 43
    instance-of v2, v1, Lcom/innioasis/ipp/Scroll;
    if-eqz v2, :L2
  .line 44
    check-cast v1, Lcom/innioasis/ipp/Scroll;
    goto :L3
  :L2
  .line 46
    new-instance v1, Lcom/innioasis/ipp/Scroll;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Scroll;-><init>(Landroid/widget/TextView;)V
  .line 47
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  :L3
  .line 49
    invoke-virtual { v1, p1 }, Lcom/innioasis/ipp/Scroll;->apply(Ljava/lang/String;)V
  :L4
  .line 52
    goto :L6
  :L5
  .line 50
    move-exception v0
  .line 51
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L6
  .line 53
    return-void
.end method

.method private overflow()I
  .registers 4
  .line 91
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;
    move-result-object v0
  .line 92
    const/4 v1, 0
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/text/Layout;->getLineCount()I
    move-result v2
    if-gtz v2, :L0
    goto :L1
  :L0
  .line 95
    invoke-virtual { v0, v1 }, Landroid/text/Layout;->getLineWidth(I)F
    move-result v0
    float-to-int v0, v0
  .line 96
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getWidth()I
    move-result v1
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v2
    sub-int/2addr v1, v2
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v2
    sub-int/2addr v1, v2
  .line 97
    sub-int/2addr v0, v1
    return v0
  :L1
  .line 93
    return v1
.end method

.method public static stopMarquee(Landroid/widget/TextView;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 61
    if-nez p0, :L0
  .line 62
    return-void
  :L0
  .line 65
    const v0, 2131821013
  :L1
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object p0
  .line 66
    instance-of v0, p0, Lcom/innioasis/ipp/Scroll;
    if-eqz v0, :L2
  .line 67
    check-cast p0, Lcom/innioasis/ipp/Scroll;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Scroll;->stop()V
  :L2
  .line 70
    goto :L4
  :L3
  .line 69
    move-exception p0
  :L4
  .line 71
    return-void
.end method

.method public apply(Ljava/lang/String;)V
  .registers 4
  .line 125
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 127
    if-nez p1, :L0
  .line 128
    const-string p1, ""
  :L0
  .line 130
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
  .line 131
    return-void
  :L1
  .line 133
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 134
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 135
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->setSingleLine()V
  .line 136
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V
  .line 137
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 138
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 139
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 140
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 141
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, p1, p1 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 142
    iget-object p1, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    invoke-virtual { p1, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 143
    iget-object p1, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    const-wide/16 v0, 1500
    invoke-virtual { p1, p0, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 144
    return-void
.end method

.method public run()V
  .registers 7
  .line 148
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L0
  .line 149
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 150
    return-void
  :L0
  .line 181
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    const-wide/16 v1, 1000
    const/4 v3, 0
    if-eqz v0, :L7
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->isShown()Z
    move-result v0
    if-nez v0, :L1
    goto/16 :L7
  :L1
  .line 188
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-nez v0, :L5
  .line 189
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->overflow()I
    move-result v0
    if-gtz v0, :L2
  .line 190
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 191
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, v3, v3 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 192
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 193
    return-void
  :L2
  .line 195
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v0, :L3
    goto :L4
  :L3
    const-string v0, ""
  :L4
  .line 196
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "     "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 197
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
    invoke-virtual { v2, v1 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    float-to-int v2, v2
    const/4 v4, 1
    add-int/2addr v2, v4
    iput v2, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 198
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 199
    iput-boolean v4, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  :L5
  .line 210
    iget v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
    add-int/lit8 v0, v0, 2
  .line 211
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->period:I
    if-lt v0, v1, :L6
    if-lez v1, :L6
  .line 212
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 213
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, v3, v3 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 214
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    const-wide/16 v1, 1500
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 215
    return-void
  :L6
  .line 217
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 218
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v3 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 219
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    const-wide/16 v1, 40
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 220
    return-void
  :L7
  .line 182
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 183
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, v3, v3 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 184
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 185
    return-void
.end method

.method public stop()V
  .registers 4
  .line 110
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->h:Landroid/os/Handler;
    invoke-virtual { v0, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 111
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1, v1 }, Landroid/widget/TextView;->scrollTo(II)V
  .line 112
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v0, :L0
  .line 113
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 115
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 116
    iput v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 117
    iput v1, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 118
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 119
    return-void
.end method
