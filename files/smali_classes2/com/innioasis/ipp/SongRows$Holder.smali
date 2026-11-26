.class final Lcom/innioasis/ipp/SongRows$Holder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Holder"
.end annotation

.field final b:Lcom/innioasis/y1/databinding/ItemSonglistBinding;

.method constructor <init>(Lcom/innioasis/y1/databinding/ItemSonglistBinding;)V
  .registers 3
  .line 612
    invoke-virtual { p1 }, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    move-result-object v0
    invoke-direct { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V
  .line 613
    iput-object p1, p0, Lcom/innioasis/ipp/SongRows$Holder;->b:Lcom/innioasis/y1/databinding/ItemSonglistBinding;
  .line 614
    return-void
.end method
