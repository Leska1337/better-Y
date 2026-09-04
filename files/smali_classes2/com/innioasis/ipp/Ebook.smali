.class public final Lcom/innioasis/ipp/Ebook;
.super Ljava/lang/Object;
.source "Ebook.java"

.field public final static EXTRA:Ljava/lang/String; = "ipp_library"

.field private final static LIBRARY_ROW:I = 2

.method private constructor <init>()V
  .registers 1
  .line 44
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static beforeShow(Landroid/app/Activity;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 179
    if-nez p0, :L0
    return-void
  :L0
  .line 180
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 181
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 182
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ebook;->minMark(Landroid/app/Activity;I)I
    move-result p1
  .line 183
    if-ge v1, p1, :L1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    move v1, p1
  :L1
  .line 184
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L2
    return-void
  :L2
  .line 185
    const p1, 2131362552
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    const/4 p1, 2
    if-ne v1, p1, :L3
    const/4 p1, 1
    goto :L4
  :L3
    const/4 p1, 0
  :L4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ebook;->paint(Landroid/view/View;Z)V
  :L5
  .line 188
    goto :L7
  :L6
  .line 186
    move-exception p0
  :L7
  .line 189
    return-void
.end method

.method private static books(Landroid/app/Activity;)I
  .registers 3
  .line 161
    const v0, 2131362311
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 162
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 163
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 164
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  :L2
    return v1
.end method

.method public static confirm(Landroid/app/Activity;I)Z
  .catchall { :L1 .. :L4 } :L6
  .registers 5
  .line 146
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 147
    const/4 v1, 1
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v2
    if-nez v2, :L3
  .line 148
    const/4 v2, 2
    if-eq p1, v2, :L2
    return v0
  :L2
  .line 149
    new-instance p1, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    invoke-direct { p1, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 150
    const-string v0, "ipp_library"
    invoke-virtual { p1, v0, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 151
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 152
    return v1
  :L3
  .line 154
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->books(Landroid/app/Activity;)I
    move-result p0
  :L4
    if-nez p0, :L5
    const/4 v0, 1
  :L5
    return v0
  :L6
  .line 155
    move-exception p0
  .line 156
    return v1
.end method

.method private static label(Landroid/view/View;Ljava/lang/String;)V
  .registers 3
  .line 103
    if-nez p0, :L0
    return-void
  :L0
  .line 104
    const v0, 2131362491
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 105
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L1
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 106
    return-void
.end method

.method public static library(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 54
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_library"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 55
    move-exception p0
  .line 56
    return v0
  :L3
  .line 54
    return v0
.end method

.method public static maxMark(Landroid/app/Activity;II)I
  .registers 3
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 2
    return p0
  :L0
  .line 122
    add-int/lit8 p1, p1, -1
    add-int/2addr p1, p2
  .line 123
    if-ge p1, p2, :L1
    goto :L2
  :L1
    move p2, p1
  :L2
    return p2
.end method

.method public static menuFloor(Landroid/app/Activity;I)I
  .registers 2
  .line 132
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const p1, 2147483647
  :L1
    return p1
.end method

.method public static minMark(Landroid/app/Activity;I)I
  .registers 2
  .line 112
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method private static paint(Landroid/view/View;Z)V
  .registers 6
  .line 197
    if-nez p0, :L0
    return-void
  :L0
  .line 198
    const v0, 2131362491
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 199
    const v1, 2131362144
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 200
    const v2, 2131362152
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 201
    if-nez v2, :L1
    goto :L2
  :L1
    move-object p0, v2
  :L2
  .line 202
    instance-of v2, v0, Landroid/widget/TextView;
    if-eqz v2, :L5
  .line 203
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast v0, Landroid/widget/TextView;
  .line 204
    if-eqz p1, :L3
    const-string v3, "#3CFFDE"
    invoke-static { v3 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v3
    goto :L4
  :L3
    const/4 v3, -1
  :L4
  .line 203
    invoke-virtual { v2, v0, v3, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L5
  .line 206
    instance-of v0, v1, Landroid/widget/ImageView;
    const/4 v2, 0
    if-eqz v0, :L8
  .line 207
    if-eqz p1, :L6
    const/4 v0, 0
    goto :L7
  :L6
    const/16 v0, 8
  :L7
    invoke-virtual { v1, v0 }, Landroid/view/View;->setVisibility(I)V
  .line 208
    if-eqz p1, :L8
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast v1, Landroid/widget/ImageView;
    const v3, 2131623981
    invoke-virtual { v0, v1, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  :L8
  .line 210
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz p1, :L9
    const v2, 2131230823
  :L9
    invoke-virtual { v0, p0, v2, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 211
    return-void
.end method

.method public static setup(Landroid/app/Activity;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 11
  .line 69
    if-nez p0, :L0
    return-void
  :L0
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v0
  .line 71
    const v1, 2131361973
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 72
    const v2, 2131362179
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 73
    const v3, 2131362552
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
  .line 74
    const v4, 2131361901
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
  .line 75
    const v5, 2131362553
    invoke-virtual { p0, v5 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
  .line 76
    const v6, 2131362311
    invoke-virtual { p0, v6 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v6
  .line 78
    const/4 v7, 1
    const/4 v8, 0
    if-nez v0, :L1
    const/4 v9, 1
    goto :L2
  :L1
    const/4 v9, 0
  :L2
    invoke-static { v1, v9 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 79
    if-nez v0, :L3
    const/4 v1, 1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 80
    if-nez v0, :L5
    goto :L6
  :L5
    const/4 v7, 0
  :L6
    invoke-static { v3, v7 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 81
    invoke-static { v6, v0 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 84
    invoke-static { v4, v8 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 85
    invoke-static { v5, v8 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 87
    const v1, 2131820617
    if-eqz v0, :L7
  .line 88
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/base/BaseActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 89
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v0, 2
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    goto :L8
  :L7
  .line 91
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { v3, p0 }, Lcom/innioasis/ipp/Ebook;->label(Landroid/view/View;Ljava/lang/String;)V
  :L8
  .line 95
    goto :L10
  :L9
  .line 93
    move-exception p0
  :L10
  .line 96
    return-void
.end method

.method private static show(Landroid/view/View;Z)V
  .registers 2
  .line 99
    if-eqz p0, :L2
    if-eqz p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    const/16 p1, 8
  :L1
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L2
  .line 100
    return-void
.end method
