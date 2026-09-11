.class public final Lcom/innioasis/y1/activity/IppUsbActivity;
.super Landroid/app/Activity;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;,
    Lcom/innioasis/y1/activity/IppUsbActivity$Plug;,
    Lcom/innioasis/y1/activity/IppUsbActivity$Media;,
    Lcom/innioasis/y1/activity/IppUsbActivity$Switch;,
    Lcom/innioasis/y1/activity/IppUsbActivity$Settle;
  }
.end annotation

.field private final static MENU_BG:I = -7564110

.field private final static PRE_MOUNT:Ljava/lang/String; = "com.innioasis.y1.PRE_MOUNT_SDCARD"

.field private final static PRE_UNMOUNT:Ljava/lang/String; = "com.innioasis.y1.PRE_UNMOUNT_SDCARD"

.field private final static SWITCH_TIMEOUT_MS:I = 20000

.field private final static USB_STATE:Ljava/lang/String; = "android.hardware.usb.action.USB_STATE"

.field private banner:Landroid/widget/TextView;

.field private busy:Z

.field private button:Landroid/widget/TextView;

.field private cleanDown:Z

.field private final giveUp:Ljava/lang/Runnable;

.field private media:Lcom/innioasis/y1/activity/IppUsbActivity$Media;

.field private message:Landroid/widget/TextView;

.field private plug:Lcom/innioasis/y1/activity/IppUsbActivity$Plug;

.field private progress:Landroid/widget/ProgressBar;

.field private shared:Z

.field private target:Z

.field private ui:Landroid/os/Handler;

