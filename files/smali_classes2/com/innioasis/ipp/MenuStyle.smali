.class public final Lcom/innioasis/ipp/MenuStyle;
.super Ljava/lang/Object;
.source "MenuStyle.java"

.field public final static KEY:Ljava/lang/String; = "menu_style"

.field private final static SIMPLE:I = 1

.method private constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 43
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 45
    check-cast p0, Landroid/app/Activity;
  .line 46
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
  .line 47
    instance-of v1, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L1
  .line 48
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 49
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
  .line 50
    instance-of v1, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v2, 2131362310
    if-eqz v1, :L2
  .line 51
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 52
    const v1, 2131362326
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result v1
    if-eqz v1, :L6
    if-nez v0, :L6
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    goto/16 :L6
  :L2
  .line 53
    instance-of v1, p0, Lcom/innioasis/y1/activity/EqActivity;
    const v3, 2131362085
    if-eqz v1, :L3
  .line 54
    const v1, 2131362312
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 55
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L3
  .line 56
    instance-of v1, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L4
  .line 57
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 58
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L4
  .line 59
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L5
  .line 60
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 61
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L6
  :L5
  .line 62
    instance-of v1, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v1, :L6
  .line 63
    const v1, 2131361987
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 64
    const v1, 2131362373
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 65
    const v1, 2131362086
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 66
    const v2, 2131362371
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 67
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->dateIcon(Landroid/view/View;)V
  :L6
  .line 69
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->backdrop(Landroid/app/Activity;Z)V
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->apply(Landroid/app/Activity;)V
  .line 71
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->apply(Landroid/app/Activity;)V
  :L7
  .line 73
    goto :L9
  :L8
  .line 72
    move-exception p0
  :L9
  .line 74
    return-void
.end method

.method private static backdrop(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  :L0
  .line 90
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 91
    check-cast p0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->back:Landroid/widget/ImageView;
  .line 92
    if-eqz p1, :L1
    const/4 v1, 4
  :L1
    invoke-virtual { p0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 93
    return-void
  :L2
  .line 95
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L3
  .line 97
    return-void
  :L3
  .line 99
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 100
    if-eqz p1, :L4
  .line 101
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 102
    return-void
  :L4
  .line 104
    const p1, 2131361890
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L5
  .line 105
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 107
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 108
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  :L5
  .line 110
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 112
    goto :L8
  :L7
  .line 111
    move-exception p0
  :L8
  .line 113
    return-void
.end method

.method private static dateIcon(Landroid/view/View;)V
  .registers 3
  .line 78
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :L1
    const v0, 2131362086
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 79
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 80
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/ImageView;
    const v1, 2131230954
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 81
    return-void
  :L1
  .line 78
    return-void
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 127
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 128
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 129
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 130
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 131
    const/4 p0, 1
    return p0
.end method

.method private static mainPreview(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 137
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 138
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 139
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 141
    goto :L3
  :L2
  .line 140
    move-exception p0
  :L3
  .line 142
    return-void
.end method

.method private static pad(Landroid/view/View;)V
  .registers 2
  .line 117
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 118
    return-void
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 121
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 122
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method public static simple(Landroid/content/Context;)Z
  .registers 2
  .line 38
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
  .line 146
    if-nez p0, :L0
    return-void
  :L0
  .line 147
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 148
    if-nez v0, :L1
    return-void
  :L1
  .line 149
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 150
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 151
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 152
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 154
    if-eqz p1, :L3
    const/4 p1, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L4
  .line 155
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L5
    return-void
  :L5
  .line 156
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 157
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 158
    return-void
.end method
