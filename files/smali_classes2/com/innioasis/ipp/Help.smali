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
  .line 299
    const-string v0, "artists"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    const p0, 2131820839
    return p0
  :L0
  .line 300
    const-string v0, "albums"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const p0, 2131820835
    return p0
  :L1
  .line 301
    const-string v0, "genres"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    const p0, 2131820843
    return p0
  :L2
  .line 302
    const-string v0, "folders"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    const p0, 2131820842
    return p0
  :L3
  .line 303
    const-string v0, "favorites"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L4
    const p0, 2131821035
    return p0
  :L4
  .line 304
    const/4 p0, 0
    return p0
.end method

.method public static blocks(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
  .registers 10
  .line 94
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 95
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->raw(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 96
    if-nez p1, :L0
    return-object v0
  :L0
  .line 97
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->resolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 98
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 99
    const-string v1, "\n"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 100
    const/4 v1, 0
    const/4 v2, 0
  :L1
    array-length v3, p0
    if-ge v2, v3, :L8
  .line 101
    aget-object v3, p0, v2
  .line 102
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
  .line 103
    const-string v5, "@img "
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 104
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .line 106
    const/4 v3, 5
    invoke-virtual { v4, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 107
    const/16 v4, 32
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 108
    const/4 v5, 0
    if-gez v4, :L2
    new-instance v4, Lcom/innioasis/ipp/Help$Block;
    invoke-direct { v4, v5, v3, v5 }, Lcom/innioasis/ipp/Help$Block;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L3
  :L2
  .line 109
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
  .line 108
    invoke-interface { v0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 110
    goto :L7
  :L4
    const-string v5, "---"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L5
  .line 111
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
    goto :L7
  :L5
  .line 113
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L6
    const/16 v4, 10
    invoke-virtual { p1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 114
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L7
  .line 100
    add-int/lit8 v2, v2, 1
    goto :L1
  :L8
  .line 117
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Help;->flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .line 118
    return-object v0
.end method

.method private static close(Ljava/io/InputStream;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 309
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/InputStream;->close()V
  :L1
    goto :L3
  :L2
  .line 310
    move-exception p0
    goto :L4
  :L3
  .line 311
    nop
  :L4
  .line 312
    return-void
.end method

.method private static flush(Ljava/util/List;Ljava/lang/StringBuilder;)V
  .registers 5
  .line 122
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  .line 123
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    new-instance v1, Lcom/innioasis/ipp/Help$Block;
    const/4 v2, 0
    invoke-direct { v1, v0, v2, v2 }, Lcom/innioasis/ipp/Help$Block;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-interface { p0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L0
  .line 124
    const/4 p0, 0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->setLength(I)V
  .line 125
    return-void
.end method

.method public static has(Landroid/content/Context;Ljava/lang/String;)Z
  .registers 2
  .line 91
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
  .line 145
    nop
  .line 147
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
  .line 148
    invoke-static { p0 }, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L2
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 148
    return-object p1
  :L3
  .line 149
    move-exception p1
    goto :L5
  :L4
    move-exception p0
    move-object p0, v0
  :L5
  .line 150
    nop
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 150
    return-object v0
.end method

.method public static label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 80
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p0
  .line 81
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
  .line 181
    const-string v0, "en"
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object p0
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
    invoke-virtual { p0 }, Ljava/util/Locale;->getLanguage()Ljava/lang/String;
    move-result-object p0
  .line 182
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
  .line 183
    move-exception p0
  .line 184
    return-object v0
.end method

.method private static load(Landroid/content/Context;)V
  .registers 6
  .line 166
    if-nez p0, :L0
    return-void
  :L0
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->lang(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
  .line 168
    sget-object v1, Lcom/innioasis/ipp/Help;->entries:Ljava/util/HashMap;
    if-eqz v1, :L1
    sget-object v1, Lcom/innioasis/ipp/Help;->loadedFor:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 169
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 170
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 171
    const-string v3, "en"
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Help;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Help;->parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  .line 172
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    const/4 v3, 0
    invoke-static { p0, v1, v3 }, Lcom/innioasis/ipp/Help;->parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  :L2
  .line 173
    sput-object v1, Lcom/innioasis/ipp/Help;->entries:Ljava/util/HashMap;
  .line 174
    sput-object v2, Lcom/innioasis/ipp/Help;->order:Ljava/util/List;
  .line 175
    sput-object v0, Lcom/innioasis/ipp/Help;->loadedFor:Ljava/lang/String;
  .line 176
    return-void
.end method

.method private static parse(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/List;)V
  .registers 15
  .line 211
    if-nez p0, :L0
    return-void
  :L0
  .line 212
    nop
  .line 213
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 214
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 215
    const-string v2, "\n"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 216
    const/4 v2, 0
    const/4 v3, 0
    move-object v5, v3
    const/4 v4, 0
  :L1
    array-length v6, p0
    if-ge v4, v6, :L19
  .line 217
    aget-object v6, p0, v4
  .line 218
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
  .line 219
    const-string v8, "[["
    invoke-virtual { v7, v8 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v8
  .line 220
    const-string v9, "["
    invoke-virtual { v7, v9 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v9
    const/4 v10, 2
    if-eqz v9, :L15
    const/16 v9, 93
    invoke-virtual { v7, v9 }, Ljava/lang/String;->indexOf(I)I
    move-result v9
    const/4 v11, 1
    if-le v9, v11, :L15
  .line 221
    invoke-static { v5, v0, v1 }, Lcom/innioasis/ipp/Help;->store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .line 222
    if-eqz v8, :L2
    const-string v5, "]]"
    goto :L3
  :L2
    const-string v5, "]"
  :L3
    invoke-virtual { v7, v5 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v5
  .line 223
    if-eqz v8, :L4
    const/4 v6, 2
    goto :L5
  :L4
    const/4 v6, 1
  :L5
    invoke-virtual { v7, v6, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
  .line 224
    if-eqz v8, :L6
    goto :L7
  :L6
    const/4 v10, 1
  :L7
    add-int/2addr v5, v10
    invoke-virtual { v7, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
  .line 225
    nop
  .line 226
    nop
  .line 227
    const-string v7, " if "
    invoke-virtual { v6, v7 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v7
  .line 228
    if-lez v7, :L8
  .line 229
    invoke-virtual { v6, v2, v7 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v9 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v9
  .line 230
    add-int/lit8 v7, v7, 4
    invoke-virtual { v6, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    move-object v7, v6
    move-object v6, v9
    goto :L9
  :L8
  .line 228
    move-object v7, v3
  :L9
  .line 232
    if-eqz p2, :L12
  .line 233
    new-instance v9, Lcom/innioasis/ipp/Help$Row;
    invoke-direct { v9, v6, v8 }, Lcom/innioasis/ipp/Help$Row;-><init>(Ljava/lang/String;Z)V
  .line 234
    if-eqz v7, :L10
    invoke-virtual { v7 }, Ljava/lang/String;->length()I
    move-result v8
    if-nez v8, :L11
  :L10
    move-object v7, v3
  :L11
    iput-object v7, v9, Lcom/innioasis/ipp/Help$Row;->showIf:Ljava/lang/String;
  .line 235
    invoke-virtual { p1, v6, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 236
    invoke-interface { p2, v9 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
    move-object v6, v9
    goto :L13
  :L12
  .line 238
    invoke-virtual { p1, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Help$Row;
  :L13
  .line 240
    if-eqz v6, :L14
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v7
    if-lez v7, :L14
    iput-object v5, v6, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
  :L14
  .line 241
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->setLength(I)V
  .line 242
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 243
    move-object v5, v6
    goto :L18
  :L15
    if-eqz v5, :L16
    const-string v8, "* "
    invoke-virtual { v7, v8 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v8
    if-eqz v8, :L16
  .line 244
    invoke-virtual { v7, v10 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    invoke-interface { v1, v6 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
    goto :L18
  :L16
  .line 245
    if-eqz v5, :L18
  .line 246
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v7
    if-lez v7, :L17
    const/16 v7, 10
    invoke-virtual { v0, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L17
  .line 247
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L18
  .line 216
    add-int/lit8 v4, v4, 1
    goto/16 :L1
  :L19
  .line 250
    invoke-static { v5, v0, v1 }, Lcom/innioasis/ipp/Help;->store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .line 251
    return-void
.end method

.method private static raw(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 157
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object p0
  .line 158
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
  .line 189
    nop
  .line 191
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object p0
  .line 192
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
  .line 193
    new-instance p1, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 8192
    invoke-direct { p1, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 194
    const/16 v1, 4096
    new-array v1, v1, [B
  :L2
  .line 196
    invoke-virtual { p0, v1 }, Ljava/io/InputStream;->read([B)I
    move-result v2
    if-lez v2, :L3
    const/4 v3, 0
    invoke-virtual { p1, v1, v3, v2 }, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :L2
  :L3
  .line 197
    new-instance v1, Ljava/lang/String;
    invoke-virtual { p1 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p1
    const-string v2, "UTF-8"
    invoke-direct { v1, p1, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  :L4
  .line 201
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 197
    return-object v1
  :L5
  .line 198
    move-exception p1
    goto :L7
  :L6
    move-exception p0
    move-object p0, v0
  :L7
  .line 199
    nop
  .line 201
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 199
    return-object v0
.end method

.method private static resolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 265
    const/16 v0, 123
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L0
    return-object p1
  :L0
  .line 266
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v2
    add-int/lit8 v2, v2, 32
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 267
    const/4 v2, 0
  :L1
  .line 268
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
    if-ge v2, v3, :L5
  .line 269
    invoke-virtual { p1, v0, v2 }, Ljava/lang/String;->indexOf(II)I
    move-result v3
  .line 270
    if-gez v3, :L2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L5
  :L2
  .line 271
    const/16 v4, 125
    invoke-virtual { p1, v4, v3 }, Ljava/lang/String;->indexOf(II)I
    move-result v4
  .line 272
    if-gez v4, :L3
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L5
  :L3
  .line 273
    invoke-virtual { v1, p1, v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;
  .line 274
    add-int/lit8 v2, v3, 1
    invoke-virtual { p1, v2, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
  .line 275
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Help;->value(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 276
    if-nez v2, :L4
    add-int/lit8 v2, v4, 1
    invoke-virtual { p1, v3, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
  :L4
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 277
    add-int/lit8 v2, v4, 1
  .line 278
    goto :L1
  :L5
  .line 279
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
  .registers 3
  .line 85
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 86
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->load(Landroid/content/Context;)V
  .line 87
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
  .line 74
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->load(Landroid/content/Context;)V
  .line 75
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
  .line 129
    nop
  .line 131
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 132
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 133
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
  .line 134
    invoke-static { p0, v0, v1 }, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 135
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
  .line 139
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 135
    return-object v0
  :L4
  .line 136
    move-exception p1
    goto :L6
  :L5
    move-exception p0
    move-object p0, v0
  :L6
  .line 137
    nop
  .line 139
    invoke-static { p0 }, Lcom/innioasis/ipp/Help;->close(Ljava/io/InputStream;)V
  .line 137
    return-object v0
.end method

.method private static store(Lcom/innioasis/ipp/Help$Row;Ljava/lang/StringBuilder;Ljava/util/List;)V
  .registers 6
  .line 254
    if-nez p0, :L0
    return-void
  :L0
  .line 255
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  .line 256
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    iput-object p1, p0, Lcom/innioasis/ipp/Help$Row;->body:Ljava/lang/String;
  :L1
  .line 257
    invoke-interface { p2 }, Ljava/util/List;->isEmpty()Z
    move-result p1
    if-nez p1, :L4
  .line 258
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p1
    new-array v0, p1, [Ljava/lang/String;
  .line 259
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
  .line 260
    iput-object v0, p0, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
  :L4
  .line 262
    return-void
.end method

.method private static value(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  .line 284
    const/4 v0, 0
  :L0
    const-string v1, "row:"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 4
    if-eqz v1, :L1
  .line 285
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/y1/activity/IppActivity;->labelOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 287
    const-string v1, "app:"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
  .line 288
    invoke-virtual { p1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Help;->appRes(Ljava/lang/String;)I
    move-result p1
  .line 289
    if-nez p1, :L2
    goto :L3
  :L2
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 291
    const-string v1, "on"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
    const p1, 2131821018
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 292
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
  .line 294
    goto :L9
  :L8
  .line 293
    move-exception p0
  :L9
  .line 295
    return-object v0
.end method
