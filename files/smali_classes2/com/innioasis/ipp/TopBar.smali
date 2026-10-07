.class public final Lcom/innioasis/ipp/TopBar;
.super Ljava/lang/Object;
.source "TopBar.java"

.field public final static ALL:I = 15

.field public final static BATTERY:I = 8

.field private final static BLACK:I = -15592942

.field public final static BLUETOOTH:I = 4

.field private final static DARK:I = 1

.field public final static HEADSET:I = 2

.field public final static ICONS:[I

.field public final static KEY_ICONS:Ljava/lang/String; = "bar_icons"

.field public final static KEY_TEXT:Ljava/lang/String; = "bar_text"

.field public final static PLAY:I = 1

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method static constructor <clinit>()V
  .registers 4
  .line 36
    const/4 v0, 4
    const/16 v1, 8
    const/4 v2, 1
    const/4 v3, 2
    filled-new-array { v2, v3, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/TopBar;->ICONS:[I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 6
  .line 46
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 48
    check-cast p0, Landroid/app/Activity;
  .line 50
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 51
    if-nez v0, :L1
    return-void
  :L1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->color(Landroid/content/Context;)I
    move-result v1
  .line 53
    const v2, 2131362410
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 54
    const v2, 2131361895
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 55
    const-string v1, "bar_icons"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 56
    and-int/lit8 v1, p0, 1
    const/4 v2, 0
    const/4 v3, 1
    if-nez v1, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    const v4, 2131362295
    invoke-static { v0, v4, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 57
    and-int/lit8 v1, p0, 2
    if-nez v1, :L4
    const/4 v1, 1
    goto :L5
  :L4
    const/4 v1, 0
  :L5
    const v4, 2131362072
    invoke-static { v0, v4, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 58
    and-int/lit8 v1, p0, 4
    if-nez v1, :L6
    const/4 v1, 1
    goto :L7
  :L6
    const/4 v1, 0
  :L7
    const v4, 2131361900
    invoke-static { v0, v4, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 59
    and-int/lit8 p0, p0, 8
    if-nez p0, :L8
    const/4 v2, 1
  :L8
    const p0, 2131361894
    invoke-static { v0, p0, v2 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  :L9
  .line 61
    goto :L11
  :L10
  .line 60
    move-exception p0
  :L11
  .line 62
    return-void
.end method

.method private static color(Landroid/content/Context;)I
  .registers 2
  .line 65
    const-string v0, "bar_text"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 66
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 67
    const/4 v0, 2
    if-ne p0, v0, :L1
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 69
    if-eqz p0, :L1
    return p0
  :L1
  .line 71
    const/4 p0, -1
    return p0
.end method

.method private static fold(Landroid/view/View;IZ)V
  .registers 6
  .line 81
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 82
    if-nez p0, :L0
    return-void
  :L0
  .line 83
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 84
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v0, :L1
    return-void
  :L1
  .line 85
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;
  .line 86
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 88
    instance-of v2, v1, [I
    if-eqz v2, :L2
  .line 89
    check-cast v1, [I
    goto :L3
  :L2
  .line 91
    iget v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result v2
    filled-new-array { v1, v2 }, [I
    move-result-object v1
  .line 92
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 94
    const/4 v0, 0
    if-eqz p2, :L4
    const/4 v2, 0
    goto :L5
  :L4
    aget v2, v1, v0
  :L5
  .line 95
    if-eqz p2, :L6
    goto :L7
  :L6
    const/4 p2, 1
    aget v0, v1, p2
  :L7
  .line 96
    iget p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    if-ne p2, v2, :L8
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result p2
    if-ne p2, v0, :L8
    return-void
  :L8
  .line 97
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
  .line 99
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 100
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V
  .line 101
    invoke-virtual { p0, p1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 102
    return-void
.end method

.method private static paint(Landroid/view/View;II)V
  .registers 3
  .line 75
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 76
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 77
    return-void
.end method
