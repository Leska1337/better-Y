.class final Lcom/innioasis/ipp/Artists$Pick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Artists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Artists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Pick"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final parent:Lcom/innioasis/music/util/SubMenuDialog;

.method constructor <init>(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .registers 3
  .line 656
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 657
    iput-object p1, p0, Lcom/innioasis/ipp/Artists$Pick;->a:Landroid/app/Activity;
  .line 658
    iput-object p2, p0, Lcom/innioasis/ipp/Artists$Pick;->parent:Lcom/innioasis/music/util/SubMenuDialog;
  .line 659
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 662
    iget-object p1, p0, Lcom/innioasis/ipp/Artists$Pick;->parent:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz p1, :L3
  :L0
  .line 664
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  :L1
  .line 667
    goto :L3
  :L2
  .line 665
    move-exception p1
  :L3
  .line 669
    if-eqz p2, :L4
    iget-object p1, p0, Lcom/innioasis/ipp/Artists$Pick;->a:Landroid/app/Activity;
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Artists;->open(Landroid/app/Activity;Ljava/lang/String;)V
  :L4
  .line 670
    const/4 p1, 1
    return p1
.end method
