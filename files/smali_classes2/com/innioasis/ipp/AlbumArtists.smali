.class public final Lcom/innioasis/ipp/AlbumArtists;
.super Ljava/lang/Object;
.source "AlbumArtists.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/AlbumArtists$Reader;,
    Lcom/innioasis/ipp/AlbumArtists$NormCmp;
  }
.end annotation

.field public final static EXTRA:Ljava/lang/String; = "ipp_album_artists"

.field public final static KEY:Ljava/lang/String; = "album_artists"

.field private final static MARK:C = '\u0004'

.field private static albumSongs:Ljava/util/HashMap;

.field private static keyToNorm:Ljava/util/HashMap;

.field private static memoAll:Ljava/util/List;

.field private static memoGen:I

.field private static names:Ljava/util/LinkedHashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 117
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static declared-synchronized build()Z
  .catchall { :L0 .. :L1 } :L20
  .catchall { :L2 .. :L3 } :L20
  .catchall { :L4 .. :L19 } :L20
  .registers 15
    const-class v0, Lcom/innioasis/ipp/AlbumArtists;
    monitor-enter v0
  :L0
  .line 128
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  :L1
  .line 129
    const/4 v2, 0
    if-nez v1, :L2
    monitor-exit v0
    return v2
  :L2
  .line 130
    sget-object v3, Lcom/innioasis/ipp/AlbumArtists;->memoAll:Ljava/util/List;
    const/4 v4, 1
    if-ne v1, v3, :L4
    sget v3, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v5
    if-ne v3, v5, :L4
    sget-object v3, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  :L3
    if-eqz v3, :L4
    monitor-exit v0
    return v4
  :L4
  .line 132
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumTags;->index(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v3
  .line 133
    invoke-static { v3 }, Lcom/innioasis/ipp/AlbumArtists;->readMissing(Ljava/util/HashMap;)V
  .line 135
    new-instance v5, Ljava/util/HashMap;
    invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
  .line 136
    new-instance v6, Ljava/util/HashMap;
    invoke-direct { v6 }, Ljava/util/HashMap;-><init>()V
  .line 137
    invoke-virtual { v3 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v7
    invoke-interface { v7 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v7
  :L5
  .line 138
    invoke-interface { v7 }, Ljava/util/Iterator;->hasNext()Z
    move-result v8
    if-eqz v8, :L12
  .line 139
    invoke-interface { v7 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/lang/String;
  .line 140
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v9
  .line 141
    if-nez v9, :L6
    goto :L5
  :L6
  .line 142
    invoke-virtual { v9 }, Lcom/innioasis/ipp/AlbumTags$Sum;->line()Ljava/lang/String;
    move-result-object v9
  .line 143
    const-string v10, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v10, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-eqz v10, :L7
    const-string v10, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    goto :L8
  :L7
    invoke-static { v9 }, Lcom/innioasis/ipp/AlbumArtists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
  :L8
  .line 144
    invoke-virtual { v5, v8, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 145
    invoke-virtual { v6, v10 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/util/HashMap;
  .line 146
    if-nez v8, :L9
    new-instance v8, Ljava/util/HashMap;
    invoke-direct { v8 }, Ljava/util/HashMap;-><init>()V
    invoke-virtual { v6, v10, v8 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 147
    invoke-virtual { v8, v9 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/Integer;
  .line 148
    if-nez v10, :L10
    const/4 v10, 1
    goto :L11
  :L10
    invoke-virtual { v10 }, Ljava/lang/Integer;->intValue()I
    move-result v10
    add-int/2addr v10, v4
  :L11
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v8, v9, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 149
    goto :L5
  :L12
  .line 150
    new-instance v7, Ljava/util/LinkedHashMap;
    invoke-direct { v7 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 151
    invoke-virtual { v6 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v6
    invoke-interface { v6 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v6
  :L13
  .line 152
    invoke-interface { v6 }, Ljava/util/Iterator;->hasNext()Z
    move-result v8
    if-eqz v8, :L18
  .line 153
    invoke-interface { v6 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/util/Map$Entry;
  .line 154
    nop
  .line 155
    nop
  .line 156
    invoke-interface { v8 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/util/HashMap;
    invoke-virtual { v9 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v9
    invoke-interface { v9 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v9
    const/4 v10, 0
    const/4 v11, 0
  :L14
  .line 157
    invoke-interface { v9 }, Ljava/util/Iterator;->hasNext()Z
    move-result v12
    if-eqz v12, :L17
  .line 158
    invoke-interface { v9 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/util/Map$Entry;
  .line 159
    invoke-interface { v12 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v13
    check-cast v13, Ljava/lang/String;
  .line 160
    invoke-interface { v12 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/lang/Integer;
    invoke-virtual { v12 }, Ljava/lang/Integer;->intValue()I
    move-result v12
  .line 161
    if-gt v12, v11, :L15
    if-ne v12, v11, :L16
    invoke-virtual { v13, v10 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v14
    if-gez v14, :L16
  :L15
    move v11, v12
    move-object v10, v13
  :L16
  .line 162
    goto :L14
  :L17
  .line 163
    invoke-interface { v8 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v8
    invoke-virtual { v7, v8, v10 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 164
    goto :L13
  :L18
  .line 165
    sput-object v3, Lcom/innioasis/ipp/AlbumArtists;->albumSongs:Ljava/util/HashMap;
  .line 166
    sput-object v5, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  .line 167
    sput-object v7, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
  .line 168
    sput-object v1, Lcom/innioasis/ipp/AlbumArtists;->memoAll:Ljava/util/List;
  .line 169
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v1
    sput v1, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
  :L19
  .line 170
    monitor-exit v0
    return v4
  :L20
  .line 127
    move-exception v1
    monitor-exit v0
    goto :L22
  :L21
    throw v1
  :L22
    goto :L21
.end method

.method static first(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 65
    const-string v0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    if-nez p0, :L0
    return-object v0
  :L0
  .line 66
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 67
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L6
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    goto :L6
  :L1
  .line 68
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 69
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L3
  :L2
    const/4 p0, 0
    invoke-interface { v1, p0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 70
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L4
    goto :L5
  :L4
    move-object v0, p0
  :L5
    return-object v0
  :L6
  .line 67
    return-object v0
.end method

.method public static is(Ljava/lang/String;)Z
  .registers 3
  .line 43
    const/4 v0, 0
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/4 v1, 4
    if-ne p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method public static musicMenu(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 76
    if-eqz p0, :L8
    if-eqz p1, :L8
  :L0
    const-string v0, "album_artists"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 77
    const v0, 2131821161
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 78
    invoke-interface { p0, v0 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 79
    const v1, 2131820839
    invoke-virtual { p1, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result p1
  .line 80
    if-gez p1, :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    goto :L4
  :L3
    add-int/lit8 p1, p1, 1
  :L4
    invoke-interface { p0, p1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L5
  .line 82
    goto :L7
  :L6
  .line 81
    move-exception p0
  :L7
  .line 83
    return-void
  :L8
  .line 76
    return-void
.end method

.method public static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 48
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L0
    return-object p0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 52
    if-nez p0, :L0
    const-string p0, ""
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 60
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 61
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtists;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static open(Landroid/app/Activity;)V
  .registers 4
  .line 87
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/ArtistsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 88
    const-string v1, "ipp_album_artists"
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 89
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 90
    return-void
.end method

.method private static readMissing(Ljava/util/HashMap;)V
  .catch Ljava/lang/InterruptedException; { :L7 .. :L8 } :L9
  .registers 10
  .line 175
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 176
    invoke-virtual { p0 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object p0
    invoke-interface { p0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 177
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L2
  .line 178
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v1
  .line 179
    if-eqz v1, :L0
    invoke-virtual { v1 }, Lcom/innioasis/ipp/AlbumTags$Sum;->anyRead()Z
    move-result v2
    if-nez v2, :L0
    iget-object v2, v1, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    if-nez v2, :L1
    goto :L0
  :L1
  .line 180
    iget-object v1, v1, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 181
    goto :L0
  :L2
  .line 182
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L3
    return-void
  :L3
  .line 183
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array v1, p0, [Lcom/innioasis/ipp/Meta$Info;
  .line 184
    new-instance v2, Lcom/innioasis/ipp/AlbumArtists$Reader;
    invoke-direct { v2, v0, v1 }, Lcom/innioasis/ipp/AlbumArtists$Reader;-><init>(Ljava/util/List;[Lcom/innioasis/ipp/Meta$Info;)V
  .line 185
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    div-int/lit8 v3, v3, 8
    const/4 v4, 1
    invoke-static { v4, v3 }, Ljava/lang/Math;->max(II)I
    move-result v3
    const/4 v5, 3
    invoke-static { v5, v3 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 186
    sub-int/2addr v3, v4
    new-array v4, v3, [Ljava/lang/Thread;
  .line 187
    const/4 v5, 0
    const/4 v6, 0
  :L4
    if-ge v6, v3, :L5
  .line 188
    new-instance v7, Ljava/lang/Thread;
    const-string v8, "ipp-albumartist"
    invoke-direct { v7, v2, v8 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    aput-object v7, v4, v6
  .line 189
    invoke-virtual { v7 }, Ljava/lang/Thread;->start()V
  .line 187
    add-int/lit8 v6, v6, 1
    goto :L4
  :L5
  .line 191
    invoke-virtual { v2 }, Lcom/innioasis/ipp/AlbumArtists$Reader;->run()V
  .line 192
    const/4 v2, 0
  :L6
    if-ge v2, v3, :L11
  :L7
  .line 193
    aget-object v6, v4, v2
    invoke-virtual { v6 }, Ljava/lang/Thread;->join()V
  :L8
    goto :L10
  :L9
    move-exception v6
  :L10
  .line 192
    add-int/lit8 v2, v2, 1
    goto :L6
  :L11
  .line 195
    nop
  :L12
    if-ge v5, p0, :L13
  .line 196
    invoke-virtual { v0, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    aget-object v3, v1, v5
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 195
    add-int/lit8 v5, v5, 1
    goto :L12
  :L13
  .line 198
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 199
    return-void
.end method

.method public static rows(Z)Ljava/util/List;
  .registers 7
  .line 229
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 230
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtists;->build()Z
    move-result v1
    if-nez v1, :L0
    return-object v0
  :L0
  .line 231
    new-instance v1, Ljava/util/ArrayList;
    sget-object v2, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
    invoke-virtual { v2 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 232
    const-string v2, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    move-result v2
  .line 233
    new-instance v3, Lcom/innioasis/ipp/AlbumArtists$NormCmp;
    invoke-direct { v3, p0 }, Lcom/innioasis/ipp/AlbumArtists$NormCmp;-><init>(Z)V
    invoke-static { v1, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 234
    const/4 p0, 0
  :L1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge p0, v3, :L2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    sget-object v4, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 p0, p0, 1
    goto :L1
  :L2
  .line 235
    if-eqz v2, :L3
    const-string p0, "\u0004\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 236
    return-object v0
.end method

.method private static screen(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 94
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_album_artists"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 95
    move-exception p0
  .line 96
    return v0
  :L3
  .line 94
    return v0
.end method

.method public static screenList(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  .line 106
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtists;->screen(Landroid/app/Activity;)Z
    move-result p1
    if-nez p1, :L0
    return-object p0
  :L0
  .line 108
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortArtist()I
    move-result p0
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
  .line 109
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-ne p0, p1, :L1
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
  .line 110
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->rows(Z)Ljava/util/List;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 111
    move-exception p0
  .line 112
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L4 } :L16
  .catchall { :L4 .. :L5 } :L13
  .catchall { :L5 .. :L12 } :L16
  .catchall { :L14 .. :L15 } :L13
  .catchall { :L15 .. :L16 } :L16
  .registers 7
  .line 250
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L0
  .line 252
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtists;->build()Z
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 253
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 254
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    const-string p0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L3
  .line 257
    const-class v1, Lcom/innioasis/ipp/AlbumArtists;
    monitor-enter v1
  :L4
  .line 258
    sget-object v2, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  .line 259
    sget-object v3, Lcom/innioasis/ipp/AlbumArtists;->albumSongs:Ljava/util/HashMap;
  .line 260
    monitor-exit v1
  :L5
  .line 261
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L6
  .line 262
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L9
  .line 263
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 264
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { p0, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L7
    goto :L6
  :L7
  .line 265
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 266
    if-eqz v2, :L8
    check-cast v2, Ljava/util/List;
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
  :L8
  .line 267
    goto :L6
  :L9
  .line 268
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, p0, :L10
  .line 269
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L11
  :L10
    nop
  :L11
  .line 270
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L12
  .line 272
    goto :L17
  :L13
  .line 260
    move-exception p0
  :L14
    monitor-exit v1
  :L15
    throw p0
  :L16
  .line 271
    move-exception p0
  :L17
  .line 273
    return-object v0
.end method

.method public static title(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 101
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->screen(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L0
    const p1, 2131821161
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
  :L0
    return-object p1
.end method
