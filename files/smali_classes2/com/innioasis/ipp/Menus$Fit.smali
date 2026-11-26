.class final Lcom/innioasis/ipp/Menus$Fit;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Menus.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Menus;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Fit"
.end annotation

.field private final base:I

.field private final lv:Landroid/view/ViewGroup;

.field private passes:I

.field private final w:Landroid/view/Window;

.method constructor <init>(Landroid/view/Window;Landroid/view/ViewGroup;I)V
  .registers 4
  .line 136
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 137
    iput-object p1, p0, Lcom/innioasis/ipp/Menus$Fit;->w:Landroid/view/Window;
  .line 138
    iput-object p2, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
  .line 139
    iput p3, p0, Lcom/innioasis/ipp/Menus$Fit;->base:I
  .line 140
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L13 } :L14
  .registers 9
  .line 145
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    const/4 v2, 0
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-virtual { v1, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Menus;->access$000(Landroid/view/View;)Landroid/widget/TextView;
    move-result-object v1
  :L2
  .line 146
    if-eqz v1, :L11
    invoke-virtual { v1 }, Landroid/widget/TextView;->getWidth()I
    move-result v3
    if-nez v3, :L3
    goto/16 :L11
  :L3
  .line 151
    iget-object v3, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-virtual { v3 }, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v3
    invoke-virtual { v3, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 152
    iget-object v3, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-static { v3 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v3
  .line 153
    if-nez v3, :L4
    return v0
  :L4
  .line 154
    invoke-virtual { v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v3
  .line 155
    if-nez v3, :L5
    return v0
  :L5
  .line 156
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v4
  .line 157
    nop
  .line 158
    const/4 v5, 0
    const/4 v6, 0
  :L6
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v6, v7, :L8
  .line 159
    invoke-interface { v3, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Menus;->access$100(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v7
  .line 160
    if-eqz v7, :L7
    invoke-virtual { v4, v7 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v7
    invoke-static { v5, v7 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  :L7
  .line 158
    add-int/lit8 v6, v6, 1
    goto :L6
  :L8
  .line 162
    invoke-virtual { v1 }, Landroid/widget/TextView;->getWidth()I
    move-result v3
    invoke-virtual { v1 }, Landroid/widget/TextView;->getTotalPaddingLeft()I
    move-result v4
    sub-int/2addr v3, v4
    invoke-virtual { v1 }, Landroid/widget/TextView;->getTotalPaddingRight()I
    move-result v1
    sub-int/2addr v3, v1
  .line 163
    int-to-float v1, v3
    cmpg-float v3, v5, v1
    if-gtz v3, :L9
    return v0
  :L9
  .line 164
    iget-object v3, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-virtual { v3 }, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v3
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 165
    iget v4, p0, Lcom/innioasis/ipp/Menus$Fit;->base:I
    sub-float/2addr v5, v1
    float-to-double v5, v5
    invoke-static { v5, v6 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v1, v5
    add-int/2addr v4, v1
    add-int/2addr v4, v0
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v1
  .line 166
    iget-object v3, p0, Lcom/innioasis/ipp/Menus$Fit;->w:Landroid/view/Window;
    invoke-virtual { v3 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v3
  .line 167
    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->width:I
    if-ne v4, v1, :L10
    return v0
  :L10
  .line 168
    iput v1, v3, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 169
    iget-object v1, p0, Lcom/innioasis/ipp/Menus$Fit;->w:Landroid/view/Window;
    invoke-virtual { v1, v3 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  .line 170
    return v2
  :L11
  .line 147
    iget v1, p0, Lcom/innioasis/ipp/Menus$Fit;->passes:I
    add-int/2addr v1, v0
    iput v1, p0, Lcom/innioasis/ipp/Menus$Fit;->passes:I
    const/4 v2, 5
    if-ge v1, v2, :L12
    return v0
  :L12
  .line 148
    iget-object v1, p0, Lcom/innioasis/ipp/Menus$Fit;->lv:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual { v1, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L13
  .line 149
    return v0
  :L14
  .line 171
    move-exception v1
  .line 172
    return v0
.end method
