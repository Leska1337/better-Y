.class public final Lcom/innioasis/ipp/Tint;
.super Ljava/lang/Object;
.source "Tint.java"

.field private final static ACCENT:I = -12779554

.field private final static BLACK:I = -15592942

.field private final static DARK:I = 1

.field private final static HALF:I = 128

.field public final static KEY_LYRICS:Ljava/lang/String; = "lyrics_tint"

.field public final static KEY_TEXT:Ljava/lang/String; = "text_tint"

.field private final static NO_COLOR:I = 0

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static color(Landroid/app/Activity;Ljava/lang/String;I)I
  .registers 4
  .line 77
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p1
  .line 78
    const/4 v0, 1
    if-ne p1, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 79
    const/4 v0, 2
    if-ne p1, v0, :L3
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->timelineColor(Landroid/app/Activity;)I
    move-result p0
  .line 81
    if-eqz p0, :L1
    return p0
  :L1
  .line 82
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 83
    if-eqz p0, :L2
    return p0
  :L2
  .line 84
    return p2
  :L3
  .line 86
    const/4 p0, -1
    return p0
.end method

.method private static lyrics(Landroid/app/Activity;)V
  .registers 5
  .line 61
    const v0, 2131362183
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 62
    instance-of v1, v0, Lme/wcy/lrcview/LrcView;
    if-nez v1, :L0
    return-void
  :L0
  .line 63
    const-string v1, "lyrics_tint"
    const v2, -12779554
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Tint;->color(Landroid/app/Activity;Ljava/lang/String;I)I
    move-result p0
  .line 64
    check-cast v0, Lme/wcy/lrcview/LrcView;
  .line 66
    invoke-virtual { v0, p0 }, Lme/wcy/lrcview/LrcView;->setCurrentColor(I)V
  .line 67
    invoke-static { p0 }, Landroid/graphics/Color;->red(I)I
    move-result v1
    invoke-static { p0 }, Landroid/graphics/Color;->green(I)I
    move-result v2
    invoke-static { p0 }, Landroid/graphics/Color;->blue(I)I
    move-result p0
    const/16 v3, 128
    invoke-static { v3, v1, v2, p0 }, Landroid/graphics/Color;->argb(IIII)I
    move-result p0
    invoke-virtual { v0, p0 }, Lme/wcy/lrcview/LrcView;->setNormalColor(I)V
  .line 68
    return-void
.end method

.method private static paint(Landroid/app/Activity;II)V
  .registers 3
  .line 71
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 72
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 73
    return-void
.end method

.method public static player(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 44
    if-nez p0, :L0
    return-void
  :L0
  .line 46
    const-string v0, "text_tint"
    const/4 v1, -1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Tint;->color(Landroid/app/Activity;Ljava/lang/String;I)I
    move-result v0
  .line 47
    const v1, 2131362486
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 48
    const v1, 2131362487
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 49
    const v1, 2131362484
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 50
    const v1, 2131362490
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 51
    const v1, 2131362494
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 52
    const v1, 2131362493
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 54
    const v1, 2131362501
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 55
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->lyrics(Landroid/app/Activity;)V
  :L1
  .line 57
    goto :L3
  :L2
  .line 56
    move-exception p0
  :L3
  .line 58
    return-void
.end method
