.class final Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
.super Ljava/lang/Object;
.implements Landroid/text/method/TransformationMethod;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "BoldTitle"
.end annotation

.field private final plain:Ljava/lang/String;

.field private final titleLen:I

.method constructor <init>(Ljava/lang/String;I)V
  .registers 3
  .line 763
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 764
    if-nez p1, :L0
    const-string p1, ""
  :L0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->plain:Ljava/lang/String;
  .line 765
    iput p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->titleLen:I
  .line 766
    return-void
.end method

.method public getTransformation(Ljava/lang/CharSequence;Landroid/view/View;)Ljava/lang/CharSequence;
  .registers 7
  .line 769
    if-nez p1, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 770
    iget p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->titleLen:I
    if-lez p2, :L4
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->plain:Ljava/lang/String;
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result p2
    if-nez p2, :L1
    goto :L4
  :L1
  .line 771
    invoke-interface { p1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object p1
  .line 772
    new-instance p2, Landroid/text/SpannableString;
    invoke-direct { p2, p1 }, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V
  .line 773
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->plain:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  :L2
    if-ltz v0, :L3
  .line 774
    new-instance v1, Landroid/text/style/StyleSpan;
    const/4 v2, 1
    invoke-direct { v1, v2 }, Landroid/text/style/StyleSpan;-><init>(I)V
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->titleLen:I
    add-int/2addr v2, v0
    const/16 v3, 33
    invoke-virtual { p2, v1, v0, v2, v3 }, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V
  .line 773
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->plain:Ljava/lang/String;
    add-int/lit8 v0, v0, 1
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v0
    goto :L2
  :L3
  .line 777
    return-object p2
  :L4
  .line 770
    return-object p1
.end method

.method public onFocusChanged(Landroid/view/View;Ljava/lang/CharSequence;ZILandroid/graphics/Rect;)V
  .registers 6
  .line 781
    return-void
.end method
