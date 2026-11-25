.class public final Lcom/innioasis/ipp/BigCover$Walk;
.super Ljava/lang/Object;
.source "BigCover.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BigCover;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Walk"
.end annotation

.field public decodeNs:J

.field public embedded:J

.field public encodeNs:J

.field public encoded:J

.field private extBytes:[B

.field private extDir:Ljava/lang/String;

.field private extDirBytes:[B

.field private extLen:J

.field public extLookups:J

.field private extMod:J

.field private extPath:Ljava/lang/String;

.field public external:J

.field public externalNs:J

.field public failed:J

.field private folder:Ljava/lang/String;

.field public none:J

.field public own:J

.field public probes:J

.field private raw:[B

.field private rep:Landroid/graphics/Bitmap;

.field public sameBytes:J

.field public samePixels:J

.field public sigOnDisk:J

.field public srcDecodeNs:J

.field public storeNs:J

.field public verbatim:J

.field public writeNs:J

.method public constructor <init>()V
  .registers 1
  .line 320
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
    return-object p0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
    return-object p1
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extDir:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$402(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extDir:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extDirBytes:[B
    return-object p0
.end method

.method static synthetic access$502(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extDirBytes:[B
    return-object p1
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extBytes:[B
    return-object p0
.end method

.method static synthetic access$602(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extBytes:[B
    return-object p1
.end method

.method static synthetic access$700(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
  .registers 1
  .line 320
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extPath:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$702(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 320
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extPath:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$800(Lcom/innioasis/ipp/BigCover$Walk;)J
  .registers 3
  .line 320
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLen:J
    return-wide v0
.end method

.method static synthetic access$802(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .registers 3
  .line 320
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLen:J
    return-wide p1
.end method

.method static synthetic access$900(Lcom/innioasis/ipp/BigCover$Walk;)J
  .registers 3
  .line 320
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extMod:J
    return-wide v0
.end method

.method static synthetic access$902(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .registers 3
  .line 320
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->extMod:J
    return-wide p1
.end method

.method public done()V
  .registers 3
  .line 342
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->access$000()Ljava/util/Map;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    invoke-interface { v0, v1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 343
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
  .line 344
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
  .line 345
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
  .line 346
    return-void
.end method
