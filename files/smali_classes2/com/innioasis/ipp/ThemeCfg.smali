.class public final Lcom/innioasis/ipp/ThemeCfg;
.super Ljava/lang/Object;
.source "ThemeCfg.java"

.field private final static BAR:[Ljava/lang/String;

.field private final static BOX:[Ljava/lang/String;

.field final static FILE:Ljava/lang/String; = "better-Y.json"

.field private final static FLAGS:[Ljava/lang/String;

.field private final static GLOBAL:Ljava/lang/String; = "global:"

.field private final static KEYS:[Ljava/lang/String;

.field private final static NAMES:[Ljava/lang/Object;

.field private final static STYLE:[Ljava/lang/String;

.field private final static THEME_SOUND:Ljava/lang/String; = "use_theme_key_sound"

.field private final static TINT:[Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 15
  .line 29
    const/4 v0, 3
    new-array v1, v0, [Ljava/lang/String;
    const/4 v2, 0
    const-string v3, "light"
    aput-object v3, v1, v2
    const/4 v4, 1
    const-string v5, "dark"
    aput-object v5, v1, v4
    const/4 v6, 2
    const-string v7, "theme"
    aput-object v7, v1, v6
    sput-object v1, Lcom/innioasis/ipp/ThemeCfg;->TINT:[Ljava/lang/String;
  .line 30
    const/4 v8, 4
    new-array v9, v8, [Ljava/lang/String;
    aput-object v3, v9, v2
    aput-object v5, v9, v4
    aput-object v7, v9, v6
    const-string v3, "off"
    aput-object v3, v9, v0
    sput-object v9, Lcom/innioasis/ipp/ThemeCfg;->BOX:[Ljava/lang/String;
  .line 31
    new-array v3, v6, [Ljava/lang/String;
    const-string v5, "default"
    aput-object v5, v3, v2
    const-string v7, "simple"
    aput-object v7, v3, v4
    sput-object v3, Lcom/innioasis/ipp/ThemeCfg;->STYLE:[Ljava/lang/String;
  .line 32
    new-array v7, v6, [Ljava/lang/String;
    aput-object v5, v7, v2
    const-string v5, "centered"
    aput-object v5, v7, v4
    sput-object v7, Lcom/innioasis/ipp/ThemeCfg;->BAR:[Ljava/lang/String;
  .line 35
    const/16 v5, 8
    new-array v10, v5, [Ljava/lang/String;
    const-string v11, "icon_tint"
    aput-object v11, v10, v2
    const-string v11, "text_tint"
    aput-object v11, v10, v4
    const-string v11, "box_tint"
    aput-object v11, v10, v6
    const-string v11, "lyrics_tint"
    aput-object v11, v10, v0
    const-string v11, "bar_text"
    aput-object v11, v10, v8
    const-string v11, "preview_text"
    const/4 v12, 5
    aput-object v11, v10, v12
    const-string v11, "menu_style"
    const/4 v13, 6
    aput-object v11, v10, v13
    const-string v11, "bar_style"
    const/4 v14, 7
    aput-object v11, v10, v14
    sput-object v10, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
  .line 37
    new-array v5, v5, [Ljava/lang/Object;
    aput-object v1, v5, v2
    aput-object v1, v5, v4
    aput-object v9, v5, v6
    aput-object v1, v5, v0
    aput-object v1, v5, v8
    aput-object v1, v5, v12
    aput-object v3, v5, v13
    aput-object v7, v5, v14
    sput-object v5, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
  .line 40
    new-array v0, v4, [Ljava/lang/String;
    const-string v1, "fixed_menu_pad"
    aput-object v1, v0, v2
    sput-object v0, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 45
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static current(Landroid/content/SharedPreferences;Ljava/lang/String;)I
  .registers 3
  .line 112
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    invoke-interface { p0, p1, v0 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p0
    return p0
.end method

.method private static currentFlag(Landroid/content/SharedPreferences;Ljava/lang/String;)Z
  .registers 3
  .line 116
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result v0
    invoke-interface { p0, p1, v0 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result p0
    return p0
.end method

.method private static dirOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 103
    if-eqz p0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "/storage/sdcard0/Themes/"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    goto :L2
  :L1
    const-string p0, ""
  :L2
    return-object p0
.end method

.method private static fileOf(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 108
    if-eqz p0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
    new-instance v0, Ljava/io/File;
    const-string v1, "better-Y.json"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    return-object v0
.end method

.method private static fromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 7
  .line 145
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/ThemeCfg;->soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 146
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v3, v2
    const-string v4, "global:"
    if-ge v1, v3, :L2
  .line 147
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v2, v1
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 148
    invoke-interface { p0, v3 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L1
    aget-object v2, v2, v1
    invoke-interface { p0, v3, v0 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v3
    invoke-interface { p1, v2, v3 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
  :L1
  .line 146
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 150
    nop
  :L3
    sget-object v1, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v2, v1
    if-ge v0, v2, :L5
  .line 151
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v1, v0
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 152
    invoke-interface { p0, v2 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L4
    aget-object v1, v1, v0
    const/4 v3, 1
    invoke-interface { p0, v2, v3 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    invoke-interface { p1, v1, v2 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  :L4
  .line 150
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 154
    return-void
.end method

.method private static fromJson(Lorg/json/JSONObject;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 10
  .line 174
    const-string v0, "use_theme_key_sound"
    const/4 v1, 0
    invoke-virtual { p0, v0, v1 }, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :L0
    const-string p1, "key_tone_sound"
    const-string v0, "\u0001theme"
    invoke-interface { p2, p1, v0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L1
  :L0
  .line 175
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/ThemeCfg;->soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L1
  .line 176
    const/4 p1, 0
  :L2
    sget-object v0, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v2, v0
    if-ge p1, v2, :L8
  .line 177
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
    aget-object v2, v2, p1
    check-cast v2, [Ljava/lang/String;
  .line 178
    aget-object v3, v0, p1
    invoke-static { v3 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v3
  .line 179
    aget-object v0, v0, p1
    invoke-virtual { p0, v0 }, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
  .line 180
    instance-of v4, v0, Ljava/lang/Number;
    if-eqz v4, :L3
  .line 181
    check-cast v0, Ljava/lang/Number;
    invoke-virtual { v0 }, Ljava/lang/Number;->intValue()I
    move-result v0
  .line 182
    if-ltz v0, :L6
    array-length v2, v2
    if-ge v0, v2, :L6
    move v3, v0
    goto :L6
  :L3
  .line 183
    instance-of v4, v0, Ljava/lang/String;
    if-eqz v4, :L6
  .line 184
    const/4 v4, 0
  :L4
    array-length v5, v2
    if-ge v4, v5, :L7
  .line 185
    aget-object v5, v2, v4
    move-object v6, v0
    check-cast v6, Ljava/lang/String;
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L5
    move v3, v4
  :L5
  .line 184
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 183
    nop
  :L7
  .line 188
    sget-object v0, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    aget-object v0, v0, p1
    invoke-interface { p2, v0, v3 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
  .line 176
    add-int/lit8 p1, p1, 1
    goto :L2
  :L8
  .line 190
    nop
  :L9
    sget-object p1, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v0, p1
    if-ge v1, v0, :L12
  .line 191
    aget-object v0, p1, v1
    invoke-virtual { p0, v0 }, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
  .line 192
    instance-of v2, v0, Ljava/lang/Boolean;
    if-eqz v2, :L10
    check-cast v0, Ljava/lang/Boolean;
    invoke-virtual { v0 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    goto :L11
  :L10
    aget-object v0, p1, v1
    invoke-static { v0 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result v0
  :L11
  .line 193
    aget-object p1, p1, v1
    invoke-interface { p2, p1, v0 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 190
    add-int/lit8 v1, v1, 1
    goto :L9
  :L12
  .line 195
    return-void
.end method

.method private static read(Ljava/io/File;)Lorg/json/JSONObject;
  .catchall { :L0 .. :L1 } :L10
  .catchall { :L1 .. :L5 } :L9
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L11 .. :L12 } :L17
  .catchall { :L13 .. :L14 } :L15
  .catchall { :L18 .. :L19 } :L20
  .registers 9
  .line 198
    nop
  .line 200
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 201
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v2
    const-wide/32 v4, 65536
    invoke-static { v2, v3, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v2
    long-to-int v3, v2
    new-array v2, v3, [B
  .line 202
    const/4 v4, 0
    const/4 v5, 0
  :L2
  .line 203
    if-ge v5, v3, :L4
  .line 204
    sub-int v6, v3, v5
    invoke-virtual { v1, v2, v5, v6 }, Ljava/io/InputStream;->read([BII)I
    move-result v6
  .line 205
    if-gez v6, :L3
    goto :L4
  :L3
  .line 206
    add-int/2addr v5, v6
  .line 207
    goto :L2
  :L4
  .line 208
    new-instance v3, Lorg/json/JSONObject;
    new-instance v6, Ljava/lang/String;
    const-string v7, "UTF-8"
    invoke-direct { v6, v2, v4, v5, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-direct { v3, v6 }, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
  :L5
  .line 213
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L6
    goto :L8
  :L7
    move-exception p0
  :L8
  .line 208
    return-object v3
  :L9
  .line 209
    move-exception v2
    goto :L11
  :L10
    move-exception v2
    move-object v1, v0
  :L11
  .line 210
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "ThemeCfg.read "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v3, ": "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L12
  .line 211
    nop
  .line 213
    if-eqz v1, :L16
  :L13
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L14
    goto :L16
  :L15
    move-exception p0
  :L16
  .line 211
    return-object v0
  :L17
  .line 213
    move-exception p0
    if-eqz v1, :L21
  :L18
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 214
    goto :L23
  :L22
    throw p0
  :L23
    goto :L22
.end method

.method private static rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 4
  .line 127
    const-string v0, "key_tone_sound"
    const-string v1, ""
    invoke-interface { p0, v0, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 128
    const-string v0, "\u0001theme"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    const-string v0, "global:key_tone_sound"
    invoke-interface { p1, v0, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  :L0
  .line 129
    return-void
.end method

.method public static save(Landroid/content/Context;Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;)V
  .catchall { :L2 .. :L7 } :L14
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 71
    nop
  .line 72
    const-string v0, ""
    if-nez p1, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getName()Ljava/lang/String;
    move-result-object v1
  :L1
  .line 74
    const/4 v2, 0
  :L2
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v3
  .line 75
    if-nez p1, :L3
    goto :L4
  :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 76
    if-eqz v3, :L12
  .line 77
    if-nez v0, :L5
  .line 78
    invoke-interface { v3 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p1
  .line 79
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 80
    invoke-interface { p1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result p1
  .line 81
    goto :L13
  :L5
  .line 82
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v4
    if-nez v4, :L6
    invoke-virtual { v0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 83
    invoke-virtual { v5 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v5
  .line 82
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L6
  .line 85
    invoke-interface { v3 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v4
  .line 86
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 87
    invoke-interface { v4 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L6
  .line 89
    invoke-static { v3 }, Lcom/innioasis/ipp/ThemeCfg;->toJson(Landroid/content/SharedPreferences;)Lorg/json/JSONObject;
    move-result-object v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/ThemeCfg;->write(Ljava/io/File;Lorg/json/JSONObject;)Z
    move-result v0
  :L7
  .line 90
    if-eqz v0, :L11
  :L8
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Theme;->cfgSaved(Landroid/content/Context;Ljava/lang/String;)V
  :L9
    goto :L11
  :L10
  .line 93
    move-exception p1
    goto :L15
  :L11
  .line 95
    move p1, v0
    goto :L13
  :L12
  .line 76
    const/4 p1, 0
  :L13
  .line 95
    goto :L16
  :L14
  .line 93
    move-exception p1
    const/4 v0, 0
  :L15
  .line 94
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "ThemeCfg.save: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
    move p1, v0
  :L16
  .line 96
    if-nez p0, :L17
    return-void
  :L17
  .line 97
    if-eqz p1, :L18
    const/4 p1, 1
    new-array p1, p1, [Ljava/lang/Object;
    aput-object v1, p1, v2
    const v0, 2131821171
    invoke-virtual { p0, v0, p1 }, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    goto :L19
  :L18
  .line 98
    const p1, 2131821172
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
  :L19
  .line 99
    invoke-static { p0, p1, v2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  .line 100
    return-void
.end method

.method private static soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 7
  .line 136
    const-string v0, "global:key_tone_sound"
    const-string v1, ""
    invoke-interface { p0, v0, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 137
    const-string v3, "\u0001theme"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L0
    move-object v2, v1
  :L0
  .line 138
    const-string v4, "key_tone_sound"
    invoke-interface { p0, v4, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 139
    invoke-interface { p0, v0 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L1
    invoke-virtual { v3, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
  :L1
  .line 140
    invoke-interface { p1, v4, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  :L2
  .line 142
    return-void
.end method

.method public static switchTo(Ljava/lang/String;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 4
  :L0
  .line 50
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 51
    if-nez v0, :L1
    return-void
  :L1
  .line 52
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/ThemeCfg;->dirOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 54
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
  .line 55
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 56
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    goto :L4
  :L3
  .line 55
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L4
  .line 57
    invoke-interface { v2 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  .line 58
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
  .line 59
    invoke-static { p0 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 60
    if-eqz p0, :L5
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-eqz v2, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/ThemeCfg;->read(Ljava/io/File;)Lorg/json/JSONObject;
    move-result-object p0
    goto :L6
  :L5
    const/4 p0, 0
  :L6
  .line 61
    if-eqz p0, :L7
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->fromJson(Lorg/json/JSONObject;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    goto :L8
  :L7
  .line 62
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->fromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L8
  .line 63
    invoke-interface { v1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L9
  .line 66
    goto :L11
  :L10
  .line 64
    move-exception p0
  .line 65
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "ThemeCfg.switchTo: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L11
  .line 67
    return-void
.end method

.method private static toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 7
  .line 120
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v3, v2
    const-string v4, "global:"
    if-ge v1, v3, :L1
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v2, v1
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    aget-object v2, v2, v1
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->current(Landroid/content/SharedPreferences;Ljava/lang/String;)I
    move-result v2
    invoke-interface { p1, v3, v2 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    add-int/lit8 v1, v1, 1
    goto :L0
  :L1
  .line 121
    nop
  :L2
    sget-object v1, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v2, v1
    if-ge v0, v2, :L3
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v1, v0
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    aget-object v1, v1, v0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->currentFlag(Landroid/content/SharedPreferences;Ljava/lang/String;)Z
    move-result v1
    invoke-interface { p1, v2, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    add-int/lit8 v0, v0, 1
    goto :L2
  :L3
  .line 122
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/ThemeCfg;->rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 123
    return-void
.end method

.method private static toJson(Landroid/content/SharedPreferences;)Lorg/json/JSONObject;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 8
  .line 157
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct { v0 }, Lorg/json/JSONObject;-><init>()V
  .line 158
    const/4 v1, 0
    const/4 v2, 0
  :L0
    sget-object v3, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L3
  .line 159
    sget-object v4, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
    aget-object v4, v4, v2
    check-cast v4, [Ljava/lang/String;
  .line 160
    aget-object v5, v3, v2
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/ThemeCfg;->current(Landroid/content/SharedPreferences;Ljava/lang/String;)I
    move-result v5
  .line 161
    if-ltz v5, :L1
    array-length v6, v4
    if-ge v5, v6, :L1
    aget-object v3, v3, v2
    aget-object v4, v4, v5
    invoke-virtual { v0, v3, v4 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    goto :L2
  :L1
  .line 162
    aget-object v3, v3, v2
    invoke-virtual { v0, v3, v5 }, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
  :L2
  .line 158
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 164
    nop
  :L4
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L5
    aget-object v2, v2, v1
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->currentFlag(Landroid/content/SharedPreferences;Ljava/lang/String;)Z
    move-result v3
    invoke-virtual { v0, v2, v3 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    add-int/lit8 v1, v1, 1
    goto :L4
  :L5
  .line 165
    const-string v1, "key_tone_sound"
    const-string v2, ""
    invoke-interface { p0, v1, v2 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    const-string v1, "\u0001theme"
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    const-string v1, "use_theme_key_sound"
    invoke-virtual { v0, v1, p0 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
  .line 166
    return-object v0
.end method

.method private static write(Ljava/io/File;Lorg/json/JSONObject;)Z
  .catchall { :L0 .. :L1 } :L9
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L10 .. :L11 } :L16
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L17 .. :L18 } :L19
  .registers 5
  .line 218
    nop
  .line 220
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 221
    const/4 v0, 2
  :L2
    invoke-virtual { p1, v0 }, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    move-result-object p1
    const-string v0, "UTF-8"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p1
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 222
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/io/FileDescriptor;->sync()V
  :L3
  .line 223
    nop
  :L4
  .line 228
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L5
    goto :L7
  :L6
    move-exception p0
  :L7
  .line 223
    const/4 p0, 1
    return p0
  :L8
  .line 224
    move-exception p1
    move-object v0, v1
    goto :L10
  :L9
    move-exception p1
  :L10
  .line 225
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "ThemeCfg.write "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, ": "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L11
  .line 226
    nop
  .line 228
    if-eqz v0, :L15
  :L12
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L13
    goto :L15
  :L14
    move-exception p0
  :L15
  .line 226
    const/4 p0, 0
    return p0
  :L16
  .line 228
    move-exception p0
    if-eqz v0, :L20
  :L17
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 229
    throw p0
.end method
