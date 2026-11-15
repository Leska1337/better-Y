.class public final Lcom/innioasis/ipp/Backlight;
.super Ljava/lang/Object;
.source "Backlight.java"

.field private final static MAX:I = 255

.field private final static SETTING:Ljava/lang/String; = "screen_brightness"

.field public final static STEP:I = 5

.field private static floor:I

.method static constructor <clinit>()V
  .registers 1
  .line 28
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Backlight;->floor:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static floor()I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 32
    sget v0, Lcom/innioasis/ipp/Backlight;->floor:I
    if-gez v0, :L3
  .line 33
    const/16 v0, 30
    sput v0, Lcom/innioasis/ipp/Backlight;->floor:I
  :L0
  .line 35
    invoke-static { }, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;
    move-result-object v0
  .line 36
    const-string v1, "config_screenBrightnessSettingMinimum"
    const-string v2, "integer"
    const-string v3, "android"
    invoke-virtual { v0, v1, v2, v3 }, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
  .line 37
    if-eqz v1, :L1
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getInteger(I)I
    move-result v0
    const/16 v1, 254
    invoke-static { v1, v0 }, Ljava/lang/Math;->min(II)I
    move-result v0
    const/4 v1, 1
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Backlight;->floor:I
  :L1
  .line 39
    goto :L3
  :L2
  .line 38
    move-exception v0
  :L3
  .line 41
    sget v0, Lcom/innioasis/ipp/Backlight;->floor:I
    return v0
.end method

.method public static mainPct(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 59
    nop
  :L0
  .line 61
    invoke-virtual { p0 }, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    const-string v0, "screen_brightness"
    invoke-static { p0, v0 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    move-result p0
  :L1
  .line 63
    goto :L3
  :L2
  .line 62
    move-exception p0
    const/16 p0, 255
  :L3
  .line 64
    invoke-static { p0 }, Lcom/innioasis/ipp/Backlight;->pct(I)I
    move-result p0
    return p0
.end method

.method public static panel(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L2 } :L3
  .registers 6
  .line 99
    const v0, 2131820924
    const/4 v1, 0
  :L0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L1
    return v1
  :L1
  .line 100
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 101
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
    const v3, 2131230952
    invoke-virtual { v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 102
    iget-object p1, p1, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/Backlight;->mainPct(Landroid/content/Context;)I
    move-result p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "%"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 103
    const/4 p0, 1
    return p0
  :L3
  .line 104
    move-exception p0
  .line 105
    return v1
.end method

.method public static pct(I)I
  .registers 2
  .line 50
    invoke-static { }, Lcom/innioasis/ipp/Backlight;->floor()I
    move-result v0
    sub-int/2addr p0, v0
    int-to-float p0, p0
    const/high16 v0, 0x42C80000
    mul-float p0, p0, v0
    invoke-static { }, Lcom/innioasis/ipp/Backlight;->floor()I
    move-result v0
    rsub-int v0, v0, 255
    int-to-float v0, v0
    div-float/2addr p0, v0
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
    const/16 v0, 100
    invoke-static { v0, p0 }, Ljava/lang/Math;->min(II)I
    move-result p0
    const/4 v0, 0
    invoke-static { v0, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
    return p0
.end method

.method public static raw(I)I
  .registers 3
  .line 45
    const/16 v0, 100
    invoke-static { v0, p0 }, Ljava/lang/Math;->min(II)I
    move-result p0
    const/4 v0, 0
    invoke-static { v0, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/Backlight;->floor()I
    move-result v0
    int-to-float v0, v0
    invoke-static { }, Lcom/innioasis/ipp/Backlight;->floor()I
    move-result v1
    rsub-int v1, v1, 255
    mul-int v1, v1, p0
    int-to-float p0, v1
    const/high16 v1, 0x42C80000
    div-float/2addr p0, v1
    add-float/2addr v0, p0
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
.end method

.method public static screen(Landroid/app/Activity;I)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 81
    const v0, 2131361907
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ProgressBar;
  .line 82
    const v1, 2131361908
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/TextView;
  .line 83
    invoke-static { p0 }, Lcom/innioasis/ipp/Backlight;->mainPct(Landroid/content/Context;)I
    move-result v2
  .line 84
    const/16 v3, 100
    if-eqz p1, :L3
  .line 85
    if-lez p1, :L1
    div-int/lit8 v2, v2, 5
    add-int/lit8 v2, v2, 1
    mul-int/lit8 v2, v2, 5
    goto :L2
  :L1
    add-int/lit8 v2, v2, 5
    add-int/lit8 v2, v2, -1
    div-int/lit8 v2, v2, 5
    add-int/lit8 v2, v2, -1
    mul-int/lit8 v2, v2, 5
  :L2
  .line 86
    invoke-static { v3, v2 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v2, 0
    invoke-static { v2, p1 }, Ljava/lang/Math;->max(II)I
    move-result v2
  .line 87
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Backlight;->setMain(Landroid/content/Context;I)V
  :L3
  .line 89
    invoke-virtual { v0, v3 }, Landroid/widget/ProgressBar;->setMax(I)V
  .line 90
    invoke-virtual { v0, v2 }, Landroid/widget/ProgressBar;->setProgress(I)V
  .line 91
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "%"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L4
  .line 93
    goto :L6
  :L5
  .line 92
    move-exception p0
  :L6
  .line 94
    return-void
.end method

.method private static setMain(Landroid/content/Context;I)V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
  .line 69
    const-string v0, "screen_brightness_mode"
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
  .line 70
    const/4 v1, 0
    invoke-static { p0, v0, v1 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result v2
    const/4 v3, 1
    if-ne v2, v3, :L1
  .line 71
    invoke-static { p0, v0, v1 }, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
  :L1
  .line 73
    const-string v0, "screen_brightness"
    invoke-static { p1 }, Lcom/innioasis/ipp/Backlight;->raw(I)I
    move-result p1
    invoke-static { p0, v0, p1 }, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
  :L2
  .line 75
    goto :L4
  :L3
  .line 74
    move-exception p0
  :L4
  .line 76
    return-void
.end method

.method public static window(I)F
  .registers 2
  .line 55
    invoke-static { p0 }, Lcom/innioasis/ipp/Backlight;->raw(I)I
    move-result p0
    int-to-float p0, p0
    const/high16 v0, 0x437F0000
    div-float/2addr p0, v0
    return p0
.end method
