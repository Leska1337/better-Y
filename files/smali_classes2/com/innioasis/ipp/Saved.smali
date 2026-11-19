.class public final Lcom/innioasis/ipp/Saved;
.super Ljava/lang/Object;
.source "Saved.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Saved$Resolve;,
    Lcom/innioasis/ipp/Saved$Swap;
  }
.end annotation

.field private final static FULL_MAX:I = 2000

.method private constructor <init>()V
  .registers 1
  .line 30
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/database/Song;)Z
  .registers 1
  .line 28
    invoke-static { p0 }, Lcom/innioasis/ipp/Saved;->stub(Lcom/innioasis/y1/database/Song;)Z
    move-result p0
    return p0
.end method

.method private static hasStubs(Ljava/util/List;)Z
  .registers 4
  .line 119
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 120
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-static { v2 }, Lcom/innioasis/ipp/Saved;->stub(Lcom/innioasis/y1/database/Song;)Z
    move-result v2
    if-eqz v2, :L2
    const/4 p0, 1
    return p0
  :L2
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 121
    return v0
.end method

.method public static restoreFailed(I)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 44
    const/16 v0, -38
    if-ne p0, v0, :L0
    return-void
  :L0
  .line 45
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isShutdown()Z
    move-result p0
    if-nez p0, :L1
    return-void
  :L1
  .line 46
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setShutdown(Z)V
  .line 47
    sget-object p0, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/objects/Global;->setRestoreCompleted(Z)V
  .line 49
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p0
  .line 50
    if-eqz p0, :L2
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/service/PlayerService;->muteOrNoMuteMusic(Z)V
  :L2
  .line 52
    goto :L4
  :L3
  .line 51
    move-exception p0
  :L4
  .line 53
    return-void
.end method

