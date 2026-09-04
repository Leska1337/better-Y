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
