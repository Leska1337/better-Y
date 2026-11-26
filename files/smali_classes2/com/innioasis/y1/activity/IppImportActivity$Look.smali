.class final Lcom/innioasis/y1/activity/IppImportActivity$Look;
.super Lcom/innioasis/ipp/Column$Painter;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppImportActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Look"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppImportActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .registers 2
  .line 213
    invoke-direct { p0 }, Lcom/innioasis/ipp/Column$Painter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$Look;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    return-void
.end method

.method public paint(I)V
  .registers 3
  .line 215
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$Look;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
    return-void
.end method
