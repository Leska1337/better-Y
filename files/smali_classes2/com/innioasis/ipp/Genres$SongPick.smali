.class public final Lcom/innioasis/ipp/Genres$SongPick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "SongPick"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.field private final asc:I

.field private final desc:I

.method constructor <init>(Lcom/innioasis/music/GenresActivity;II)V
  .registers 4
  .line 780
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$SongPick;->a:Lcom/innioasis/music/GenresActivity;
    iput p2, p0, Lcom/innioasis/ipp/Genres$SongPick;->asc:I
    iput p3, p0, Lcom/innioasis/ipp/Genres$SongPick;->desc:I
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 5
  .line 783
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 784
    iget p2, p0, Lcom/innioasis/ipp/Genres$SongPick;->asc:I
  .line 785
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$SongPick;->a:Lcom/innioasis/music/GenresActivity;
    const v1, 2131820971
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    iget p2, p0, Lcom/innioasis/ipp/Genres$SongPick;->desc:I
    goto :L4
  :L2
  .line 786
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$SongPick;->a:Lcom/innioasis/music/GenresActivity;
    const v1, 2131820969
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    const/4 p2, 4
    goto :L4
  :L3
  .line 787
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$SongPick;->a:Lcom/innioasis/music/GenresActivity;
    const v1, 2131820970
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L4
    const/4 p2, 5
  :L4
  .line 788
    iget-object p1, p0, Lcom/innioasis/ipp/Genres$SongPick;->a:Lcom/innioasis/music/GenresActivity;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Genres;->access$300(Lcom/innioasis/music/GenresActivity;I)V
  .line 789
    invoke-static { }, Lcom/innioasis/ipp/Genres;->access$200()Lcom/innioasis/music/util/SubMenuDialog;
    move-result-object p1
    if-eqz p1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Genres;->access$200()Lcom/innioasis/music/util/SubMenuDialog;
    move-result-object p1
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  :L5
  .line 790
    const/4 p1, 1
    return p1
.end method
