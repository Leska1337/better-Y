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

.field private folder:Ljava/lang/String;

.field private raw:[B

.field private rep:Landroid/graphics/Bitmap;

.method public constructor <init>()V
  .registers 1
  .line 343
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
  .registers 1
  .line 343
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 343
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 1
  .line 343
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
    return-object p0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .registers 2
  .line 343
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
    return-object p1
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
  .registers 1
  .line 343
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 2
  .line 343
    iput-object p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method public done()V
  .registers 3
  .line 350
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->access$000()Ljava/util/Hashtable;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 351
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->folder:Ljava/lang/String;
  .line 352
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->raw:[B
  .line 353
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->rep:Landroid/graphics/Bitmap;
  .line 354
    return-void
.end method
