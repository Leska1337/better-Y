.class public final Lcom/innioasis/ipp/Tint;
.super Ljava/lang/Object;
.source "Tint.java"

.field private final static ACCENT:I = -12779554

.field private final static BLACK:I = -15592942

.field private final static BOX_ALPHA:I = 26

.field private final static BOX_OFF:I = 3

.field private final static DARK:I = 1

.field private final static HALF:I = 128

.field public final static KEY_BOX:Ljava/lang/String; = "box_tint"

.field public final static KEY_LYRICS:Ljava/lang/String; = "lyrics_tint"

.field public final static KEY_TEXT:Ljava/lang/String; = "text_tint"

.field private final static NO_COLOR:I = 0

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method private constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static back(Landroid/app/Activity;II)V
  .registers 3
  .line 110
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 111
    if-eqz p0, :L0
    invoke-virtual { p0, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  :L0
  .line 112
    return-void
.end method

.method private static box(I)I
  .registers 2
  .line 105
    const v0, 16777215
    and-int/2addr p0, v0
    const/high16 v0, 0x1A000000
    or-int/2addr p0, v0
    return p0
.end method

.method private static color(Landroid/app/Activity;Ljava/lang/String;I)I
  .registers 4
  .line 121
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p1
  .line 122
    const/4 v0, 1
    if-ne p1, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 123
    const/4 v0, 2
    if-ne p1, v0, :L3
  .line 124
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->timelineColor(Landroid/app/Activity;)I
    move-result p0
  .line 125
    if-eqz p0, :L1
    return p0
  :L1
  .line 126
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 127
    if-eqz p0, :L2
    return p0
  :L2
  .line 128
    return p2
  :L3
  .line 130
    const/4 p0, -1
    return p0
.end method

.method private static lyrics(Landroid/app/Activity;)V
  .registers 5
  .line 89
    const v0, 2131362183
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 90
    instance-of v1, v0, Lme/wcy/lrcview/LrcView;
    if-nez v1, :L0
    return-void
  :L0
  .line 91
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->lyricsColor(Landroid/app/Activity;)I
    move-result p0
  .line 92
    check-cast v0, Lme/wcy/lrcview/LrcView;
  .line 94
    invoke-virtual { v0, p0 }, Lme/wcy/lrcview/LrcView;->setCurrentColor(I)V
  .line 95
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
  .line 96
    return-void
.end method

.method static lyricsColor(Landroid/app/Activity;)I
  .registers 3
  .line 100
    const-string v0, "lyrics_tint"
    const v1, -12779554
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Tint;->color(Landroid/app/Activity;Ljava/lang/String;I)I
    move-result p0
    return p0
.end method

.method private static paint(Landroid/app/Activity;II)V
  .registers 3
  .line 115
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 116
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 117
    return-void
.end method

.method public static player(Landroid/app/Activity;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  .line 52
    const-string v0, "box_tint"
    if-nez p0, :L0
    return-void
  :L0
  .line 54
    const-string v1, "text_tint"
    const/4 v2, -1
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Tint;->color(Landroid/app/Activity;Ljava/lang/String;I)I
    move-result v1
  .line 55
    const v3, 2131362486
    invoke-static { p0, v3, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 56
    const v4, 2131362487
    invoke-static { p0, v4, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 57
    const v5, 2131362484
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 58
    const v6, 2131362490
    invoke-static { p0, v6, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 59
    const v7, 2131362494
    invoke-static { p0, v7, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 60
    const v7, 2131362493
    invoke-static { p0, v7, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 62
    const v7, 2131362501
    invoke-static { p0, v7, v1 }, Lcom/innioasis/ipp/Tint;->paint(Landroid/app/Activity;II)V
  .line 63
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
    const/4 v7, 3
    if-ne v1, v7, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Tint;->color(Landroid/app/Activity;Ljava/lang/String;I)I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Tint;->box(I)I
    move-result v0
  :L2
  .line 64
    invoke-static { p0, v3, v0 }, Lcom/innioasis/ipp/Tint;->back(Landroid/app/Activity;II)V
  .line 65
    invoke-static { p0, v4, v0 }, Lcom/innioasis/ipp/Tint;->back(Landroid/app/Activity;II)V
  .line 66
    invoke-static { p0, v5, v0 }, Lcom/innioasis/ipp/Tint;->back(Landroid/app/Activity;II)V
  .line 67
    invoke-static { p0, v6, v0 }, Lcom/innioasis/ipp/Tint;->back(Landroid/app/Activity;II)V
  .line 68
    const v1, 2131362155
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Tint;->back(Landroid/app/Activity;II)V
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->lyrics(Landroid/app/Activity;)V
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->volume(Landroid/app/Activity;)V
  :L3
  .line 72
    goto :L5
  :L4
  .line 71
    move-exception p0
  :L5
  .line 73
    return-void
.end method

.method private static volume(Landroid/app/Activity;)V
  .registers 4
  .line 77
    const v0, 2131362170
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 78
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L0
    return-void
  :L0
  .line 79
    check-cast v0, Landroid/view/ViewGroup;
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->timelineColor(Landroid/app/Activity;)I
    move-result p0
  .line 81
    const/4 v1, 0
  :L1
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L3
  .line 82
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    instance-of v2, v2, Landroid/widget/ImageView;
    if-eqz v2, :L2
  .line 83
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/ImageView;
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Icons;->on(Landroid/widget/ImageView;I)V
  :L2
  .line 81
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 86
    return-void
.end method
