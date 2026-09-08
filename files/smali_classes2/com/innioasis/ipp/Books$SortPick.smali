.class public final Lcom/innioasis/ipp/Books$SortPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Books.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Books;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "SortPick"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 185
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 189
    const/4 p1, 1
    if-nez p2, :L0
    const/4 p2, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
  :L1
  .line 190
    nop
  .line 191
    iget-object v0, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
    const v1, 2131820971
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 p2, 1
    goto :L5
  :L2
  .line 192
    iget-object v0, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
    const v1, 2131820969
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    const/4 p2, 2
    goto :L5
  :L3
  .line 193
    iget-object v0, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
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
  .line 194
    iget-object v0, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Books;->access$000(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 195
    iget-object p2, p0, Lcom/innioasis/ipp/Books$SortPick;->a:Landroid/app/Activity;
    invoke-static { p2 }, Lcom/innioasis/ipp/Books;->access$100(Landroid/app/Activity;)V
  :L6
  .line 198
    goto :L8
  :L7
  .line 196
    move-exception p2
  :L8
  .line 199
    return p1
.end method
