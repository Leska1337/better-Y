.class final Lcom/innioasis/ipp/GenreInfo$Bucket;
.super Ljava/lang/Object;
.source "GenreInfo.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreInfo;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Bucket"
.end annotation

.field final albums:Ljava/util/HashSet;

.field final artists:Ljava/util/HashSet;

.field composite:Z

.field final exact:Ljava/util/HashMap;

.method private constructor <init>()V
  .registers 2
  .line 96
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 97
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/GenreInfo$Bucket;->albums:Ljava/util/HashSet;
  .line 98
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/GenreInfo$Bucket;->artists:Ljava/util/HashSet;
  .line 100
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/GenreInfo$Bucket;->exact:Ljava/util/HashMap;
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/GenreInfo$1;)V
  .registers 2
  .line 96
    invoke-direct { p0 }, Lcom/innioasis/ipp/GenreInfo$Bucket;-><init>()V
    return-void
.end method
