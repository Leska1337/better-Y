.class public final Lcom/innioasis/ipp/TopBar;
.super Ljava/lang/Object;
.source "TopBar.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/TopBar$Order;,
    Lcom/innioasis/ipp/TopBar$Center;
  }
.end annotation

.field public final static ALL:I = 15

.field public final static BATTERY:I = 8

.field private final static BLACK:I = -15592942

.field public final static BLUETOOTH:I = 4

.field private final static CENTERED:I = 1

.field private final static DARK:I = 1

.field public final static HEADER:I = 32

.field public final static HEADSET:I = 2

.field public final static ICONS:[I

.field public final static KEY_HEADER:Ljava/lang/String; = "bar_header"

.field public final static KEY_ICONS:Ljava/lang/String; = "bar_icons"

.field public final static KEY_STYLE:Ljava/lang/String; = "bar_style"

.field public final static KEY_TEXT:Ljava/lang/String; = "bar_text"

.field private final static LEFT:[I

.field public final static PERCENT:I = 16

.field public final static PLAY:I = 1

.field private final static THEME:I = 2

.field private final static WHITE:I = -1

.method static constructor <clinit>()V
  .registers 5
  .line 57
    const/4 v0, 6
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/TopBar;->ICONS:[I
  .line 134
    const v0, 2131362327
    const v1, 2131362516
    const v2, 2131362295
    const v3, 2131362072
    const v4, 2131361900
    filled-new-array { v2, v3, v4, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/TopBar;->LEFT:[I
    return-void
  :L0
  .array-data 4
      32
      1
      2
      4
      8
      16
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 30
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L15 } :L16
  .registers 8
  .line 101
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 103
    check-cast p0, Landroid/app/Activity;
  .line 105
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 106
    if-nez v0, :L1
    return-void
  :L1
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->color(Landroid/content/Context;)I
    move-result v1
  .line 108
    const v2, 2131362410
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 109
    const v3, 2131361895
    invoke-static { v0, v3, v1 }, Lcom/innioasis/ipp/TopBar;->paint(Landroid/view/View;II)V
  .line 110
    const-string v1, "bar_icons"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
  .line 111
    and-int/lit8 v3, v1, 1
    const/4 v4, 0
    const/4 v5, 1
    if-nez v3, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
    const v6, 2131362295
    invoke-static { v0, v6, v3 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 112
    and-int/lit8 v3, v1, 2
    if-nez v3, :L4
    const/4 v3, 1
    goto :L5
  :L4
    const/4 v3, 0
  :L5
    const v6, 2131362072
    invoke-static { v0, v6, v3 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 113
    and-int/lit8 v3, v1, 4
    if-nez v3, :L6
    const/4 v3, 1
    goto :L7
  :L6
    const/4 v3, 0
  :L7
    const v6, 2131361900
    invoke-static { v0, v6, v3 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 114
    and-int/lit8 v1, v1, 8
    if-nez v1, :L8
    const/4 v1, 1
    goto :L9
  :L8
    const/4 v1, 0
  :L9
    const v3, 2131361894
    invoke-static { v0, v3, v1 }, Lcom/innioasis/ipp/TopBar;->fold(Landroid/view/View;IZ)V
  .line 115
    instance-of v1, v0, Landroid/widget/LinearLayout;
    if-eqz v1, :L12
  .line 116
    move-object v1, v0
    check-cast v1, Landroid/widget/LinearLayout;
    const-string v3, "bar_style"
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v3
    if-ne v3, v5, :L10
    goto :L11
  :L10
    const/4 v5, 0
  :L11
    invoke-static { v1, v5 }, Lcom/innioasis/ipp/TopBar;->arrange(Landroid/widget/LinearLayout;Z)V
  :L12
  .line 118
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 119
    if-eqz v0, :L15
  .line 120
    const-string v1, "bar_header"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L13
    goto :L14
  :L13
    const/4 v4, 4
  :L14
    invoke-virtual { v0, v4 }, Landroid/view/View;->setVisibility(I)V
  :L15
  .line 123
    goto :L17
  :L16
  .line 122
    move-exception p0
  :L17
  .line 124
    return-void
.end method

.method private static arrange(Landroid/widget/LinearLayout;Z)V
  .registers 10
  .line 143
    const v0, 2131362410
    invoke-virtual { p0, v0 }, Landroid/widget/LinearLayout;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 145
    instance-of v2, v1, Lcom/innioasis/ipp/TopBar$Order;
    const/4 v3, 0
    const/4 v4, 0
    if-eqz v2, :L0
  .line 146
    check-cast v1, Lcom/innioasis/ipp/TopBar$Order;
  .line 147
    iget-boolean v2, v1, Lcom/innioasis/ipp/TopBar$Order;->centered:Z
    if-ne v2, p1, :L5
    return-void
  :L0
  .line 149
    if-nez p1, :L1
    return-void
  :L1
  .line 150
    new-instance v1, Lcom/innioasis/ipp/TopBar$Order;
    invoke-direct { v1, v3 }, Lcom/innioasis/ipp/TopBar$Order;-><init>(Lcom/innioasis/ipp/TopBar$1;)V
  .line 151
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v2
    new-array v2, v2, [Landroid/view/View;
    iput-object v2, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
  .line 152
    const/4 v2, 0
  :L2
    iget-object v5, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    array-length v5, v5
    if-ge v2, v5, :L3
    iget-object v5, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    invoke-virtual { p0, v2 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v6
    aput-object v6, v5, v2
    add-int/lit8 v2, v2, 1
    goto :L2
  :L3
  .line 153
    new-instance v2, Landroid/view/View;
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-direct { v2, v5 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v2, v1, Lcom/innioasis/ipp/TopBar$Order;->spacer:Landroid/view/View;
  .line 154
    iget-object v2, v1, Lcom/innioasis/ipp/TopBar$Order;->spacer:Landroid/view/View;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v6, 0x3F800000
    invoke-direct { v5, v4, v4, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual { v2, v5 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 155
    invoke-virtual { p0, v0 }, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 156
    if-nez v2, :L4
    return-void
  :L4
  .line 157
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v5
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual { v5 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginStart()I
    move-result v5
    iput v5, v1, Lcom/innioasis/ipp/TopBar$Order;->titleStart:I
  .line 158
    new-instance v5, Lcom/innioasis/ipp/TopBar$Center;
    invoke-direct { v5, v3 }, Lcom/innioasis/ipp/TopBar$Center;-><init>(Lcom/innioasis/ipp/TopBar$1;)V
    invoke-virtual { v2, v5 }, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V
  .line 159
    invoke-virtual { p0, v0, v1 }, Landroid/widget/LinearLayout;->setTag(ILjava/lang/Object;)V
  :L5
  .line 161
    invoke-virtual { p0, v0 }, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 163
    if-eqz p1, :L16
  .line 164
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 165
    const/4 v5, 0
  :L6
    sget-object v6, Lcom/innioasis/ipp/TopBar;->LEFT:[I
    array-length v7, v6
    if-ge v5, v7, :L8
  .line 166
    aget v6, v6, v5
    invoke-virtual { p0, v6 }, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;
    move-result-object v6
  .line 167
    if-eqz v6, :L7
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 165
    add-int/lit8 v5, v5, 1
    goto :L6
  :L8
  .line 169
    nop
  .line 170
    const/4 v5, 0
  :L9
    iget-object v6, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    array-length v6, v6
    if-ge v5, v6, :L11
  .line 171
    iget-object v6, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    aget-object v6, v6, v5
    invoke-virtual { v6 }, Landroid/view/View;->getId()I
    move-result v6
    const/4 v7, -1
    if-ne v6, v7, :L10
    iget-object v3, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    aget-object v3, v3, v5
  :L10
  .line 170
    add-int/lit8 v5, v5, 1
    goto :L9
  :L11
  .line 173
    if-eqz v3, :L12
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 174
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 175
    iget-object v3, v1, Lcom/innioasis/ipp/TopBar$Order;->spacer:Landroid/view/View;
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 176
    const/4 v3, 0
  :L13
    iget-object v5, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    array-length v5, v5
    if-ge v3, v5, :L15
  .line 177
    iget-object v5, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
    aget-object v5, v5, v3
  .line 178
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L14
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L14
  .line 176
    add-int/lit8 v3, v3, 1
    goto :L13
  :L15
  .line 180
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v3, v3, [Landroid/view/View;
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Landroid/view/View;
  .line 181
    goto :L17
  :L16
  .line 182
    iget-object v2, v1, Lcom/innioasis/ipp/TopBar$Order;->stock:[Landroid/view/View;
  :L17
  .line 184
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 185
    const/4 v3, 0
  :L18
    array-length v5, v2
    if-ge v3, v5, :L19
    aget-object v5, v2, v3
    invoke-virtual { p0, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    add-int/lit8 v3, v3, 1
    goto :L18
  :L19
  .line 186
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;
  .line 187
    if-eqz p1, :L20
    goto :L21
  :L20
    iget v4, v1, Lcom/innioasis/ipp/TopBar$Order;->titleStart:I
  :L21
  .line 188
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
  .line 189
    invoke-virtual { v2, v4 }, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V
  .line 190
    invoke-virtual { v0, v2 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 191
    if-eqz p1, :L22
    iget v2, v1, Lcom/innioasis/ipp/TopBar$Order;->titleStart:I
    goto :L23
  :L22
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->indentOf(Landroid/view/View;)I
    move-result v2
  :L23
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getPaddingTop()I
    move-result v3
  .line 192
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getPaddingRight()I
    move-result v4
    invoke-virtual { p0 }, Landroid/widget/LinearLayout;->getPaddingBottom()I
    move-result v5
  .line 191
    invoke-virtual { p0, v2, v3, v4, v5 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 193
    if-nez p1, :L24
    const/4 p0, 0
    invoke-virtual { v0, p0 }, Landroid/view/View;->setTranslationX(F)V
  :L24
  .line 194
    iput-boolean p1, v1, Lcom/innioasis/ipp/TopBar$Order;->centered:Z
  .line 195
    return-void
.end method

.method private static color(Landroid/content/Context;)I
  .registers 2
  .line 229
    const-string v0, "bar_text"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 230
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, -15592942
    return p0
  :L0
  .line 231
    const/4 v0, 2
    if-ne p0, v0, :L1
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p0
  .line 233
    if-eqz p0, :L1
    return p0
  :L1
  .line 235
    const/4 p0, -1
    return p0
.end method

.method private static fold(Landroid/view/View;IZ)V
  .registers 6
  .line 245
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 246
    if-nez p0, :L0
    return-void
  :L0
  .line 247
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 248
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v0, :L1
    return-void
  :L1
  .line 249
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;
  .line 250
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 252
    instance-of v2, v1, [I
    if-eqz v2, :L2
  .line 253
    check-cast v1, [I
    goto :L3
  :L2
  .line 255
    iget v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result v2
    filled-new-array { v1, v2 }, [I
    move-result-object v1
  .line 256
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 258
    const/4 v0, 0
    if-eqz p2, :L4
    const/4 v2, 0
    goto :L5
  :L4
    aget v2, v1, v0
  :L5
  .line 259
    if-eqz p2, :L6
    goto :L7
  :L6
    const/4 p2, 1
    aget v0, v1, p2
  :L7
  .line 260
    iget p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
    if-ne p2, v2, :L8
    invoke-virtual { p1 }, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I
    move-result p2
    if-ne p2, v0, :L8
    return-void
  :L8
  .line 261
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I
  .line 263
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 264
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V
  .line 265
    invoke-virtual { p0, p1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 266
    return-void
.end method

.method static indent(Landroid/app/Activity;I)V
  .registers 5
  .line 202
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 203
    if-nez p0, :L0
    return-void
  :L0
  .line 204
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 205
    const v0, 2131362410
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v0
  .line 206
    instance-of v1, v0, Lcom/innioasis/ipp/TopBar$Order;
    if-eqz v1, :L1
    check-cast v0, Lcom/innioasis/ipp/TopBar$Order;
    iget-boolean v0, v0, Lcom/innioasis/ipp/TopBar$Order;->centered:Z
    if-eqz v0, :L1
    return-void
  :L1
  .line 207
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingLeft()I
    move-result v0
    if-ne v0, p1, :L2
    return-void
  :L2
  .line 208
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingRight()I
    move-result v1
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingBottom()I
    move-result v2
    invoke-virtual { p0, p1, v0, v1, v2 }, Landroid/view/View;->setPadding(IIII)V
  .line 209
    return-void
.end method

.method private static indentOf(Landroid/view/View;)I
  .registers 2
  .line 212
    const v0, 2131362408
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object p0
  .line 213
    instance-of v0, p0, Ljava/lang/Integer;
    if-eqz v0, :L0
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static mask(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 61
    const-string v0, "bar_icons"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    and-int/lit8 v0, v0, 15
  .line 62
    const-string v1, "bar_header"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    or-int/lit8 v0, v0, 32
  :L0
  .line 64
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getBatteryPercentage()Z
    move-result p0
  :L1
    if-eqz p0, :L2
    or-int/lit8 p0, v0, 16
    move v0, p0
  :L2
  .line 66
    goto :L4
  :L3
  .line 65
    move-exception p0
  :L4
  .line 67
    return v0
.end method

.method private static paint(Landroid/view/View;II)V
  .registers 3
  .line 239
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 240
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 241
    return-void
.end method

.method public static percent(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .registers 3
  .line 274
    if-nez p0, :L0
    return-void
  :L0
  .line 275
    if-eqz p1, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-static { v0, p1 }, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 276
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 277
    return-void
.end method

.method public static save(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L2 .. :L5 } :L6
  .registers 6
  .line 72
    and-int/lit8 v0, p1, 15
    const-string v1, "bar_icons"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 73
    and-int/lit8 v0, p1, 32
    const/4 v1, 1
    const/4 v2, 0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    const-string v3, "bar_header"
    invoke-static { p0, v3, v0 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L2
  .line 75
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    and-int/lit8 p1, p1, 16
    if-eqz p1, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setBatteryPercentage(Z)V
  .line 76
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->updateBatteryPercentageBase()V
  :L5
  .line 78
    goto :L7
  :L6
  .line 77
    move-exception p1
  :L7
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/TopBar;->apply(Ljava/lang/Object;)V
  .line 80
    return-void
.end method

.method public static settingsRows(Lcom/innioasis/y1/activity/SettingActivity;Ljava/util/List;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 85
    const v0, 2131820923
  :L0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 86
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L1
    if-ltz v0, :L3
  .line 87
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
  .line 86
    add-int/lit8 v0, v0, -1
    goto :L1
  :L3
  .line 90
    goto :L5
  :L4
  .line 89
    move-exception p0
  :L5
  .line 91
    return-void
.end method
