.class public final Lcom/innioasis/ipp/Folders$SortPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "SortPick"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 794
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 798
    const/4 p1, 1
    if-nez p2, :L0
    const/4 p2, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
  :L1
  .line 799
    nop
  .line 800
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    const v1, 2131820971
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 p2, 1
    goto :L5
  :L2
  .line 801
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    const v1, 2131820969
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    const/4 p2, 2
    goto :L5
  :L3
  .line 802
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    const v1, 2131820970
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L4
    const/4 p2, 3
    goto :L5
  :L4
    const/4 p2, 0
  :L5
  .line 803
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Folders;->access$200(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Folders;->access$300(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 804
    iget-object p2, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    invoke-static { p2 }, Lcom/innioasis/ipp/Folders;->access$400(Landroid/app/Activity;)V
  .line 805
    iget-object p2, p0, Lcom/innioasis/ipp/Folders$SortPick;->a:Landroid/app/Activity;
    invoke-static { p2 }, Lcom/innioasis/ipp/Folders;->access$500(Landroid/app/Activity;)V
  :L6
  .line 808
    goto :L8
  :L7
  .line 806
    move-exception p2
  :L8
  .line 809
    return p1
.end method
