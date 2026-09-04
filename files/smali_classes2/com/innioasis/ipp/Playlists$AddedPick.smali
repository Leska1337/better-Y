.class public final Lcom/innioasis/ipp/Playlists$AddedPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Playlists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Playlists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "AddedPick"
.end annotation

.field private final activity:Lcom/innioasis/music/PlayListActivity;

.field private final parent:Lcom/innioasis/music/util/SubMenuDialog;

.method constructor <init>(Lcom/innioasis/music/PlayListActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .registers 3
  .line 353
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 354
    iput-object p1, p0, Lcom/innioasis/ipp/Playlists$AddedPick;->activity:Lcom/innioasis/music/PlayListActivity;
  .line 355
    iput-object p2, p0, Lcom/innioasis/ipp/Playlists$AddedPick;->parent:Lcom/innioasis/music/util/SubMenuDialog;
  .line 356
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 4
  .line 359
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 360
    iget-object p2, p0, Lcom/innioasis/ipp/Playlists$AddedPick;->activity:Lcom/innioasis/music/PlayListActivity;
    const v0, 2131821029
    invoke-virtual { p2, v0 }, Lcom/innioasis/music/PlayListActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    const/4 p2, 1
    if-eqz p1, :L2
    const/4 p1, 2
    goto :L3
  :L2
    const/4 p1, 1
  :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/Playlists;->access$002(I)I
  .line 362
    iget-object p1, p0, Lcom/innioasis/ipp/Playlists$AddedPick;->activity:Lcom/innioasis/music/PlayListActivity;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { p1, v0 }, Lcom/innioasis/music/PlayListActivity;->getSongListBySort(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .line 363
    iget-object p1, p0, Lcom/innioasis/ipp/Playlists$AddedPick;->parent:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz p1, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  :L4
  .line 364
    return p2
.end method
