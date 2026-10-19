.class final Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "CapHolder"
.end annotation

.field final text:Landroid/widget/TextView;

.method constructor <init>(Landroid/view/View;Landroid/widget/TextView;)V
  .registers 3
  .line 1301
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V
  .line 1302
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$CapHolder;->text:Landroid/widget/TextView;
  .line 1303
    return-void
.end method
