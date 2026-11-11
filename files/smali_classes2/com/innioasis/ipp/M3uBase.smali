.class public final Lcom/innioasis/ipp/M3uBase;
.super Ljava/lang/Object;
.source "M3uBase.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/M3uBase$Answer;,
    Lcom/innioasis/ipp/M3uBase$Typed;,
    Lcom/innioasis/ipp/M3uBase$Learn;
  }
.end annotation

.field final static LINE:Ljava/lang/String; = "#BETTERY:BASE:"

.method private constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 116
    const/4 v0, 0
    if-eqz p0, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 117
    nop
  .line 118
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "/storage/sdcard0"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v3, "/Music"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 121
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "/"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1, v3 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
  .line 122
    nop
  .line 123
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v0, v0, 1
    invoke-virtual { p1, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
    move-object v0, p0
    goto :L2
  :L1
  .line 124
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
  .line 125
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->parent(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 126
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, 1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
  :L2
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->windows(Ljava/lang/String;)Z
    move-result p0
    const/16 v1, 47
    if-eqz p0, :L3
    const/16 p0, 92
    goto :L4
  :L3
    const/16 p0, 47
  :L4
  .line 131
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p1, v1, p0 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 128
    return-object v0
  :L6
  .line 116
    return-object v0
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 29
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static ask(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 14
  .line 209
    if-eqz p0, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L3
  :L0
  .line 210
    new-instance v0, Landroid/text/SpannableStringBuilder;
    invoke-direct { v0 }, Landroid/text/SpannableStringBuilder;-><init>()V
  .line 211
    invoke-virtual { v0, p1 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
  .line 212
    new-instance v1, Landroid/text/style/StyleSpan;
    const/4 v2, 1
    invoke-direct { v1, v2 }, Landroid/text/style/StyleSpan;-><init>(I)V
    invoke-virtual { v0 }, Landroid/text/SpannableStringBuilder;->length()I
    move-result v3
    const/16 v4, 33
    const/4 v5, 0
    invoke-virtual { v0, v1, v5, v3, v4 }, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V
  .line 213
    const v1, 2131821183
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
  .line 214
    const-string v3, "\n\n"
    invoke-virtual { v0, v3 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    move-result-object v4
    invoke-virtual { v4, v1 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    move-result-object v4
    const-string v6, "\u3002"
    invoke-virtual { v1, v6 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    const-string v1, ""
    goto :L2
  :L1
    const-string v1, " "
  :L2
    invoke-virtual { v4, v1 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    move-result-object v1
  .line 215
    const v4, 2131821187
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    move-result-object v1
    invoke-virtual { v1, v3 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
  .line 216
    const v1, 2131821184
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
  .line 217
    const/4 v1, 3
    new-array v9, v1, [Ljava/lang/String;
    const v1, 2131821118
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    aput-object v1, v9, v5
  .line 218
    const v1, 2131821185
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    aput-object v1, v9, v2
    const v1, 2131821186
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 2
    aput-object v1, v9, v2
  .line 219
    new-instance v1, Lcom/innioasis/ipp/BackupDialog;
    const v2, 2131821182
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v8
    const/4 v10, 0
    new-instance v11, Lcom/innioasis/ipp/M3uBase$Answer;
    invoke-direct { v11, p0, p1 }, Lcom/innioasis/ipp/M3uBase$Answer;-><init>(Landroid/app/Activity;Ljava/lang/String;)V
    move-object v6, v1
    move-object v7, p0
    invoke-direct/range { v6 .. v11 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 220
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/BackupDialog;->note(Ljava/lang/CharSequence;)Lcom/innioasis/ipp/BackupDialog;
    move-result-object p0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BackupDialog;->show()V
  .line 221
    return-void
  :L3
  .line 209
    return-void
.end method

.method static edit(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 5
  .line 243
    new-instance v0, Lcom/innioasis/ipp/M3uBase$Typed;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/ipp/M3uBase$Typed;-><init>(Landroid/app/Activity;Ljava/lang/String;)V
  .line 244
    new-instance v1, Lcom/innioasis/y1/utils/InputMethodDialog;
    const v2, 2131886361
    invoke-direct { v1, p0, v0, v2 }, Lcom/innioasis/y1/utils/InputMethodDialog;-><init>(Landroid/app/Activity;Lcom/innioasis/y1/utils/InputMethodDialog$Callback;I)V
  .line 245
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->show()V
  .line 247
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
    if-eqz p0, :L0
  .line 248
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
    const/16 v2, 128
    invoke-virtual { p0, v2 }, Landroid/view/Window;->addFlags(I)V
  :L0
  .line 250
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/M3uBase$Typed;->seed(Ljava/lang/String;)V
  .line 251
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/utils/InputMethodDialog;->setEditText(Ljava/lang/String;)V
  .line 252
    return-void
.end method

.method static file()Ljava/io/File;
  .registers 3
  .line 37
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "music_path.txt"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method public static get()Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L12
  .catchall { :L2 .. :L4 } :L11
  .catchall { :L6 .. :L12 } :L12
  .registers 7
  .line 43
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/M3uBase;->file()Ljava/io/File;
    move-result-object v1
  .line 44
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-nez v2, :L1
    return-object v0
  :L1
  .line 45
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 48
    invoke-virtual { v1 }, Ljava/io/File;->length()J
    move-result-wide v3
    const-wide/16 v5, 4096
    invoke-static { v3, v4, v5, v6 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v3
    long-to-int v1, v3
    new-array v3, v1, [B
  .line 49
    const/4 v4, 0
    const/4 v5, 0
  :L3
  .line 50
    if-ge v5, v1, :L6
  .line 51
    sub-int v6, v1, v5
    invoke-virtual { v2, v3, v5, v6 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v6
  :L4
  .line 52
    if-gez v6, :L5
    goto :L6
  :L5
  .line 53
    add-int/2addr v5, v6
  .line 54
    goto :L3
  :L6
  .line 56
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 57
    nop
  .line 58
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v3, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\r\n|\r|\n"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 59
    const/4 v2, 0
  :L7
    array-length v3, v1
    if-ge v2, v3, :L10
  .line 60
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 61
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L8
    invoke-virtual { v3, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    const v6, 65279
    if-ne v5, v6, :L8
    const/4 v5, 1
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  :L8
  .line 62
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L9
    invoke-static { v3 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
  :L9
  .line 59
    add-int/lit8 v2, v2, 1
    goto :L7
  :L10
  .line 65
    goto :L13
  :L11
  .line 56
    move-exception v1
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 57
    throw v1
  :L12
  .line 64
    move-exception v1
  :L13
  .line 66
    return-object v0
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 97
    const/16 v0, 92
    const/16 v1, 47
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static offer(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 204
    if-eqz p1, :L1
    invoke-static { }, Lcom/innioasis/ipp/M3uBase;->get()Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/M3uBase;->same(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 205
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/M3uBase;->ask(Landroid/app/Activity;Ljava/lang/String;)V
  .line 206
    return-void
  :L1
  .line 204
    return-void
.end method

.method private static parent(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 110
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
    const/16 v1, 92
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 111
    if-lez v0, :L0
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L0
    return-object p0
.end method

.method static put(Ljava/lang/String;)Z
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L3 .. :L5 } :L5
  .registers 4
  .line 71
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
  .line 72
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-nez v2, :L1
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 73
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-static { }, Lcom/innioasis/ipp/M3uBase;->file()Ljava/io/File;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 75
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, "\r\n"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v2, "UTF-8"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 76
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/FileDescriptor;->sync()V
  :L3
  .line 78
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 79
    nop
  .line 80
    const/4 p0, 1
    return p0
  :L4
  .line 78
    move-exception p0
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 79
    throw p0
  :L5
  .line 81
    move-exception p0
  .line 82
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "music_path write: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 83
    return v0
.end method

.method public static same(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 101
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/M3uBase;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    return p0
  :L1
  .line 101
    if-ne p0, p1, :L2
    const/4 p0, 1
    goto :L3
  :L2
    const/4 p0, 0
  :L3
    return p0
.end method

.method static strip(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
  .registers 12
  .line 136
    if-eqz p1, :L3
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L3
  :L0
  .line 137
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->pct(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    const/16 v0, 92
    const/16 v1, 47
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
  .line 138
    invoke-virtual { p1, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 139
    nop
  .line 140
    const/4 v3, 1
    const/4 v4, 0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "/"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    const/4 v6, 0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v7, v0, 1
    move-object v2, p0
    invoke-virtual/range { v2 .. v7 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result v0
    const-string v8, "/storage/sdcard0"
    if-eqz v0, :L1
  .line 141
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "/Music/"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p1
    add-int/lit8 p1, p1, 1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p2, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 142
    return-void
  :L1
  .line 144
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->parent(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 145
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L2
    const/4 v3, 1
    const/4 v4, 0
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    const/4 v6, 0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result p1
    add-int/lit8 v7, p1, 1
    move-object v2, p0
    invoke-virtual/range { v2 .. v7 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result p1
    if-eqz p1, :L2
  .line 146
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p1, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v0, v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p2, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L2
  .line 148
    return-void
  :L3
  .line 136
    return-void
.end method

.method static trim(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 89
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L0
  .line 90
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 1
    if-le v0, v1, :L2
    const-string v0, "/"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "\\"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L2
  :L1
  .line 91
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    sub-int/2addr v0, v1
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    goto :L0
  :L2
  .line 93
    return-object p0
.end method

.method private static windows(Ljava/lang/String;)Z
  .registers 4
  .line 106
    const/16 v0, 92
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    const/4 v1, 1
    if-gez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v2, 2
    if-lt v0, v2, :L0
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/16 v0, 58
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v1, 0
  :L1
    return v1
.end method
