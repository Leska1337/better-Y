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

.field public final static PERCENT:I = 16

.field public final static PLAY:I = 1

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method static constructor <clinit>()V
  .registers 5
  .line 46
    const/16 v0, 8
    const/16 v1, 16
    const/4 v2, 1
    const/4 v3, 2
    const/4 v4, 4
    filled-new-array { v2, v3, v4, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/TopBar;->ICONS:[I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 6
  .line 88
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 90
    check-cast p0, Landroid/app/Activity;
  .line 92
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 93
    if-nez v0, :L1
    return-void
  :L1
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->color(Landroid/content/Context;)I
    move-result v1
  .line 95
    const v2, 2131362410
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 96
    const v2, 2131361895
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 97
    const-string v1, "bar_icons"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 98
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
  .line 99
    and-int/lit8 v1, p0, 2
    if-nez v1, :L4
    const/4 v1, 1
    goto :L5
  :L4
    const/4 v1, 0
  :L5
    const v4, 2131362072
    invoke-static { v0, v4, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 100
    and-int/lit8 v1, p0, 4
    if-nez v1, :L6
    const/4 v1, 1
    goto :L7
  :L6
    const/4 v1, 0
  :L7
    const v4, 2131361900
    invoke-static { v0, v4, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 101
    and-int/lit8 p0, p0, 8
    if-nez p0, :L8
    const/4 v2, 1
  :L8
    const p0, 2131361894
    invoke-static { v0, p0, v2 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  :L9
  .line 103
    goto :L11
  :L10
  .line 102
    move-exception p0
  :L11
  .line 104
    return-void
.end method

.method private static color(Landroid/content/Context;)I
  .registers 2
  .line 107
    const-string v0, "bar_text"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 108
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 109
    const/4 v0, 2
    if-ne p0, v0, :L1
  .line 110
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 111
    if-eqz p0, :L1
    return p0
  :L1
  .line 113
    const/4 p0, -1
    return p0
.end method

.method private static fold(Landroid/view/View;IZ)V
  .registers 6
  .line 123
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 124
    if-nez p0, :L0
    return-void
  :L0
  .line 125
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 126
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v0, :L1
    return-void
  :L1
  .line 127
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;
  .line 128
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 130
    instance-of v2, v1, [I
    if-eqz v2, :L2
  .line 131
    check-cast v1, [I
    goto :L3
  :L2
  .line 133
    iget v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result v2
    filled-new-array { v1, v2 }, [I
    move-result-object v1
  .line 134
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 136
    const/4 v0, 0
    if-eqz p2, :L4
    const/4 v2, 0
    goto :L5
  :L4
    aget v2, v1, v0
  :L5
  .line 137
    if-eqz p2, :L6
    goto :L7
  :L6
    const/4 p2, 1
    aget v0, v1, p2
  :L7
  .line 138
    iget p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    if-ne p2, v2, :L8
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result p2
    if-ne p2, v0, :L8
    return-void
  :L8
  .line 139
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
  .line 141
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 142
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V
  .line 143
    invoke-virtual { p0, p1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 144
    return-void
.end method

.method public static mask(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 50
    const-string v0, "bar_icons"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    and-int/lit8 p0, p0, 15
  :L0
  .line 52
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getBatteryPercentage()Z
    move-result v0
  :L1
    if-eqz v0, :L2
    or-int/lit8 p0, p0, 16
  :L2
  .line 54
    goto :L4
  :L3
  .line 53
    move-exception v0
  :L4
  .line 55
    return p0
.end method

.method private static paint(Landroid/view/View;II)V
  .registers 3
  .line 117
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 118
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 119
    return-void
.end method

.method public static percent(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .registers 3
  .line 152
    if-nez p0, :L0
    return-void
  :L0
  .line 153
    if-eqz p1, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-static { v0, p1 }, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 154
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 155
    return-void
.end method

.method public static save(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 60
    and-int/lit8 v0, p1, 15
    const-string v1, "bar_icons"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 62
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    and-int/lit8 p1, p1, 16
    if-eqz p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setBatteryPercentage(Z)V
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->updateBatteryPercentageBase()V
  :L3
  .line 65
    goto :L5
  :L4
  .line 64
    move-exception p1
  :L5
  .line 66
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->apply(Ljava/lang/Object;)V
  .line 67
    return-void
.end method

.method public static settingsRows(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 72
    const v0, 2131820923
  :L0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 73
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L1
    if-ltz v0, :L3
  .line 74
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->getTitle()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-interface { p1, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L2
  .line 73
    add-int/lit8 v0, v0, -1
    goto :L1
  :L3
  .line 77
    goto :L5
  :L4
  .line 76
    move-exception p0
  :L5
  .line 78
    return-void
.end method
