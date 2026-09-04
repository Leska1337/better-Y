.class final Lcom/innioasis/ipp/Playlists$AddedCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Playlists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Playlists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "AddedCmp"
.end annotation

.field private final desc:Z

.field private final order:Ljava/util/HashMap;

.method constructor <init>(Ljava/util/HashMap;Z)V
  .registers 3
  .line 409
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 410
    iput-object p1, p0, Lcom/innioasis/ipp/Playlists$AddedCmp;->order:Ljava/util/HashMap;
  .line 411
    iput-boolean p2, p0, Lcom/innioasis/ipp/Playlists$AddedCmp;->desc:Z
  .line 412
    return-void
.end method

.method private rank(Ljava/lang/Object;)I
  .registers 4
  .line 415
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    const/4 v1, -1
    if-nez v0, :L0
    return v1
  :L0
  .line 416
    iget-object v0, p0, Lcom/innioasis/ipp/Playlists$AddedCmp;->order:Ljava/util/HashMap;
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 417
    instance-of v0, p1, Ljava/lang/Integer;
    if-eqz v0, :L1
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L1
    return v1
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 421
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Playlists$AddedCmp;->rank(Ljava/lang/Object;)I
    move-result p1
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Playlists$AddedCmp;->rank(Ljava/lang/Object;)I
    move-result p2
  .line 423
    if-ltz p1, :L3
    if-gez p2, :L0
    goto :L3
  :L0
  .line 424
    iget-boolean v0, p0, Lcom/innioasis/ipp/Playlists$AddedCmp;->desc:Z
    if-eqz v0, :L1
    sub-int/2addr p2, p1
    goto :L2
  :L1
    sub-int p2, p1, p2
  :L2
    return p2
  :L3
  .line 423
    if-gez p1, :L4
    if-gez p2, :L4
    const/4 p1, 0
    goto :L6
  :L4
    if-gez p1, :L5
    const/4 p1, 1
    goto :L6
  :L5
    const/4 p1, -1
  :L6
    return p1
.end method
