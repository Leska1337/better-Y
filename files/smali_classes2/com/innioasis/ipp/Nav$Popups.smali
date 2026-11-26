.class final Lcom/innioasis/ipp/Nav$Popups;
.super Ljava/lang/Object;
.source "Nav.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Nav;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Popups"
.end annotation

.field private final static HIDDEN:Ljava/util/ArrayList;

.field private static fViews:Ljava/lang/reflect/Field;

.field private static global:Ljava/lang/Object;

.method static constructor <clinit>()V
  .registers 1
  .line 673
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Nav$Popups;->HIDDEN:Ljava/util/ArrayList;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 672
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static hide(Landroid/app/Activity;)V
  .catchall { :L0 .. :L9 } :L11
  .registers 8
  :L0
  .line 679
    sget-object v0, Lcom/innioasis/ipp/Nav$Popups;->global:Ljava/lang/Object;
    const/4 v1, 0
    if-nez v0, :L1
  .line 680
    const-string v0, "android.view.WindowManagerGlobal"
    invoke-static { v0 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v0
  .line 681
    const-string v2, "getInstance"
    new-array v3, v1, [Ljava/lang/Class;
    invoke-virtual { v0, v2, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v2
    new-array v3, v1, [Ljava/lang/Object;
    const/4 v4, 0
    invoke-virtual { v2, v4, v3 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    sput-object v2, Lcom/innioasis/ipp/Nav$Popups;->global:Ljava/lang/Object;
  .line 682
    const-string v2, "mViews"
    invoke-virtual { v0, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Nav$Popups;->fViews:Ljava/lang/reflect/Field;
  .line 683
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  :L1
  .line 685
    sget-object v0, Lcom/innioasis/ipp/Nav$Popups;->fViews:Ljava/lang/reflect/Field;
    sget-object v2, Lcom/innioasis/ipp/Nav$Popups;->global:Ljava/lang/Object;
    invoke-virtual { v0, v2 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 686
    instance-of v2, v0, [Ljava/lang/Object;
    if-eqz v2, :L2
    move-object v2, v0
    check-cast v2, [Ljava/lang/Object;
    array-length v2, v2
    goto :L3
  :L2
    move-object v2, v0
    check-cast v2, Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
  :L3
  .line 687
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v3
  .line 688
    nop
  :L4
    if-ge v1, v2, :L10
  .line 689
    instance-of v4, v0, [Ljava/lang/Object;
    if-eqz v4, :L5
    move-object v4, v0
    check-cast v4, [Ljava/lang/Object;
    aget-object v4, v4, v1
    goto :L6
  :L5
    move-object v4, v0
    check-cast v4, Ljava/util/List;
    invoke-interface { v4, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  :L6
    check-cast v4, Landroid/view/View;
  .line 690
    if-eqz v4, :L9
    if-eq v4, v3, :L9
    invoke-virtual { v4 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Nav$Popups;->host(Landroid/content/Context;)Landroid/app/Activity;
    move-result-object v5
    if-eq v5, p0, :L7
    goto :L9
  :L7
  .line 692
    invoke-virtual { v4 }, Landroid/view/View;->getVisibility()I
    move-result v5
    if-eqz v5, :L8
    goto :L9
  :L8
  .line 693
    const/4 v5, 4
    invoke-virtual { v4, v5 }, Landroid/view/View;->setVisibility(I)V
  .line 694
    sget-object v5, Lcom/innioasis/ipp/Nav$Popups;->HIDDEN:Ljava/util/ArrayList;
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L9
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 688
    add-int/lit8 v1, v1, 1
    goto :L4
  :L10
  .line 697
    goto :L12
  :L11
  .line 696
    move-exception p0
  :L12
  .line 698
    return-void
.end method

.method private static host(Landroid/content/Context;)Landroid/app/Activity;
  .registers 2
  .line 712
    nop
  :L0
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L2
  .line 713
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L1
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L1
  .line 714
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
    goto :L0
  :L2
  .line 716
    const/4 p0, 0
    return-object p0
.end method

.method static restore()V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 701
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Nav$Popups;->HIDDEN:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L5
  .line 702
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  :L1
  .line 704
    invoke-virtual { v2 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    if-eqz v3, :L2
    invoke-virtual { v2 }, Landroid/view/View;->getVisibility()I
    move-result v3
    const/4 v4, 4
    if-ne v3, v4, :L2
    invoke-virtual { v2, v0 }, Landroid/view/View;->setVisibility(I)V
  :L2
  .line 706
    goto :L4
  :L3
  .line 705
    move-exception v2
  :L4
  .line 701
    add-int/lit8 v1, v1, 1
    goto :L0
  :L5
  .line 708
    invoke-virtual { v2 }, Ljava/util/ArrayList;->clear()V
  .line 709
    return-void
.end method
