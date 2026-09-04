.class public final Lcom/innioasis/ipp/Shuffle;
.super Ljava/lang/Object;
.source "Shuffle.java"

.field private static busy:Z

.field private static last:Ljava/lang/ref/WeakReference;

.method public constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static refresh()V
  .catchall { :L4 .. :L7 } :L8
  .registers 5
  .line 85
    sget-boolean v0, Lcom/innioasis/ipp/Shuffle;->busy:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 86
    sget-object v0, Lcom/innioasis/ipp/Shuffle;->last:Ljava/lang/ref/WeakReference;
  .line 87
    if-nez v0, :L1
    return-void
  :L1
  .line 88
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 89
    instance-of v1, v0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-nez v1, :L2
    return-void
  :L2
  .line 90
    check-cast v0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 91
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-nez v1, :L3
    return-void
  :L3
  .line 92
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Shuffle;->busy:Z
  .line 94
    const/4 v1, 0
  :L4
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v2
  .line 95
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v2, :L5
    const v4, 2131231050
    goto :L6
  :L5
    const/4 v4, 0
  :L6
    invoke-virtual { v3, v0, v4, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L7
    goto :L9
  :L8
  .line 96
    move-exception v0
  :L9
  .line 99
    sput-boolean v1, Lcom/innioasis/ipp/Shuffle;->busy:Z
  .line 100
    nop
  .line 101
    return-void
.end method

.method public static style(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)V
  .registers 5
  .line 34
    if-nez p0, :L0
    return-void
  :L0
  .line 35
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Shuffle;->last:Ljava/lang/ref/WeakReference;
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->attach(Landroid/view/View;)V
  .line 43
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->reveal(Landroid/view/View;)V
  :L1
  .line 44
    const v0, 2131362500
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 45
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 46
    check-cast v0, Landroid/widget/TextView;
  .line 50
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 51
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v1
  .line 52
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    if-eqz v1, :L3
    const v3, 2131100252
    goto :L4
  :L3
    const v3, 2131100267
  :L4
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 53
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v3, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 57
    const v2, 2131362087
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 58
    instance-of v3, v2, Landroid/widget/ImageView;
    if-eqz v3, :L5
    check-cast v2, Landroid/widget/ImageView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L5
  .line 65
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v1, :L6
    const v2, 2131231050
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-virtual { v0, p0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 66
    return-void
.end method
