.class public final Lcom/innioasis/ipp/BackupDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "BackupDialog.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BackupDialog$Go;,
    Lcom/innioasis/ipp/BackupDialog$Paint;,
    Lcom/innioasis/ipp/BackupDialog$Repaint;
  }
.end annotation

.field private final static BOX:I = -7564110

.field private final static CORNER:F = 10.0F

.field private final activity:Landroid/app/Activity;

.field private col:Lcom/innioasis/ipp/Column;

.field private final extras:[Ljava/lang/String;

.field private final go:Lcom/innioasis/ipp/BackupDialog$Go;

.field private labels:[Landroid/widget/TextView;

.field private note:Ljava/lang/CharSequence;

.field private repainting:Z

.field private final rows:[Ljava/lang/String;

.field private final title:Ljava/lang/String;

.field private final toggle:Ljava/lang/String;

.field private toggled:Z

.field private values:[Landroid/widget/TextView;

.field private views:[Landroid/view/View;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .registers 13
  .line 60
    const/4 v5, 0
    move-object v0, p0
    move-object v1, p1
    move-object v2, p2
    move-object v3, p3
    move-object v4, p4
    move-object v6, p5
    invoke-direct/range { v0 .. v6 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 61
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .registers 8
  .line 66
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 67
    iput-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 68
    iput-object p2, p0, Lcom/innioasis/ipp/BackupDialog;->title:Ljava/lang/String;
  .line 69
    iput-object p3, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
  .line 70
    iput-object p4, p0, Lcom/innioasis/ipp/BackupDialog;->extras:[Ljava/lang/String;
  .line 71
    iput-object p5, p0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
  .line 72
    iput-object p6, p0, Lcom/innioasis/ipp/BackupDialog;->go:Lcom/innioasis/ipp/BackupDialog$Go;
  .line 73
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/BackupDialog;)Z
  .registers 1
  .line 25
    iget-boolean p0, p0, Lcom/innioasis/ipp/BackupDialog;->repainting:Z
    return p0
.end method

.method static synthetic access$002(Lcom/innioasis/ipp/BackupDialog;Z)Z
  .registers 2
  .line 25
    iput-boolean p1, p0, Lcom/innioasis/ipp/BackupDialog;->repainting:Z
    return p1
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/BackupDialog;)Lcom/innioasis/ipp/Column;
  .registers 1
  .line 25
    iget-object p0, p0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/BackupDialog;I)V
  .registers 2
  .line 25
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->paint(I)V
    return-void
.end method

.method private close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 285
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->getOnBack()Lkotlin/jvm/functions/Function0;
    move-result-object v0
  .line 286
    if-eqz v0, :L1
    invoke-interface { v0 }, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
  :L1
  .line 288
    goto :L3
  :L2
  .line 287
    move-exception v0
  :L3
  .line 289
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->dismiss()V
  .line 290
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 170
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private move(I)V
  .registers 3
  .line 268
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Column;->step(I)V
  .line 269
    return-void
.end method

.method private paint(I)V
  .registers 8
  .line 220
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L0
    return-void
  :L0
  .line 221
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    const/4 v1, 0
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 222
    iget-object v2, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    if-eqz v0, :L3
  .line 223
    const v3, 2131100253
    goto :L4
  :L3
    const v3, 2131100267
  :L4
  .line 222
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 227
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Column;->barred()Z
    move-result v3
    if-nez v3, :L7
  .line 228
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v3, v3, p1
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 229
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v4, v4, p1
  .line 230
    const v5, 2131231051
    if-eqz v0, :L5
    const v1, 2131231051
  :L5
  .line 229
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 231
    if-eqz v0, :L6
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    if-nez v1, :L6
  .line 232
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1, v5 }, Landroid/view/View;->setBackgroundResource(I)V
  :L6
  .line 234
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-static { v1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L7
  .line 236
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 237
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
    aget-object p1, v3, p1
    invoke-virtual { v1, p1, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 238
    return-void
.end method

.method private row(I)Landroid/view/View;
  .registers 9
  .line 182
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 183
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;
    const/4 v2, -1
    const/4 v3, -2
    invoke-direct { v1, v2, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 184
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 185
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 186
    const/4 v2, 5
    const/4 v4, 3
    invoke-virtual { v0, v2, v4, v2, v4 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 187
    const-string v2, "ipp_flat"
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 189
    new-instance v2, Landroid/widget/TextView;
    iget-object v4, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v4 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 190
    const/high16 v4, 0x41600000
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 191
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 192
    const/4 v4, 2
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 193
    const v5, 2131362459
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setId(I)V
  .line 194
    iget-object v5, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v6, v5
    if-ge p1, v6, :L0
    aget-object v5, v5, p1
    goto :L1
  :L0
    iget-object v5, p0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
  :L1
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 195
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v1, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 196
    const/high16 v6, 0x3F800000
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 197
    invoke-virtual { v0, v2, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 199
    new-instance v5, Landroid/widget/TextView;
    iget-object v6, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v5, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 200
    const/high16 v6, 0x41400000
    invoke-virtual { v5, v6 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 201
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v6
    invoke-virtual { v5, v6 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 202
    const v6, 8388613
    invoke-virtual { v5, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 203
    const/4 v6, 4
    invoke-virtual { v5, v6, v1, v4, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 204
    const/4 v1, 1
    invoke-virtual { v5, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 205
    const v1, 2131362437
    invoke-virtual { v5, v1 }, Landroid/widget/TextView;->setId(I)V
  .line 206
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v1, v1
    if-lt p1, v1, :L4
  .line 207
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    iget-boolean v4, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    if-eqz v4, :L2
    const v4, 2131821018
    goto :L3
  :L2
    const v4, 2131821019
  :L3
    invoke-virtual { v1, v4 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v5, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L4
  .line 209
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->extras:[Ljava/lang/String;
    if-eqz v1, :L5
    array-length v4, v1
    if-ge p1, v4, :L5
    aget-object v1, v1, p1
    if-nez v1, :L6
  :L5
    const-string v1, ""
  :L6
    invoke-virtual { v5, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 211
    invoke-virtual { v0, v5, v3, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 213
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    aput-object v0, v1, p1
  .line 214
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
    aput-object v2, v1, p1
  .line 215
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
    aput-object v5, v1, p1
  .line 216
    return-object v0
.end method

.method private take()V
  .registers 4
  .line 273
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
  .line 274
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v1, v1
    if-lt v0, v1, :L2
  .line 275
    iget-boolean v1, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    xor-int/lit8 v1, v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
  .line 276
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
  .line 277
    return-void
  :L2
  .line 279
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->dismiss()V
  .line 280
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog;->go:Lcom/innioasis/ipp/BackupDialog$Go;
    if-eqz v1, :L3
    iget-boolean v2, p0, Lcom/innioasis/ipp/BackupDialog;->toggled:Z
    invoke-virtual { v1, v0, v2 }, Lcom/innioasis/ipp/BackupDialog$Go;->go(IZ)V
  :L3
  .line 281
    return-void
.end method

.method public dismiss()V
  .registers 2
  .line 146
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 147
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseDialog;->dismiss()V
  .line 148
    return-void
.end method

.method public longDown(II)V
  .registers 4
  .line 257
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v0
    if-ne p1, v0, :L0
    const/4 p1, 3
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    instance-of p2, p1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p2, :L0
  .line 259
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseActivity;->askShutdown()V
  :L0
  .line 261
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 265
    return-void
.end method

.method public note(Ljava/lang/CharSequence;)Lcom/innioasis/ipp/BackupDialog;
  .registers 2
  .line 77
    iput-object p1, p0, Lcom/innioasis/ipp/BackupDialog;->note:Ljava/lang/CharSequence;
  .line 78
    return-object p0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 19
  .line 83
    move-object/from16 v0, p0
    invoke-super/range { p0 .. p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 85
    iget-object v1, v0, Lcom/innioasis/ipp/BackupDialog;->rows:[Ljava/lang/String;
    array-length v1, v1
    iget-object v2, v0, Lcom/innioasis/ipp/BackupDialog;->toggle:Ljava/lang/String;
    const/4 v3, 1
    const/4 v4, 0
    if-eqz v2, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    add-int/2addr v1, v2
  .line 86
    new-array v2, v1, [Landroid/view/View;
    iput-object v2, v0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
  .line 87
    new-array v2, v1, [Landroid/widget/TextView;
    iput-object v2, v0, Lcom/innioasis/ipp/BackupDialog;->labels:[Landroid/widget/TextView;
  .line 88
    new-array v2, v1, [Landroid/widget/TextView;
    iput-object v2, v0, Lcom/innioasis/ipp/BackupDialog;->values:[Landroid/widget/TextView;
  .line 90
    new-instance v2, Landroid/widget/LinearLayout;
    iget-object v5, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v5 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 91
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 92
    const/16 v3, 8
    const/4 v5, 6
    invoke-virtual { v2, v3, v5, v3, v5 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 93
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v6 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v6
  .line 94
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v7 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 95
    const/high16 v8, 0x41200000
    invoke-virtual { v7, v8 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 96
    if-nez v6, :L2
    const v6, -7564110
    goto :L3
  :L2
    invoke-virtual { v6 }, Ljava/lang/Integer;->intValue()I
    move-result v6
  :L3
    invoke-virtual { v7, v6 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 97
    invoke-virtual { v2, v7 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 99
    new-instance v6, Landroid/widget/TextView;
    iget-object v7, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v6, v7 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 100
    const/high16 v7, 0x41700000
    invoke-virtual { v6, v7 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 101
    invoke-static { }, Lcom/innioasis/ipp/BackupDialog;->font()Landroid/graphics/Typeface;
    move-result-object v7
    invoke-virtual { v6, v7 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 102
    const/16 v7, 17
    invoke-virtual { v6, v7 }, Landroid/widget/TextView;->setGravity(I)V
  .line 103
    const/4 v8, 2
    const/4 v9, 4
    invoke-virtual { v6, v9, v8, v9, v5 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 104
    iget-object v8, v0, Lcom/innioasis/ipp/BackupDialog;->title:Ljava/lang/String;
    invoke-virtual { v6, v8 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 105
    sget-object v8, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v9, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 106
    invoke-virtual { v9 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    const v10, 2131100267
    invoke-virtual { v9, v10 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v9
  .line 105
    invoke-virtual { v8, v6, v9, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 107
    const/4 v8, -1
    const/4 v9, -2
    invoke-virtual { v2, v6, v8, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 109
    iget-object v6, v0, Lcom/innioasis/ipp/BackupDialog;->note:Ljava/lang/CharSequence;
    if-eqz v6, :L4
  .line 110
    new-instance v6, Landroid/widget/TextView;
    iget-object v11, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-direct { v6, v11 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 111
    const/high16 v11, 0x41480000
    invoke-virtual { v6, v11 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 112
    sget-object v11, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v6, v11 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 113
    invoke-virtual { v6, v5, v4, v5, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 114
    iget-object v3, v0, Lcom/innioasis/ipp/BackupDialog;->note:Ljava/lang/CharSequence;
    invoke-virtual { v6, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 115
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 116
    invoke-virtual { v5 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5, v10 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 115
    invoke-virtual { v3, v6, v5, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 117
    invoke-virtual { v2, v6, v8, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  :L4
  .line 120
    const/4 v3, 0
  :L5
    if-ge v3, v1, :L6
    invoke-direct { v0, v3 }, Lcom/innioasis/ipp/BackupDialog;->row(I)Landroid/view/View;
    add-int/lit8 v3, v3, 1
    goto :L5
  :L6
  .line 121
    new-instance v1, Lcom/innioasis/ipp/Column;
    iget-object v3, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    iget-object v5, v0, Lcom/innioasis/ipp/BackupDialog;->views:[Landroid/view/View;
    new-instance v6, Lcom/innioasis/ipp/BackupDialog$Paint;
    invoke-direct { v6, v0 }, Lcom/innioasis/ipp/BackupDialog$Paint;-><init>(Lcom/innioasis/ipp/BackupDialog;)V
    invoke-direct { v1, v3, v5, v6 }, Lcom/innioasis/ipp/Column;-><init>(Landroid/content/Context;[Landroid/view/View;Lcom/innioasis/ipp/Column$Painter;)V
    iput-object v1, v0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
  .line 122
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Column;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
    invoke-virtual { v2, v1, v8, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 123
    iget-object v11, v0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    iget-object v12, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    const/4 v13, 1
    const v14, 2131231051
  .line 124
    invoke-virtual { v12 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v3, 2131100253
    invoke-virtual { v1, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v15
    iget-object v1, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
  .line 125
    invoke-virtual { v1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1, v10 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v16
  .line 123
    invoke-virtual/range { v11 .. v16 }, Lcom/innioasis/ipp/Column;->bar(Landroid/app/Activity;ZIII)V
  .line 127
    invoke-virtual { v0, v2 }, Lcom/innioasis/ipp/BackupDialog;->setContentView(Landroid/view/View;)V
  .line 129
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/ipp/BackupDialog;->getWindow()Landroid/view/Window;
    move-result-object v1
  .line 130
    if-eqz v1, :L7
  .line 131
    invoke-virtual { v1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v2
  .line 132
    iget-object v3, v0, Lcom/innioasis/ipp/BackupDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v3 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v5, 2131165784
    invoke-virtual { v3, v5 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v3
    const v5, 1071225242
    mul-float v3, v3, v5
    float-to-int v3, v3
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 133
    iput v7, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 134
    invoke-virtual { v1, v2 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  .line 136
    const/16 v2, 128
    invoke-virtual { v1, v2 }, Landroid/view/Window;->addFlags(I)V
  :L7
  .line 139
    iget-object v1, v0, Lcom/innioasis/ipp/BackupDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1, v4 }, Lcom/innioasis/ipp/Column;->set(I)V
  .line 141
    new-instance v1, Lcom/innioasis/ipp/BackupDialog$Repaint;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/BackupDialog$Repaint;-><init>(Lcom/innioasis/ipp/BackupDialog;)V
    invoke-static { v1 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 142
    return-void
.end method

.method public shortUp(I)V
  .registers 4
  .line 242
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 243
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L4
  :L0
  .line 245
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L1
    goto :L3
  :L1
  .line 247
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L2
  .line 248
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->take()V
    goto :L5
  :L2
  .line 249
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L5
  .line 250
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog;->close()V
    goto :L5
  :L3
  .line 246
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->move(I)V
    goto :L5
  :L4
  .line 244
    const/4 p1, -1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/BackupDialog;->move(I)V
  :L5
  .line 252
    return-void
.end method
