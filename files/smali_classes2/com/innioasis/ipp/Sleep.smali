.class final Lcom/innioasis/ipp/Sleep;
.super Ljava/lang/Object;
.source "Sleep.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Sleep$Blink;
  }
.end annotation

.field private final static BLINK_MS:J = 400L

.field private final static H:Landroid/os/Handler;

.field private final static ICONS:[I

.field private final static MS:[I

.field private final static SECONDS:[I

.field private static blink:Lcom/innioasis/ipp/Sleep$Blink;

.field private static editing:Lcom/innioasis/y1/activity/SettingActivity;

.field private static val:I

.method static constructor <clinit>()V
  .registers 2
  .line 30
    const/16 v0, 8
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/Sleep;->MS:[I
  .line 31
    new-array v1, v0, [I
    fill-array-data v1, :L1
    sput-object v1, Lcom/innioasis/ipp/Sleep;->SECONDS:[I
  .line 32
    new-array v0, v0, [I
    fill-array-data v0, :L2
    sput-object v0, Lcom/innioasis/ipp/Sleep;->ICONS:[I
  .line 37
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Sleep;->H:Landroid/os/Handler;
    return-void
  :L0
  .array-data 4
      10000
      15000
      30000
      45000
      60000
      120000
      300000
      2147483647
  .end array-data
  :L1
  .array-data 4
      10
      15
      30
      45
      60
      120
      300
      0
  .end array-data
  :L2
  .array-data 4
      2131230986
      2131230988
      2131230989
      2131230991
      2131230992
      2131230987
      2131230990
      0
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Lcom/innioasis/y1/activity/SettingActivity;
  .registers 1
  .line 26
    sget-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    return-object v0
.end method

.method static synthetic access$002(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/activity/SettingActivity;
  .registers 1
  .line 26
    sput-object p0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    return-object p0
.end method

.method static synthetic access$100()Landroid/os/Handler;
  .registers 1
  .line 26
    sget-object v0, Lcom/innioasis/ipp/Sleep;->H:Landroid/os/Handler;
    return-object v0
.end method

.method static confirm(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 4
  .line 75
    sget-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 1
    if-ne v0, p0, :L0
  .line 76
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sleep;->end(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .line 77
    return v1
  :L0
  .line 79
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Sleep;->ours(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
    move-result p1
    const/4 v0, 0
    if-nez p1, :L1
    return v0
  :L1
  .line 80
    sput-object p0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
  .line 81
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->current(Lcom/innioasis/y1/activity/SettingActivity;)I
    move-result p1
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    sput p1, Lcom/innioasis/ipp/Sleep;->val:I
  .line 82
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->show(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 83
    return v1
.end method

.method private static current(Lcom/innioasis/y1/activity/SettingActivity;)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 66
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    const-string v0, "screen_off_timeout"
    invoke-static { p0, v0 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    move-result p0
  .line 67
    const/4 v0, 0
  :L1
    sget-object v1, Lcom/innioasis/ipp/Sleep;->MS:[I
    array-length v2, v1
    if-ge v0, v2, :L4
    aget v1, v1, v0
  :L2
    if-ne v1, p0, :L3
    return v0
  :L3
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 69
    goto :L6
  :L5
  .line 68
    move-exception p0
  :L6
  .line 70
    const/4 p0, -1
    return p0
.end method

.method private static end(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 144
    sget-object v0, Lcom/innioasis/ipp/Sleep;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Sleep;->blink:Lcom/innioasis/ipp/Sleep$Blink;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 145
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
    move-result-object v0
  .line 146
    if-eqz v0, :L0
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L0
  .line 147
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
  .line 148
    if-eqz p1, :L4
  :L1
  .line 150
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p1
    const-string v0, "screen_off_timeout"
    sget-object v1, Lcom/innioasis/ipp/Sleep;->MS:[I
    sget v2, Lcom/innioasis/ipp/Sleep;->val:I
    aget v1, v1, v2
    invoke-static { p1, v0, v1 }, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
  :L2
  .line 152
    goto :L4
  :L3
  .line 151
    move-exception p1
  :L4
  .line 154
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->current(Lcom/innioasis/y1/activity/SettingActivity;)I
    move-result p1
  .line 155
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 156
    if-ltz p1, :L5
    instance-of v1, v0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L5
  .line 157
    move-object v1, v0
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 158
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getMark()I
    move-result v2
  .line 159
    if-ltz v2, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 160
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Sleep;->text(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/activity/SettingActivity$SettingItem;->setText(Ljava/lang/String;)V
  .line 161
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V
  :L5
  .line 164
    const p1, 2131820942
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  .line 165
    return-void
.end method

.method private static icon(I)I
  .registers 2
  .line 59
    sget-object v0, Lcom/innioasis/ipp/Sleep;->ICONS:[I
    aget p0, v0, p0
    if-eqz p0, :L0
    return p0
  :L0
  .line 60
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getLanguage()I
    move-result p0
    if-nez p0, :L1
  .line 61
    const p0, 2131230993
    goto :L2
  :L1
    const p0, 2131230994
  :L2
  .line 60
    return p0
.end method

.method private static info(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
  .registers 4
  .line 54
    sget-object v0, Lcom/innioasis/ipp/Sleep;->SECONDS:[I
    aget v1, v0, p1
    if-nez v1, :L0
    const p1, 2131820941
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L1
  :L0
  .line 55
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    aget p1, v0, p1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const v0, 2131820995
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 54
    return-object p0
.end method

.method private static ours(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 3
  .line 44
    const v0, 2131820942
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static paint(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 5
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 108
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
    sget v3, Lcom/innioasis/ipp/Sleep;->val:I
    invoke-static { v3 }, Lcom/innioasis/ipp/Sleep;->icon(I)I
    move-result v3
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 109
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    sget v1, Lcom/innioasis/ipp/Sleep;->val:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sleep;->info(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 110
    return-void
.end method

.method static panel(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 3
  .line 101
    sget-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-ne v0, p0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Sleep;->ours(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->paint(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 103
    const/4 p0, 1
    return p0
  :L1
  .line 101
    const/4 p0, 0
    return p0
.end method

.method private static rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
  .registers 2
  .line 124
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object v0, v0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->recycler:Landroidx/recyclerview/widget/RecyclerView;
  .line 125
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getMark()I
    move-result p0
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 126
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    const v0, 2131362437
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
  :L1
    return-object p0
.end method

.method private static show(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 5
  .line 113
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->paint(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 114
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->rowText(Lcom/innioasis/y1/activity/SettingActivity;)Landroid/widget/TextView;
    move-result-object v0
  .line 115
    if-nez v0, :L0
    return-void
  :L0
  .line 116
    sget v1, Lcom/innioasis/ipp/Sleep;->val:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sleep;->text(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 117
    sget-object p0, Lcom/innioasis/ipp/Sleep;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Sleep;->blink:Lcom/innioasis/ipp/Sleep$Blink;
    invoke-virtual { p0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 118
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 119
    new-instance v1, Lcom/innioasis/ipp/Sleep$Blink;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Sleep$Blink;-><init>(Landroid/widget/TextView;)V
    sput-object v1, Lcom/innioasis/ipp/Sleep;->blink:Lcom/innioasis/ipp/Sleep$Blink;
  .line 120
    const-wide/16 v2, 400
    invoke-virtual { p0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 121
    return-void
.end method

.method private static text(Lcom/innioasis/y1/activity/SettingActivity;I)Ljava/lang/String;
  .registers 4
  .line 49
    sget-object v0, Lcom/innioasis/ipp/Sleep;->SECONDS:[I
    aget v1, v0, p1
    if-nez v1, :L0
    const p1, 2131820941
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L1
  :L0
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    aget p1, v0, p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "s"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static top(Lcom/innioasis/y1/activity/SettingActivity;)Z
  .registers 3
  .line 94
    sget-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eq v0, p0, :L0
    return v1
  :L0
  .line 95
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Sleep;->end(Lcom/innioasis/y1/activity/SettingActivity;Z)V
  .line 96
    const/4 p0, 1
    return p0
.end method

.method static wheel(Lcom/innioasis/y1/activity/SettingActivity;I)Z
  .registers 4
  .line 87
    sget-object v0, Lcom/innioasis/ipp/Sleep;->editing:Lcom/innioasis/y1/activity/SettingActivity;
    if-eq v0, p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 88
    sget v0, Lcom/innioasis/ipp/Sleep;->val:I
    add-int/2addr v0, p1
    sget-object p1, Lcom/innioasis/ipp/Sleep;->MS:[I
    array-length v1, p1
    rem-int/2addr v0, v1
    array-length v1, p1
    add-int/2addr v0, v1
    array-length p1, p1
    rem-int/2addr v0, p1
    sput v0, Lcom/innioasis/ipp/Sleep;->val:I
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/Sleep;->show(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 90
    const/4 p0, 1
    return p0
.end method
