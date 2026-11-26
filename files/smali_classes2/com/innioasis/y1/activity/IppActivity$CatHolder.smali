.class final Lcom/innioasis/y1/activity/IppActivity$CatHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "CatHolder"
.end annotation

.field final arrow:Landroid/widget/ImageView;

.field final label:Landroid/widget/TextView;

.method constructor <init>(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/ImageView;)V
  .registers 4
  .line 979
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V
  .line 980
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->label:Landroid/widget/TextView;
  .line 981
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$CatHolder;->arrow:Landroid/widget/ImageView;
  .line 982
    return-void
.end method
