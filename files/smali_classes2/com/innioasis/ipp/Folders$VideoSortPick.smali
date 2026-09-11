.class public final Lcom/innioasis/ipp/Folders$VideoSortPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "VideoSortPick"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 753
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Folders$VideoSortPick;->a:Landroid/app/Activity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 757
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 758
    sget-object p2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 759
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$VideoSortPick;->a:Landroid/app/Activity;
    const v1, 2131820971
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    sget-object p2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    goto :L4
  :L2
  .line 760
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$VideoSortPick;->a:Landroid/app/Activity;
    const v1, 2131820969
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    sget-object p2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Asc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    goto :L4
  :L3
  .line 761
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$VideoSortPick;->a:Landroid/app/Activity;
    const v1, 2131820970
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L4
    sget-object p2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Desc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  :L4
  .line 762
    sget-object p1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result p2
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setVideoSort(I)V
  .line 763
    iget-object p1, p0, Lcom/innioasis/ipp/Folders$VideoSortPick;->a:Landroid/app/Activity;
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->access$100(Landroid/app/Activity;)V
  :L5
  .line 766
    goto :L7
  :L6
  .line 764
    move-exception p1
  :L7
  .line 767
    const/4 p1, 1
    return p1
.end method
