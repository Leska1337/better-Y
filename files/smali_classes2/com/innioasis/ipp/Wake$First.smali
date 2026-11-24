.class final Lcom/innioasis/ipp/Wake$First;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Wake.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wake;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "First"
.end annotation

.field private final c:Lcom/innioasis/ipp/Wake$Cover;

.method constructor <init>(Lcom/innioasis/ipp/Wake$Cover;)V
  .registers 2
  .line 151
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 152
    iput-object p1, p0, Lcom/innioasis/ipp/Wake$First;->c:Lcom/innioasis/ipp/Wake$Cover;
  .line 153
    return-void
.end method

.method public onPreDraw()Z
  .registers 2
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/Wake;->access$000()Z
    move-result v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Wake$First;->c:Lcom/innioasis/ipp/Wake$Cover;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Wake$Cover;->isShown()Z
    move-result v0
    if-eqz v0, :L0
  .line 157
    iget-object v0, p0, Lcom/innioasis/ipp/Wake$First;->c:Lcom/innioasis/ipp/Wake$Cover;
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->access$200(Lcom/innioasis/ipp/Wake$Cover;)V
  .line 158
    iget-object v0, p0, Lcom/innioasis/ipp/Wake$First;->c:Lcom/innioasis/ipp/Wake$Cover;
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->drawn(Lcom/innioasis/ipp/Wake$Cover;)V
  :L0
  .line 160
    const/4 v0, 1
    return v0
.end method
