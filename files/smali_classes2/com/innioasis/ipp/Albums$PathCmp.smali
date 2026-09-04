.class final Lcom/innioasis/ipp/Albums$PathCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Albums.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Albums;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "PathCmp"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 1149
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Albums$1;)V
  .registers 2
  .line 1149
    invoke-direct { p0 }, Lcom/innioasis/ipp/Albums$PathCmp;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 1151
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 1152
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p2
  .line 1153
    const-string v0, ""
    if-nez p1, :L0
    move-object p1, v0
  :L0
    if-nez p2, :L1
    move-object p2, v0
  :L1
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method
