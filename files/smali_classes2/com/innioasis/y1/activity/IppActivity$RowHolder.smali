.class final Lcom/innioasis/y1/activity/IppActivity$RowHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "RowHolder"
.end annotation

.field final arrow:Landroid/widget/ImageView;

.field item:I

.field final label:Landroid/widget/TextView;

.field final line:Landroid/widget/LinearLayout;

.field final mark:Landroid/widget/TextView;

.field final value:Landroid/widget/TextView;

.method constructor <init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V
  .registers 7
  .line 995
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V
  .line 996
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->line:Landroid/widget/LinearLayout;
  .line 997
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->mark:Landroid/widget/TextView;
  .line 998
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->label:Landroid/widget/TextView;
  .line 999
    iput-object p5, p0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->value:Landroid/widget/TextView;
  .line 1000
    iput-object p6, p0, Lcom/innioasis/y1/activity/IppActivity$RowHolder;->arrow:Landroid/widget/ImageView;
  .line 1001
    return-void
.end method
