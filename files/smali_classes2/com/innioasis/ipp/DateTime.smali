.class public final Lcom/innioasis/ipp/DateTime;
.super Ljava/lang/Object;
.source "DateTime.java"

.field private final static TIME:I = 1

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static label(Landroid/view/View;Z)V
  .registers 3
  .line 46
    instance-of v0, p0, Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 47
    if-eqz p1, :L1
    check-cast p0, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->rowText(Landroid/widget/TextView;)V
    goto :L2
  :L1
  .line 48
    check-cast p0, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  :L2
  .line 49
    return-void
.end method

.method public static rows(Ljava/lang/Object;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 7
  .line 24
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 26
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/DateOneLevelActivity;->getPosition()I
    move-result v0
  .line 27
    check-cast p0, Landroid/app/Activity;
  .line 28
    const v1, 2131362127
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    const/4 v2, 2
    const/4 v3, 1
    const/4 v4, 0
    if-ne v0, v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/DateTime;->label(Landroid/view/View;Z)V
  .line 29
    const v1, 2131362128
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    const/4 v2, 3
    if-ne v0, v2, :L3
    const/4 v2, 1
    goto :L4
  :L3
    const/4 v2, 0
  :L4
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/DateTime;->label(Landroid/view/View;Z)V
  .line 30
    const v1, 2131362107
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 31
    if-nez v1, :L5
    const/4 v1, 0
    goto :L6
  :L5
    const v2, 2131361881
    invoke-virtual { v1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  :L6
  .line 32
    instance-of v2, v1, Landroid/widget/ImageView;
    if-eqz v2, :L8
  .line 33
    if-ne v0, v3, :L7
  .line 34
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    move-object v3, v1
    check-cast v3, Landroid/widget/ImageView;
    const v5, 2131623981
    invoke-virtual { v2, v3, v5 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 35
    invoke-virtual { v1, v4 }, Landroid/view/View;->setVisibility(I)V
    goto :L8
  :L7
  .line 37
    const/16 v2, 8
    invoke-virtual { v1, v2 }, Landroid/view/View;->setVisibility(I)V
  :L8
  .line 40
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/RowBar;->dateTime(Landroid/app/Activity;I)V
  :L9
  .line 42
    goto :L11
  :L10
  .line 41
    move-exception p0
  :L11
  .line 43
    return-void
.end method