.method public static restored(Lcom/innioasis/y1/service/PlayerService;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 127
    if-eqz p0, :L4
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Saved;->hasStubs(Ljava/util/List;)Z
    move-result v0
    if-nez v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Saved;->hasStubs(Ljava/util/List;)Z
    move-result v0
    if-eqz v0, :L4
  :L1
  .line 128
    new-instance v0, Lcom/innioasis/ipp/Saved$Resolve;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Saved$Resolve;-><init>(Lcom/innioasis/y1/service/PlayerService;)V
    const-wide/16 v1, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L2
    goto :L4
  :L3
  .line 130
    move-exception p0
    goto :L5
  :L4
  .line 131
    nop
  :L5
  .line 132
    return-void
.end method

.method private static songs(Lcom/google/gson/stream/JsonWriter;Lcom/google/gson/Gson;Ljava/util/List;I)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 9
  .line 97
    invoke-virtual { p0 }, Lcom/google/gson/stream/JsonWriter;->beginArray()Lcom/google/gson/stream/JsonWriter;
  .line 98
    const/4 v0, 0
    if-nez p2, :L0
    const/4 v1, 0
    goto :L1
  :L0
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v1
  :L1
  .line 99
    const/16 v2, 2000
    if-gt v1, v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 100
    nop
  :L4
    if-ge v0, v1, :L8
  .line 101
    invoke-interface { p2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 102
    if-nez v2, :L6
    if-ne v0, p3, :L5
    goto :L6
  :L5
  .line 105
    invoke-virtual { p0 }, Lcom/google/gson/stream/JsonWriter;->beginObject()Lcom/google/gson/stream/JsonWriter;
  .line 106
    const-string v4, "path"
    invoke-virtual { p0, v4 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object v4
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v3 }, Lcom/google/gson/stream/JsonWriter;->value(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
  .line 107
    invoke-virtual { p0 }, Lcom/google/gson/stream/JsonWriter;->endObject()Lcom/google/gson/stream/JsonWriter;
    goto :L7
  :L6
  .line 103
    const-class v4, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1, v3, v4, p0 }, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/gson/stream/JsonWriter;)V
  :L7
  .line 100
    add-int/lit8 v0, v0, 1
    goto :L4
  :L8
  .line 110
    invoke-virtual { p0 }, Lcom/google/gson/stream/JsonWriter;->endArray()Lcom/google/gson/stream/JsonWriter;
  .line 111
    return-void
.end method

.method private static stub(Lcom/innioasis/y1/database/Song;)Z
  .registers 3
  .line 115
    if-eqz p0, :L0
    const-string v0, ""
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static write(Lcom/innioasis/y1/service/PlayerService;)Z
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L1 .. :L8 } :L10
  .registers 14
  .line 57
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->saveSource(Lcom/innioasis/y1/service/PlayerService;)V
  .line 58
    nop
  .line 60
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getFilesDir()Ljava/io/File;
    move-result-object v2
  .line 61
    new-instance v3, Ljava/io/File;
    const-string v4, "save_state.tmp"
    invoke-direct { v3, v2, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L1
  .line 62
    new-instance v1, Lcom/google/gson/Gson;
    invoke-direct { v1 }, Lcom/google/gson/Gson;-><init>()V
  .line 63
    new-instance v4, Lcom/google/gson/stream/JsonWriter;
    new-instance v5, Ljava/io/BufferedWriter;
    new-instance v6, Ljava/io/OutputStreamWriter;
    new-instance v7, Ljava/io/FileOutputStream;
    invoke-direct { v7, v3 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    const-string v8, "UTF-8"
    invoke-direct { v6, v7, v8 }, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    const/high16 v7, 0x00010000
    invoke-direct { v5, v6, v7 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    invoke-direct { v4, v5 }, Lcom/google/gson/stream/JsonWriter;-><init>(Ljava/io/Writer;)V
  .line 65
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v5
  .line 66
    sget-object v6, Lcom/innioasis/y1/service/PlayerService$Playing;->Music:Lcom/innioasis/y1/service/PlayerService$Playing;
    const/4 v7, -1
    const/4 v8, 1
    if-ne v5, v6, :L2
    const/4 v5, 0
    goto :L4
  :L2
    sget-object v6, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v5, v6, :L3
    const/4 v5, 1
    goto :L4
  :L3
    const/4 v5, -1
  :L4
  .line 67
    nop
  .line 68
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v6
    if-eqz v6, :L5
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v6
    if-eqz v6, :L5
  .line 69
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v9
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v11
    cmp-long v6, v9, v11
    if-gtz v6, :L5
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v9
    goto :L6
  :L5
  .line 70
    const-wide/16 v9, 0
  :L6
    if-ne v5, v8, :L7
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getBookMarkProgress()Lcom/innioasis/y1/database/Bookmark;
    move-result-object v6
    if-eqz v6, :L7
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getBookMarkIndex()I
    move-result v7
  :L7
  .line 71
    invoke-virtual { v4 }, Lcom/google/gson/stream/JsonWriter;->beginObject()Lcom/google/gson/stream/JsonWriter;
  .line 72
    const-string v6, "musicList"
    invoke-virtual { v4, v6 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
  .line 73
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v6
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result v11
    invoke-static { v4, v1, v6, v11 }, Lcom/innioasis/ipp/Saved;->songs(Lcom/google/gson/stream/JsonWriter;Lcom/google/gson/Gson;Ljava/util/List;I)V
  .line 74
    const-string v6, "musicIndex"
    invoke-virtual { v4, v6 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object v6
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result v11
    int-to-long v11, v11
    invoke-virtual { v6, v11, v12 }, Lcom/google/gson/stream/JsonWriter;->value(J)Lcom/google/gson/stream/JsonWriter;
  .line 75
    const-string v6, "audiobookList"
    invoke-virtual { v4, v6 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
  .line 76
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v6
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result v11
    invoke-static { v4, v1, v6, v11 }, Lcom/innioasis/ipp/Saved;->songs(Lcom/google/gson/stream/JsonWriter;Lcom/google/gson/Gson;Ljava/util/List;I)V
  .line 77
    const-string v1, "audiobookIndex"
    invoke-virtual { v4, v1 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object v1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result p0
    int-to-long v11, p0
    invoke-virtual { v1, v11, v12 }, Lcom/google/gson/stream/JsonWriter;->value(J)Lcom/google/gson/stream/JsonWriter;
  .line 78
    const-string p0, "startTime"
    invoke-virtual { v4, p0 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object p0
    invoke-virtual { p0, v9, v10 }, Lcom/google/gson/stream/JsonWriter;->value(J)Lcom/google/gson/stream/JsonWriter;
  .line 79
    const-string p0, "playing"
    invoke-virtual { v4, p0 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object p0
    int-to-long v5, v5
    invoke-virtual { p0, v5, v6 }, Lcom/google/gson/stream/JsonWriter;->value(J)Lcom/google/gson/stream/JsonWriter;
  .line 80
    const-string p0, "bookmarkIndex"
    invoke-virtual { v4, p0 }, Lcom/google/gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;
    move-result-object p0
    int-to-long v5, v7
    invoke-virtual { p0, v5, v6 }, Lcom/google/gson/stream/JsonWriter;->value(J)Lcom/google/gson/stream/JsonWriter;
  .line 81
    invoke-virtual { v4 }, Lcom/google/gson/stream/JsonWriter;->endObject()Lcom/google/gson/stream/JsonWriter;
  .line 82
    invoke-virtual { v4 }, Lcom/google/gson/stream/JsonWriter;->close()V
  .line 83
    new-instance p0, Ljava/io/File;
    const-string v1, "save_state"
    invoke-direct { p0, v2, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 84
    invoke-virtual { v3, p0 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result v1
    if-nez v1, :L9
  .line 85
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  .line 86
    invoke-virtual { v3, p0 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result p0
  :L8
    if-nez p0, :L9
    return v0
  :L9
  .line 88
    return v8
  :L10
  .line 89
    move-exception p0
    move-object v1, v3
    goto :L12
  :L11
    move-exception p0
  :L12
  .line 90
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "save_state not written: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 91
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L13
  .line 92
    return v0
.end method
