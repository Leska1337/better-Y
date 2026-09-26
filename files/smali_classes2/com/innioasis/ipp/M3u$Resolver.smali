.class public final Lcom/innioasis/ipp/M3u$Resolver;
.super Ljava/lang/Object;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Resolver"
.end annotation

.field private byFile:Ljava/util/HashMap;

.field private byInfo:Ljava/util/HashMap;

.field private byPath:Ljava/util/HashMap;

.field private byTitle:Ljava/util/HashMap;

.field private final repo:Lcom/innioasis/y1/database/Y1Repository;

.method public constructor <init>()V
  .registers 2
  .line 907
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 908
    invoke-static { }, Lcom/innioasis/ipp/M3u;->access$500()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->repo:Lcom/innioasis/y1/database/Y1Repository;
    return-void
.end method

.method private static add(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V
  .registers 4
  .line 995
    if-eqz p1, :L2
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 996
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/util/List;
  .line 997
    if-nez v0, :L1
  .line 998
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 999
    invoke-virtual { p0, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 1001
    invoke-interface { v0, p2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 1002
    return-void
  :L2
  .line 995
    return-void
.end method

.method private build()V
  .registers 10
  .line 1005
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byPath:Ljava/util/HashMap;
    if-eqz v0, :L0
    return-void
  :L0
  .line 1006
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byPath:Ljava/util/HashMap;
  .line 1007
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byFile:Ljava/util/HashMap;
  .line 1008
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byInfo:Ljava/util/HashMap;
  .line 1009
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byTitle:Ljava/util/HashMap;
  .line 1010
    const/4 v0, 0
    const/4 v1, 0
  :L1
    const/4 v2, 1
    if-gt v1, v2, :L8
  .line 1011
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Resolver;->repo:Lcom/innioasis/y1/database/Y1Repository;
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
  .line 1012
    const/4 v3, 0
  :L2
    if-eqz v2, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L7
  .line 1013
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1014
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L3
    goto :L6
  :L3
  .line 1015
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1016
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
  .line 1017
    if-nez v6, :L4
    goto :L6
  :L4
  .line 1018
    iget-object v7, p0, Lcom/innioasis/ipp/M3u$Resolver;->byPath:Ljava/util/HashMap;
    invoke-virtual { v6 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7, v8, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 1019
    iget-object v7, p0, Lcom/innioasis/ipp/M3u$Resolver;->byFile:Ljava/util/HashMap;
    invoke-static { v6 }, Lcom/innioasis/ipp/M3u;->access$600(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v6
    invoke-static { v7, v6, v4 }, Lcom/innioasis/ipp/M3u$Resolver;->add(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V
  .line 1020
    sget-object v6, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/M3u;->access$800(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 1021
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v7
    if-nez v7, :L5
    goto :L6
  :L5
  .line 1022
    sget-object v7, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v7, v5 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/M3u;->access$800(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 1023
    iget-object v7, p0, Lcom/innioasis/ipp/M3u$Resolver;->byTitle:Ljava/util/HashMap;
    invoke-static { v6 }, Lcom/innioasis/ipp/M3u$Resolver;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-static { v7, v8, v4 }, Lcom/innioasis/ipp/M3u$Resolver;->add(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V
  .line 1024
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v7
    if-lez v7, :L6
    iget-object v7, p0, Lcom/innioasis/ipp/M3u$Resolver;->byInfo:Ljava/util/HashMap;
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v8, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v8, " - "
    invoke-virtual { v5, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/M3u$Resolver;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v7, v5, v4 }, Lcom/innioasis/ipp/M3u$Resolver;->add(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V
  :L6
  .line 1012
    add-int/lit8 v3, v3, 1
    goto/16 :L2
  :L7
  .line 1010
    add-int/lit8 v1, v1, 1
    goto/16 :L1
  :L8
  .line 1027
    return-void
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 991
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    const/16 v0, 59
    const/16 v1, 44
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    const-string v0, "\\s+"
    const-string v1, " "
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pick(Ljava/util/List;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
  .registers 8
  .line 974
    const/4 v0, 0
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    goto :L7
  :L0
  .line 975
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    const/4 v3, 0
    if-ne v1, v2, :L1
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
    return-object p0
  :L1
  .line 976
    nop
  .line 977
    nop
  .line 978
    const/4 v1, 0
    const/4 v2, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v1, v4, :L6
  .line 979
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 980
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/M3u;->access$700(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { p1, v5 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
  .line 981
    if-nez v5, :L3
    const/4 v5, 0
    goto :L4
  :L3
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
  :L4
  .line 982
    if-le v5, v2, :L5
  .line 983
    nop
  .line 984
    move-object v0, v4
    move v2, v5
  :L5
  .line 978
    add-int/lit8 v1, v1, 1
    goto :L2
  :L6
  .line 987
    return-object v0
  :L7
  .line 974
    return-object v0
.end method

.method byInfo(Ljava/lang/String;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
  .registers 8
  .line 956
    const/4 v0, 0
    if-eqz p1, :L5
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L0
    goto :L5
  :L0
  .line 957
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Resolver;->build()V
  .line 958
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u$Resolver;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 959
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Resolver;->byInfo:Ljava/util/HashMap;
    invoke-virtual { v1, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/util/List;
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/M3u$Resolver;->pick(Ljava/util/List;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  .line 960
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 963
    const-string v1, " - "
    invoke-virtual { p1, v1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
  :L2
  .line 964
    if-ltz v2, :L4
  .line 965
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Resolver;->byTitle:Ljava/util/HashMap;
    add-int/lit8 v2, v2, 3
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/List;
    invoke-static { v3, p2 }, Lcom/innioasis/ipp/M3u$Resolver;->pick(Ljava/util/List;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 966
    if-eqz v3, :L3
    return-object v3
  :L3
  .line 967
    invoke-virtual { p1, v1, v2 }, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v2
    goto :L2
  :L4
  .line 969
    return-object v0
  :L5
  .line 956
    return-object v0
.end method

.method byName(Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/innioasis/y1/database/Song;
  .registers 12
  .line 934
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Resolver;->build()V
  .line 935
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->pct(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/16 v0, 92
    const/16 v1, 47
    invoke-virtual { p1, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p1
  .line 936
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Resolver;->byFile:Ljava/util/HashMap;
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->access$600(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/util/List;
  .line 937
    const/4 v1, 0
    if-eqz v0, :L7
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L0
    goto :L7
  :L0
  .line 938
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 0
    const/4 v4, 1
    if-ne v2, v4, :L1
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/database/Song;
    return-object p1
  :L1
  .line 939
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->access$700(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->access$600(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p1
  .line 940
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v2
    if-lez v2, :L5
  .line 941
    nop
  .line 942
    nop
  .line 943
    move-object v5, v1
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v3, v6, :L4
  .line 944
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 945
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/M3u;->access$700(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/M3u;->access$600(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { p1, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L3
  .line 946
    nop
  .line 947
    add-int/lit8 v2, v2, 1
    move-object v5, v6
  :L3
  .line 943
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 950
    if-ne v2, v4, :L5
    return-object v5
  :L5
  .line 952
    if-eqz p3, :L6
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/M3u$Resolver;->pick(Ljava/util/List;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L6
    return-object v1
  :L7
  .line 937
    return-object v1
.end method

.method byPath(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 6
  .line 915
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->candidates(Ljava/lang/String;)Ljava/util/List;
    move-result-object p1
  .line 916
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 917
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Resolver;->repo:Lcom/innioasis/y1/database/Y1Repository;
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  .line 918
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 916
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 920
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Resolver;->build()V
  .line 921
    nop
  :L3
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L5
  .line 922
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Resolver;->byPath:Ljava/util/HashMap;
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    invoke-virtual { v2 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 923
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L4
    check-cast v1, Lcom/innioasis/y1/database/Song;
    return-object v1
  :L4
  .line 921
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 925
    const/4 p1, 0
    return-object p1
.end method
