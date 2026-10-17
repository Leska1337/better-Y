.class final Lcom/innioasis/ipp/PlGrid$ViewPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ViewPick"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 99
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$ViewPick;->a:Landroid/app/Activity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 5
  .line 102
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 104
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$ViewPick;->a:Landroid/app/Activity;
    invoke-static { p2 }, Lcom/innioasis/ipp/PlGrid;->access$000(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object p2
  .line 105
    if-eqz p2, :L2
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v0
    if-eqz v0, :L2
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/List;->clear()V
  :L2
  .line 106
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$ViewPick;->a:Landroid/app/Activity;
    const v1, 2131821160
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/PlGrid;->access$100(Landroid/app/Activity;Z)V
  .line 107
    if-eqz p2, :L3
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L3
  .line 108
    const/4 p1, 1
    return p1
.end method
