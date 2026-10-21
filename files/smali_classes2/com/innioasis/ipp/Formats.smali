.class public final Lcom/innioasis/ipp/Formats;
.super Ljava/lang/Object;
.source "Formats.java"

.field private final static EXTRA:[Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 3
  .line 15
    const/4 v0, 3
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "opus"
    aput-object v2, v0, v1
    const/4 v1, 1
    const-string v2, "oga"
    aput-object v2, v0, v1
    const/4 v1, 2
    const-string v2, "m4b"
    aput-object v2, v0, v1
    sput-object v0, Lcom/innioasis/ipp/Formats;->EXTRA:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 13
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static more(Ljava/util/List;)Ljava/util/List;
  .registers 4
  .line 19
    new-instance v0, Ljava/util/ArrayList;
    if-nez p0, :L0
    sget-object v1, Lcom/innioasis/ipp/Formats;->EXTRA:[Ljava/lang/String;
    array-length v1, v1
    goto :L1
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    sget-object v2, Lcom/innioasis/ipp/Formats;->EXTRA:[Ljava/lang/String;
    array-length v2, v2
    add-int/2addr v1, v2
  :L1
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(I)V
  .line 20
    if-eqz p0, :L2
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
  :L2
  .line 21
    const/4 p0, 0
  :L3
    sget-object v1, Lcom/innioasis/ipp/Formats;->EXTRA:[Ljava/lang/String;
    array-length v2, v1
    if-ge p0, v2, :L5
  .line 22
    aget-object v2, v1, p0
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L4
    aget-object v1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 21
    add-int/lit8 p0, p0, 1
    goto :L3
  :L5
  .line 24
    return-object v0
.end method
