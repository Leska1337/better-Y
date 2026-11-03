.class public Lcom/innioasis/ipp/Nothing;
.super Lcom/innioasis/ipp/Outline;
.source "Nothing.java"

.method public constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 14
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Outline;-><init>(Landroid/content/Context;)V
  .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 18
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Outline;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 22
    invoke-direct { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Outline;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 23
    return-void
.end method

.method protected onAttachedToWindow()V
  .registers 1
  .line 27
    invoke-super { p0 }, Lcom/innioasis/ipp/Outline;->onAttachedToWindow()V
  .line 28
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->nothing(Landroid/widget/TextView;)V
  .line 29
    return-void
.end method
