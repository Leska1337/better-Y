.class final Lcom/innioasis/ipp/Albums$Dirs;
.super Ljava/lang/Object;
.source "Albums.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Albums;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Dirs"
.end annotation

.field private hashes:[I

.field private ids:[I

.field private keys:[Ljava/lang/String;

.field size:I

.method private constructor <init>()V
  .registers 3
  .line 1067
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1068
    const/16 v0, 4096
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
  .line 1069
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/ipp/Albums$Dirs;->hashes:[I
  .line 1070
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Albums$Dirs;->ids:[I
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Albums$1;)V
  .registers 2
  .line 1067
    invoke-direct { p0 }, Lcom/innioasis/ipp/Albums$Dirs;-><init>()V
    return-void
.end method

.method private static end(Ljava/lang/String;)I
  .registers 2
  .line 1074
    if-nez p0, :L0
    const/4 p0, -1
    goto :L1
  :L0
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result p0
  :L1
    return p0
.end method

.method private grow()V
  .registers 8
  .line 1114
    iget-object v0, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
  .line 1115
    iget-object v1, p0, Lcom/innioasis/ipp/Albums$Dirs;->hashes:[I
  .line 1116
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Dirs;->ids:[I
  .line 1117
    array-length v3, v0
    mul-int/lit8 v3, v3, 2
    new-array v3, v3, [Ljava/lang/String;
    iput-object v3, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
  .line 1118
    array-length v3, v0
    mul-int/lit8 v3, v3, 2
    new-array v3, v3, [I
    iput-object v3, p0, Lcom/innioasis/ipp/Albums$Dirs;->hashes:[I
  .line 1119
    array-length v3, v0
    mul-int/lit8 v3, v3, 2
    new-array v3, v3, [I
    iput-object v3, p0, Lcom/innioasis/ipp/Albums$Dirs;->ids:[I
  .line 1120
    const/4 v3, 0
    iput v3, p0, Lcom/innioasis/ipp/Albums$Dirs;->size:I
  .line 1121
    nop
  :L0
    array-length v4, v0
    if-ge v3, v4, :L2
    aget-object v4, v0, v3
    if-eqz v4, :L1
    aget v5, v1, v3
    aget v6, v2, v3
    invoke-direct { p0, v4, v5, v6 }, Lcom/innioasis/ipp/Albums$Dirs;->put(Ljava/lang/String;II)V
  :L1
    add-int/lit8 v3, v3, 1
    goto :L0
  :L2
  .line 1122
    return-void
.end method

.method private static hash(Ljava/lang/String;I)I
  .registers 5
  .line 1078
    nop
  .line 1079
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-ge v0, p1, :L1
    mul-int/lit8 v1, v1, 31
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v2
    add-int/2addr v1, v2
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 1080
    return v1
.end method

.method private put(Ljava/lang/String;II)V
  .registers 8
  .line 1104
    iget-object v0, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
    array-length v0, v0
    add-int/lit8 v0, v0, -1
  .line 1105
    and-int v1, p2, v0
  :L0
  .line 1106
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
    aget-object v3, v2, v1
    if-eqz v3, :L1
    add-int/lit8 v1, v1, 1
    and-int/2addr v1, v0
    goto :L0
  :L1
  .line 1107
    aput-object p1, v2, v1
  .line 1108
    iget-object p1, p0, Lcom/innioasis/ipp/Albums$Dirs;->hashes:[I
    aput p2, p1, v1
  .line 1109
    iget-object p1, p0, Lcom/innioasis/ipp/Albums$Dirs;->ids:[I
    aput p3, p1, v1
  .line 1110
    iget p1, p0, Lcom/innioasis/ipp/Albums$Dirs;->size:I
    add-int/lit8 p1, p1, 1
    iput p1, p0, Lcom/innioasis/ipp/Albums$Dirs;->size:I
  .line 1111
    return-void
.end method

.method add(Ljava/lang/String;I)V
  .registers 6
  .line 1097
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums$Dirs;->end(Ljava/lang/String;)I
    move-result v0
  .line 1098
    if-gez v0, :L0
    return-void
  :L0
  .line 1099
    iget v1, p0, Lcom/innioasis/ipp/Albums$Dirs;->size:I
    add-int/lit8 v1, v1, 1
    mul-int/lit8 v1, v1, 2
    iget-object v2, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
    array-length v2, v2
    if-le v1, v2, :L1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Albums$Dirs;->grow()V
  :L1
  .line 1100
    const/4 v1, 0
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Albums$Dirs;->hash(Ljava/lang/String;I)I
    move-result p1
    invoke-direct { p0, v1, p1, p2 }, Lcom/innioasis/ipp/Albums$Dirs;->put(Ljava/lang/String;II)V
  .line 1101
    return-void
.end method

.method find(Ljava/lang/String;)I
  .registers 9
  .line 1085
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums$Dirs;->end(Ljava/lang/String;)I
    move-result v0
  .line 1086
    const/4 v1, -1
    if-gez v0, :L0
    return v1
  :L0
  .line 1087
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Albums$Dirs;->hash(Ljava/lang/String;I)I
    move-result v2
  .line 1088
    iget-object v3, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
    array-length v3, v3
    add-int/lit8 v3, v3, -1
  .line 1089
    and-int v4, v2, v3
  :L1
    iget-object v5, p0, Lcom/innioasis/ipp/Albums$Dirs;->keys:[Ljava/lang/String;
    aget-object v5, v5, v4
    if-eqz v5, :L3
  .line 1090
    nop
  .line 1091
    iget-object v6, p0, Lcom/innioasis/ipp/Albums$Dirs;->hashes:[I
    aget v6, v6, v4
    if-ne v6, v2, :L2
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v6
    if-ne v6, v0, :L2
    const/4 v6, 0
    invoke-virtual { p1, v6, v5, v6, v0 }, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z
    move-result v5
    if-eqz v5, :L2
    iget-object p1, p0, Lcom/innioasis/ipp/Albums$Dirs;->ids:[I
    aget p1, p1, v4
    return p1
  :L2
  .line 1089
    add-int/lit8 v4, v4, 1
    and-int/2addr v4, v3
    goto :L1
  :L3
  .line 1093
    return v1
.end method
