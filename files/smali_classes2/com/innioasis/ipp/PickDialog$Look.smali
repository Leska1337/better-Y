.class final Lcom/innioasis/ipp/PickDialog$Look;
.super Lcom/innioasis/ipp/Column$Painter;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PickDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Look"
.end annotation

.field private final d:Lcom/innioasis/ipp/PickDialog;

.method constructor <init>(Lcom/innioasis/ipp/PickDialog;)V
  .registers 2
  .line 208
    invoke-direct { p0 }, Lcom/innioasis/ipp/Column$Painter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Look;->d:Lcom/innioasis/ipp/PickDialog;
    return-void
.end method

.method public paint(I)V
  .registers 3
  .line 210
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Look;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;I)V
    return-void
.end method
