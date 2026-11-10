.class final Lcom/innioasis/ipp/Stale$Keys;
.super Ljava/lang/Object;
.source "Stale.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Stale;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Keys"
.end annotation

.field private a:[J

.field private n:I

.method constructor <init>()V
  .registers 2
  .line 111
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 112
    const/16 v0, 4096
    new-array v0, v0, [J
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
    return-void
.end method

.method static of(II)J
  .registers 6
  .line 121
    int-to-long v0, p0
    const/16 p0, 32
    shl-long/2addr v0, p0
    int-to-long p0, p1
    const-wide v2, 4294967295L
    and-long/2addr p0, v2
    or-long/2addr p0, v0
    return-wide p0
.end method

.method static of(Ljava/lang/String;)J
  .registers 3
  .line 117
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result v0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Stale$Keys;->of(II)J
    move-result-wide v0
    return-wide v0
.end method

.method add(J)V
  .registers 6
  .line 125
    iget v0, p0, Lcom/innioasis/ipp/Stale$Keys;->n:I
    iget-object v1, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
    array-length v2, v1
    if-ne v0, v2, :L0
    mul-int/lit8 v0, v0, 2
    invoke-static { v1, v0 }, Ljava/util/Arrays;->copyOf([JI)[J
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
  :L0
  .line 126
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
    iget v1, p0, Lcom/innioasis/ipp/Stale$Keys;->n:I
    add-int/lit8 v2, v1, 1
    iput v2, p0, Lcom/innioasis/ipp/Stale$Keys;->n:I
    aput-wide p1, v0, v1
  .line 127
    return-void
.end method

.method has(J)Z
  .registers 6
  .line 134
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
    iget v1, p0, Lcom/innioasis/ipp/Stale$Keys;->n:I
    const/4 v2, 0
    invoke-static { v0, v2, v1, p1, p2 }, Ljava/util/Arrays;->binarySearch([JIIJ)I
    move-result p1
    if-ltz p1, :L0
    const/4 v2, 1
  :L0
    return v2
.end method

.method seal()V
  .registers 4
  .line 130
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Keys;->a:[J
    const/4 v1, 0
    iget v2, p0, Lcom/innioasis/ipp/Stale$Keys;->n:I
    invoke-static { v0, v1, v2 }, Ljava/util/Arrays;->sort([JII)V
  .line 131
    return-void
.end method
