.class public final Lcom/innioasis/ipp/BackupDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "BackupDialog.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BackupDialog$Go;,
    Lcom/innioasis/ipp/BackupDialog$Repaint;
  }
.end annotation

.field private final static BOX:I = -7564110

.field private final static CORNER:F = 10.0F

.field private final activity:Landroid/app/Activity;

.field private final extras:[Ljava/lang/String;

.field private final go:Lcom/innioasis/ipp/BackupDialog$Go;

.field private labels:[Landroid/widget/TextView;

.field private repainting:Z

.field private final rows:[Ljava/lang/String;

.field private sel:I

.field private final title:Ljava/lang/String;

.field private final toggle:Ljava/lang/String;

.field private toggled:Z

.field private values:[Landroid/widget/TextView;

.field private views:[Landroid/view/View;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .registers 13
  .line 56
    const/4 v5, 0
    move-object v0, p0
    move-object v1, p1
    move-object v2, p2
    move-object v3, p3
    move-object v4, p4
    move-object v6, p5
    invoke-direct/range { v0 .. v6 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 57
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .registers 8
  .line 62
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 63
    iput-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 64
    iput-object p2, p0, Lcom/innioasis/ipp/BackupDialog;->title:Ljava/lang/String;
  .line 65
    iput-object p3, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
  .line 66
    iput-object p4, p0, Lcom/innioasis/ipp/BackupDialog;->extras:[Ljava/lang/String;
  .line 67
    iput-object p5, p0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
  .line 68
    iput-object p6, p0, Lcom/innioasis/ipp/BackupDialog;->go:Lcom/innioasis/ipp/BackupDialog$Go;
  .line 69
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/BackupDialog;)Z
  .registers 1
  .line 24
    iget-boolean p0, p0, Lcom/innioasis/ipp/BackupDialog;->repainting:Z
    return p0
.end method

.method static synthetic access$002(Lcom/innioasis/ipp/BackupDialog;Z)Z
  .registers 2
  .line 24
    iput-boolean p1, p0, Lcom/innioasis/ipp/BackupDialog;->repainting:Z
    return p1
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/BackupDialog;)V
  .registers 1
  .line 24
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->paintAll()V
    return-void
.end method

.method private close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 254
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->getOnBack()Lkotlin/jvm/functions/Function0;
    move-result-object v0
  .line 255
    if-eqz v0, :L1
    invoke-interface { v0 }, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
  :L1
  .line 257
    goto :L3
  :L2
  .line 256
    move-exception v0
  :L3
  .line 258
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->dismiss()V
  .line 259
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 143
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private move(I)V
  .registers 4
  .line 232
    iget v0, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
  .line 233
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 234
    iget v1, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
    if-ne p1, v1, :L0
    return-void
  :L0
  .line 235
    iput p1, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
  .line 236
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/BackupDialog;->paint(I)V
  .line 237
    iget p1, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->paint(I)V
  .line 238
    return-void
.end method

.method private paint(I)V
  .registers 8
  .line 186
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L0
    return-void
  :L0
  .line 187
    iget v0, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
    const/4 v1, 0
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 188
    iget-object v2, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    if-eqz v0, :L3
  .line 189
    const v3, 2131100253
    goto :L4
  :L3
    const v3, 2131100267
  :L4
  .line 188
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 193
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v3, v3, p1
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 194
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v4, v4, p1
  .line 195
    const v5, 2131231051
    if-eqz v0, :L5
    const v1, 2131231051
  :L5
  .line 194
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 196
    if-eqz v0, :L6
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    if-nez v1, :L6
  .line 197
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1, v5 }, Landroid/view/View;->setBackgroundResource(I)V
  :L6
  .line 199
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-static { v1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 200
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 201
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
    aget-object p1, v3, p1
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 202
    return-void
.end method

.method private paintAll()V
  .registers 3
  .line 182
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L1
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/BackupDialog;->paint(I)V
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 183
    return-void
.end method

.method private row(I)Landroid/view/View;
  .registers 9
  .line 147
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 148
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 149
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 150
    const/4 v2, 5
    const/4 v3, 3
    invoke-virtual { v0, v2, v3, v2, v3 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 151
    const-string v2, "ipp_flat"
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 153
    new-instance v2, Landroid/widget/TextView;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 154
    const/high16 v3, 0x41600000
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 155
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 156
    const/4 v3, 2
    invoke-virtual { v2, v3 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 157
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v5, v4
    if-ge p1, v5, :L0
    aget-object v4, v4, p1
    goto :L1
  :L0
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
  :L1
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 158
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -2
    invoke-direct { v4, v1, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 159
    const/high16 v6, 0x3F800000
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 160
    invoke-virtual { v0, v2, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 162
    new-instance v4, Landroid/widget/TextView;
    iget-object v6, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v4, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 163
    const/high16 v6, 0x41400000
    invoke-virtual { v4, v6 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v6
    invoke-virtual { v4, v6 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 165
    const v6, 8388613
    invoke-virtual { v4, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 166
    const/4 v6, 4
    invoke-virtual { v4, v6, v1, v3, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 167
    const/4 v1, 1
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 168
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v1, v1
    if-lt p1, v1, :L4
  .line 169
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    iget-boolean v3, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    if-eqz v3, :L2
    const v3, 2131821018
    goto :L3
  :L2
    const v3, 2131821019
  :L3
    invoke-virtual { v1, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L4
  .line 171
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->extras:[Ljava/lang/String;
    if-eqz v1, :L5
    array-length v3, v1
    if-ge p1, v3, :L5
    aget-object v1, v1, p1
    if-nez v1, :L6
  :L5
    const-string v1, ""
  :L6
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 173
    invoke-virtual { v0, v4, v5, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 175
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aput-object v0, v1, p1
  .line 176
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
    aput-object v2, v1, p1
  .line 177
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
    aput-object v4, v1, p1
  .line 178
    return-object v0
.end method

.method private take()V
  .registers 4
  .line 242
    iget v0, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
  .line 243
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v1, v1
    if-lt v0, v1, :L2
  .line 244
    iget-boolean v1, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    xor-int/lit8 v1, v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
  .line 245
    iget-object v2, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
    aget-object v0, v2, v0
    iget-object v2, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    if-eqz v1, :L0
    const v1, 2131821018
    goto :L1
  :L0
    const v1, 2131821019
  :L1
    invoke-virtual { v2, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 246
    return-void
  :L2
  .line 248
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->dismiss()V
  .line 249
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->go:Lcom/innioasis/ipp/BackupDialog$Go;
    if-eqz v1, :L3
    iget-boolean v2, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    invoke-virtual { v1, v0, v2 }, Lcom/innioasis/ipp/BackupDialog$Go;->go(IZ)V
  :L3
  .line 250
    return-void
.end method

.method public dismiss()V
  .registers 2
  .line 119
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 120
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseDialog;->dismiss()V
  .line 121
    return-void
.end method

.method public longDown(II)V
  .registers 4
  .line 221
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v0
    if-ne p1, v0, :L0
    const/4 p1, 3
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    instance-of p2, p1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p2, :L0
  .line 223
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseActivity;->askShutdown()V
  :L0
  .line 225
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 229
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 9
  .line 73
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 75
    iget-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length p1, p1
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
    const/4 v1, 1
    const/4 v2, 0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    add-int/2addr p1, v0
  .line 76
    new-array v0, p1, [Landroid/view/View;
    iput-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
  .line 77
    new-array v0, p1, [Landroid/widget/TextView;
    iput-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
  .line 78
    new-array v0, p1, [Landroid/widget/TextView;
    iput-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
  .line 79
    iput v2, p0, Lcom/innioasis/ipp/BackupDialog;->sel:I
  .line 81
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v3 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 82
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 83
    const/16 v1, 8
    const/4 v3, 6
    invoke-virtual { v0, v1, v3, v1, v3 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 84
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v1
  .line 85
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v4 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 86
    const/high16 v5, 0x41200000
    invoke-virtual { v4, v5 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 87
    if-nez v1, :L2
    const v1, -7564110
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L3
    invoke-virtual { v4, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 88
    invoke-virtual { v0, v4 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 90
    new-instance v1, Landroid/widget/TextView;
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v1, v4 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 91
    const/high16 v4, 0x41700000
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 92
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 93
    const/16 v4, 17
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setGravity(I)V
  .line 94
    const/4 v5, 2
    const/4 v6, 4
    invoke-virtual { v1, v6, v5, v6, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 95
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->title:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 96
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 97
    invoke-virtual { v5 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    const v6, 2131100267
    invoke-virtual { v5, v6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 96
    invoke-virtual { v3, v1, v5, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 98
    const/4 v3, -1
    const/4 v5, -2
    invoke-virtual { v0, v1, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 100
    nop
  :L4
    if-ge v2, p1, :L5
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/BackupDialog;->row(I)Landroid/view/View;
    move-result-object v1
    invoke-virtual { v0, v1, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 102
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/BackupDialog;->setContentView(Landroid/view/View;)V
  .line 104
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->getWindow()Landroid/view/Window;
    move-result-object p1
  .line 105
    if-eqz p1, :L6
  .line 106
    invoke-virtual { p1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 107
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131165784
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v1
    const v2, 1071225242
    mul-float v1, v1, v2
    float-to-int v1, v1
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 108
    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 109
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L6
  .line 112
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->paintAll()V
  .line 114
    new-instance p1, Lcom/innioasis/ipp/BackupDialog$Repaint;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/BackupDialog$Repaint;-><init>(Lcom/innioasis/ipp/BackupDialog;)V
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 115
    return-void
.end method

.method public shortUp(I)V
  .registers 4
  .line 206
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 207
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L4
  :L0
  .line 209
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L1
    goto :L3
  :L1
  .line 211
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L2
  .line 212
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->take()V
    goto :L5
  :L2
  .line 213
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L5
  .line 214
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->close()V
    goto :L5
  :L3
  .line 210
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->move(I)V
    goto :L5
  :L4
  .line 208
    const/4 p1, -1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->move(I)V
  :L5
  .line 216
    return-void
.end method
