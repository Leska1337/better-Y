.class public final Lcom/innioasis/ipp/TipDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "TipDialog.java"

.field private final static BOX:I = -7564110

.field private final static CLOSE:I = 1

.field private final static CORNER:F = 10.0F

.field private final static NONE:I = -1

.field private final static TICK:I

.field private final activity:Landroid/app/Activity;

.field private body:Landroid/widget/TextView;

.field private final closeText:Ljava/lang/String;

.field private counter:Landroid/widget/TextView;

.field private final labels:[Landroid/widget/TextView;

.field private off:Z

.field private page:I

.field private final pages:[Ljava/lang/String;

.field private final pref:Ljava/lang/String;

.field private final rows:[Landroid/view/View;

.field private sel:I

.field private tick:Landroid/widget/ImageView;

.field private final tickText:Ljava/lang/String;

.method private constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 9
  .line 70
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 46
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
  .line 47
    const/4 v1, 2
    new-array v2, v1, [Landroid/view/View;
    iput-object v2, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
  .line 48
    new-array v1, v1, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
  .line 71
    iput-object p1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
  .line 72
    invoke-static { p2 }, Lcom/innioasis/ipp/TipDialog;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
  .line 73
    array-length p1, p1
    if-le p1, v0, :L0
    const/4 p1, -1
    iput p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
  :L0
  .line 74
    iput-object p3, p0, Lcom/innioasis/ipp/TipDialog;->closeText:Ljava/lang/String;
  .line 75
    iput-object p4, p0, Lcom/innioasis/ipp/TipDialog;->tickText:Ljava/lang/String;
  .line 76
    iput-object p5, p0, Lcom/innioasis/ipp/TipDialog;->pref:Ljava/lang/String;
  .line 77
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 186
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private paint()V
  .registers 11
  .line 190
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100267
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 191
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    iget v4, p0, Lcom/innioasis/ipp/TipDialog;->page:I
    aget-object v3, v3, v4
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 192
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    iget v4, p0, Lcom/innioasis/ipp/TipDialog;->page:I
    const/4 v5, 1
    add-int/2addr v4, v5
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " / "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length v4, v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 193
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v4, 0
    invoke-virtual { v2, v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 194
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    invoke-virtual { v2, v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 195
    const/4 v0, 0
  :L0
    const/4 v2, 2
    if-ge v0, v2, :L14
  .line 196
    iget v2, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-ne v0, v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 197
    if-ne v0, v5, :L7
  .line 198
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    const v6, 2131230870
    const v7, 2131230869
    if-eqz v2, :L3
    const v8, 2131230870
    goto :L4
  :L3
    const v8, 2131230869
  :L4
    invoke-virtual { v3, v8 }, Landroid/widget/TextView;->setBackgroundResource(I)V
  .line 199
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v8, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v8, v8, v0
  .line 200
    if-eqz v2, :L5
    goto :L6
  :L5
    const v6, 2131230869
  :L6
  .line 199
    invoke-virtual { v3, v8, v6, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetBackground(Landroid/widget/TextView;IZ)V
  .line 201
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v6, v6, v0
    const/4 v7, -1
    invoke-virtual { v3, v6, v7, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetTextColor(Landroid/widget/TextView;IZ)V
  .line 202
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, v0
    invoke-static { v2 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 203
    goto :L13
  :L7
  .line 205
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v3 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    if-eqz v2, :L8
  .line 206
    const v6, 2131100253
    goto :L9
  :L8
    const v6, 2131100267
  :L9
  .line 205
    invoke-virtual { v3, v6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
  .line 207
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v6, v6, v0
    const/4 v7, 0
    invoke-virtual { v6, v7 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 208
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v7, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v7, v7, v0
  .line 209
    const v8, 2131231051
    if-eqz v2, :L10
    const v9, 2131231051
    goto :L11
  :L10
    const/4 v9, 0
  :L11
  .line 208
    invoke-virtual { v6, v7, v9, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 210
    if-eqz v2, :L12
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v6, v6, v0
    invoke-virtual { v6 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v6
    if-nez v6, :L12
  .line 211
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v6, v6, v0
    invoke-virtual { v6, v8 }, Landroid/view/View;->setBackgroundResource(I)V
  :L12
  .line 213
    iget-object v6, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aget-object v6, v6, v0
    invoke-static { v6 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 214
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v7, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v7, v7, v0
    invoke-virtual { v6, v7, v3, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 215
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, v0
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 216
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    iget-boolean v3, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L13
  .line 195
    add-int/lit8 v0, v0, 1
    goto/16 :L0
  :L14
  .line 218
    return-void
.end method

.method public static show(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/innioasis/ipp/TipDialog;
  .catchall { :L0 .. :L7 } :L9
  .registers 11
  .line 56
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-static { p0, p2, v0 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :L1
    return-object v1
  :L1
  .line 57
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p1
  .line 58
    if-eqz p1, :L8
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    if-eqz v2, :L8
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L2
    goto :L8
  :L2
  .line 59
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v2, :L3
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v2, v2
    if-lez v2, :L3
    iget-object v2, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v0, v2, v0
    goto :L4
  :L3
    const-string v0, "OK"
  :L4
    move-object v5, v0
  .line 60
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v0, :L5
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v0, v0
    const/4 v2, 1
    if-le v0, v2, :L5
    iget-object v0, p1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v0, v0, v2
    goto :L6
  :L5
    const-string v0, ""
  :L6
    move-object v6, v0
  .line 61
    new-instance v0, Lcom/innioasis/ipp/TipDialog;
    iget-object p1, p1, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    move-object v2, v0
    move-object v3, p0
    move-object v7, p2
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/TipDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .line 62
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->show()V
  :L7
  .line 63
    return-object v0
  :L8
  .line 58
    return-object v1
  :L9
  .line 64
    move-exception p0
  .line 65
    return-object v1
.end method

.method private static split(Ljava/lang/String;)[Ljava/lang/String;
  .registers 7
  .line 158
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 159
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 160
    const-string v2, "\n"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 161
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L4
  .line 162
    aget-object v4, p0, v3
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    const-string v5, "---"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L1
  .line 163
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-interface { v0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 164
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->setLength(I)V
    goto :L3
  :L1
  .line 166
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L2
    const/16 v4, 10
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L2
  .line 167
    aget-object v4, p0, v3
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 161
    add-int/lit8 v3, v3, 1
    goto :L0
  :L4
  .line 170
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-interface { v0, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 171
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-interface { v0, p0 }, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    return-object p0
.end method

.method private step(I)V
  .registers 6
  .line 246
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length v0, v0
    const/4 v1, 1
    sub-int/2addr v0, v1
  .line 247
    const/4 v2, -1
    const/4 v3, 0
    if-lez p1, :L2
  .line 248
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->page:I
    if-ge p1, v0, :L0
    add-int/2addr p1, v1
    iput p1, p0, Lcom/innioasis/ipp/TipDialog;->page:I
    goto :L5
  :L0
  .line 249
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-ne p1, v2, :L1
    iput v3, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    goto :L5
  :L1
  .line 250
    iput v1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    goto :L5
  :L2
  .line 252
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-ne p1, v1, :L3
    iput v3, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    goto :L5
  :L3
  .line 253
    if-nez p1, :L4
    iput v2, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    goto :L5
  :L4
  .line 254
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->page:I
    if-lez p1, :L5
    sub-int/2addr p1, v1
    iput p1, p0, Lcom/innioasis/ipp/TipDialog;->page:I
  :L5
  .line 256
    return-void
.end method

.method private tallest(I)I
  .registers 13
  .line 176
    nop
  .line 177
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length v2, v2
    if-ge v0, v2, :L2
  .line 178
    new-instance v2, Landroid/text/StaticLayout;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    aget-object v4, v3, v0
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v5
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;
    const/high16 v8, 0x3F800000
    const/4 v9, 0
    const/4 v10, 1
    move-object v3, v2
    move v6, p1
    invoke-direct/range { v3 .. v10 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 180
    invoke-virtual { v2 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v3
    if-le v3, v1, :L1
    invoke-virtual { v2 }, Landroid/text/StaticLayout;->getHeight()I
    move-result v1
  :L1
  .line 177
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 182
    return v1
.end method

.method public longDown(II)V
  .registers 3
  .line 260
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 264
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 16
  .line 81
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 82
    new-instance p1, Landroid/widget/LinearLayout;
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { p1, v0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 83
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 84
    const/16 v1, 10
    const/16 v2, 8
    invoke-virtual { p1, v1, v2, v1, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 85
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v1
  .line 86
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v3 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 87
    const/high16 v4, 0x41200000
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 88
    if-nez v1, :L0
    const v1, -7564110
    goto :L1
  :L0
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L1
    invoke-virtual { v3, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 89
    invoke-virtual { p1, v3 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 91
    new-instance v1, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
  .line 92
    const/high16 v3, 0x41600000
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 93
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 94
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v4, 4
    const/4 v5, 2
    invoke-virtual { v1, v4, v5, v4, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 95
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/16 v6, 17
    invoke-virtual { v1, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 96
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    const/4 v7, -1
    const/4 v8, -2
    invoke-virtual { p1, v1, v7, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 97
    new-instance v1, Landroid/widget/TextView;
    iget-object v9, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v9 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
  .line 98
    const/high16 v9, 0x41400000
    invoke-virtual { v1, v9 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 99
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v9
    invoke-virtual { v1, v9 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 100
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 101
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    const/4 v9, 0
    invoke-virtual { v1, v9, v9, v9, v4 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 102
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    iget-object v10, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length v10, v10
    if-le v10, v0, :L2
    const/4 v10, 0
    goto :L3
  :L2
    const/16 v10, 8
  :L3
    invoke-virtual { v1, v10 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 103
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->counter:Landroid/widget/TextView;
    invoke-virtual { p1, v1, v7, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 105
    new-instance v1, Landroid/widget/LinearLayout;
    iget-object v10, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v10 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 106
    invoke-virtual { v1, v9 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 107
    const/16 v10, 16
    invoke-virtual { v1, v10 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 108
    const/4 v11, 5
    const/4 v12, 3
    invoke-virtual { v1, v11, v12, v11, v12 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 109
    const-string v11, "ipp_flat"
    invoke-virtual { v1, v11 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 110
    new-instance v12, Landroid/widget/ImageView;
    iget-object v13, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v12, v13 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v12, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
  .line 111
    invoke-static { v9 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v13
    invoke-virtual { v12, v13 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 112
    iget-object v12, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    sget-object v13, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v12, v13 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 113
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v12, v10, v10 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 114
    const/4 v10, 6
    iput v10, v12, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 115
    iget-object v13, p0, Lcom/innioasis/ipp/TipDialog;->tick:Landroid/widget/ImageView;
    invoke-virtual { v1, v13, v12 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 116
    new-instance v12, Landroid/widget/TextView;
    iget-object v13, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v12, v13 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 117
    invoke-virtual { v12, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 118
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v12, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 119
    invoke-virtual { v12, v5 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 120
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->tickText:Ljava/lang/String;
    invoke-virtual { v12, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 121
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v9, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 122
    const/high16 v13, 0x3F800000
    iput v13, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 123
    invoke-virtual { v1, v12, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 124
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aput-object v1, v3, v9
  .line 125
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aput-object v12, v3, v9
  .line 126
    invoke-virtual { p1, v1, v7, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 128
    new-instance v1, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 129
    invoke-virtual { v1, v11 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 130
    const/high16 v3, 0x41700000
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 131
    invoke-static { }, Lcom/innioasis/ipp/TipDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 132
    invoke-virtual { v1, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 133
    invoke-virtual { v1, v10, v4, v10, v4 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 134
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 135
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->closeText:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 136
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->rows:[Landroid/view/View;
    aput-object v1, v3, v0
  .line 137
    iget-object v3, p0, Lcom/innioasis/ipp/TipDialog;->labels:[Landroid/widget/TextView;
    aput-object v1, v3, v0
  .line 138
    new-instance v3, Landroid/widget/LinearLayout;
    iget-object v4, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-direct { v3, v4 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 139
    invoke-virtual { v3, v6 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 140
    invoke-virtual { v3, v9, v10, v9, v9 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 141
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v8, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, v1, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 142
    invoke-virtual { p1, v3, v7, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 144
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/TipDialog;->setContentView(Landroid/view/View;)V
  .line 145
    iget-object p1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    invoke-virtual { p1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    const v1, 2131165784
    invoke-virtual { p1, v1 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result p1
    const v1, 1071225242
    mul-float p1, p1, v1
    float-to-int p1, p1
  .line 146
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->getWindow()Landroid/view/Window;
    move-result-object v1
  .line 147
    if-eqz v1, :L4
  .line 148
    invoke-virtual { v1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v3
  .line 149
    iput p1, v3, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 150
    iput v6, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 151
    invoke-virtual { v1, v3 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L4
  .line 153
    iget-object v1, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length v1, v1
    if-le v1, v0, :L5
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->body:Landroid/widget/TextView;
    add-int/lit8 p1, p1, -20
    sub-int/2addr p1, v2
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/TipDialog;->tallest(I)I
    move-result p1
    add-int/2addr p1, v5
    add-int/2addr p1, v2
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setHeight(I)V
  :L5
  .line 154
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
  .line 155
    return-void
.end method

.method public shortUp(I)V
  .registers 8
  .line 222
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 223
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    const/4 v2, 0
    const/4 v3, 1
    if-eq p1, v1, :L1
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L1
  :L0
    const/4 v1, 0
    goto :L2
  :L1
    const/4 v1, 1
  :L2
  .line 224
    const/4 v4, -1
    if-nez v1, :L8
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v5
    if-eq p1, v5, :L8
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v5
    if-ne p1, v5, :L3
    goto :L8
  :L3
  .line 228
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L7
  .line 229
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-ne p1, v4, :L4
  .line 230
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/TipDialog;->step(I)V
  .line 231
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
    goto :L13
  :L4
  .line 232
    if-nez p1, :L5
  .line 233
    iget-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    xor-int/2addr p1, v3
    iput-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
  .line 234
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
    goto :L13
  :L5
  .line 236
    iget-boolean p1, p0, Lcom/innioasis/ipp/TipDialog;->off:Z
    if-eqz p1, :L6
    iget-object p1, p0, Lcom/innioasis/ipp/TipDialog;->activity:Landroid/app/Activity;
    iget-object v0, p0, Lcom/innioasis/ipp/TipDialog;->pref:Ljava/lang/String;
    invoke-static { p1, v0, v3 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L6
  .line 237
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
    goto :L13
  :L7
  .line 239
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L13
  .line 240
    invoke-virtual { p0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
    goto :L13
  :L8
  .line 225
    iget-object p1, p0, Lcom/innioasis/ipp/TipDialog;->pages:[Ljava/lang/String;
    array-length p1, p1
    if-ne p1, v3, :L10
    iget p1, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    if-nez p1, :L9
    const/4 v2, 1
  :L9
    iput v2, p0, Lcom/innioasis/ipp/TipDialog;->sel:I
    goto :L12
  :L10
  .line 226
    if-eqz v1, :L11
    const/4 v3, -1
  :L11
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/TipDialog;->step(I)V
  :L12
  .line 227
    invoke-direct { p0 }, Lcom/innioasis/ipp/TipDialog;->paint()V
  :L13
  .line 242
    return-void
.end method
