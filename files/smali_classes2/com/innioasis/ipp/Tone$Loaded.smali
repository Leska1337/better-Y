.class final Lcom/innioasis/ipp/Tone$Loaded;
.super Ljava/lang/Object;
.implements Landroid/media/SoundPool$OnLoadCompleteListener;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Loaded"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 224
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onLoadComplete(Landroid/media/SoundPool;II)V
  .registers 11
  .line 227
    if-eqz p3, :L0
    return-void
  :L0
  .line 228
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$000()Ljava/util/HashMap;
    move-result-object p3
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p3, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 229
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$100()I
    move-result p3
    if-ne p2, p3, :L1
  .line 230
    const/4 p3, 0
    invoke-static { p3 }, Lcom/innioasis/ipp/Tone;->access$102(I)I
  .line 231
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$300()F
    move-result v2
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$300()F
    move-result v3
    const/4 v4, 1
    const/4 v5, 0
    const/high16 v6, 0x3F800000
    move-object v0, p1
    move v1, p2
    invoke-virtual/range { v0 .. v6 }, Landroid/media/SoundPool;->play(IFFIIF)I
    move-result p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->access$202(I)I
  :L1
  .line 233
    return-void
.end method
