.class final Lcom/innioasis/y1/activity/IppActivity$CatAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "CatAdapter"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 944
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public getItemCount()I
  .registers 2
  .line 946
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$000(Lcom/innioasis/y1/activity/IppActivity;)[I
    move-result-object v0
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$000(Lcom/innioasis/y1/activity/IppActivity;)[I
    move-result-object v0
    array-length v0, v0
  :L1
    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .registers 4
  .line 953
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$CatHolder;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/y1/activity/IppActivity;->bindCat(Lcom/innioasis/y1/activity/IppActivity$CatHolder;I)V
  .line 954
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 3
  .line 949
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$CatAdapter;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { p2, p1 }, Lcom/innioasis/y1/activity/IppActivity;->newCat(Landroid/view/ViewGroup;)Lcom/innioasis/y1/activity/IppActivity$CatHolder;
    move-result-object p1
    return-object p1
.end method
