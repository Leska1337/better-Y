.class public final Lcom/innioasis/ipp/Likes;
.super Ljava/lang/Object;
.source "Likes.java"

.method private constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static get(Ljava/lang/String;)Z
  .registers 3
  .line 40
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 41
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 42
    if-eqz v1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Likes;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v1, p0, v0 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result p0
    if-eqz p0, :L1
    const/4 v0, 1
  :L1
    return v0
.end method

.method private static isFav(Ljava/util/UUID;)Z
  .registers 2
  .line 84
    if-eqz p0, :L0
    const-string v0, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-virtual { p0 }, Ljava/util/UUID;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static key(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 36
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "like:"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static noteAdd(Ljava/util/List;Ljava/util/UUID;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 55
    if-eqz p0, :L7
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Likes;->isFav(Ljava/util/UUID;)Z
    move-result p1
    if-nez p1, :L1
    goto :L7
  :L1
  .line 56
    const/4 p1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L4
  .line 57
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 58
    instance-of v1, v0, Lcom/innioasis/y1/database/Song;
    if-eqz v1, :L3
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Likes;->set(Ljava/lang/String;Z)V
  :L3
  .line 56
    add-int/lit8 p1, p1, 1
    goto :L2
  :L4
  .line 62
    goto :L6
  :L5
  .line 60
    move-exception p0
  :L6
  .line 63
    return-void
  :L7
  .line 55
    return-void
.end method

.method public static noteRemove(Ljava/lang/String;Ljava/util/UUID;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  .line 72
    if-eqz p0, :L6
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Likes;->isFav(Ljava/util/UUID;)Z
    move-result p1
    if-nez p1, :L1
    goto :L6
  :L1
  .line 73
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p1
  .line 74
    if-nez p1, :L2
    return-void
  :L2
  .line 75
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongBySongIdSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 76
    if-eqz p0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    const/4 p1, 0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Likes;->set(Ljava/lang/String;Z)V
  :L3
  .line 79
    goto :L5
  :L4
  .line 77
    move-exception p0
  :L5
  .line 80
    return-void
  :L6
  .line 72
    return-void
.end method

.method public static set(Ljava/lang/String;Z)V
  .registers 3
  .line 46
    if-nez p0, :L0
    return-void
  :L0
  .line 47
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 48
    if-nez v0, :L1
    return-void
  :L1
  .line 49
    invoke-static { p0 }, Lcom/innioasis/ipp/Likes;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0, p1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .line 50
    return-void
.end method
