.class public final Lcom/innioasis/ipp/Playlists$VideoAddedPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Playlists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Playlists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "VideoAddedPick"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 487
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Playlists$VideoAddedPick;->a:Landroid/app/Activity;
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 491
    const/4 p1, 1
    if-nez p2, :L0
    const/4 p2, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p2
  :L1
  .line 492
    iget-object v0, p0, Lcom/innioasis/ipp/Playlists$VideoAddedPick;->a:Landroid/app/Activity;
    const v1, 2131821029
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L2
    const/4 p2, 2
    goto :L3
  :L2
    const/4 p2, 1
  :L3
    invoke-static { p2 }, Lcom/innioasis/ipp/Playlists;->access$100(I)V
  .line 495
    invoke-static { p1 }, Lcom/innioasis/ipp/Playlists;->access$202(Z)Z
  .line 496
    sget-object p2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->None:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 497
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v0
  .line 496
    invoke-virtual { p2, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setVideoSort(I)V
  .line 498
    iget-object p2, p0, Lcom/innioasis/ipp/Playlists$VideoAddedPick;->a:Landroid/app/Activity;
    invoke-static { p2 }, Lcom/innioasis/ipp/Playlists;->access$300(Landroid/app/Activity;)V
  :L4
  .line 501
    goto :L6
  :L5
  .line 499
    move-exception p2
  :L6
  .line 502
    return p1
.end method