.method public constructor <init>()V
  .registers 2
  .line 47
    invoke-direct { p0 }, Landroid/app/Activity;-><init>()V
  .line 66
    new-instance v0, Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;-><init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->giveUp:Ljava/lang/Runnable;
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppUsbActivity;)Landroid/os/Handler;
  .registers 1
  .line 47
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method private build()V
  .registers 17
  .line 116
    move-object/from16 v0, p0
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->menuBackground()I
    move-result v1
  .line 117
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->menuText()I
    move-result v2
  .line 118
    const/high16 v3, 0xFF000000
    or-int/2addr v3, v1
  .line 120
    new-instance v4, Landroid/widget/FrameLayout;
    invoke-direct { v4, v0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 121
    new-instance v5, Landroid/widget/ImageView;
    invoke-direct { v5, v0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 122
    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v5, v6 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 123
    sget-object v6, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v6 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v6
  .line 124
    if-eqz v6, :L0
    invoke-virtual { v5, v6 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L0
  .line 125
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v7, -1
    invoke-direct { v6, v7, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v4, v5, v6 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 126
    new-instance v5, Landroid/view/View;
    invoke-direct { v5, v0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 129
    const v6, 16777215
    and-int/2addr v1, v6
    const v6, 9213106
    if-ne v1, v6, :L1
    const/high16 v6, 0x4D000000
    goto :L2
  :L1
    const/high16 v6, 0x80000000
  :L2
  .line 130
    or-int/2addr v1, v6
    invoke-virtual { v5, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 131
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v1, v7, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v4, v5, v1 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 133
    new-instance v1, Landroid/widget/RelativeLayout;
    invoke-direct { v1, v0 }, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V
  .line 134
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, v7, v7 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v4, v1, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 136
    const/16 v5, 20
    invoke-direct { v0, v5, v2 }, Lcom/innioasis/y1/activity/IppUsbActivity;->text(II)Landroid/widget/TextView;
    move-result-object v6
  .line 137
    const/4 v8, 1
    invoke-virtual { v6, v8 }, Landroid/widget/TextView;->setId(I)V
  .line 138
    const v9, 2131821128
    invoke-virtual { v6, v9 }, Landroid/widget/TextView;->setText(I)V
  .line 139
    const/4 v9, 6
    invoke-direct { v0, v9 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v9
    const/4 v10, 0
    invoke-virtual { v6, v9, v10, v10, v10 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 140
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v11, -2
    invoke-direct { v9, v7, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 141
    const/16 v12, 10
    invoke-virtual { v9, v12 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
  .line 142
    invoke-virtual { v1, v6, v9 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 144
    new-instance v6, Landroid/widget/ImageView;
    invoke-direct { v6, v0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 145
    const/4 v9, 2
    invoke-virtual { v6, v9 }, Landroid/widget/ImageView;->setId(I)V
  .line 146
    const v12, 2131624022
    invoke-virtual { v6, v12 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 147
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 148
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v12, v11, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 149
    const/4 v13, 3
    invoke-virtual { v12, v13, v8 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V
  .line 150
    const/16 v14, 14
    invoke-virtual { v12, v14 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
  .line 151
    invoke-virtual { v1, v6, v12 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 153
    const/16 v6, 24
    invoke-direct { v0, v6, v2 }, Lcom/innioasis/y1/activity/IppUsbActivity;->text(II)Landroid/widget/TextView;
    move-result-object v6
    iput-object v6, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->banner:Landroid/widget/TextView;
  .line 154
    invoke-virtual { v6, v13 }, Landroid/widget/TextView;->setId(I)V
  .line 155
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->banner:Landroid/widget/TextView;
    const/16 v12, 17
    invoke-virtual { v6, v12 }, Landroid/widget/TextView;->setGravity(I)V
  .line 156
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v6, v7, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 157
    invoke-virtual { v6, v13, v9 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V
  .line 158
    iget-object v15, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->banner:Landroid/widget/TextView;
    invoke-virtual { v1, v15, v6 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 160
    const/16 v6, 16
    invoke-direct { v0, v6, v2 }, Lcom/innioasis/y1/activity/IppUsbActivity;->text(II)Landroid/widget/TextView;
    move-result-object v15
    iput-object v15, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->message:Landroid/widget/TextView;
  .line 161
    invoke-virtual { v15, v12 }, Landroid/widget/TextView;->setGravity(I)V
  .line 162
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->message:Landroid/widget/TextView;
    const/16 v15, 30
    invoke-direct { v0, v15 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v8
    invoke-direct { v0, v15 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v15
    invoke-virtual { v12, v8, v10, v15, v10 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 163
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v8, v7, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 164
    invoke-virtual { v8, v13, v13 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V
  .line 165
    invoke-direct { v0, v9 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v9
    iput v9, v8, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I
  .line 166
    iget-object v9, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->message:Landroid/widget/TextView;
    invoke-virtual { v1, v9, v8 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 168
    new-instance v8, Landroid/widget/RelativeLayout;
    invoke-direct { v8, v0 }, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V
  .line 169
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v9, v11, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 170
    const/16 v10, 12
    invoke-virtual { v9, v10 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
  .line 171
    invoke-virtual { v9, v14 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
  .line 172
    invoke-direct { v0, v6 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v6
    iput v6, v9, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I
  .line 173
    invoke-virtual { v1, v8, v9 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 175
    invoke-direct { v0, v5, v3 }, Lcom/innioasis/y1/activity/IppUsbActivity;->text(II)Landroid/widget/TextView;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->button:Landroid/widget/TextView;
  .line 176
    const/16 v3, 18
    invoke-direct { v0, v3 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v5
    const/4 v6, 4
    invoke-direct { v0, v6 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v9
    invoke-direct { v0, v3 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v3
    invoke-direct { v0, v6 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v6
    invoke-virtual { v1, v5, v9, v3, v6 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 177
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 178
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 179
    const/16 v3, 27
    invoke-direct { v0, v3 }, Lcom/innioasis/y1/activity/IppUsbActivity;->dp(I)I
    move-result v3
    int-to-float v3, v3
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 180
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->button:Landroid/widget/TextView;
    invoke-virtual { v3, v1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 181
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->button:Landroid/widget/TextView;
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v3, v11, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v1, v3 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 183
    new-instance v1, Landroid/widget/ProgressBar;
    invoke-direct { v1, v0 }, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V
    iput-object v1, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->progress:Landroid/widget/ProgressBar;
  .line 184
    const/4 v3, 1
    invoke-virtual { v1, v3 }, Landroid/widget/ProgressBar;->setIndeterminate(Z)V
  .line 185
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->progress:Landroid/widget/ProgressBar;
    invoke-virtual { v1 }, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 186
    if-eqz v1, :L3
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v1, v2, v3 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L3
  .line 187
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct { v1, v11, v11 }, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V
  .line 188
    const/16 v2, 13
    invoke-virtual { v1, v2 }, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
  .line 189
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppUsbActivity;->progress:Landroid/widget/ProgressBar;
    invoke-virtual { v8, v2, v1 }, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 191
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { v1, v7, v7 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v4, v1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 192
    return-void
.end method

.method private dp(I)I
  .registers 3
  .line 292
    int-to-float p1, p1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    mul-float p1, p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    return p1
.end method

.method private menuBackground()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 272
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 273
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    return v0
  :L2
  .line 276
    goto :L4
  :L3
  .line 274
    move-exception v0
  :L4
  .line 277
    const v0, -7564110
    return v0
.end method

.method private menuText()I
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 283
    const/4 v0, -1
  :L0
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 284
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v3, 0
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 285
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
  :L1
    return v0
  :L2
  .line 286
    move-exception v1
  .line 287
    return v0
.end method

.method private render()V
  .registers 4
  .line 203
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->banner:Landroid/widget/TextView;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
    if-eqz v1, :L0
    const v1, 2131821132
    goto :L1
  :L0
    const v1, 2131821129
  :L1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(I)V
  .line 204
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->message:Landroid/widget/TextView;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
    if-eqz v1, :L2
    const v1, 2131821133
    goto :L3
  :L2
    const v1, 2131821130
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(I)V
  .line 205
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->button:Landroid/widget/TextView;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
    if-eqz v1, :L4
    const v1, 2131821134
    goto :L5
  :L4
    const v1, 2131821131
  :L5
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(I)V
  .line 206
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->button:Landroid/widget/TextView;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
    const/4 v2, 0
    if-eqz v1, :L6
    const/4 v1, 4
    goto :L7
  :L6
    const/4 v1, 0
  :L7
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 207
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->progress:Landroid/widget/ProgressBar;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
    if-eqz v1, :L8
    goto :L9
  :L8
    const/16 v2, 8
  :L9
    invoke-virtual { v0, v2 }, Landroid/widget/ProgressBar;->setVisibility(I)V
  .line 208
    return-void
.end method

.method private text(II)Landroid/widget/TextView;
  .registers 5
  .line 195
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 196
    const/4 v1, 2
    int-to-float p1, p1
    invoke-virtual { v0, v1, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 197
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 198
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 199
    return-object v0
.end method

.method private toggle()V
  .registers 6
  .line 229
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 230
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
  .line 231
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
    xor-int/2addr v1, v0
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->target:Z
  .line 232
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->render()V
  .line 233
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->ui:Landroid/os/Handler;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->giveUp:Ljava/lang/Runnable;
    const-wide/16 v3, 20000
    invoke-virtual { v1, v2, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 234
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;
    iget-boolean v3, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->target:Z
    invoke-direct { v2, p0, v3 }, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;-><init>(Lcom/innioasis/y1/activity/IppUsbActivity;Z)V
    const-string v3, "ipp-usb-switch"
    invoke-direct { v1, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 235
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 236
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 237
    return-void
.end method

.method private unregister(Landroid/content/BroadcastReceiver;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 109
    if-eqz p1, :L3
  :L0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
    goto :L3
  :L2
  .line 110
    move-exception p1
    goto :L4
  :L3
  .line 112
    nop
  :L4
  .line 113
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
  .registers 5
  .line 212
    invoke-static { p1 }, Lcom/innioasis/ipp/Force;->key(Landroid/view/KeyEvent;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 213
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v0
    const/4 v2, 0
    if-nez v0, :L2
  .line 214
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p1
    if-nez p1, :L1
    const/4 v2, 1
  :L1
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->cleanDown:Z
  .line 215
    return v1
  :L2
  .line 217
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v0
    if-ne v0, v1, :L7
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->cleanDown:Z
    if-nez v0, :L3
    goto :L7
  :L3
  .line 218
    iput-boolean v2, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->cleanDown:Z
  .line 219
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result p1
  .line 220
    const/16 v0, 66
    if-eq p1, v0, :L5
    const/16 v0, 23
    if-ne p1, v0, :L4
    goto :L5
  :L4
  .line 222
    const/4 v0, 4
    if-ne p1, v0, :L6
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
    if-nez p1, :L6
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
    if-nez p1, :L6
  .line 223
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->finish()V
    goto :L6
  :L5
  .line 221
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->toggle()V
  :L6
  .line 225
    return v1
  :L7
  .line 217
    return v1
.end method

.method giveUp()V
  .registers 2
  .line 253
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
  .line 254
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->settle()V
  .line 255
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 4
  .line 75
    invoke-super { p0, p1 }, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
  .line 77
    const/4 p1, 1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->requestWindowFeature(I)Z
  .line 78
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->getWindow()Landroid/view/Window;
    move-result-object p1
    const/16 v0, 1024
    invoke-virtual { p1, v0, v0 }, Landroid/view/Window;->setFlags(II)V
  .line 80
    new-instance p1, Landroid/os/Handler;
    invoke-direct { p1 }, Landroid/os/Handler;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->ui:Landroid/os/Handler;
  .line 81
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->build()V
  .line 82
    new-instance p1, Lcom/innioasis/y1/activity/IppUsbActivity$Plug;
    invoke-direct { p1, p0 }, Lcom/innioasis/y1/activity/IppUsbActivity$Plug;-><init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->plug:Lcom/innioasis/y1/activity/IppUsbActivity$Plug;
  .line 83
    new-instance v0, Landroid/content/IntentFilter;
    const-string v1, "android.hardware.usb.action.USB_STATE"
    invoke-direct { v0, v1 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    move-result-object p1
  .line 84
    if-eqz p1, :L0
    const-string v0, "connected"
    const/4 v1, 0
    invoke-virtual { p1, v0, v1 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p1
    if-nez p1, :L0
  .line 85
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->finish()V
  .line 86
    return-void
  :L0
  .line 88
    new-instance p1, Lcom/innioasis/y1/activity/IppUsbActivity$Media;
    invoke-direct { p1, p0 }, Lcom/innioasis/y1/activity/IppUsbActivity$Media;-><init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->media:Lcom/innioasis/y1/activity/IppUsbActivity$Media;
  .line 89
    new-instance p1, Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.MEDIA_SHARED"
    invoke-direct { p1, v0 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 90
    const-string v0, "android.intent.action.MEDIA_UNSHARED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 91
    const-string v0, "android.intent.action.MEDIA_MOUNTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 92
    const-string v0, "android.intent.action.MEDIA_UNMOUNTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 93
    const-string v0, "file"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V
  .line 94
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->media:Lcom/innioasis/y1/activity/IppUsbActivity$Media;
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 95
    const-string p1, "isUsbMassStorageEnabled"
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->storage(Ljava/lang/String;)Z
    move-result p1
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
  .line 96
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->render()V
  .line 97
    return-void
.end method

.method protected onDestroy()V
  .registers 3
  .line 101
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->giveUp:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 102
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->plug:Lcom/innioasis/y1/activity/IppUsbActivity$Plug;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->unregister(Landroid/content/BroadcastReceiver;)V
  .line 103
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->media:Lcom/innioasis/y1/activity/IppUsbActivity$Media;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->unregister(Landroid/content/BroadcastReceiver;)V
  .line 104
    invoke-super { p0 }, Landroid/app/Activity;->onDestroy()V
  .line 105
    return-void
.end method

.method settle()V
  .registers 3
  .line 244
    const-string v0, "isUsbMassStorageEnabled"
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->storage(Ljava/lang/String;)Z
    move-result v0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->shared:Z
  .line 245
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
    if-eqz v1, :L0
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->target:Z
    if-ne v0, v1, :L0
  .line 246
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->busy:Z
  .line 247
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity;->giveUp:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 249
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->render()V
  :L1
  .line 250
    return-void
.end method

.method storage(Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 260
    const/4 v0, 0
  :L0
    const-string v1, "storage"
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
  .line 261
    invoke-virtual { v1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    new-array v3, v0, [Ljava/lang/Class;
    invoke-virtual { v2, p1, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v2
  .line 262
    new-array v3, v0, [Ljava/lang/Object;
    invoke-virtual { v2, v1, v3 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 263
    instance-of v2, v1, Ljava/lang/Boolean;
    if-eqz v2, :L2
    check-cast v1, Ljava/lang/Boolean;
    invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result p1
  :L1
    if-eqz p1, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 264
    move-exception v1
  .line 265
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v2, " failed"
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    const-string v2, "ippUsb"
    invoke-static { v2, p1, v1 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  .line 266
    return v0
.end method
