.class final Lcom/innioasis/ipp/Wake$Cover;
.super Landroid/view/View;
.source "Wake.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wake;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Cover"
.end annotation

.field first:Lcom/innioasis/ipp/Wake$First;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 142
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 143
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Wake$Cover;->setClickable(Z)V
  .line 144
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Wake$Cover;->setFocusable(Z)V
  .line 145
    return-void
.end method
