.class final Lcom/innioasis/ipp/Tone$Job;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Job"
.end annotation

.field private final gain:F

.field private final kind:I

.field private final path:Ljava/lang/String;

.method constructor <init>(ILjava/lang/String;F)V
  .registers 4
  .line 226
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 227
    iput p1, p0, Lcom/innioasis/ipp/Tone$Job;->kind:I
  .line 228
    iput-object p2, p0, Lcom/innioasis/ipp/Tone$Job;->path:Ljava/lang/String;
  .line 229
    iput p3, p0, Lcom/innioasis/ipp/Tone$Job;->gain:F
  .line 230
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 234
    iget v0, p0, Lcom/innioasis/ipp/Tone$Job;->kind:I
    const/4 v1, 1
    if-ne v0, v1, :L1
    iget-object v0, p0, Lcom/innioasis/ipp/Tone$Job;->path:Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/ipp/Tone$Job;->gain:F
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Tone;->access$000(Ljava/lang/String;F)V
    goto :L2
  :L1
  .line 235
    iget-object v0, p0, Lcom/innioasis/ipp/Tone$Job;->path:Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/ipp/Tone$Job;->gain:F
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Tone;->access$100(Ljava/lang/String;F)V
  :L2
  .line 236
    iget v0, p0, Lcom/innioasis/ipp/Tone$Job;->kind:I
    const/4 v1, 2
    if-ne v0, v1, :L3
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Tone;->access$202(I)I
  :L3
  .line 238
    goto :L5
  :L4
  .line 237
    move-exception v0
  :L5
  .line 239
    return-void
.end method
