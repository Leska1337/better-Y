.class final Lcom/innioasis/ipp/Wake$Remove;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wake.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wake;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Remove"
.end annotation

.field private final v:Landroid/view/View;

.method constructor <init>(Landroid/view/View;)V
  .registers 2
  .line 167
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 168
    iput-object p1, p0, Lcom/innioasis/ipp/Wake$Remove;->v:Landroid/view/View;
  .line 169
    return-void
.end method

.method public run()V
  .registers 2
  .line 172
    iget-object v0, p0, Lcom/innioasis/ipp/Wake$Remove;->v:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Wake;->remove(Landroid/view/View;)V
  .line 173
    return-void
.end method
