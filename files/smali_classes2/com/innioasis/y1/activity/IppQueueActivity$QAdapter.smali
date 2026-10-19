.class final Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.implements Lcom/innioasis/ipp/Bar$Ticks;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "QAdapter"
.end annotation

.field private final static CAPTION:I = 1

.field private final static ROW:I

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1255
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
  .line 1256
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1257
    return-void
.end method

.method public getItemCount()I
  .registers 2
  .line 1260
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$700(Lcom/innioasis/y1/activity/IppQueueActivity;)[I
    move-result-object v0
    array-length v0, v0
    return v0
.end method

.method public getItemViewType(I)I
  .registers 3
  .line 1264
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$700(Lcom/innioasis/y1/activity/IppQueueActivity;)[I
    move-result-object v0
    aget p1, v0, p1
    if-gez p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .registers 4
  .line 1272
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bindRow(Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;I)V
    goto :L1
  :L0
  .line 1273
    instance-of v0, p1, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    check-cast p1, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bindCaption(Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;I)V
  :L1
  .line 1274
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 3
  .line 1268
    const/4 p1, 1
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->newCaption()Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
    move-result-object p1
    goto :L1
  :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->newRow()Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
    move-result-object p1
  :L1
    return-object p1
.end method

.method public ticked(I)Z
  .registers 4
  .line 1277
    if-ltz p1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$700(Lcom/innioasis/y1/activity/IppQueueActivity;)[I
    move-result-object v0
    array-length v0, v0
    if-ge p1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$800(Lcom/innioasis/y1/activity/IppQueueActivity;)Ljava/util/HashSet;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$700(Lcom/innioasis/y1/activity/IppQueueActivity;)[I
    move-result-object v1
    aget p1, v1, p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method
