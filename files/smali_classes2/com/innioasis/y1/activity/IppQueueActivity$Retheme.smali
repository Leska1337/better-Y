.class final Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Retheme"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1236
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    return-void
.end method

.method public run()V
  .registers 4
  .line 1238
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1239
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$000(Lcom/innioasis/y1/activity/IppQueueActivity;)I
    move-result v0
  .line 1240
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$100(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v1
    if-eqz v1, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$100(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v1
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v2
    or-int/2addr v2, v0
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  :L1
  .line 1241
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$200(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$200(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/view/View;
    move-result-object v1
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v2
    or-int/2addr v2, v0
    invoke-virtual { v1, v2 }, Landroid/view/View;->setBackgroundColor(I)V
  :L2
  .line 1242
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$300(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v1
    if-eqz v1, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$300(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v1
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$400()I
    move-result v2
    or-int/2addr v0, v2
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  :L3
  .line 1243
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-direct { v1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$502(Lcom/innioasis/y1/activity/IppQueueActivity;Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;)Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
  .line 1244
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$600(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$500(Lcom/innioasis/y1/activity/IppQueueActivity;)Lcom/innioasis/y1/activity/IppQueueActivity$QAdapter;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 1245
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1246
    return-void
.end method
