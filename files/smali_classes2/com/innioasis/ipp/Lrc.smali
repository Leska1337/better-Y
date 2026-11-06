.class public final Lcom/innioasis/ipp/Lrc;
.super Ljava/lang/Object;
.source "Lrc.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Lrc$Read;,
    Lcom/innioasis/ipp/Lrc$Got;
  }
.end annotation

.field private final static LEAD:Ljava/lang/String; = "\u2026"

.field private final static MAIN:Landroid/os/Handler;

.field private final static META:Ljava/util/regex/Pattern;

.field private final static STAMP:Ljava/util/regex/Pattern;

.field private final static WORD:Ljava/util/regex/Pattern;

.field private static audio:Ljava/lang/String;

.field private static missing:Ljava/lang/String;

.field private static tried:Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 2
  .line 41
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Lrc;->MAIN:Landroid/os/Handler;
  .line 43
    const-string v0, "\\[(\\d+):(\\d{1,2})(?:[.:](\\d{1,3}))?\\]"
    invoke-static { v0 }, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Lrc;->STAMP:Ljava/util/regex/Pattern;
  .line 44
    const-string v0, "\\[([A-Za-z#]+):([^\\]]*)\\]"
    invoke-static { v0 }, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Lrc;->META:Ljava/util/regex/Pattern;
  .line 45
    const-string v0, "<\\d+:\\d{1,2}(?:[.:]\\d{1,3})?>"
    invoke-static { v0 }, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Lrc;->WORD:Ljava/util/regex/Pattern;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Lrc;->MAIN:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Lrc;->audio:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Lrc;->missing:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 30
    invoke-static { p0 }, Lcom/innioasis/ipp/Lrc;->lrcOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lrc;->show(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
    return-void
.end method

.method private static embedded(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 95
    sget-object v0, Lcom/innioasis/ipp/Lrc;->audio:Ljava/lang/String;
  .line 96
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/Lrc;->missing:Ljava/lang/String;
    if-eqz v1, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 97
    sget-object v1, Lcom/innioasis/ipp/Lrc;->missing:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lrc;->lrcOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    sget-object v1, Lcom/innioasis/ipp/Lrc;->tried:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    goto :L2
  :L1
  .line 98
    sput-object v0, Lcom/innioasis/ipp/Lrc;->tried:Ljava/lang/String;
  .line 99
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Lrc$Read;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/Lrc$Read;-><init>(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
    const-string p0, "ipp-lyrics"
    invoke-direct { v1, v2, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 100
    return-void
  :L2
  .line 97
    return-void
  :L3
  .line 96
    return-void
.end method

.method public static loaded(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;Ljava/lang/String;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 60
    const/4 v0, 0
  :L0
    sput-object v0, Lcom/innioasis/ipp/Lrc;->tried:Ljava/lang/String;
  .line 61
    if-eqz p1, :L2
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
    const/4 v1, 0
    goto :L3
  :L2
    const/4 v1, 1
  :L3
  .line 62
    if-eqz v1, :L4
    goto :L5
  :L4
    move-object p2, v0
  :L5
    sput-object p2, Lcom/innioasis/ipp/Lrc;->missing:Ljava/lang/String;
  .line 63
    if-eqz v1, :L6
    const-string p1, ""
  :L6
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lrc;->show(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 64
    if-eqz v1, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Lrc;->embedded(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L7
  .line 66
    goto :L9
  :L8
  .line 65
    move-exception p0
  :L9
  .line 67
    return-void
.end method

.method private static lrcOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 193
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 194
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    if-gez v0, :L0
    goto :L1
  :L0
    const/4 v2, 0
    invoke-virtual { p0, v2, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, ".lrc"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static ms(Ljava/util/regex/Matcher;)J
  .registers 9
  .line 264
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v1
    const-wide/32 v3, 60000
    mul-long v1, v1, v3
    const/4 v3, 2
    invoke-virtual { p0, v3 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v4
    const-wide/16 v6, 1000
    mul-long v4, v4, v6
    add-long/2addr v1, v4
  .line 265
    const/4 v4, 3
    invoke-virtual { p0, v4 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object p0
  .line 266
    if-eqz p0, :L3
  .line 267
    invoke-static { p0 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v4
  .line 268
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v6
    if-ne v6, v0, :L1
    const-wide/16 v6, 100
  :L0
    mul-long v4, v4, v6
    goto :L2
  :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-ne p0, v3, :L2
    const-wide/16 v6, 10
    goto :L0
  :L2
    add-long/2addr v1, v4
  :L3
  .line 270
    return-wide v1
.end method

.method static normalize(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L2 .. :L3 } :L4
  .registers 18
  .line 221
    move-object/from16 v0, p0
    const-string v1, "\ufeff"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L0
    invoke-virtual { v0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
  :L0
  .line 222
    const-string v1, "\\r?\\n|\\r"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 223
    nop
  .line 224
    const/4 v5, 0
    const-wide/16 v6, 0
  :L1
    array-length v0, v1
    const-string v8, ""
    if-ge v5, v0, :L6
  .line 225
    sget-object v0, Lcom/innioasis/ipp/Lrc;->META:Ljava/util/regex/Pattern;
    aget-object v9, v1, v5
    invoke-virtual { v9 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v0
  .line 226
    invoke-virtual { v0 }, Ljava/util/regex/Matcher;->matches()Z
    move-result v9
    if-eqz v9, :L5
    invoke-virtual { v0, v2 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v9
    const-string v10, "offset"
    invoke-virtual { v9, v10 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v9
    if-eqz v9, :L5
  .line 228
    const/4 v9, 2
  :L2
    invoke-virtual { v0, v9 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    const-string v9, "+"
    invoke-virtual { v0, v9, v8 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v6
  :L3
  .line 230
    goto :L5
  :L4
  .line 229
    move-exception v0
  :L5
  .line 224
    add-int/lit8 v5, v5, 1
    goto :L1
  :L6
  .line 233
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 234
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 235
    nop
  .line 236
    nop
  .line 237
    const-wide v9, 9223372036854775807L
    const/4 v11, 0
    const/4 v12, 0
  :L7
    array-length v13, v1
    if-ge v11, v13, :L16
  .line 238
    aget-object v13, v1, v11
    invoke-virtual { v13 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v13
  .line 239
    invoke-virtual { v5 }, Ljava/util/ArrayList;->clear()V
  .line 240
    const/4 v14, 0
  :L8
  .line 241
    invoke-virtual { v13 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v14, v2, :L10
    invoke-virtual { v13, v14 }, Ljava/lang/String;->charAt(I)C
    move-result v2
    const/16 v4, 91
    if-ne v2, v4, :L10
  .line 242
    sget-object v2, Lcom/innioasis/ipp/Lrc;->STAMP:Ljava/util/regex/Pattern;
    invoke-virtual { v2, v13 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v2
  .line 243
    invoke-virtual { v13 }, Ljava/lang/String;->length()I
    move-result v4
    invoke-virtual { v2, v14, v4 }, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;
  .line 244
    invoke-virtual { v2 }, Ljava/util/regex/Matcher;->lookingAt()Z
    move-result v4
    if-nez v4, :L9
    goto :L10
  :L9
  .line 245
    invoke-static { v2 }, Lcom/innioasis/ipp/Lrc;->ms(Ljava/util/regex/Matcher;)J
    move-result-wide v15
    sub-long/2addr v15, v6
    invoke-static/range { v15 .. v16 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 246
    invoke-virtual { v2 }, Ljava/util/regex/Matcher;->end()I
    move-result v14
  .line 247
    const/4 v2, 1
    goto :L8
  :L10
  .line 248
    invoke-virtual { v5 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    if-eqz v2, :L11
    goto :L15
  :L11
  .line 249
    sget-object v2, Lcom/innioasis/ipp/Lrc;->WORD:Ljava/util/regex/Pattern;
    invoke-virtual { v13, v14 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v2
    invoke-virtual { v2, v8 }, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 250
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L12
    goto :L15
  :L12
  .line 251
    const/4 v4, 0
  :L13
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v13
    if-ge v4, v13, :L15
  .line 252
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/lang/Long;
    invoke-virtual { v12 }, Ljava/lang/Long;->longValue()J
    move-result-wide v12
  .line 253
    invoke-static { v12, v13 }, Lcom/innioasis/ipp/Lrc;->stamp(J)Ljava/lang/String;
    move-result-object v14
    invoke-virtual { v0, v14 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v14
    invoke-virtual { v14, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v14
    const/16 v3, 10
    invoke-virtual { v14, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 254
    cmp-long v3, v12, v9
    if-gez v3, :L14
    move-wide v9, v12
  :L14
  .line 255
    nop
  .line 251
    add-int/lit8 v4, v4, 1
    const/4 v12, 1
    goto :L13
  :L15
  .line 237
    add-int/lit8 v11, v11, 1
    const/4 v2, 1
    goto/16 :L7
  :L16
  .line 258
    if-nez v12, :L17
    const/4 v0, 0
    return-object v0
  :L17
  .line 259
    const-wide/16 v1, 0
    cmp-long v3, v9, v1
    if-lez v3, :L18
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Lrc;->stamp(J)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\u2026"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\n"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    invoke-virtual { v0, v2, v1 }, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;
  :L18
  .line 260
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static plain(Landroid/app/Activity;Z)Landroid/widget/ScrollView;
  .registers 8
  .line 165
    const v0, 2131362183
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 166
    const/4 v2, 0
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    instance-of v3, v3, Landroid/view/ViewGroup;
    if-nez v3, :L0
    goto :L3
  :L0
  .line 167
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 168
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;
    move-result-object v3
  .line 169
    instance-of v4, v3, Landroid/widget/ScrollView;
    if-eqz v4, :L1
    check-cast v3, Landroid/widget/ScrollView;
    return-object v3
  :L1
  .line 170
    if-nez p1, :L2
    return-object v2
  :L2
  .line 171
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
  .line 172
    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct { v2, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
  .line 173
    const/4 v3, 0
    invoke-virtual { v2, v3 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  .line 174
    invoke-virtual { v2, v3 }, Landroid/widget/ScrollView;->setClipToPadding(Z)V
  .line 175
    const/high16 v4, 0x42200000
    mul-float v4, v4, p1
    float-to-int v4, v4
  .line 176
    invoke-virtual { v2, v3, v4, v3, v4 }, Landroid/widget/ScrollView;->setPadding(IIII)V
  .line 177
    new-instance v4, Landroid/widget/TextView;
    invoke-direct { v4, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 178
    const/4 p0, 1
    invoke-virtual { v4, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 179
    const/4 p0, 2
    const/high16 v5, 0x41D80000
    invoke-virtual { v4, p0, v5 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 180
    const/high16 p0, 0x41A00000
    mul-float p1, p1, p0
    float-to-int p0, p1
  .line 181
    invoke-virtual { v4, p0, v3, p0, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 182
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 p1, -2
    const/4 v3, -1
    invoke-direct { p0, v3, p1 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v4, p0 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 184
    const/16 p0, 8
    invoke-virtual { v2, p0 }, Landroid/widget/ScrollView;->setVisibility(I)V
  .line 185
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { p0, v3, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, p0 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 187
    invoke-virtual { v1, v0, v2 }, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V
  .line 188
    return-object v2
  :L3
  .line 166
    return-object v2
.end method

.method private static show(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .registers 7
  .line 140
    nop
  .line 141
    const v0, 2131362183
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 142
    instance-of v1, v0, Lme/wcy/lrcview/LrcView;
    if-nez v1, :L0
    return-void
  :L0
  .line 143
    check-cast v0, Lme/wcy/lrcview/LrcView;
  .line 144
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Lrc;->normalize(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  :L2
  .line 145
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v2
    const-string v3, ""
    const/4 v4, 0
    if-eqz v2, :L5
    if-eqz v1, :L3
    goto :L5
  :L3
  .line 152
    const/4 v1, 1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Lrc;->plain(Landroid/app/Activity;Z)Landroid/widget/ScrollView;
    move-result-object v1
  .line 153
    if-nez v1, :L4
    return-void
  :L4
  .line 154
    invoke-virtual { v1, v4 }, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/TextView;
  .line 155
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->lyricsColor(Landroid/app/Activity;)I
    move-result p0
    invoke-virtual { v2, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 156
    invoke-static { p1 }, Lcom/innioasis/ipp/Lrc;->untimed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 157
    invoke-virtual { v1, v4, v4 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 158
    invoke-virtual { v0, v3 }, Lme/wcy/lrcview/LrcView;->loadLrc(Ljava/lang/String;)V
  .line 159
    const/4 p0, 4
    invoke-virtual { v0, p0 }, Lme/wcy/lrcview/LrcView;->setVisibility(I)V
  .line 160
    invoke-virtual { v1, v4 }, Landroid/widget/ScrollView;->setVisibility(I)V
  .line 161
    return-void
  :L5
  .line 146
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/Lrc;->plain(Landroid/app/Activity;Z)Landroid/widget/ScrollView;
    move-result-object p0
  .line 147
    if-eqz p0, :L6
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ScrollView;->setVisibility(I)V
  :L6
  .line 148
    invoke-virtual { v0, v4 }, Lme/wcy/lrcview/LrcView;->setVisibility(I)V
  .line 149
    if-nez v1, :L7
    move-object v1, v3
  :L7
    invoke-virtual { v0, v1 }, Lme/wcy/lrcview/LrcView;->loadLrc(Ljava/lang/String;)V
  .line 150
    return-void
.end method

.method static stamp(J)Ljava/lang/String;
  .registers 10
  .line 209
    const-wide/16 v0, 0
    cmp-long v2, p0, v0
    if-gez v2, :L0
    move-wide p0, v0
  :L0
  .line 210
    const-wide/32 v0, 60000
    div-long v0, p0, v0
  .line 211
    const-wide/16 v2, 99
    cmp-long v4, v0, v2
    if-lez v4, :L1
    move-wide v0, v2
  :L1
  .line 212
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    const/4 v3, 3
    new-array v3, v3, [Ljava/lang/Object;
    const/4 v4, 0
    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    aput-object v0, v3, v4
    const-wide/16 v0, 1000
    div-long v4, p0, v0
    const-wide/16 v6, 60
    rem-long/2addr v4, v6
    invoke-static { v4, v5 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    const/4 v5, 1
    aput-object v4, v3, v5
    rem-long/2addr p0, v0
    invoke-static { p0, p1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object p0
    const/4 p1, 2
    aput-object p0, v3, p1
    const-string p0, "[%02d:%02d.%03d]"
    invoke-static { v2, p0, v3 }, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static timed(Ljava/lang/String;)Z
  .registers 5
  .line 199
    const-string v0, "\\r?\\n"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 200
    const/4 v0, 0
    const/4 v1, 0
  :L0
    array-length v2, p0
    if-ge v1, v2, :L2
  .line 201
    sget-object v2, Lcom/innioasis/ipp/Lrc;->STAMP:Ljava/util/regex/Pattern;
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v2
  .line 202
    invoke-virtual { v2 }, Ljava/util/regex/Matcher;->lookingAt()Z
    move-result v2
    if-eqz v2, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 200
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 204
    return v0
.end method

.method public static track(Ljava/lang/String;)V
  .registers 1
  .line 51
    sput-object p0, Lcom/innioasis/ipp/Lrc;->audio:Ljava/lang/String;
  .line 52
    return-void
.end method

.method private static untimed(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 275
    const-string v0, "\ufeff"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L0
  .line 276
    const-string v0, "\\r?\\n|\\r"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 277
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 278
    const/4 v1, 0
  :L1
    array-length v2, p0
    if-ge v1, v2, :L5
  .line 279
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 280
    sget-object v3, Lcom/innioasis/ipp/Lrc;->META:Ljava/util/regex/Pattern;
    invoke-virtual { v3, v2 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/util/regex/Matcher;->matches()Z
    move-result v3
    if-eqz v3, :L2
    goto :L4
  :L2
  .line 281
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v3
    if-lez v3, :L3
    const/16 v3, 10
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L3
  .line 282
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 278
    add-int/lit8 v1, v1, 1
    goto :L1
  :L5
  .line 284
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static wheel(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .catchall { :L0 .. :L4 } :L7
  .registers 5
  .line 80
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 81
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Lrc;->plain(Landroid/app/Activity;Z)Landroid/widget/ScrollView;
    move-result-object p0
  .line 82
    if-eqz p0, :L6
    invoke-virtual { p0 }, Landroid/widget/ScrollView;->getVisibility()I
    move-result v1
    if-eqz v1, :L2
    goto :L6
  :L2
  .line 83
    invoke-virtual { p0, v0 }, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/TextView;
  .line 84
    invoke-virtual { v1 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v1
  .line 85
    sget-object v2, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v2
    if-ne p1, v2, :L3
    invoke-virtual { p0, v0, v1 }, Landroid/widget/ScrollView;->scrollBy(II)V
    goto :L4
  :L3
  .line 86
    sget-object v2, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v2
    if-ne p1, v2, :L5
    neg-int p1, v1
    invoke-virtual { p0, v0, p1 }, Landroid/widget/ScrollView;->scrollBy(II)V
  :L4
  .line 88
    const/4 p0, 1
    return p0
  :L5
  .line 87
    return v0
  :L6
  .line 82
    return v0
  :L7
  .line 89
    move-exception p0
  .line 90
    return v0
.end method

.method public static window(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 72
    invoke-static { p0 }, Lcom/innioasis/ipp/Lrc;->embedded(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L1
  .line 74
    goto :L3
  :L2
  .line 73
    move-exception p0
  :L3
  .line 75
    return-void
.end method
