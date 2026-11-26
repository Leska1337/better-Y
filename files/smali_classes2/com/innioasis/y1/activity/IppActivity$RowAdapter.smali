.class final Lcom/innioasis/y1/activity/IppActivity$RowAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "RowAdapter"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 961
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public getItemCount()I
  .registers 2
  .line 963
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$100(Lcom/innioasis/y1/activity/IppActivity;)[I
    move-result-object v0
    array-length v0, v0
    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .registers 4
  .line 970
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$RowHolder;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/y1/activity/IppActivity;->bindRow(Lcom/innioasis/y1/activity/IppActivity$RowHolder;I)V
  .line 971
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 3
  .line 966
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RowAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppActivity;->newRow()Lcom/innioasis/y1/activity/IppActivity$RowHolder;
    move-result-object p1
    return-object p1
.end method
