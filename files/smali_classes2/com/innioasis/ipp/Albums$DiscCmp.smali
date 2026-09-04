.class final Lcom/innioasis/ipp/Albums$DiscCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Albums.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Albums;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "DiscCmp"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 1083
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Albums$1;)V
  .registers 2
  .line 1083
    invoke-direct { p0 }, Lcom/innioasis/ipp/Albums$DiscCmp;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 1085
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->discOf(Ljava/lang/String;)I
    move-result p1
  .line 1086
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->discOf(Ljava/lang/String;)I
    move-result p2
  .line 1087
    if-ge p1, p2, :L0
    const/4 p1, -1
    goto :L2
  :L0
    if-le p1, p2, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
    return p1
.end method
