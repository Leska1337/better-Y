.class public final Lcom/innioasis/ipp/AlbumTags;
.super Ljava/lang/Object;
.source "AlbumTags.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/AlbumTags$Sum;,
    Lcom/innioasis/ipp/AlbumTags$Fill;,
    Lcom/innioasis/ipp/AlbumTags$Repaint;
  }
.end annotation

.field private final static MAIN:Landroid/os/Handler;

.field private final static REPAINT_MS:J = 1000L

.field private static filler:Ljava/lang/Thread;

.field private static memo:Ljava/util/HashMap;

.field private static memoFor:Ljava/util/List;

.field private static memoGen:I

.field private static own:Ljava/util/HashMap;

.field private static ownFor:Ljava/util/List;

.field private final static queue:Ljava/util/LinkedHashSet;

.field private final static tried:Ljava/util/HashSet;

.method static constructor <clinit>()V
  .registers 2
  .line 63
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/AlbumTags;->memoGen:I
  .line 64
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumTags;->memo:Ljava/util/HashMap;
  .line 195
    new-instance v0, Ljava/util/LinkedHashSet;
    invoke-direct { v0 }, Ljava/util/LinkedHashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumTags;->queue:Ljava/util/LinkedHashSet;
  .line 197
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumTags;->tried:Ljava/util/HashSet;
  .line 199
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/AlbumTags;->MAIN:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/util/List;Z)Ljava/lang/String;
  .registers 2
  .line 21
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumTags;->commonest(Ljava/util/List;Z)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/LinkedHashSet;
  .registers 1
  .line 21
    sget-object v0, Lcom/innioasis/ipp/AlbumTags;->queue:Ljava/util/LinkedHashSet;
    return-object v0
.end method

.method static synthetic access$302(Ljava/lang/Thread;)Ljava/lang/Thread;
  .registers 1
  .line 21
    sput-object p0, Lcom/innioasis/ipp/AlbumTags;->filler:Ljava/lang/Thread;
    return-object p0
.end method

.method static synthetic access$400()Ljava/util/HashSet;
  .registers 1
  .line 21
    sget-object v0, Lcom/innioasis/ipp/AlbumTags;->tried:Ljava/util/HashSet;
    return-object v0
.end method

.method static synthetic access$600()Landroid/os/Handler;
  .registers 1
  .line 21
    sget-object v0, Lcom/innioasis/ipp/AlbumTags;->MAIN:Landroid/os/Handler;
    return-object v0
.end method

.method private static build(Ljava/util/List;)Lcom/innioasis/ipp/AlbumTags$Sum;
  .registers 10
  .line 95
    nop
  .line 96
    nop
  .line 97
    const/4 v0, 0
    const/4 v1, 0
    move-object v4, v0
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 98
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 99
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 100
    if-eqz v3, :L2
    if-eqz v4, :L1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v5
    if-gez v5, :L2
  :L1
    move-object v4, v3
  :L2
  .line 101
    invoke-static { v2 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v3
    if-eqz v3, :L3
    add-int/lit8 v8, v8, 1
    goto :L7
  :L3
  .line 102
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumTags;->year(Ljava/lang/String;)I
    move-result v2
  .line 103
    if-nez v2, :L4
    goto :L7
  :L4
  .line 104
    if-eqz v6, :L5
    if-ge v2, v6, :L6
  :L5
    move v6, v2
  :L6
  .line 105
    if-le v2, v7, :L7
    move v7, v2
  :L7
  .line 97
    add-int/lit8 v1, v1, 1
    goto :L0
  :L8
  .line 107
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ne v8, v1, :L9
    goto :L10
  :L9
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/AlbumTags;->commonest(Ljava/util/List;Z)Ljava/lang/String;
    move-result-object v0
  :L10
    move-object v5, v0
  .line 108
    new-instance v0, Lcom/innioasis/ipp/AlbumTags$Sum;
    move-object v2, v0
    move-object v3, p0
    invoke-direct/range { v2 .. v8 }, Lcom/innioasis/ipp/AlbumTags$Sum;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;III)V
    return-object v0
.end method

