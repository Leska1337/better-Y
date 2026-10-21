.class public final Lcom/innioasis/ipp/Pinyin;
.super Ljava/lang/Object;
.source "Pinyin.java"

.field private final static MAX:I = 4096

.field private final static SEEN:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 18
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Pinyin;->SEEN:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static keep(CLcom/innioasis/y1/utils/HanziToPinyin$Token;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 5
  .line 32
    if-nez p1, :L0
    return-void
  :L0
  .line 33
    new-instance v0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;
    iget v1, p1, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->type:I
    iget-object v2, p1, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->source:Ljava/lang/String;
    iget-object p1, p1, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->target:Ljava/lang/String;
    invoke-direct { v0, v1, v2, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin$Token;-><init>(ILjava/lang/String;Ljava/lang/String;)V
  .line 34
    sget-object p1, Lcom/innioasis/ipp/Pinyin;->SEEN:Ljava/util/HashMap;
    monitor-enter p1
  :L1
  .line 35
    invoke-virtual { p1 }, Ljava/util/HashMap;->size()I
    move-result v1
    const/16 v2, 4096
    if-ge v1, v2, :L2
    invoke-static { p0 }, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    move-result-object p0
    invoke-virtual { p1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 36
    monitor-exit p1
  .line 37
    return-void
  :L3
  .line 36
    move-exception p0
    monitor-exit p1
  :L4
    throw p0
.end method

.method public static token(C)Lcom/innioasis/y1/utils/HanziToPinyin$Token;
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 25
    sget-object v0, Lcom/innioasis/ipp/Pinyin;->SEEN:Ljava/util/HashMap;
    monitor-enter v0
  :L0
  .line 26
    invoke-static { p0 }, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;
  .line 27
    monitor-exit v0
  :L1
  .line 28
    if-nez p0, :L2
    const/4 p0, 0
    goto :L3
  :L2
    new-instance v0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;
    iget v1, p0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->type:I
    iget-object v2, p0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->source:Ljava/lang/String;
    iget-object p0, p0, Lcom/innioasis/y1/utils/HanziToPinyin$Token;->target:Ljava/lang/String;
    invoke-direct { v0, v1, v2, p0 }, Lcom/innioasis/y1/utils/HanziToPinyin$Token;-><init>(ILjava/lang/String;Ljava/lang/String;)V
    move-object p0, v0
  :L3
    return-object p0
  :L4
  .line 27
    move-exception p0
  :L5
    monitor-exit v0
  :L6
    throw p0
.end method
