.class final Lcom/innioasis/ipp/PlGrid$Say;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Say"
.end annotation

.field private final c:Landroid/content/Context;

.field private final res:I

.method constructor <init>(Landroid/content/Context;I)V
  .registers 3
  .line 1488
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1489
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$Say;->c:Landroid/content/Context;
  .line 1490
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Say;->res:I
  .line 1491
    return-void
.end method

.method public run()V
  .registers 4
  .line 1494
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Say;->c:Landroid/content/Context;
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Say;->res:I
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 1495
    return-void
.end method
