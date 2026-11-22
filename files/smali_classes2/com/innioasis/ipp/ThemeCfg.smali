.class public final Lcom/innioasis/ipp/ThemeCfg;
.super Ljava/lang/Object;
.source "ThemeCfg.java"

.field private final static BAR:[Ljava/lang/String;

.field private final static BOX:[Ljava/lang/String;

.field final static FILE:Ljava/lang/String; = "better-Y.json"

.field private final static FLAGS:[Ljava/lang/String;

.field private final static GLOBAL:Ljava/lang/String; = "global:"

.field private final static KEYS:[Ljava/lang/String;

.field private final static LAYOUT:[[Ljava/lang/String;

.field private final static NAMES:[Ljava/lang/Object;

.field private final static SS_BG:[Ljava/lang/String;

.field private final static SS_STYLE:[Ljava/lang/String;

.field private final static SS_TINT:[Ljava/lang/String;

.field private final static STYLE:[Ljava/lang/String;

.field private final static THEME_SOUND:Ljava/lang/String; = "use_theme_key_sound"

.field private final static TINT:[Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 27
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
    const-string v10, "off"
    aput-object v10, v9, v0
    sput-object v9, Lcom/innioasis/ipp/ThemeCfg;->BOX:[Ljava/lang/String;
  .line 31
    new-array v11, v0, [Ljava/lang/String;
    const-string v12, "default"
    aput-object v12, v11, v2
    const-string v13, "simple"
    aput-object v13, v11, v4
    const-string v13, "even"
    aput-object v13, v11, v6
    sput-object v11, Lcom/innioasis/ipp/ThemeCfg;->STYLE:[Ljava/lang/String;
  .line 32
    new-array v13, v6, [Ljava/lang/String;
    aput-object v12, v13, v2
    const-string v12, "centered"
    aput-object v12, v13, v4
    sput-object v13, Lcom/innioasis/ipp/ThemeCfg;->BAR:[Ljava/lang/String;
  .line 33
    new-array v12, v0, [Ljava/lang/String;
    aput-object v3, v12, v2
    aput-object v5, v12, v4
    const-string v14, "wallpaper"
    aput-object v14, v12, v6
    sput-object v12, Lcom/innioasis/ipp/ThemeCfg;->SS_BG:[Ljava/lang/String;
  .line 34
    new-array v14, v8, [Ljava/lang/String;
    aput-object v10, v14, v2
    aput-object v3, v14, v4
    aput-object v5, v14, v6
    aput-object v7, v14, v0
    sput-object v14, Lcom/innioasis/ipp/ThemeCfg;->SS_TINT:[Ljava/lang/String;
  .line 35
    const/16 v3, 9
    new-array v5, v3, [Ljava/lang/String;
    const-string v7, "clock_left"
    aput-object v7, v5, v2
    const-string v7, "clock_center"
    aput-object v7, v5, v4
    const-string v7, "clock_right"
    aput-object v7, v5, v6
    const-string v7, "clock_date_left"
    aput-object v7, v5, v0
    const-string v7, "clock_date_center"
    aput-object v7, v5, v8
    const-string v7, "clock_date_right"
    const/4 v10, 5
    aput-object v7, v5, v10
    const-string v7, "song_left"
    const/4 v15, 6
    aput-object v7, v5, v15
    const-string v7, "song_center"
    const/16 v16, 7
    aput-object v7, v5, v16
    const-string v7, "song_right"
    const/16 v17, 8
    aput-object v7, v5, v17
    sput-object v5, Lcom/innioasis/ipp/ThemeCfg;->SS_STYLE:[Ljava/lang/String;
  .line 40
    const/16 v7, 13
    new-array v3, v7, [Ljava/lang/String;
    const-string v19, "icon_tint"
    aput-object v19, v3, v2
    const-string v20, "text_tint"
    aput-object v20, v3, v4
    const-string v21, "box_tint"
    aput-object v21, v3, v6
    const-string v22, "lyrics_tint"
    aput-object v22, v3, v0
    const-string v23, "bar_text"
    aput-object v23, v3, v8
    const-string v24, "preview_text"
    aput-object v24, v3, v10
    const-string v25, "menu_style"
    aput-object v25, v3, v15
    const-string v25, "bar_style"
    aput-object v25, v3, v16
    const-string v25, "ss_style"
    aput-object v25, v3, v17
    const-string v25, "ss_background"
    const/16 v18, 9
    aput-object v25, v3, v18
    const/16 v25, 10
    const-string v26, "ss_tint"
    aput-object v26, v3, v25
    const/16 v25, 11
    const-string v26, "ss_clock_color"
    aput-object v26, v3, v25
    const/16 v25, 12
    const-string v26, "ss_text_color"
    aput-object v26, v3, v25
    sput-object v3, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
  .line 43
    new-array v3, v7, [Ljava/lang/Object;
    aput-object v1, v3, v2
    aput-object v1, v3, v4
    aput-object v9, v3, v6
    aput-object v1, v3, v0
    aput-object v1, v3, v8
    aput-object v1, v3, v10
    aput-object v11, v3, v15
    aput-object v13, v3, v16
    aput-object v5, v3, v17
    const/16 v5, 9
    aput-object v12, v3, v5
    const/16 v5, 10
    aput-object v14, v3, v5
    const/16 v5, 11
    aput-object v1, v3, v5
    const/16 v5, 12
    aput-object v1, v3, v5
    sput-object v3, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
  .line 47
    new-array v1, v4, [Ljava/lang/String;
    const-string v3, "fixed_menu_pad"
    aput-object v3, v1, v2
    sput-object v1, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
  .line 56
    new-array v1, v10, [[Ljava/lang/String;
    new-array v3, v10, [Ljava/lang/String;
    const-string v5, "now_playing"
    aput-object v5, v3, v2
    aput-object v19, v3, v4
    aput-object v20, v3, v6
    aput-object v22, v3, v0
    aput-object v21, v3, v8
    aput-object v3, v1, v2
    new-array v3, v8, [Ljava/lang/String;
    const-string v5, "menu"
    aput-object v5, v3, v2
    const-string v5, "menu_style"
    aput-object v5, v3, v4
    aput-object v24, v3, v6
    const-string v5, "fixed_menu_pad"
    aput-object v5, v3, v0
    aput-object v3, v1, v4
    new-array v3, v0, [Ljava/lang/String;
    const-string v5, "status_bar"
    aput-object v5, v3, v2
    aput-object v23, v3, v4
    const-string v5, "bar_style"
    aput-object v5, v3, v6
    aput-object v3, v1, v6
    new-array v3, v15, [Ljava/lang/String;
    const-string v5, "screensaver"
    aput-object v5, v3, v2
    const-string v5, "ss_style"
    aput-object v5, v3, v4
    const-string v5, "ss_background"
    aput-object v5, v3, v6
    const-string v5, "ss_tint"
    aput-object v5, v3, v0
    const-string v5, "ss_clock_color"
    aput-object v5, v3, v8
    const-string v5, "ss_text_color"
    aput-object v5, v3, v10
    aput-object v3, v1, v0
    new-array v0, v6, [Ljava/lang/String;
    const-string v3, "key_tone"
    aput-object v3, v0, v2
    const-string v2, "use_theme_key_sound"
    aput-object v2, v0, v4
    aput-object v0, v1, v8
    sput-object v1, Lcom/innioasis/ipp/ThemeCfg;->LAYOUT:[[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 63
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static current(Landroid/content/SharedPreferences;Ljava/lang/String;)I
  .registers 3
  .line 134
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v0
    invoke-interface { p0, p1, v0 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p0
    return p0
.end method

.method private static currentFlag(Landroid/content/SharedPreferences;Ljava/lang/String;)Z
  .registers 3
  .line 138
    invoke-static { p1 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result v0
    invoke-interface { p0, p1, v0 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result p0
    return p0
.end method

.method private static dirOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 125
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
  .line 130
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
  .line 167
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/ThemeCfg;->soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 168
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v3, v2
    const-string v4, "global:"
    if-ge v1, v3, :L2
  .line 169
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v2, v1
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 170
    invoke-interface { p0, v3 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L1
    aget-object v2, v2, v1
    invoke-interface { p0, v3, v0 }, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v3
    invoke-interface { p1, v2, v3 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
  :L1
  .line 168
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 172
    nop
  :L3
    sget-object v1, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v2, v1
    if-ge v0, v2, :L5
  .line 173
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v1, v0
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 174
    invoke-interface { p0, v2 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L4
    aget-object v1, v1, v0
    const/4 v3, 1
    invoke-interface { p0, v2, v3 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    invoke-interface { p1, v1, v2 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  :L4
  .line 172
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 176
    return-void
.end method

.method private static fromJson(Lorg/json/JSONObject;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 10
  .line 216
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    const-string v1, "use_theme_key_sound"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->opt(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    const-string p1, "key_tone_sound"
    const-string v0, "\u0001theme"
    invoke-interface { p2, p1, v0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L1
  :L0
  .line 217
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/ThemeCfg;->soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L1
  .line 218
    const/4 p1, 0
    const/4 v0, 0
  :L2
    sget-object v1, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v2, v1
    if-ge v0, v2, :L8
  .line 219
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
    aget-object v2, v2, v0
    check-cast v2, [Ljava/lang/String;
  .line 220
    aget-object v3, v1, v0
    invoke-static { v3 }, Lcom/innioasis/ipp/Prefs;->defInt(Ljava/lang/String;)I
    move-result v3
  .line 221
    aget-object v1, v1, v0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->opt(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
  .line 222
    instance-of v4, v1, Ljava/lang/Number;
    if-eqz v4, :L3
  .line 223
    check-cast v1, Ljava/lang/Number;
    invoke-virtual { v1 }, Ljava/lang/Number;->intValue()I
    move-result v1
  .line 224
    if-ltz v1, :L6
    array-length v2, v2
    if-ge v1, v2, :L6
    move v3, v1
    goto :L6
  :L3
  .line 225
    instance-of v4, v1, Ljava/lang/String;
    if-eqz v4, :L6
  .line 226
    const/4 v4, 0
  :L4
    array-length v5, v2
    if-ge v4, v5, :L7
  .line 227
    aget-object v5, v2, v4
    move-object v6, v1
    check-cast v6, Ljava/lang/String;
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L5
    move v3, v4
  :L5
  .line 226
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 225
    nop
  :L7
  .line 230
    sget-object v1, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    aget-object v1, v1, v0
    invoke-interface { p2, v1, v3 }, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
  .line 218
    add-int/lit8 v0, v0, 1
    goto :L2
  :L8
  .line 232
    nop
  :L9
    sget-object v0, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v1, v0
    if-ge p1, v1, :L12
  .line 233
    aget-object v1, v0, p1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->opt(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
  .line 234
    instance-of v2, v1, Ljava/lang/Boolean;
    if-eqz v2, :L10
    check-cast v1, Ljava/lang/Boolean;
    invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result v1
    goto :L11
  :L10
    aget-object v1, v0, p1
    invoke-static { v1 }, Lcom/innioasis/ipp/Prefs;->defBool(Ljava/lang/String;)Z
    move-result v1
  :L11
  .line 235
    aget-object v0, v0, p1
    invoke-interface { p2, v0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 232
    add-int/lit8 p1, p1, 1
    goto :L9
  :L12
  .line 237
    return-void
.end method

.method private static opt(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
  .registers 6
  .line 202
    invoke-virtual { p0, p1 }, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
  .line 203
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 204
    const/4 v0, 0
    const/4 v1, 0
  :L1
    sget-object v2, Lcom/innioasis/ipp/ThemeCfg;->LAYOUT:[[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L3
  .line 205
    aget-object v2, v2, v1
    aget-object v2, v2, v0
    invoke-virtual { p0, v2 }, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    move-result-object v2
  .line 206
    if-eqz v2, :L2
    invoke-virtual { v2, p1 }, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L2
    invoke-virtual { v2, p1 }, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    return-object p0
  :L2
  .line 204
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 208
    const/4 p0, 0
    return-object p0
.end method

.method private static read(Ljava/io/File;)Lorg/json/JSONObject;
  .catchall { :L0 .. :L1 } :L10
  .catchall { :L1 .. :L5 } :L9
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L11 .. :L12 } :L17
  .catchall { :L13 .. :L14 } :L15
  .catchall { :L18 .. :L19 } :L20
  .registers 9
  .line 240
    nop
  .line 242
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 243
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v2
    const-wide/32 v4, 65536
    invoke-static { v2, v3, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v2
    long-to-int v3, v2
    new-array v2, v3, [B
  .line 244
    const/4 v4, 0
    const/4 v5, 0
  :L2
  .line 245
    if-ge v5, v3, :L4
  .line 246
    sub-int v6, v3, v5
    invoke-virtual { v1, v2, v5, v6 }, Ljava/io/InputStream;->read([BII)I
    move-result v6
  .line 247
    if-gez v6, :L3
    goto :L4
  :L3
  .line 248
    add-int/2addr v5, v6
  .line 249
    goto :L2
  :L4
  .line 250
    new-instance v3, Lorg/json/JSONObject;
    new-instance v6, Ljava/lang/String;
    const-string v7, "UTF-8"
    invoke-direct { v6, v2, v4, v5, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-direct { v3, v6 }, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
  :L5
  .line 255
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L6
    goto :L8
  :L7
    move-exception p0
  :L8
  .line 250
    return-object v3
  :L9
  .line 251
    move-exception v2
    goto :L11
  :L10
    move-exception v2
    move-object v1, v0
  :L11
  .line 252
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
  .line 253
    nop
  .line 255
    if-eqz v1, :L16
  :L13
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L14
    goto :L16
  :L15
    move-exception p0
  :L16
  .line 253
    return-object v0
  :L17
  .line 255
    move-exception p0
    if-eqz v1, :L21
  :L18
    invoke-virtual { v1 }, Ljava/io/InputStream;->close()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 256
    goto :L23
  :L22
    throw p0
  :L23
    goto :L22
.end method

.method private static rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 4
  .line 149
    const-string v0, "key_tone_sound"
    const-string v1, ""
    invoke-interface { p0, v0, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 150
    const-string v0, "\u0001theme"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    const-string v0, "global:key_tone_sound"
    invoke-interface { p1, v0, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  :L0
  .line 151
    return-void
.end method

.method public static save(Landroid/content/Context;Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;)V
  .catchall { :L2 .. :L7 } :L14
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 93
    nop
  .line 94
    const-string v0, ""
    if-nez p1, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getName()Ljava/lang/String;
    move-result-object v1
  :L1
  .line 96
    const/4 v2, 0
  :L2
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v3
  .line 97
    if-nez p1, :L3
    goto :L4
  :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 98
    if-eqz v3, :L12
  .line 99
    if-nez v0, :L5
  .line 100
    invoke-interface { v3 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p1
  .line 101
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 102
    invoke-interface { p1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result p1
  .line 103
    goto :L13
  :L5
  .line 104
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v4
    if-nez v4, :L6
    invoke-virtual { v0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 105
    invoke-virtual { v5 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v5
  .line 104
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L6
  .line 107
    invoke-interface { v3 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v4
  .line 108
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 109
    invoke-interface { v4 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L6
  .line 111
    invoke-static { v3 }, Lcom/innioasis/ipp/ThemeCfg;->toJson(Landroid/content/SharedPreferences;)Lorg/json/JSONObject;
    move-result-object v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/ThemeCfg;->write(Ljava/io/File;Lorg/json/JSONObject;)Z
    move-result v0
  :L7
  .line 112
    if-eqz v0, :L11
  :L8
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Theme;->cfgSaved(Landroid/content/Context;Ljava/lang/String;)V
  :L9
    goto :L11
  :L10
  .line 115
    move-exception p1
    goto :L15
  :L11
  .line 117
    move p1, v0
    goto :L13
  :L12
  .line 98
    const/4 p1, 0
  :L13
  .line 117
    goto :L16
  :L14
  .line 115
    move-exception p1
    const/4 v0, 0
  :L15
  .line 116
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
  .line 118
    if-nez p0, :L17
    return-void
  :L17
  .line 119
    if-eqz p1, :L18
    const/4 p1, 1
    new-array p1, p1, [Ljava/lang/Object;
    aput-object v1, p1, v2
    const v0, 2131821171
    invoke-virtual { p0, v0, p1 }, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    goto :L19
  :L18
  .line 120
    const p1, 2131821172
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
  :L19
  .line 121
    invoke-static { p0, p1, v2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  .line 122
    return-void
.end method

.method private static soundFromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 7
  .line 158
    const-string v0, "global:key_tone_sound"
    const-string v1, ""
    invoke-interface { p0, v0, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 159
    const-string v3, "\u0001theme"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L0
    move-object v2, v1
  :L0
  .line 160
    const-string v4, "key_tone_sound"
    invoke-interface { p0, v4, v1 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 161
    invoke-interface { p0, v0 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L1
    invoke-virtual { v3, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
  :L1
  .line 162
    invoke-interface { p1, v4, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  :L2
  .line 164
    return-void
.end method

.method public static switchTo(Ljava/lang/String;)V
  .catchall { :L0 .. :L9 } :L14
  .catchall { :L10 .. :L13 } :L14
  .registers 5
  :L0
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 69
    if-nez v0, :L1
    return-void
  :L1
  .line 70
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/ThemeCfg;->dirOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 72
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
  .line 73
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L2
    goto :L3
  :L2
  .line 74
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    goto :L4
  :L3
  .line 73
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/ThemeCfg;->toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L4
  .line 75
    invoke-interface { v2 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  .line 76
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
  .line 77
    invoke-static { p0 }, Lcom/innioasis/ipp/ThemeCfg;->fileOf(Ljava/lang/String;)Ljava/io/File;
    move-result-object v2
  .line 78
    if-eqz v2, :L5
    invoke-virtual { v2 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L5
    invoke-static { v2 }, Lcom/innioasis/ipp/ThemeCfg;->read(Ljava/io/File;)Lorg/json/JSONObject;
    move-result-object v2
    goto :L6
  :L5
    const/4 v2, 0
  :L6
  .line 79
    if-eqz v2, :L7
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->fromJson(Lorg/json/JSONObject;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    goto :L8
  :L7
  .line 80
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/ThemeCfg;->fromGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  :L8
  .line 82
    invoke-static { p0 }, Lcom/innioasis/ipp/Saver;->themePicture(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L9
  .line 83
    const-string v0, "ss_image"
    if-eqz p0, :L11
  :L10
    invoke-interface { v1, v0, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L12
  :L11
  .line 84
    invoke-interface { v1, v0 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  :L12
  .line 85
    invoke-interface { v1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L13
  .line 88
    goto :L15
  :L14
  .line 86
    move-exception p0
  .line 87
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
  :L15
  .line 89
    return-void
.end method

.method private static toGlobal(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .registers 7
  .line 142
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
  .line 143
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
  .line 144
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/ThemeCfg;->rememberSound(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
  .line 145
    return-void
.end method

.method private static toJson(Landroid/content/SharedPreferences;)Lorg/json/JSONObject;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 9
  .line 180
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 181
    const/4 v1, 0
    const/4 v2, 0
  :L0
    sget-object v3, Lcom/innioasis/ipp/ThemeCfg;->KEYS:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L3
  .line 182
    sget-object v4, Lcom/innioasis/ipp/ThemeCfg;->NAMES:[Ljava/lang/Object;
    aget-object v4, v4, v2
    check-cast v4, [Ljava/lang/String;
  .line 183
    aget-object v5, v3, v2
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/ThemeCfg;->current(Landroid/content/SharedPreferences;Ljava/lang/String;)I
    move-result v5
  .line 184
    aget-object v3, v3, v2
    if-ltz v5, :L1
    array-length v6, v4
    if-ge v5, v6, :L1
    aget-object v4, v4, v5
    goto :L2
  :L1
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
  :L2
    invoke-virtual { v0, v3, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 181
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 186
    const/4 v2, 0
  :L4
    sget-object v3, Lcom/innioasis/ipp/ThemeCfg;->FLAGS:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L5
    aget-object v3, v3, v2
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/ThemeCfg;->currentFlag(Landroid/content/SharedPreferences;Ljava/lang/String;)Z
    move-result v4
    invoke-static { v4 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v4
    invoke-virtual { v0, v3, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 187
    const-string v2, "key_tone_sound"
    const-string v3, ""
    invoke-interface { p0, v2, v3 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    const-string v2, "\u0001theme"
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    invoke-static { p0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object p0
    const-string v2, "use_theme_key_sound"
    invoke-virtual { v0, v2, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 188
    new-instance p0, Lorg/json/JSONObject;
    invoke-direct { p0 }, Lorg/json/JSONObject;-><init>()V
  .line 189
    const/4 v2, 0
  :L6
    sget-object v3, Lcom/innioasis/ipp/ThemeCfg;->LAYOUT:[[Ljava/lang/String;
    array-length v3, v3
    if-ge v2, v3, :L10
  .line 190
    new-instance v3, Lorg/json/JSONObject;
    invoke-direct { v3 }, Lorg/json/JSONObject;-><init>()V
  .line 191
    const/4 v4, 1
  :L7
    sget-object v5, Lcom/innioasis/ipp/ThemeCfg;->LAYOUT:[[Ljava/lang/String;
    aget-object v6, v5, v2
    array-length v7, v6
    if-ge v4, v7, :L9
  .line 192
    aget-object v6, v6, v4
    invoke-virtual { v0, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
  .line 193
    if-eqz v6, :L8
    aget-object v5, v5, v2
    aget-object v5, v5, v4
    invoke-virtual { v3, v5, v6 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  :L8
  .line 191
    add-int/lit8 v4, v4, 1
    goto :L7
  :L9
  .line 195
    aget-object v4, v6, v1
    invoke-virtual { p0, v4, v3 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 189
    add-int/lit8 v2, v2, 1
    goto :L6
  :L10
  .line 197
    return-object p0
.end method

.method private static write(Ljava/io/File;Lorg/json/JSONObject;)Z
  .catchall { :L0 .. :L1 } :L9
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L10 .. :L11 } :L16
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L17 .. :L18 } :L19
  .registers 5
  .line 260
    nop
  .line 262
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 263
    const/4 v0, 2
  :L2
    invoke-virtual { p1, v0 }, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    move-result-object p1
    const-string v0, "UTF-8"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p1
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 264
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/io/FileDescriptor;->sync()V
  :L3
  .line 265
    nop
  :L4
  .line 270
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L5
    goto :L7
  :L6
    move-exception p0
  :L7
  .line 265
    const/4 p0, 1
    return p0
  :L8
  .line 266
    move-exception p1
    move-object v0, v1
    goto :L10
  :L9
    move-exception p1
  :L10
  .line 267
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
  .line 268
    nop
  .line 270
    if-eqz v0, :L15
  :L12
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L13
    goto :L15
  :L14
    move-exception p0
  :L15
  .line 268
    const/4 p0, 0
    return p0
  :L16
  .line 270
    move-exception p0
    if-eqz v0, :L20
  :L17
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 271
    throw p0
.end method
