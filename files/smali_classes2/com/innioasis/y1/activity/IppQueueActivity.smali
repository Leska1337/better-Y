.class public final Lcom/innioasis/y1/activity/IppQueueActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;,
    Lcom/innioasis/y1/activity/IppQueueActivity$Pin;,
    Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;,
    Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;,
    Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;,
    Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;,
    Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;,
    Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;,
    Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;,
    Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;,
    Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  }
.end annotation

.field private final static ACCENT:I = 0

.field private final static BLINK_MS:I = 500

.field private final static CAPTION_PAD:I = 3

.field private final static CAPTION_SP:F = 12.0F

.field private final static COVER_PX:I = 50

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static PLAY_ALPHA:I = 771751936

.field private final static PLAY_ALPHA_BARE:I = 385875968

.field private final static PLAY_NAME_SP:F = 18.0F

.field private final static PLAY_SUB_SP:F = 14.0F

.field private final static RULE_H:I = 2

.field private final static SEP:Ljava/lang/String; = " \u2014 "

.field private adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;

.field private blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;

.field private blinkOn:Z

.field private capPos:[I

.field private coverArt:Landroid/graphics/Bitmap;

.field private coverPath:Ljava/lang/String;

.field private empty:Landroid/widget/TextView;

.field private entCap:[Ljava/lang/String;

.field private entRow:[I

.field private header:Landroid/widget/LinearLayout;

.field private isMultiSelect:Z

.field private labels:[Ljava/lang/String;

.field private list:Landroidx/recyclerview/widget/RecyclerView;

.field private lm:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private final markCache:Ljava/util/HashMap;

.field private final marked:Ljava/util/HashSet;

.field private menuDlg:Lcom/innioasis/music/util/SubMenuDialog;

.field private nowCap:Landroid/view/View;

.field private pinned:Landroid/widget/LinearLayout;

.field private pinnedFirst:Ljava/lang/String;

.field private pinnedShown:Ljava/lang/String;

.field private pinnedText:Landroid/widget/TextView;

.field private playBand:Landroid/widget/LinearLayout;

.field private playBase:I

.field private playCover:Landroid/widget/ImageView;

.field private playExtra:I

.field private playRow:Landroid/widget/LinearLayout;

.field private playSub:Landroid/widget/TextView;

.field private playTag:Landroid/widget/TextView;

.field private playTitle:Landroid/widget/TextView;

.field private posOf:[I

.field private final resolvedByPath:Ljava/util/HashMap;

.field private retheme:Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;

.field private rowH:I

.field private rows:Ljava/util/List;

.field private sel:I

.field private watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;

.method static constructor <clinit>()V
  .registers 1
  .line 66
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 3
  .line 64
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 77
    const/4 v0, 0
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
  .line 78
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
  .line 79
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
  .line 127
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
  .line 133
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
  .line 139
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
  .line 147
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppQueueActivity;)I
  .registers 1
  .line 64
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->washRgb()I
    move-result p0
    return p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    return-object p0
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/view/View;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->nowCap:Landroid/view/View;
    return-object p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBand:Landroid/widget/LinearLayout;
    return-object p0
.end method

.method static synthetic access$400()I
  .registers 1
  .line 64
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->playAlpha()I
    move-result v0
    return v0
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppQueueActivity;)Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    return-object p0
.end method

.method static synthetic access$502(Lcom/innioasis/y1/activity/IppQueueActivity;Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;)Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
  .registers 2
  .line 64
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    return-object p1
.end method

.method static synthetic access$600(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroidx/recyclerview/widget/RecyclerView;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    return-object p0
.end method

.method static synthetic access$700(Lcom/innioasis/y1/activity/IppQueueActivity;)[I
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    return-object p0
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppQueueActivity;)Ljava/util/HashSet;
  .registers 1
  .line 64
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    return-object p0
.end method

.method private addToPlaylist(Ljava/util/UUID;)V
  .registers 6
  .line 1112
    if-nez p1, :L0
    return-void
  :L0
  .line 1113
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1114
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pickedRows()Ljava/util/List;
    move-result-object v1
  .line 1115
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1116
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 1117
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1115
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1119
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1120
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1121
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1122
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;
    invoke-direct { v2, v0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;-><init>(Ljava/util/List;Ljava/util/UUID;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 1123
    return-void
.end method

.method private artistAt(I)Ljava/lang/String;
  .registers 4
  .line 884
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 885
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
    const-string v1, " \u2014 "
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/2addr v0, v1
  .line 886
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-lt v0, v1, :L0
    const-string p1, ""
    goto :L1
  :L0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
  :L1
    return-object p1
.end method

.method private artistsOf(I)Ljava/util/List;
  .registers 2
  .line 1157
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p1
    return-object p1
.end method

.method private band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
  .registers 12
  .line 763
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 764
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->washRgb()I
    move-result v1
  .line 765
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 766
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100252
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
  .line 765
    const/4 v4, 0
    invoke-virtual { v2, v0, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 767
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v2, 16777215
    and-int/2addr v0, v2
  .line 769
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 770
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 771
    const/4 v3, -1
    if-eqz p3, :L0
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object v4
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 772
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 773
    if-eqz p3, :L1
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object p1
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L1
  .line 774
    or-int p1, v1, p5
    invoke-virtual { v2, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 775
    return-object v2
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 817
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 818
    return-void
.end method

.method private buildPlaying()V
  .registers 13
  .line 240
    const v0, 2131820769
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->nowCap:Landroid/view/View;
  .line 241
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v2
    invoke-virtual { v1, v0, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 243
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct { v0, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
  .line 244
    const v1, 2131362353
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setId(I)V
  .line 245
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 246
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 247
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 248
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    const/16 v3, 10
    const/4 v4, 5
    invoke-virtual { v0, v3, v1, v4, v1 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 250
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playCover:Landroid/widget/ImageView;
  .line 251
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v3, 50
    invoke-direct { v0, v3, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 252
    const/16 v3, 8
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 253
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playCover:Landroid/widget/ImageView;
    invoke-virtual { v4, v5, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 255
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
  .line 256
    const v4, 2131362491
    invoke-virtual { v0, v4 }, Landroid/widget/TextView;->setId(I)V
  .line 257
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v4
    invoke-virtual { v0, v4 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 258
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 259
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 260
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 261
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v0, v1, v1, v3, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 262
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    const-string v3, "\u25b6"
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 263
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    const/4 v4, -2
    invoke-virtual { v0, v3, v4, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 266
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
  .line 267
    const v3, 2131362459
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setId(I)V
  .line 268
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    const/high16 v3, 0x41900000
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 269
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 270
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 271
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 272
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    const/4 v3, 1
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 274
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
  .line 275
    const v5, 2131362437
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setId(I)V
  .line 276
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    const/high16 v5, 0x41600000
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 277
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v5, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 278
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 279
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 281
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 283
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct { v0, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 284
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 285
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 286
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -1
    invoke-direct { v3, v5, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v2, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 287
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v5, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v2, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 288
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v1, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 289
    const/high16 v1, 0x3F800000
    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 290
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v0, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 293
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    const/4 v8, -2
    const/4 v9, 0
    const/4 v10, 0
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->playAlpha()I
    move-result v11
    move-object v6, p0
    invoke-direct/range { v6 .. v11 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBand:Landroid/widget/LinearLayout;
  .line 294
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v5, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 295
    return-void
.end method

.method private captionView(Ljava/lang/String;)Landroid/widget/TextView;
  .registers 7
  .line 742
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 743
    const/high16 v1, 0x41400000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 744
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 745
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 746
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 748
    const/4 v2, 3
    const/4 v3, 5
    const/16 v4, 10
    invoke-virtual { v0, v4, v2, v3, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 749
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 750
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 751
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 752
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 753
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 752
    invoke-virtual { p1, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 754
    return-object v0
.end method

.method private cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/Exception; { :L0 .. :L5 } :L6
  .registers 6
  .line 826
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 827
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 828
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 829
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 830
    if-eqz v2, :L2
    const/16 v3, 50
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
    goto :L3
  :L2
    move-object v2, v0
  :L3
  .line 831
    if-nez v2, :L4
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L4
  .line 832
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
  .line 833
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
  :L5
  .line 834
    return-object v2
  :L6
  .line 835
    move-exception p1
  .line 836
    return-object v0
.end method

.method private divider(Ljava/lang/String;)Landroid/view/View;
  .registers 8
  .line 644
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v1
    const/4 v2, -2
    const/high16 v3, 0x59000000
    const/4 v4, 2
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v5
    move-object v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object p1
    return-object p1
.end method

.method private dividerParams()Landroid/widget/LinearLayout$LayoutParams;
  .registers 4
  .line 802
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -1
    const/4 v2, -2
    invoke-direct { v0, v1, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    return-object v0
.end method

.method private endMulti()V
  .registers 2
  .line 1182
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 1183
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
  .line 1184
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1185
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 1186
    return-void
.end method

.method private fillPlaying()V
  .registers 5
  .line 375
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    const/4 v1, 0
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 376
    const/16 v2, 8
    if-eqz v0, :L0
  .line 377
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playCover:Landroid/widget/ImageView;
    invoke-virtual { v3, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 378
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playCover:Landroid/widget/ImageView;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 379
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setVisibility(I)V
    goto :L1
  :L0
  .line 381
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playCover:Landroid/widget/ImageView;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 382
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L1
  .line 384
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistAt(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 386
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v1
    add-int/2addr v0, v1
    const/16 v1, 50
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 387
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBase:I
  .line 388
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
    add-int/2addr v0, v2
    invoke-static { v1, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setHeight(Landroid/view/View;I)Z
  .line 389
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 812
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private highlighted(I)Z
  .registers 3
  .line 559
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L3
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz p1, :L1
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    if-eqz p1, :L0
    goto :L1
  :L0
    const/4 p1, 0
    goto :L2
  :L1
    const/4 p1, 1
  :L2
    return p1
  :L3
  .line 560
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    return p1
.end method

.method private itemRgb()I
  .registers 5
  .line 787
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 788
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 789
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 788
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 790
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    return v0
.end method

.method private label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 859
    if-nez p1, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 860
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 861
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 862
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 863
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 864
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " \u2014 "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
.end method

.method private labelAt(I)Ljava/lang/String;
  .registers 5
  .line 869
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L3
    if-ltz p1, :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 870
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v0, :L1
    array-length v1, v0
    if-ge p1, v1, :L1
    aget-object v0, v0, p1
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 871
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 872
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v1, :L2
    array-length v2, v1
    if-ge p1, v2, :L2
    aput-object v0, v1, p1
  :L2
  .line 873
    return-object v0
  :L3
  .line 869
    const-string p1, ""
    return-object p1
.end method

.method private manualCaption()Ljava/lang/String;
  .registers 5
  .line 842
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualCount()I
    move-result v0
  .line 843
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualShown()I
    move-result v1
  .line 844
    if-gt v0, v1, :L0
    const v0, 2131821078
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    return-object v0
  :L0
  .line 845
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 846
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const/4 v3, 0
    aput-object v1, v2, v3
    const/4 v1, 1
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v1
  .line 845
    const v0, 2131821117
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private mark(Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;)V
  .registers 4
  .line 458
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    iget v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->row:I
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 459
    iget v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->row:I
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v0
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tickMark(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L1
  :L0
    iget v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->row:I
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v0
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->queuedDot(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L1
  .line 460
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->dot:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, v0, :L2
    return-void
  :L2
  .line 461
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->dot:Landroid/widget/ImageView;
    invoke-virtual { v1, v0 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 462
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->dot:Landroid/widget/ImageView;
    invoke-virtual { p1, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 463
    return-void
.end method

.method private markBox(F)I
  .registers 3
  .line 638
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v0
    const v0, 1061997773
    mul-float p1, p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 639
    const/16 v0, 10
    if-ge p1, v0, :L0
    const/16 p1, 10
  :L0
    return p1
.end method

.method private move(IZ)V
  .registers 6
  .line 537
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 538
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    aget v2, v1, p1
  .line 539
    aget v0, v1, v0
  .line 540
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setMark(I)V
  .line 541
    if-eqz p1, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v1, :L2
  :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintHead()V
  :L2
  .line 542
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v1, :L3
  .line 543
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rebind(I)V
  .line 545
    if-eqz p2, :L7
  .line 546
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 547
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 p2, 0
    invoke-virtual { p1, p2, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L7
  :L3
  .line 549
    if-nez p1, :L6
  .line 551
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p2, :L4
    const/4 p2, -1
    goto :L5
  :L4
    move p2, v0
  :L5
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-static { p1, p2, v0, v1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
    goto :L7
  :L6
  .line 553
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-static { p1, v2, v0, p2 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L7
  .line 555
    return-void
.end method

.method private nameAt(I)Ljava/lang/String;
  .registers 4
  .line 878
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 879
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
  .line 880
    if-gtz v0, :L0
    goto :L1
  :L0
    const/4 v1, 0
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
  :L1
    return-object p1
.end method

.method private openAlbum()V
  .registers 2
  .line 1140
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1141
    if-nez v0, :L0
    return-void
  :L0
  .line 1142
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 1143
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1144
    return-void
.end method

.method private openArtist(Ljava/lang/String;)V
  .registers 4
  .line 1148
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1149
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1150
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1151
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startActivity(Landroid/content/Intent;)V
  .line 1152
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1153
    return-void
  :L1
  .line 1148
    return-void
.end method

.method private paintHead()V
  .registers 7
  .line 393
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->highlighted(I)Z
    move-result v1
  .line 394
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
    if-nez v2, :L2
  .line 395
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    const v4, 2131231052
    goto :L1
  :L0
    const/4 v4, 0
  :L1
    invoke-virtual { v2, v3, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L2
  .line 397
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    const/4 v4, -1
    if-eqz v1, :L3
    sget v5, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L4
  :L3
    const/4 v5, -1
  :L4
    invoke-virtual { v2, v3, v5, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 398
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    if-eqz v1, :L5
    sget v5, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v5, -1
  :L6
    invoke-virtual { v2, v3, v5, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 399
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    if-eqz v1, :L7
    sget v4, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
  :L7
    invoke-virtual { v2, v3, v4, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 401
    if-nez v1, :L8
  .line 402
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131100252
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
  .line 403
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTag:Landroid/widget/TextView;
    invoke-virtual { v2, v3, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 404
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-virtual { v2, v3, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 405
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playSub:Landroid/widget/TextView;
    invoke-virtual { v2, v3, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 408
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->nameAt(I)Ljava/lang/String;
    move-result-object v0
  .line 409
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v1, :L9
  .line 410
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
    goto :L10
  :L9
  .line 412
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-static { v1 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  .line 413
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :L10
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playTitle:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L10
  .line 415
    return-void
.end method

.method private pickedRows()Ljava/util/List;
  .registers 4
  .line 1127
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1128
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1129
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1130
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1131
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 1132
    return-object v0
  :L2
  .line 1134
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ltz v1, :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v2, :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1135
    return-object v0
.end method

.method private static playAlpha()I
  .registers 1
  .line 104
    invoke-static { }, Lcom/innioasis/ipp/Theme;->rowsPainted()Z
    move-result v0
    if-eqz v0, :L0
    const/high16 v0, 0x2E000000
    goto :L1
  :L0
    const/high16 v0, 0x17000000
  :L1
    return v0
.end method

.method private static px(FLandroid/util/DisplayMetrics;)I
  .registers 3
  .line 117
    const/4 v0, 2
    invoke-static { v0, p0, p1 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result p0
    const/high16 p1, 0x3FC00000
    mul-float p0, p0, p1
    float-to-int p0, p0
    return p0
.end method

.method private queuedDot(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 10
  .line 569
    nop
  :L0
  .line 571
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  :L1
  .line 573
    goto :L3
  :L2
  .line 572
    move-exception v0
    const/4 v0, 0
  :L3
  .line 574
    const v1, 16777215
    const/high16 v2, 0xFF000000
    if-eqz v0, :L4
  .line 575
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p2
    or-int/2addr p2, v2
    goto :L5
  :L4
  .line 577
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    xor-int/2addr p2, v1
    or-int/2addr p2, v2
  :L5
  .line 579
    xor-int v0, p2, v1
    or-int/2addr v0, v2
  .line 580
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result v1
  .line 582
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "d"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ":"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 583
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 584
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L6
    check-cast v3, Landroid/graphics/Bitmap;
    return-object v3
  :L6
  .line 587
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 588
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 589
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 590
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v5
    invoke-virtual { v3, p1 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 591
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
  .line 592
    const-string v5, "\u2022"
    const/4 v6, 0
    invoke-virtual { v3, v5, v6, v4, p1 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 593
    invoke-virtual { p1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    invoke-virtual { p1 }, Landroid/graphics/Rect;->width()I
    move-result p1
    invoke-static { v4, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 594
    const/4 v4, 3
    if-ge p1, v4, :L7
    const/4 p1, 3
  :L7
  .line 596
    nop
  .line 597
    add-int/lit8 v4, v1, -4
    if-le p1, v4, :L8
    move p1, v4
  :L8
  .line 599
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v1, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 600
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v4 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 601
    int-to-float v1, v1
    const/high16 v6, 0x40000000
    div-float/2addr v1, v6
  .line 602
    int-to-float p1, p1
    div-float/2addr p1, v6
  .line 603
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, v6 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 604
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 605
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 606
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 607
    const/high16 p2, 0x3FC00000
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 608
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 609
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 610
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v2, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 611
    return-object v4
.end method

.method private rebind(I)V
  .registers 5
  .line 520
    if-ltz p1, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    array-length v0, v0
    if-lt p1, v0, :L0
    goto :L2
  :L0
  .line 521
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  .line 522
    if-nez v0, :L1
    return-void
  :L1
  .line 523
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object v0
    invoke-virtual { v1, v0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .line 524
    return-void
  :L2
  .line 520
    return-void
.end method

.method private removePicked()V
  .registers 5
  .line 1094
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1095
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1096
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1097
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1098
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
    goto :L3
  :L2
  .line 1099
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v1, :L3
  .line 1100
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L4
  :L3
  .line 1099
    nop
  :L4
  .line 1102
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L5
    if-ltz v1, :L7
  .line 1103
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 1104
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v3
    if-eqz v3, :L6
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->removeRow(I)V
  :L6
  .line 1102
    add-int/lit8 v1, v1, -1
    goto :L5
  :L7
  .line 1106
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1107
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1108
    return-void
.end method

.method private repaintAll()V
  .registers 2
  .line 528
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintHead()V
  .line 529
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->notifyDataSetChanged()V
  .line 530
    return-void
.end method

.method private resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  :L0
  .line 942
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
  .line 943
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    return-object p1
  :L1
  .line 944
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 945
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 946
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 947
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L3
    check-cast v1, Lcom/innioasis/y1/database/Song;
    return-object v1
  :L3
  .line 948
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 949
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  .line 950
    if-nez v2, :L4
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 951
    if-nez v2, :L5
    return-object p1
  :L5
  .line 952
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 953
    return-object v2
  :L7
  .line 945
    return-object p1
  :L8
  .line 954
    move-exception v0
  .line 955
    return-object p1
.end method

.method static rowHeight(Landroid/widget/TextView;)I
  .registers 2
  .line 807
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    const/high16 v0, 0x3FC00000
    mul-float p0, p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private rule(II)Landroid/view/View;
  .registers 4
  .line 795
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 796
    or-int/2addr p1, p2
    invoke-virtual { v0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 797
    return-object v0
.end method

.method private static setHeight(Landroid/view/View;I)Z
  .registers 5
  .line 718
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 719
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
  .line 720
    if-eqz v1, :L2
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v2, p1, :L1
    goto :L2
  :L1
  .line 721
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 722
    invoke-virtual { p0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 723
    const/4 p0, 1
    return p0
  :L2
  .line 720
    return v0
.end method

.method private setPinned(Ljava/lang/String;)V
  .registers 3
  .line 676
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 677
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getVisibility()I
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 678
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 679
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 680
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 681
    return-void
  :L2
  .line 676
    return-void
.end method

.method private showBlink()V
  .registers 4
  .line 1205
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    goto :L1
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    aget v0, v2, v0
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 1206
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    if-eqz v1, :L2
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Bar;->blink(Landroid/view/View;Z)Z
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 1207
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L3
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintHead()V
    goto :L4
  :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    aget v0, v1, v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rebind(I)V
  :L4
  .line 1208
    return-void
.end method

.method private songAt(I)Lcom/innioasis/y1/database/Song;
  .registers 4
  .line 1162
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    const/4 v1, 0
    if-eqz v0, :L2
    if-ltz p1, :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L2
  :L0
  .line 1163
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 1164
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L1
    return-object v1
  :L2
  .line 1162
    return-object v1
.end method

.method private startMulti()V
  .registers 5
  .line 1168
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1169
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
  .line 1170
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1172
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 1173
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1174
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  .line 1175
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    const-wide/16 v2, 500
    invoke-virtual { v1, v0, v2, v3 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1176
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    aget v0, v0, v1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rebind(I)V
  .line 1177
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->showBlink()V
  .line 1178
    return-void
.end method

.method private stopBlink()V
  .registers 3
  .line 1189
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1190
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-eqz v0, :L1
  .line 1191
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 1192
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  :L1
  .line 1194
    return-void
.end method

.method private static textSize(I)F
  .registers 1
  .line 234
    if-nez p0, :L0
    const/high16 p0, 0x41900000
    goto :L1
  :L0
    const/high16 p0, 0x41800000
  :L1
    return p0
.end method

.method private tickMark(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
  .registers 14
  .line 616
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result p1
  .line 617
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
  .line 618
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "t"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ":"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 619
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 620
    instance-of v2, v1, Landroid/graphics/Bitmap;
    if-eqz v2, :L0
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L0
  .line 622
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 623
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 624
    new-instance v9, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { v9, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 625
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 626
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 627
    int-to-float p1, p1
    const/high16 p2, 0x41800000
    div-float/2addr p1, p2
  .line 628
    const p2, 1075419546
    mul-float p2, p2, p1
  .line 629
    const/high16 v2, 0x3FC00000
    cmpg-float v3, p2, v2
    if-gez v3, :L1
    const/high16 p2, 0x3FC00000
  :L1
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 630
    const/high16 p2, 0x40200000
    mul-float v3, p1, p2
    const/high16 p2, 0x41080000
    mul-float v4, p1, p2
    const/high16 p2, 0x40D00000
    mul-float p2, p2, p1
    const/high16 v2, 0x41480000
    mul-float v10, p1, v2
    move-object v2, v8
    move v5, p2
    move v6, v10
    move-object v7, v9
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 631
    const/high16 v2, 0x41580000
    mul-float v5, p1, v2
    const/high16 v2, 0x40600000
    mul-float v6, p1, v2
    move-object v2, v8
    move v3, p2
    move v4, v10
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 632
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 633
    return-object v1
.end method

.method private static titleLen(Ljava/lang/String;)I
  .registers 2
  .line 891
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 892
    const-string v0, " \u2014 "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  .line 893
    if-gez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
  :L1
    return v0
.end method

.method private static unNamed(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 928
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 930
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 931
    move-exception v0
  .line 932
    return-object p0
.end method

.method private washRgb()I
  .registers 5
  .line 780
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 781
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget v2, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    const/4 v3, 1
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 782
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    return v0
.end method

.method public antiClockwise()V
  .registers 5
  .line 978
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 979
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 980
    nop
  .line 981
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-gt v0, v1, :L3
  .line 982
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-le v1, v3, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    const/4 v3, -1
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Bar;->wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
  .line 983
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    sub-int/2addr v1, v2
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 984
    goto :L4
  :L2
  .line 982
    return-void
  :L3
  .line 986
    add-int/lit8 v1, v0, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const/4 v2, 0
  :L4
  .line 988
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(IZ)V
  .line 989
    return-void
  :L5
  .line 978
    return-void
.end method

.method bindCaption(Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;I)V
  .registers 5
  .line 452
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;->text:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
    aget-object p2, v1, p2
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 453
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;->itemView:Landroid/view/View;
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->washRgb()I
    move-result p2
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v0
    or-int/2addr p2, v0
    invoke-virtual { p1, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 454
    return-void
.end method

.method bindRow(Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;I)V
  .registers 8
  .line 419
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    aget v0, v0, p2
  .line 420
    iput v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->row:I
  .line 421
    iget-object v1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->line:Landroid/widget/LinearLayout;
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowH:I
    if-lez v2, :L0
    goto :L1
  :L0
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v2
  :L1
    invoke-static { v1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setHeight(Landroid/view/View;I)Z
  .line 423
    const/4 v1, 1
    add-int/2addr p2, v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    array-length v3, v2
    const/4 v4, 0
    if-ge p2, v3, :L2
    aget p2, v2, p2
    if-gez p2, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 424
    iget-object p2, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->hair:Landroid/view/View;
    if-eqz v1, :L4
    const/16 v1, 8
    goto :L5
  :L4
    const/4 v1, 0
  :L5
    invoke-virtual { p2, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 426
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->highlighted(I)Z
    move-result p2
  .line 427
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v1
    if-nez v1, :L7
  .line 428
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->line:Landroid/widget/LinearLayout;
    if-eqz p2, :L6
    const v4, 2131231052
  :L6
    invoke-virtual { v1, v2, v4, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L7
  .line 430
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    if-eqz p2, :L8
    sget v3, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L9
  :L8
    const/4 v3, -1
  :L9
    invoke-virtual { v1, v2, v3, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 434
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p2
  .line 435
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne v0, v1, :L10
  .line 436
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
    goto :L11
  :L10
  .line 438
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  .line 439
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-virtual { p2, v0 }, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z
    move-result v0
    if-nez v0, :L11
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L11
  .line 442
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;
    move-result-object v0
  .line 443
    instance-of v1, v0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    if-eqz v1, :L12
    check-cast v0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    iget-object v0, v0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;->plain:Ljava/lang/String;
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L13
  :L12
  .line 444
    iget-object v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    invoke-static { p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v2
    invoke-direct { v1, p2, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V
  :L13
  .line 446
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->mark(Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;)V
  .line 447
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->itemView:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 448
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 1197
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1198
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    xor-int/lit8 v0, v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1199
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->showBlink()V
  .line 1200
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    const-wide/16 v2, 500
    invoke-virtual { v0, v1, v2, v3 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 1201
    return-void
  :L1
  .line 1197
    return-void
.end method

.method public clockwise()V
  .registers 5
  .line 961
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L6
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L6
  :L0
  .line 962
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 963
    nop
  .line 964
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    if-lt v0, v1, :L4
  .line 965
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->wraps(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-nez v1, :L1
    return-void
  :L1
  .line 966
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 967
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L3
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne v1, v0, :L2
    goto :L3
  :L2
  .line 968
    goto :L5
  :L3
  .line 967
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    return-void
  :L4
  .line 970
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/2addr v1, v2
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const/4 v2, 0
  :L5
  .line 972
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(IZ)V
  .line 973
    return-void
  :L6
  .line 961
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 997
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 998
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz v0, :L3
  .line 999
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L1
    return-void
  :L1
  .line 1000
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 1001
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L2
  .line 1002
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    aget v0, v0, v1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rebind(I)V
  .line 1003
    return-void
  :L3
  .line 1005
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L4
  .line 1006
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1007
    return-void
  :L4
  .line 1009
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->playRow(I)V
  .line 1010
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1011
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1012
    return-void
  :L5
  .line 997
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1212
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1214
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    if-eqz p1, :L0
  .line 1215
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1216
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1217
    return-void
  :L0
  .line 1219
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L1
  .line 1221
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 64
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 151
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 12
  .line 156
    const v0, 2131821043
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 158
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 159
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 161
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 162
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 165
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
  .line 166
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 167
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildPlaying()V
  .line 168
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/4 v3, -1
    const/4 v4, -2
    invoke-virtual { v1, v2, v3, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 170
    const-string v2, ""
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v6
    iput-object v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
  .line 171
    const/4 v7, -2
    const/high16 v8, 0x59000000
    const/4 v9, 2
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v10
    move-object v5, p0
    invoke-direct/range { v5 .. v10 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
  .line 172
    const/16 v5, 8
    invoke-virtual { v2, v5 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 173
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v2, v3, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 175
    new-instance v2, Landroidx/recyclerview/widget/RecyclerView;
    invoke-direct { v2, p0 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
  .line 176
    const v6, 2131362310
    invoke-virtual { v2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->setId(I)V
  .line 177
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { v2, p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 178
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v6, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 180
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    const/4 v6, 0
    invoke-virtual { v2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 181
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    const/4 v6, 0
    invoke-virtual { v2, v6 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 182
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { v2, v6 }, Landroidx/recyclerview/widget/LinearLayoutManager;->setItemPrefetchEnabled(Z)V
  .line 183
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    const/high16 v7, 0x00060000
    invoke-virtual { v2, v7 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 184
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
  .line 185
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v7, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 186
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v3, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 187
    const/high16 v7, 0x3F800000
    iput v7, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 188
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1, v7, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 190
    new-instance v2, Landroid/widget/TextView;
    invoke-direct { v2, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
  .line 191
    const/high16 v7, 0x41800000
    invoke-virtual { v2, v7 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 192
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    const/4 v7, 6
    const/16 v8, 12
    invoke-virtual { v2, v7, v8, v7, v7 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 193
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    const v7, 2131821044
    invoke-virtual { p0, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v2, v7 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 194
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    invoke-virtual { v2, v7, v3, v6 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 195
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 196
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    invoke-virtual { v1, v2, v3, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 198
    invoke-virtual { v0, v1, v3, v3 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 200
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 202
    iput v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 204
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->retheme:Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;
  .line 205
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->watchRows(Ljava/lang/Runnable;)V
  .line 206
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 208
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  .line 209
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 210
    return-void
.end method

.method public longConfirm()V
  .registers 6
  .line 1021
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L7
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L7
  :L0
  .line 1022
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1023
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->isMultiSelect:Z
    const v2, 2131821106
    if-eqz v1, :L1
  .line 1024
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L1
  .line 1025
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const v3, 2131821105
    const v4, 2131821071
    if-nez v1, :L3
  .line 1026
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1027
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1028
    invoke-static { }, Lcom/innioasis/ipp/Queue;->hasSource()Z
    move-result v1
    if-eqz v1, :L6
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L3
  .line 1030
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 1031
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1032
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L5
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1033
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 1036
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v1, v2, v0, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1037
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1038
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1039
    return-void
  :L7
  .line 1021
    return-void
.end method

.method newCaption()Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
  .registers 8
  .line 511
    const-string v0, ""
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
  .line 512
    const/4 v3, -2
    const/high16 v4, 0x59000000
    const/4 v5, 2
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v6
    move-object v1, p0
    move-object v2, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v1
  .line 513
    new-instance v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    const/4 v3, -1
    const/4 v4, -2
    invoke-direct { v2, v3, v4 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 514
    sget-object v2, Lcom/innioasis/ipp/Bar;->CAPTION:Ljava/lang/Object;
    invoke-virtual { v1, v2 }, Landroid/view/View;->setTag(Ljava/lang/Object;)V
  .line 515
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
    invoke-direct { v2, v1, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;-><init>(Landroid/view/View;Landroid/widget/TextView;)V
    return-object v2
.end method

.method newRow()Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
  .registers 11
  .line 473
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 474
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 475
    invoke-virtual { v2, v0 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 476
    const/16 v1, 16
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 477
    const/16 v3, 10
    const/4 v4, 5
    invoke-virtual { v2, v3, v0, v4, v0 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 480
    new-instance v3, Landroid/widget/ImageView;
    invoke-direct { v3, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 481
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -2
    invoke-direct { v4, v5, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 482
    const/16 v6, 8
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 483
    invoke-virtual { v2, v3, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 485
    new-instance v4, Landroid/widget/TextView;
    invoke-direct { v4, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 486
    const v6, 2131362459
    invoke-virtual { v4, v6 }, Landroid/widget/TextView;->setId(I)V
  .line 487
    const/4 v6, 1
    invoke-static { v6 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v7
    invoke-virtual { v4, v7 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 489
    sget-object v7, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v4, v7, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 490
    invoke-virtual { v4, v0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 491
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 492
    invoke-virtual { v4, v6 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 493
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v7, -1
    invoke-direct { v1, v0, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 494
    const/high16 v0, 0x3F800000
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 495
    invoke-virtual { v2, v4, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 498
    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct { v8, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 499
    invoke-virtual { v8, v6 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 500
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-static { v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v1
    invoke-direct { v0, v7, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v2, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 501
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->itemRgb()I
    move-result v0
    const/high16 v1, 0x1F000000
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object v9
  .line 502
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v0, v7, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v9, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 503
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    invoke-direct { v0, v7, v5 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v0 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 504
    new-instance v6, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    move-object v0, v6
    move-object v1, v8
    move-object v5, v9
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;-><init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/view/View;)V
  .line 505
    invoke-virtual { v8, v6 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 506
    return-object v6
.end method

.method protected onDestroy()V
  .catch Ljava/lang/Exception; { :L0 .. :L1 } :L2
  .registers 2
  .line 214
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->retheme:Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->unwatchRows(Ljava/lang/Runnable;)V
  .line 215
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 216
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    if-eqz v0, :L4
  :L0
  .line 218
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
  .line 220
    goto :L3
  :L2
  .line 219
    move-exception v0
  :L3
  .line 221
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  :L4
  .line 223
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 224
    return-void
.end method

.method onTrackChanged()V
  .registers 1
  .line 228
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 229
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 230
    return-void
.end method

.method pick(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 7
  .line 1043
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 1044
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 1045
    if-eqz v1, :L1
  .line 1046
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->addToPlaylist(Ljava/util/UUID;)V
  .line 1047
    return v0
  :L1
  .line 1049
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  .line 1050
    if-nez p1, :L2
    return v0
  :L2
  .line 1051
    const v1, 2131821106
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 1052
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->removePicked()V
  .line 1053
    return v0
  :L3
  .line 1055
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 1056
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startMulti()V
  .line 1057
    return v0
  :L4
  .line 1059
    const v1, 2131821071
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L5
  .line 1060
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openAlbum()V
  .line 1061
    return v0
  :L5
  .line 1063
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 1064
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->openSource(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L6
  .line 1065
    return v0
  :L7
  .line 1067
    const v1, 2131821105
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L10
  .line 1068
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object p1
  .line 1069
    if-nez p1, :L8
    return v0
  :L8
  .line 1070
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L9
  .line 1071
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1072
    return v0
  :L9
  .line 1074
    new-instance v0, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v0, v1, p1, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1075
    return v2
  :L10
  .line 1077
    return v0
.end method

.method pickArtist(Ljava/lang/String;)V
  .registers 3
  .line 1082
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v0, :L0
  .line 1083
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  .line 1084
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  :L0
  .line 1086
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1087
    return-void
.end method

.method public quit()V
  .registers 1
  .line 1225
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1226
    return-void
.end method

.method render()V
  .registers 15
  .line 299
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
  .line 300
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 301
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
  .line 302
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 303
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 305
    const/4 v2, -1
    const/16 v3, 8
    const/4 v4, 0
    if-nez v0, :L0
  .line 306
    new-array v0, v4, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
  .line 307
    new-array v0, v4, [Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
  .line 308
    new-array v0, v4, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
  .line 309
    new-array v0, v4, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
  .line 310
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 311
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 312
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 313
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    invoke-virtual { v0, v4 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 314
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->notifyDataSetChanged()V
  .line 315
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setMark(I)V
  .line 316
    return-void
  :L0
  .line 318
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v5, v4 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 319
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v5, v4 }, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V
  .line 320
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->empty:Landroid/widget/TextView;
    invoke-virtual { v5, v3 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 321
    iget v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lt v5, v0, :L1
    add-int/lit8 v5, v0, -1
    iput v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L1
  .line 322
    iget v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-gez v5, :L2
    iput v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L2
  .line 325
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 326
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6 }, Ljava/util/ArrayList;-><init>()V
  .line 327
    new-array v7, v0, [I
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
  .line 328
    aput v2, v7, v4
  .line 329
    nop
  .line 330
    nop
  .line 331
    const/4 v7, 1
    const/4 v8, 1
    const/4 v9, 0
    const/4 v10, 0
  :L3
    if-ge v8, v0, :L9
  .line 332
    invoke-static { v8 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v11
  .line 333
    nop
  .line 334
    if-eqz v11, :L4
    if-nez v9, :L4
  .line 335
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->manualCaption()Ljava/lang/String;
    move-result-object v9
  .line 336
    move v11, v10
    const/4 v10, 1
    goto :L6
  :L4
  .line 337
    if-nez v11, :L5
    if-nez v10, :L5
  .line 338
    new-array v10, v7, [Ljava/lang/Object;
    invoke-static { }, Lcom/innioasis/ipp/Queue;->source()Ljava/lang/String;
    move-result-object v11
    aput-object v11, v10, v4
    const v11, 2131821079
    invoke-virtual { p0, v11, v10 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v10
  .line 339
    const/4 v11, 1
    move-object v13, v10
    move v10, v9
    move-object v9, v13
    goto :L6
  :L5
  .line 341
    move v11, v10
    move v10, v9
    move-object v9, v1
  :L6
    if-eqz v9, :L8
  .line 342
    iget-object v12, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v12, :L7
  .line 343
    iput-object v9, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    goto :L8
  :L7
  .line 345
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v12
    invoke-static { v12 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v12
    invoke-virtual { v6, v12 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 346
    invoke-virtual { v5, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 349
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v12
    aput v12, v9, v8
  .line 350
    invoke-static { v8 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v5, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 331
    add-int/lit8 v8, v8, 1
    move v9, v10
    move v10, v11
    goto :L3
  :L9
  .line 352
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
  .line 353
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
  .line 354
    const/4 v0, 0
  :L10
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    array-length v7, v7
    if-ge v0, v7, :L15
  .line 355
    invoke-virtual { v5, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
  .line 356
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entRow:[I
    instance-of v9, v7, Ljava/lang/Integer;
    if-eqz v9, :L11
    move-object v9, v7
    check-cast v9, Ljava/lang/Integer;
    invoke-virtual { v9 }, Ljava/lang/Integer;->intValue()I
    move-result v9
    goto :L12
  :L11
    const/4 v9, -1
  :L12
    aput v9, v8, v0
  .line 357
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
    instance-of v9, v7, Ljava/lang/String;
    if-eqz v9, :L13
    check-cast v7, Ljava/lang/String;
    goto :L14
  :L13
    move-object v7, v1
  :L14
    aput-object v7, v8, v0
  .line 354
    add-int/lit8 v0, v0, 1
    goto :L10
  :L15
  .line 359
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
  .line 360
    const/4 v0, 0
  :L16
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
    array-length v2, v1
    if-ge v0, v2, :L17
    invoke-virtual { v6, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    aput v2, v1, v0
    add-int/lit8 v0, v0, 1
    goto :L16
  :L17
  .line 361
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-eqz v0, :L18
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
    goto :L19
  :L18
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L19
  .line 363
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->fillPlaying()V
  .line 364
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintHead()V
  .line 365
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    aget v0, v0, v1
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setMark(I)V
  .line 366
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->notifyDataSetChanged()V
  .line 368
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 369
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 370
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v1, :L20
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->posOf:[I
    aget v4, v2, v1
  :L20
    invoke-virtual { v0, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V
  .line 371
    return-void
.end method

.method repin()V
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  :L0
  .line 653
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-eqz v0, :L9
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    if-nez v1, :L1
    goto :L9
  :L1
  .line 654
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v1, :L3
  .line 655
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-eq v0, v1, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L2
  .line 656
    return-void
  :L3
  .line 658
    nop
  .line 659
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I
    move-result v0
  .line 660
    const/4 v2, 0
  :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
    array-length v4, v3
    if-ge v2, v4, :L7
  .line 661
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lm:Landroidx/recyclerview/widget/LinearLayoutManager;
    aget v3, v3, v2
    invoke-virtual { v4, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v3
  .line 663
    if-eqz v3, :L5
  .line 664
    invoke-virtual { v3 }, Landroid/view/View;->getBottom()I
    move-result v3
    if-lez v3, :L6
    goto :L7
  :L5
  .line 665
    if-ltz v0, :L7
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
    aget v3, v3, v2
    if-le v3, v0, :L6
  .line 666
    goto :L7
  :L6
  .line 668
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->entCap:[Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capPos:[I
    aget v3, v3, v2
    aget-object v1, v1, v3
  .line 660
    add-int/lit8 v2, v2, 1
    goto :L4
  :L7
  .line 670
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
  :L8
  .line 672
    goto :L11
  :L9
  .line 653
    return-void
  :L10
  .line 671
    move-exception v0
  :L11
  .line 673
    return-void
.end method

.method stretch()Z
  .catchall { :L0 .. :L6 } :L10
  .registers 7
  .line 691
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L9
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
    goto :L9
  :L1
  .line 692
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->list:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
    add-int/2addr v1, v2
  .line 693
    if-gtz v1, :L2
    return v0
  :L2
  .line 695
    const/4 v2, 1
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v3
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v3
  .line 696
    add-int/2addr v3, v2
    div-int v3, v1, v3
  .line 697
    if-ge v3, v2, :L3
    return v0
  :L3
  .line 698
    div-int v4, v1, v3
  .line 699
    mul-int v3, v3, v4
    sub-int/2addr v1, v3
  .line 701
    nop
  .line 702
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowH:I
    sub-int/2addr v4, v2
    if-eq v3, v4, :L4
  .line 703
    iput v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowH:I
  .line 704
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->adapter:Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->notifyDataSetChanged()V
  .line 705
    const/4 v3, 1
    goto :L5
  :L4
  .line 702
    const/4 v3, 0
  :L5
  .line 707
    iget v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBase:I
    if-lez v4, :L7
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playRow:Landroid/widget/LinearLayout;
    add-int/2addr v4, v1
    invoke-static { v5, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setHeight(Landroid/view/View;I)Z
    move-result v4
    if-eqz v4, :L7
  .line 708
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
  :L6
  .line 709
    goto :L8
  :L7
  .line 711
    move v2, v3
  :L8
    return v2
  :L9
  .line 691
    return v0
  :L10
  .line 712
    move-exception v1
  .line 713
    return v0
.end method

.method public tinted(Landroid/view/View;)V
  .registers 3
  .line 467
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p1 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object p1
  :L1
  .line 468
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    if-eqz v0, :L2
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->mark(Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;)V
  :L2
  .line 469
    return-void
.end method