.method private static commonest(Ljava/util/List;Z)Ljava/lang/String;
  .registers 12
  .line 125
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 126
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 127
    nop
  .line 128
    nop
  .line 129
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    const-string v6, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    const-string v7, ""
    if-ge v3, v5, :L14
  .line 130
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 132
    if-eqz p1, :L2
  .line 133
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v6
  .line 134
    if-nez v6, :L1
    move-object v6, v7
    goto :L4
  :L1
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    goto :L4
  :L2
  .line 136
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumArtists;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  .line 137
    invoke-virtual { v6, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L3
    move-object v6, v7
    goto :L4
  :L3
    move-object v6, v8
  :L4
  .line 139
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v8
    if-nez v8, :L5
    goto :L13
  :L5
  .line 140
    invoke-virtual { v0, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/lang/Integer;
  .line 141
    const/4 v9, 1
    if-nez v8, :L6
    goto :L7
  :L6
    invoke-virtual { v8 }, Ljava/lang/Integer;->intValue()I
    move-result v8
    add-int/2addr v9, v8
  :L7
  .line 142
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v8
    invoke-virtual { v0, v6, v8 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 143
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    if-nez v8, :L8
    goto :L9
  :L8
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
  :L9
  .line 144
    invoke-virtual { v1, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 145
    if-eqz v5, :L10
    invoke-virtual { v7, v5 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v5
    if-gez v5, :L11
  :L10
    invoke-virtual { v1, v6, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L11
  .line 146
    if-eqz v2, :L12
    if-gt v9, v4, :L12
    if-ne v9, v4, :L13
  .line 147
    invoke-virtual { v1, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v5, v7 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v5
    if-gez v5, :L13
  :L12
  .line 148
    nop
  .line 149
    move-object v2, v6
    move v4, v9
  :L13
  .line 129
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L14
  .line 152
    if-nez v2, :L16
    if-eqz p1, :L15
    move-object v6, v7
  :L15
    return-object v6
  :L16
  .line 153
    return-object v2
.end method

.method static index(Ljava/util/List;)Ljava/util/HashMap;
  .catchall { :L1 .. :L3 } :L13
  .catchall { :L10 .. :L12 } :L11
  .catchall { :L14 .. :L15 } :L13
  .registers 7
  .line 166
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v0
  .line 167
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 168
    const-class v0, Lcom/innioasis/ipp/AlbumTags;
    monitor-enter v0
  :L1
  .line 169
    sget-object v1, Lcom/innioasis/ipp/AlbumTags;->ownFor:Ljava/util/List;
    if-ne v1, p0, :L2
    sget-object v1, Lcom/innioasis/ipp/AlbumTags;->own:Ljava/util/HashMap;
    if-eqz v1, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 170
    monitor-exit v0
  :L3
  .line 171
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 172
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 173
    const/4 v2, 0
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L9
  .line 174
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 175
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-nez v4, :L5
    goto :L8
  :L5
  .line 176
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 177
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L6
    goto :L8
  :L6
  .line 178
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v4
  .line 179
    invoke-virtual { v0, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/ArrayList;
  .line 180
    if-nez v5, :L7
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
    invoke-virtual { v0, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 181
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 173
    add-int/lit8 v2, v2, 1
    goto :L4
  :L9
  .line 183
    const-class v1, Lcom/innioasis/ipp/AlbumTags;
    monitor-enter v1
  :L10
  .line 184
    sput-object v0, Lcom/innioasis/ipp/AlbumTags;->own:Ljava/util/HashMap;
  .line 185
    sput-object p0, Lcom/innioasis/ipp/AlbumTags;->ownFor:Ljava/util/List;
  .line 186
    monitor-exit v1
  .line 187
    return-object v0
  :L11
  .line 186
    move-exception p0
    monitor-exit v1
  :L12
    throw p0
  :L13
  .line 170
    move-exception p0
  :L14
    monitor-exit v0
  :L15
    goto :L17
  :L16
    throw p0
  :L17
    goto :L16
.end method

.method public static of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
  .catchall { :L3 .. :L7 } :L14
  .catchall { :L9 .. :L12 } :L11
  .catchall { :L15 .. :L16 } :L14
  .registers 6
  .line 71
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 72
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
  .line 73
    if-nez v1, :L1
    invoke-static { }, Landroid/os/Looper;->myLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    if-eq v2, v3, :L1
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  :L1
  .line 74
    if-nez v1, :L2
    return-object v0
  :L2
  .line 75
    invoke-static { }, Lcom/innioasis/ipp/Schema;->gen()I
    move-result v2
  .line 76
    const-class v3, Lcom/innioasis/ipp/AlbumTags;
    monitor-enter v3
  :L3
  .line 77
    sget-object v4, Lcom/innioasis/ipp/AlbumTags;->memoFor:Ljava/util/List;
    if-ne v1, v4, :L4
    sget v4, Lcom/innioasis/ipp/AlbumTags;->memoGen:I
    if-eq v2, v4, :L5
  :L4
  .line 78
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
    sput-object v4, Lcom/innioasis/ipp/AlbumTags;->memo:Ljava/util/HashMap;
  .line 79
    sput-object v1, Lcom/innioasis/ipp/AlbumTags;->memoFor:Ljava/util/List;
  .line 80
    sput v2, Lcom/innioasis/ipp/AlbumTags;->memoGen:I
  :L5
  .line 82
    sget-object v4, Lcom/innioasis/ipp/AlbumTags;->memo:Ljava/util/HashMap;
    invoke-virtual { v4, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 83
    if-eqz v4, :L6
    check-cast v4, Lcom/innioasis/ipp/AlbumTags$Sum;
    monitor-exit v3
    return-object v4
  :L6
  .line 84
    monitor-exit v3
  :L7
  .line 85
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumTags;->index(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v3
    invoke-virtual { v3, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/List;
  .line 86
    if-eqz v3, :L13
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L8
    goto :L13
  :L8
  .line 87
    invoke-static { v3 }, Lcom/innioasis/ipp/AlbumTags;->build(Ljava/util/List;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v0
  .line 88
    const-class v3, Lcom/innioasis/ipp/AlbumTags;
    monitor-enter v3
  :L9
  .line 89
    sget-object v4, Lcom/innioasis/ipp/AlbumTags;->memoFor:Ljava/util/List;
    if-ne v4, v1, :L10
    sget v1, Lcom/innioasis/ipp/AlbumTags;->memoGen:I
    if-ne v1, v2, :L10
    sget-object v1, Lcom/innioasis/ipp/AlbumTags;->memo:Ljava/util/HashMap;
    invoke-virtual { v1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 90
    monitor-exit v3
  .line 91
    return-object v0
  :L11
  .line 90
    move-exception p0
    monitor-exit v3
  :L12
    throw p0
  :L13
  .line 86
    return-object v0
  :L14
  .line 84
    move-exception p0
  :L15
    monitor-exit v3
  :L16
    throw p0
.end method

.method public static shown(Ljava/lang/String;)V
  .catchall { :L1 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 4
  .line 203
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v0
  .line 204
    if-eqz v0, :L8
    iget v0, v0, Lcom/innioasis/ipp/AlbumTags$Sum;->unread:I
    if-nez v0, :L0
    goto :L8
  :L0
  .line 206
    sget-object v0, Lcom/innioasis/ipp/AlbumTags;->queue:Ljava/util/LinkedHashSet;
    monitor-enter v0
  :L1
  .line 207
    invoke-virtual { v0, p0 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    monitor-exit v0
    return-void
  :L2
  .line 208
    sget-object p0, Lcom/innioasis/ipp/AlbumTags;->filler:Ljava/lang/Thread;
    if-eqz p0, :L3
    monitor-exit v0
    return-void
  :L3
  .line 209
    new-instance p0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/AlbumTags$Fill;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/AlbumTags$Fill;-><init>(Lcom/innioasis/ipp/AlbumTags$1;)V
    const-string v2, "ipp-albumtags"
    invoke-direct { p0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    sput-object p0, Lcom/innioasis/ipp/AlbumTags;->filler:Ljava/lang/Thread;
  .line 210
    monitor-exit v0
  :L4
  .line 211
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  .line 212
    return-void
  :L5
  .line 210
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
  :L8
  .line 204
    return-void
.end method

.method private static year(Ljava/lang/String;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 112
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 4
    if-eq v1, v2, :L0
    goto :L3
  :L0
  .line 114
    invoke-static { p0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p0
  :L1
    return p0
  :L2
  .line 115
    move-exception p0
  .line 116
    return v0
  :L3
  .line 112
    return v0
.end method

.method public static yearLabel(Lcom/innioasis/ipp/AlbumTags$Sum;)Ljava/lang/String;
  .registers 3
  .line 158
    if-eqz p0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->anyRead()Z
    move-result v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 159
    iget v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    if-nez v0, :L1
    const-string p0, ""
    return-object p0
  :L1
  .line 160
    iget v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMax:I
    iget v1, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    if-ne v0, v1, :L2
    iget p0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    invoke-static { p0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 161
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iget v1, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " \u2013 "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget p0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMax:I
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 158
    const/4 p0, 0
    return-object p0
.end method
