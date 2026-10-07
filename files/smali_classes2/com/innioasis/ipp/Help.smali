.class public final Lcom/innioasis/ipp/Help;
.super Ljava/lang/Object;
.source "Help.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Help$Row;,
    Lcom/innioasis/ipp/Help$Block;
  }
.end annotation

.field private final static DIR:Ljava/lang/String; = "help"

.field private final static IMG:Ljava/lang/String; = "help/img/"

.field private static entries:Ljava/util/HashMap;

.field private static loadedFor:Ljava/lang/String;

.field private static order:Ljava/util/List;

.method private constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static appRes(Ljava/lang/String;)I
  .registers 2
  .line 307
    const-string v0, "artists"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    const p0, 2131820839
    return p0
  :L0
  .line 308
    const-string v0, "albums"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const p0, 2131820835
    return p0
  :L1
  .line 309
    const-string v0, "genres"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    const p0, 2131820843
    return p0
  :L2
  .line 310
    const-string v0, "folders"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    const p0, 2131820842
    return p0
  :L3
  .line 311
    const-string v0, "favorites"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L4
    const p0, 2131821035
    return p0
  :L4
  .line 312
    const/4 p0, 0
    return p0
.end method

.method public static blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
  .registers 10
  .line 95
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 96
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->raw(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 97
    if-nez p1, :L0
    return-object v0
  :L0
  .line 98
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->resolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 99
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 100
    const-string v1, "\n"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 101
    const/4 v1, 0
    const/4 v2, 0
  :L1
    array-length v3, p0
    if-ge v2, v3, :L8
  .line 102
    aget-object v3, p0, v2
  .line 103
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
  .line 104
    const-string v5, "@img "
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 105
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .line 107
    const/4 v3, 5
    invoke-virtual { v4, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 108
    const/16 v4, 32
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 109
    const/4 v5, 0
    if-gez v4, :L2
    new-instance v4, Lcom/innioasis/ipp/Help$Block;
    invoke-direct { v4, v5, v3, v5 }, Lcom/innioasis/ipp/Help$Block;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L3
  :L2
  .line 110
    new-instance v6, Lcom/innioasis/ipp/Help$Block;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
    invoke-direct { v6, v5, v7, v3 }, Lcom/innioasis/ipp/Help$Block;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    move-object v4, v6
  :L3
  .line 109
    invoke-interface { v0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 111
    goto :L7
  :L4
    const-string v5, "---"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L5
  .line 112
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
    goto :L7
  :L5
  .line 114
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L6
    const/16 v4, 10
    invoke-virtual { p1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 115
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L7
  .line 101
    add-int/lit8 v2, v2, 1
    goto :L1
  :L8
  .line 118
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .line 119
    return-object v0
.end method

.method private static clause(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 253
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  .line 254
    const/4 v1, 0
    if-gez v0, :L0
    return-object v1
  :L0
  .line 255
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p1
    add-int/2addr v0, p1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 256
    const/16 p1, 32
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(I)I
    move-result p1
  .line 257
    if-lez p1, :L1
    const/4 v0, 0
    invoke-virtual { p0, v0, p1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 258
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-nez p1, :L2
    goto :L3
  :L2
    move-object v1, p0
  :L3
    return-object v1
.end method

.method private static close(Ljava/io/InputStream;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 317
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L1
    goto :L3
  :L2
  .line 318
    move-exception p0
    goto :L4
  :L3
  .line 319
    nop
  :L4
  .line 320
    return-void
.end method

.method private static flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .registers 5
  .line 123
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  .line 124
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    new-instance v1, Lcom/innioasis/ipp/Help$Block;
    const/4 v2, 0
    invoke-direct { v1, v0, v2, v2 }, Lcom/innioasis/ipp/Help$Block;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-interface { p0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L0
  .line 125
    const/4 p0, 0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->setLength(I)V
  .line 126
    return-void
.end method

.method public static has(Landroid/content/Context;Ljava/lang/String;)Z
  .registers 2
  .line 92
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->raw(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static image(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 146
    nop
  .line 148
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object p0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "help/img/"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object p0
  :L1
  .line 149
    invoke-static { p0 }, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L2
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 149
    return-object p1
  :L3
  .line 150
    move-exception p1
    goto :L5
  :L4
    move-exception p0
    move-object p0, v0
  :L5
  .line 151
    nop
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 151
    return-object v0
.end method

.method public static label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 81
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p0
  .line 82
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    iget-object p0, p0, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
  :L1
    return-object p0
.end method

.method private static lang(Landroid/content/Context;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  .line 182
    const-string v0, "en"
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object p0
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
    invoke-virtual { p0 }, Ljava/util/Locale;->getLanguage()Ljava/lang/String;
    move-result-object p0
  .line 183
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  :L1
    if-nez v1, :L2
    goto :L3
  :L2
    move-object v0, p0
  :L3
    return-object v0
  :L4
  .line 184
    move-exception p0
  .line 185
    return-object v0
.end method

.method private static load(Landroid/content/Context;)V
  .registers 6
  .line 167
    if-nez p0, :L0
    return-void
  :L0
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->lang(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
  .line 169
    sget-object v1, Lcom/innioasis/ipp/Help;->entries:Ljava/util/HashMap;
    if-eqz v1, :L1
    sget-object v1, Lcom/innioasis/ipp/Help;->loadedFor:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 170
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 171
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 172
    const-string v3, "en"
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Help;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Help;->parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  .line 173
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    const/4 v3, 0
    invoke-static { p0, v1, v3 }, Lcom/innioasis/ipp/Help;->parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  :L2
  .line 174
    sput-object v1, Lcom/innioasis/ipp/Help;->entries:Ljava/util/HashMap;
  .line 175
    sput-object v2, Lcom/innioasis/ipp/Help;->order:Ljava/util/List;
  .line 176
    sput-object v0, Lcom/innioasis/ipp/Help;->loadedFor:Ljava/lang/String;
  .line 177
    return-void
.end method

.method private static parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  .registers 14
  .line 213
    if-nez p0, :L0
    return-void
  :L0
  .line 214
    nop
  .line 215
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 216
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 217
    const-string v2, "\n"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 218
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L1
    array-length v5, p0
    if-ge v4, v5, :L17
  .line 219
    aget-object v5, p0, v4
  .line 220
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
  .line 221
    const-string v7, "[["
    invoke-virtual { v6, v7 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
  .line 222
    const-string v8, "["
    invoke-virtual { v6, v8 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v8
    const/4 v9, 2
    if-eqz v8, :L13
    const/16 v8, 93
    invoke-virtual { v6, v8 }, Ljava/lang/String;->indexOf(I)I
    move-result v8
    const/4 v10, 1
    if-le v8, v10, :L13
  .line 223
    invoke-static { v3, v0, v1 }, Lcom/innioasis/ipp/Help;->store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .line 224
    if-eqz v7, :L2
    const-string v3, "]]"
    goto :L3
  :L2
    const-string v3, "]"
  :L3
    invoke-virtual { v6, v3 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v3
  .line 225
    if-eqz v7, :L4
    const/4 v5, 2
    goto :L5
  :L4
    const/4 v5, 1
  :L5
    invoke-virtual { v6, v5, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
  .line 226
    if-eqz v7, :L6
    goto :L7
  :L6
    const/4 v9, 1
  :L7
    add-int/2addr v3, v9
    invoke-virtual { v6, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 227
    const/16 v6, 32
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
  .line 228
    if-lez v6, :L8
    invoke-virtual { v5, v2, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    goto :L9
  :L8
    move-object v6, v5
  :L9
  .line 229
    if-eqz p2, :L10
  .line 230
    new-instance v8, Lcom/innioasis/ipp/Help$Row;
    invoke-direct { v8, v6, v7 }, Lcom/innioasis/ipp/Help$Row;-><init>(Ljava/lang/String;Z)V
  .line 231
    const-string v7, " if "
    invoke-static { v5, v7 }, Lcom/innioasis/ipp/Help;->clause(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    iput-object v7, v8, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
  .line 232
    const-string v7, " in "
    invoke-static { v5, v7 }, Lcom/innioasis/ipp/Help;->clause(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v8, Lcom/innioasis/ipp/Help$Row;->parent:Ljava/lang/String;
  .line 233
    invoke-virtual { p1, v6, v8 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 234
    invoke-interface { p2, v8 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
    goto :L11
  :L10
  .line 236
    invoke-virtual { p1, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    move-object v8, v5
    check-cast v8, Lcom/innioasis/ipp/Help$Row;
  :L11
  .line 238
    if-eqz v8, :L12
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L12
    iput-object v3, v8, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
  :L12
  .line 239
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->setLength(I)V
  .line 240
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 241
    move-object v3, v8
    goto :L16
  :L13
    if-eqz v3, :L14
    const-string v7, "* "
    invoke-virtual { v6, v7 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L14
  .line 242
    invoke-virtual { v6, v9 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
    invoke-interface { v1, v5 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
    goto :L16
  :L14
  .line 243
    if-eqz v3, :L16
  .line 244
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v6
    if-lez v6, :L15
    const/16 v6, 10
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L15
  .line 245
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L16
  .line 218
    add-int/lit8 v4, v4, 1
    goto/16 :L1
  :L17
  .line 248
    invoke-static { v3, v0, v1 }, Lcom/innioasis/ipp/Help;->store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .line 249
    return-void
.end method

.method private static raw(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 158
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p0
  .line 159
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    iget-object p0, p0, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
  :L1
    return-object p0
.end method

.method private static read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L6
  .catchall { :L1 .. :L4 } :L5
  .registers 6
  .line 190
    nop
  .line 192
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object p0
  .line 193
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "help/"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v1, ".txt"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object p0
  :L1
  .line 194
    new-instance p1, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 8192
    invoke-direct { p1, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 195
    const/16 v1, 4096
    new-array v1, v1, [B
  :L2
  .line 197
    invoke-virtual { p0, v1 }, Ljava/io/InputStream;->read([B)I
    move-result v2
    if-lez v2, :L3
    const/4 v3, 0
    invoke-virtual { p1, v1, v3, v2 }, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :L2
  :L3
  .line 198
    new-instance v1, Ljava/lang/String;
    invoke-virtual { p1 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p1
    const-string v2, "UTF-8"
    invoke-direct { v1, p1, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  :L4
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 198
    return-object v1
  :L5
  .line 199
    move-exception p1
    goto :L7
  :L6
    move-exception p0
    move-object p0, v0
  :L7
  .line 200
    nop
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 200
    return-object v0
.end method

.method private static resolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 273
    const/16 v0, 123
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L0
    return-object p1
  :L0
  .line 274
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v2
    add-int/lit8 v2, v2, 32
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 275
    const/4 v2, 0
  :L1
  .line 276
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
    if-ge v2, v3, :L5
  .line 277
    invoke-virtual { p1, v0, v2 }, Ljava/lang/String;->indexOf(II)I
    move-result v3
  .line 278
    if-gez v3, :L2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L5
  :L2
  .line 279
    const/16 v4, 125
    invoke-virtual { p1, v4, v3 }, Ljava/lang/String;->indexOf(II)I
    move-result v4
  .line 280
    if-gez v4, :L3
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L5
  :L3
  .line 281
    invoke-virtual { v1, p1, v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;
  .line 282
    add-int/lit8 v2, v3, 1
    invoke-virtual { p1, v2, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
  .line 283
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Help;->value(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 284
    if-nez v2, :L4
    add-int/lit8 v2, v4, 1
    invoke-virtual { p1, v3, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
  :L4
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 285
    add-int/lit8 v2, v4, 1
  .line 286
    goto :L1
  :L5
  .line 287
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
  .registers 3
  .line 86
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 87
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->load(Landroid/content/Context;)V
  .line 88
    sget-object p0, Lcom/innioasis/ipp/Help;->entries:Ljava/util/HashMap;
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/Help$Row;
  :L2
    return-object v0
.end method

.method public static rows(Landroid/content/Context;)Ljava/util/List;
  .registers 1
  .line 75
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->load(Landroid/content/Context;)V
  .line 76
    sget-object p0, Lcom/innioasis/ipp/Help;->order:Ljava/util/List;
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  :L0
    return-object p0
.end method

.method public static size(Landroid/content/Context;Ljava/lang/String;)[I
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L4
  .registers 7
  .line 130
    nop
  .line 132
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 133
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 134
    invoke-virtual { p0 }, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object p0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "help/img/"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object p0
  :L1
  .line 135
    invoke-static { p0, v0, v1 }, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 136
    iget p1, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez p1, :L3
    const/4 p1, 2
    new-array p1, p1, [I
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    const/4 v4, 0
    aput v3, p1, v4
    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    aput v1, p1, v2
  :L2
    move-object v0, p1
  :L3
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 136
    return-object v0
  :L4
  .line 137
    move-exception p1
    goto :L6
  :L5
    move-exception p0
    move-object p0, v0
  :L6
  .line 138
    nop
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 138
    return-object v0
.end method

.method private static store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .registers 6
  .line 262
    if-nez p0, :L0
    return-void
  :L0
  .line 263
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  .line 264
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    iput-object p1, p0, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
  :L1
  .line 265
    invoke-interface { p2 }, Ljava/util/List;->isEmpty()Z
    move-result p1
    if-nez p1, :L4
  .line 266
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p1
    new-array v0, p1, [Ljava/lang/String;
  .line 267
    const/4 v1, 0
  :L2
    if-ge v1, p1, :L3
    invoke-interface { p2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    aput-object v2, v0, v1
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 268
    iput-object v0, p0, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
  :L4
  .line 270
    return-void
.end method

.method private static value(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  .line 292
    const/4 v0, 0
  :L0
    const-string v1, "row:"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 4
    if-eqz v1, :L1
  .line 293
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->labelOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 295
    const-string v1, "app:"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
  .line 296
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Help;->appRes(Ljava/lang/String;)I
    move-result p1
  .line 297
    if-nez p1, :L2
    goto :L3
  :L2
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 299
    const-string v1, "on"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
    const p1, 2131821018
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 300
    const-string v1, "off"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L7
    const p1, 2131821019
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L6
    return-object p0
  :L7
  .line 302
    goto :L9
  :L8
  .line 301
    move-exception p0
  :L9
  .line 303
    return-object v0
.end method
