.class public final Lcom/innioasis/ipp/Prefs;
.super Ljava/lang/Object;
.source "Prefs.java"

.field private final static DEFAULTS:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 4
  .line 23
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
  .line 27
    const-string v0, "icon_tint"
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 28
    const-string v0, "text_tint"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 29
    const-string v0, "lyrics_tint"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 30
    const-string v0, "cover_tilt"
    const/4 v2, 1
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 31
    const-string v0, "top_hold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 32
    const-string v0, "book_top_hold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 33
    const-string v0, "first_artist_only"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 34
    const-string v0, "feat_in_title"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 35
    const-string v0, "artist_album_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 37
    const-string v0, "alpha_scroll"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 38
    const-string v0, "alpha_threshold"
    const/4 v3, 5
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 39
    const-string v0, "follow_playing"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 40
    const-string v0, "follow_idle"
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 41
    const-string v0, "fixed_menu_pad"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 42
    const-string v0, "album_artists"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 43
    const-string v0, "loop_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 44
    const-string v0, "bar_text"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 45
    const-string v0, "bar_icons"
    const/16 v3, 15
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 47
    const-string v0, "meta_title"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 48
    const-string v0, "book_meta_title"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 49
    const-string v0, "album_year"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 50
    const-string v0, "track_numbers"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 51
    const-string v0, "artist_split"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 52
    const-string v0, "genre_split"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 53
    const-string v0, "artist_scope"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 55
    const-string v0, "delete_folder"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 56
    const-string v0, "keep_awake"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 57
    const-string v0, "likes"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 59
    const-string v0, "key_tone"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 60
    const-string v0, "key_tone_volume"
    const/4 v1, 7
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 62
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 16
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albumLabel(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 90
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 91
    if-eqz p0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->albumYearEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 95
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-gtz v1, :L1
    goto :L2
  :L1
  .line 98
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ("
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, ")"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 96
    return-object v0
  :L3
  .line 92
    return-object v0
.end method

.method public static albumYearEnabled()Z
  .registers 2
  .line 102
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 103
    const-string v1, "album_year"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method static all(Landroid/content/Context;)Ljava/util/Map;
  .registers 1
  .line 139
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static artistAlbumsEnabled()Z
  .registers 1
  .line 108
    const/4 v0, 1
    return v0
.end method

.method private static def(Ljava/lang/String;I)V
  .registers 3
  .line 65
    sget-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 66
    return-void
.end method

.method public static defBool(Ljava/lang/String;)Z
  .registers 1
  .line 76
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static defInt(Ljava/lang/String;)I
  .registers 2
  .line 70
    const-string v0, "kb_lang2"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Keys;->defaultSecond()I
    move-result p0
    return p0
  :L0
  .line 71
    sget-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 72
    if-nez p0, :L1
    const/4 p0, 0
    goto :L2
  :L1
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L2
    return p0
.end method

.method public static defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
  .registers 2
  .line 113
    const-string p0, "/storage/sdcard0/Music"
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->isDir(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
    const-string p0, "/storage/sdcard0"
  :L1
    return-object p0
.end method

.method static file()Landroid/content/SharedPreferences;
  .registers 1
  .line 133
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 134
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
  :L1
    return-object v0
.end method

.method public static getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
  .registers 3
  .line 120
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result p0
    return p0
.end method

.method public static getInt(Landroid/content/Context;Ljava/lang/String;I)I
  .registers 3
  .line 147
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p0
    return p0
.end method

.method public static getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 155
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static has(Landroid/content/Context;Ljava/lang/String;)Z
  .registers 2
  .line 163
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static isDir(Ljava/lang/String;)Z
  .registers 2
  .line 124
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    return p0
.end method

.method public static on(Landroid/content/Context;Ljava/lang/String;)Z
  .registers 3
  .line 81
    if-nez p0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result p0
    goto :L1
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    move-result p0
  :L1
    return p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
  .registers 3
  .line 128
    const-string v0, "innioasis_plus"
    const/4 v1, 0
    invoke-virtual { p0, v0, v1 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object p0
    return-object p0
.end method

.method public static setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .registers 3
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->apply()V
  .line 144
    return-void
.end method

.method public static setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .registers 3
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->apply()V
  .line 152
    return-void
.end method

.method public static setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 159
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->apply()V
  .line 160
    return-void
.end method

.method public static trackSortEnabled()Z
  .registers 1
  .line 168
    const/4 v0, 1
    return v0
.end method

.method public static val(Landroid/content/Context;Ljava/lang/String;)I
  .registers 3
  .line 85
    if-nez p0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result p0
    goto :L1
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
  :L1
    return p0
.end method

.method public static videoFolderPath()Ljava/lang/String;
  .registers 2
  .line 116
    const-string v0, "/storage/sdcard0/Videos"
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->isDir(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
    const-string v0, "/storage/sdcard0"
  :L1
    return-object v0
.end method
