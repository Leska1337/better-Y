.class public final Lcom/innioasis/ipp/Eq;
.super Ljava/lang/Object;
.source "Eq.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Eq$Stretch;
  }
.end annotation

.field private final static ACTIVE:I = -5374161

.field private static host:Ljava/lang/ref/WeakReference;

.method public constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static active(Landroid/widget/TextView;)V
  .registers 2
  .line 54
    if-nez p0, :L0
    return-void
  :L0
  .line 55
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 56
    if-eqz v0, :L1
    goto :L2
  :L1
    const v0, -5374161
  :L2
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 57
    return-void
.end method

.method static paint()V
  .catchall { :L2 .. :L6 } :L8
  .registers 5
  .line 73
    sget-object v0, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 74
    sput-object v1, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
  .line 75
    instance-of v1, v0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v1, :L2
    return-void
  :L2
  .line 77
    check-cast v0, Lcom/innioasis/y1/activity/EqActivity;
  .line 78
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
  .line 79
    instance-of v2, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;
    if-nez v2, :L3
    return-void
  :L3
  .line 80
    check-cast v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;
  .line 82
    invoke-static { }, Lcom/innioasis/y1/activity/EqActivity;->getEqList()Ljava/util/List;
    move-result-object v2
  .line 83
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity;->getMark()I
    move-result v0
  .line 84
    if-eqz v2, :L7
    if-ltz v0, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v0, v3, :L4
    goto :L7
  :L4
  .line 85
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 86
    instance-of v2, v0, Lcom/innioasis/y1/activity/EqActivity$EqData;
    if-nez v2, :L5
    return-void
  :L5
  .line 87
    check-cast v0, Lcom/innioasis/y1/activity/EqActivity$EqData;
  .line 89
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;->image:Landroid/widget/ImageView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity$EqData;->getIcon()I
    move-result v4
    invoke-virtual { v2, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 90
    iget-object v1, v1, Lcom/innioasis/y1/databinding/ActivityEqBinding;->text:Landroid/widget/TextView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/EqActivity$EqData;->getStr()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L6
  .line 93
    goto :L9
  :L7
  .line 84
    return-void
  :L8
  .line 91
    move-exception v0
  :L9
  .line 94
    return-void
.end method

.method public static preview(Lcom/innioasis/y1/activity/EqActivity;)V
  .registers 2
  .line 43
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Eq;->host:Ljava/lang/ref/WeakReference;
  .line 44
    return-void
.end method

.method public static stretch(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 112
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Eq$Stretch;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Eq$Stretch;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
    goto :L3
  :L2
  .line 113
    move-exception p0
    goto :L4
  :L3
  .line 115
    nop
  :L4
  .line 116
    return-void
.end method

.method public static underline(Landroid/widget/TextView;I)V
  .registers 4
  .line 65
    if-nez p0, :L0
    return-void
  :L0
  .line 66
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaintFlags()I
    move-result v0
  .line 67
    sget-object v1, Lcom/innioasis/y1/utils/EqSPUtils;->INSTANCE:Lcom/innioasis/y1/utils/EqSPUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/EqSPUtils;->getEqualizerInt()I
    move-result v1
    if-ne p1, v1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 68
    if-eqz p1, :L3
    or-int/lit8 p1, v0, 8
    goto :L4
  :L3
    and-int/lit8 p1, v0, -9
  :L4
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setPaintFlags(I)V
  .line 69
    return-void
.end method
