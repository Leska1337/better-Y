.class public final Lcom/innioasis/ipp/Feat;
.super Ljava/lang/Object;
.source "Feat.java"

.method public constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static artist(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 47
    invoke-static { p0 }, Lcom/innioasis/ipp/Feat;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static featEnabled()Z
  .registers 1
  .line 39
    const-string v0, "feat_in_title"
    invoke-static { v0 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static first(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 58
    if-eqz p0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Feat;->hideEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 59
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
  .line 60
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L1
    return-object p0
  :L1
  .line 61
    const/4 p0, 0
    invoke-interface { v0, p0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
  :L2
  .line 58
    return-object p0
.end method

.method public static hideEnabled()Z
  .registers 1
  .line 34
    const-string v0, "first_artist_only"
    invoke-static { v0 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static pref(Ljava/lang/String;)Z
  .registers 2
  .line 27
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 28
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 29
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static title(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 72
    if-eqz p0, :L11
    if-nez p1, :L0
    goto/16 :L11
  :L0
  .line 73
    invoke-static { }, Lcom/innioasis/ipp/Feat;->hideEnabled()Z
    move-result v0
    if-eqz v0, :L10
    invoke-static { }, Lcom/innioasis/ipp/Feat;->featEnabled()Z
    move-result v0
    if-nez v0, :L1
    goto/16 :L10
  :L1
  .line 74
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p1
  .line 75
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L2
    return-object p0
  :L2
  .line 77
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  .line 78
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 79
    const/4 v2, 1
  :L3
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 80
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 81
    if-eqz v3, :L7
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L4
    goto :L7
  :L4
  .line 82
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v3, v4 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v4
    if-ltz v4, :L5
    return-object p0
  :L5
  .line 83
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L6
    const-string v4, ", "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L6
  .line 84
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L7
  .line 79
    add-int/lit8 v2, v2, 1
    goto :L3
  :L8
  .line 86
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->length()I
    move-result p1
    if-nez p1, :L9
    return-object p0
  :L9
  .line 87
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " (feat. "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, ")"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L10
  .line 73
    return-object p0
  :L11
  .line 72
    return-object p0
.end method
