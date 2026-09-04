.class public final Lcom/innioasis/ipp/Prefs;
.super Ljava/lang/Object;
.source "Prefs.java"

.field private final static DEFAULTS:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 4
  .line 40
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
  .line 44
    const-string v0, "icon_tint"
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 45
    const-string v0, "cover_tilt"
    const/4 v2, 1
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 46
    const-string v0, "top_hold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 47
    const-string v0, "book_top_hold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 48
    const-string v0, "first_artist_only"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 49
    const-string v0, "feat_in_title"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 51
    const-string v0, "alpha_scroll"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 52
    const-string v0, "alpha_threshold"
    const/4 v3, 5
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 53
    const-string v0, "follow_playing"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 54
    const-string v0, "follow_idle"
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 55
    const-string v0, "fixed_menu_pad"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 57
    const-string v0, "meta_title"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 58
    const-string v0, "book_meta_title"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 59
    const-string v0, "album_year"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 60
    const-string v0, "track_numbers"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 61
    const-string v0, "artist_split"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 62
    const-string v0, "genre_split"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 63
    const-string v0, "artist_scope"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 65
    const-string v0, "delete_folder"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 66
    const-string v0, "keep_awake"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 67
    const-string v0, "likes"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->def(Ljava/lang/String;I)V
  .line 69
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albumLabel(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 115
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 116
    if-eqz p0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->albumYearEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 120
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-gtz v1, :L1
    goto :L2
  :L1
  .line 123
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
  .line 121
    return-object v0
  :L3
  .line 117
    return-object v0
.end method

.method public static albumYearEnabled()Z
  .registers 2
  .line 127
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 128
    const-string v1, "album_year"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method static all(Landroid/content/Context;)Ljava/util/Map;
  .registers 1
  .line 174
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
  .line 136
    const/4 v0, 1
    return v0
.end method

.method private static def(Ljava/lang/String;I)V
  .registers 3
  .line 72
    sget-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 73
    return-void
.end method

.method public static defBool(Ljava/lang/String;)Z
  .registers 1
  .line 90
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
  .line 83
    const-string v0, "kb_lang2"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Keys;->defaultSecond()I
    move-result p0
    return p0
  :L0
  .line 84
    sget-object v0, Lcom/innioasis/ipp/Prefs;->DEFAULTS:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 85
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
  .line 148
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

.method public static getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
  .registers 3
  .line 157
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result p0
    return p0
.end method

.method public static getInt(Landroid/content/Context;Ljava/lang/String;I)I
  .registers 3
  .line 182
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p0
    return p0
.end method

.method private static isDir(Ljava/lang/String;)Z
  .registers 2
  .line 161
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    return p0
.end method

.method public static on(Landroid/content/Context;Ljava/lang/String;)Z
  .registers 3
  .line 99
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
  .line 169
    const-string v0, "innioasis_plus"
    const/4 v1, 0
    invoke-virtual { p0, v0, v1 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object p0
    return-object p0
.end method

.method public static setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  .registers 3
  .line 178
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->apply()V
  .line 179
    return-void
.end method

.method public static setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .registers 3
  .line 186
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0, p1, p2 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object p0
    invoke-interface { p0 }, Landroid/content/SharedPreferences$Editor;->apply()V
  .line 187
    return-void
.end method

.method public static trackSortEnabled()Z
  .registers 1
  .line 197
    const/4 v0, 1
    return v0
.end method

.method public static val(Landroid/content/Context;Ljava/lang/String;)I
  .registers 3
  .line 104
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
  .line 153
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
