.class final Lcom/innioasis/ipp/AlbumArtists$NormCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "AlbumArtists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumArtists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NormCmp"
.end annotation

.field private final rev:Z

.method constructor <init>(Z)V
  .registers 2
  .line 241
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/AlbumArtists$NormCmp;->rev:Z
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 243
    check-cast p1, Ljava/lang/String;
    check-cast p2, Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
  .line 244
    iget-boolean p2, p0, Lcom/innioasis/ipp/AlbumArtists$NormCmp;->rev:Z
    if-eqz p2, :L0
    neg-int p1, p1
  :L0
    return p1
.end method
