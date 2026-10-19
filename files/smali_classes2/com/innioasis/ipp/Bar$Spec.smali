.class final Lcom/innioasis/ipp/Bar$Spec;
.super Ljava/lang/Object;
.source "Bar.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Bar;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Spec"
.end annotation

.field final arrow:I

.field bgs:[I

.field byAdapter:Z

.field head:I

.field final list:I

.field final rowColor:I

.field final rowRes:I

.field final selColor:I

.field final selRes:I

.field final texts:[I

.method constructor <init>(IIIII[II)V
  .registers 9
  .line 45
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 40
    const/4 v0, 0
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Spec;->bgs:[I
  .line 46
    iput p1, p0, Lcom/innioasis/ipp/Bar$Spec;->list:I
  .line 47
    iput p2, p0, Lcom/innioasis/ipp/Bar$Spec;->selRes:I
  .line 48
    iput p3, p0, Lcom/innioasis/ipp/Bar$Spec;->rowRes:I
  .line 49
    iput p4, p0, Lcom/innioasis/ipp/Bar$Spec;->selColor:I
  .line 50
    iput p5, p0, Lcom/innioasis/ipp/Bar$Spec;->rowColor:I
  .line 51
    iput-object p6, p0, Lcom/innioasis/ipp/Bar$Spec;->texts:[I
  .line 52
    iput p7, p0, Lcom/innioasis/ipp/Bar$Spec;->arrow:I
  .line 53
    return-void
.end method
