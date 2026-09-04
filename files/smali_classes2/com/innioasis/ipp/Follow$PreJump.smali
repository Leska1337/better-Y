.class final Lcom/innioasis/ipp/Follow$PreJump;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Follow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Follow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "PreJump"
.end annotation

.field private final a:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final lv:Landroid/widget/ListView;

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .registers 3
  .line 753
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 754
    iput-object p1, p0, Lcom/innioasis/ipp/Follow$PreJump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 755
    iput-object p2, p0, Lcom/innioasis/ipp/Follow$PreJump;->lv:Landroid/widget/ListView;
  .line 756
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L4 .. :L7 } :L8
  .registers 5
  :L0
  .line 761
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$PreJump;->lv:Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 764
    goto :L3
  :L2
  .line 762
    move-exception v0
  :L3
  .line 766
    const/4 v0, 1
  :L4
    invoke-static { }, Lcom/innioasis/ipp/Follow;->access$300()Ljava/lang/String;
    move-result-object v1
  .line 767
    if-nez v1, :L5
    return v0
  :L5
  .line 768
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$PreJump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Follow;->access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v1
  .line 769
    if-gez v1, :L6
    return v0
  :L6
  .line 770
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$PreJump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iget-object v3, p0, Lcom/innioasis/ipp/Follow$PreJump;->lv:Landroid/widget/ListView;
    invoke-static { v2, v3, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L7
  .line 773
    nop
  .line 774
    const/4 v0, 0
    return v0
  :L8
  .line 771
    move-exception v1
  .line 772
    return v0
.end method
