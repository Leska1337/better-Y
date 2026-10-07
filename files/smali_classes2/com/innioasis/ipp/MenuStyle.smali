.class public final Lcom/innioasis/ipp/MenuStyle;
.super Ljava/lang/Object;
.source "MenuStyle.java"

.field public final static KEY:Ljava/lang/String; = "menu_style"

.field private final static SIMPLE:I = 1

.method private constructor <init>()V
  .registers 1
  .line 27
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 39
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 41
    check-cast p0, Landroid/app/Activity;
  .line 42
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
  .line 43
    instance-of v1, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L1
  .line 44
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 45
    const v1, 2131362147
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result v1
    if-eqz v1, :L6
    if-nez v0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->mainPreview(Landroid/app/Activity;)V
    goto/16 :L6
  :L1
  .line 46
    instance-of v1, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v2, 2131362310
    if-eqz v1, :L2
  .line 47
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 48
    const v1, 2131362326
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result p0
    if-eqz p0, :L6
    if-nez v0, :L6
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    goto/16 :L6
  :L2
  .line 49
    instance-of v1, p0, Lcom/innioasis/y1/activity/EqActivity;
    const v3, 2131362085
    if-eqz v1, :L3
  .line 50
    const v1, 2131362312
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 51
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L3
  .line 52
    instance-of v1, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L4
  .line 53
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 54
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L4
  .line 55
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L5
  .line 56
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 57
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L5
  .line 58
    instance-of v1, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v1, :L6
  .line 59
    const v1, 2131361987
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 60
    const v1, 2131362373
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 61
    const v1, 2131362086
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 62
    const v1, 2131362371
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  :L6
  .line 65
    goto :L8
  :L7
  .line 64
    move-exception p0
  :L8
  .line 66
    return-void
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 80
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 81
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 82
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 83
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 84
    const/4 p0, 1
    return p0
.end method

.method private static mainPreview(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 90
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 91
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 92
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 94
    goto :L3
  :L2
  .line 93
    move-exception p0
  :L3
  .line 95
    return-void
.end method

.method private static pad(Landroid/view/View;)V
  .registers 2
  .line 70
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 71
    return-void
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 74
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 75
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method public static simple(Landroid/content/Context;)Z
  .registers 2
  .line 34
    const-string v0, "menu_style"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    const/4 v0, 1
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static widen(Landroid/view/View;Z)V
  .registers 6
  .line 99
    if-nez p0, :L0
    return-void
  :L0
  .line 100
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 101
    if-nez v0, :L1
    return-void
  :L1
  .line 102
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 103
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 104
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 105
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 107
    if-eqz p1, :L3
    const/4 p1, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L4
  .line 108
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L5
    return-void
  :L5
  .line 109
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 110
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 111
    return-void
.end method
