.class final Lcom/innioasis/y1/activity/IppImportActivity$Ticker;
.super Lcom/innioasis/ipp/M3u$Tick;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppImportActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Ticker"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppImportActivity;

.field base:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .registers 2
  .line 640
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Tick;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    return-void
.end method

.method public tick(Lcom/innioasis/ipp/M3u$Plan;I)V
  .registers 4
  .line 643
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->base:I
    add-int/2addr v0, p2
    iput v0, p1, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
  .line 644
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->a:Lcom/innioasis/y1/activity/IppImportActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->tick()V
  .line 645
    return-void
.end method
