.class final Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "RowHolder"
.end annotation

.field final dot:Landroid/widget/ImageView;

.field final hair:Landroid/view/View;

.field final line:Landroid/widget/LinearLayout;

.field row:I

.field final title:Landroid/widget/TextView;

.method constructor <init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/view/View;)V
  .registers 6
  .line 1289
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V
  .line 1290
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->line:Landroid/widget/LinearLayout;
  .line 1291
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->dot:Landroid/widget/ImageView;
  .line 1292
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->title:Landroid/widget/TextView;
  .line 1293
    iput-object p5, p0, Lcom/innioasis/y1/activity/IppQueueActivity$RowHolder;->hair:Landroid/view/View;
  .line 1294
    return-void
.end method
