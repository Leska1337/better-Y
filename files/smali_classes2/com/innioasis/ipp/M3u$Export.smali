.class final Lcom/innioasis/ipp/M3u$Export;
.super Ljava/lang/Object;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Export"
.end annotation

.field private final a:Landroid/app/Activity;

.field private at:I

.field private choice:I

.field private final jobs:Ljava/util/ArrayList;

.field private final taken:Ljava/util/HashSet;

.method constructor <init>(Landroid/app/Activity;Ljava/util/List;)V
  .registers 6
  .line 131
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 126
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
  .line 127
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
  .line 129
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/M3u$Export;->choice:I
  .line 132
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
  .line 133
    const/4 v0, 0
  :L0
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 134
    invoke-interface { p2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Playlist;
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/M3u;->access$000(Landroid/content/Context;Lcom/innioasis/y1/database/Playlist;)Lcom/innioasis/ipp/M3u$Job;
    move-result-object v1
  .line 135
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 133
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 137
    return-void
.end method

.method private apply(Lcom/innioasis/ipp/M3u$Job;I)V
  .registers 4
  .line 187
    if-nez p2, :L0
    const/4 p2, 1
    iput-boolean p2, p1, Lcom/innioasis/ipp/M3u$Job;->overwrite:Z
    goto :L1
  :L0
  .line 188
    iget-object p2, p1, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    invoke-static { p2, v0 }, Lcom/innioasis/ipp/M3u;->access$100(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
    move-result-object p2
    iput-object p2, p1, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
  :L1
  .line 189
    return-void
.end method

.method private ask(Lcom/innioasis/ipp/M3u$Job;)V
  .registers 12
  .line 162
    nop
  .line 163
    iget v0, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 164
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v3, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Job;
  .line 165
    iget-object v4, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    iget-object v5, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v5 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L1
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/M3u;->access$200(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    add-int/lit8 v2, v2, 1
  :L1
  .line 163
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 167
    const/4 v0, 2
    new-array v6, v0, [Ljava/lang/String;
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    const v3, 2131821146
    invoke-virtual { v0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    aput-object v0, v6, v1
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
  .line 168
    const v3, 2131821145
    invoke-virtual { v0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/4 v3, 1
    aput-object v0, v6, v3
  .line 169
    new-instance v0, Lcom/innioasis/ipp/BackupDialog;
    iget-object v4, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    new-array v5, v3, [Ljava/lang/Object;
    iget-object p1, p1, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
  .line 170
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->access$300(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    aput-object p1, v5, v1
    const p1, 2131821142
    invoke-virtual { v4, p1, v5 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
    const/4 v7, 0
  .line 171
    if-le v2, v3, :L3
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    const v1, 2131821147
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    goto :L4
  :L3
    const/4 p1, 0
  :L4
    move-object v8, p1
    new-instance v9, Lcom/innioasis/ipp/M3u$ExportGo;
    invoke-direct { v9, p0 }, Lcom/innioasis/ipp/M3u$ExportGo;-><init>(Lcom/innioasis/ipp/M3u$Export;)V
    move-object v3, v0
    invoke-direct/range { v3 .. v9 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 173
    new-instance p1, Lcom/innioasis/ipp/M3u$Nothing;
    invoke-direct { p1 }, Lcom/innioasis/ipp/M3u$Nothing;-><init>()V
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/BackupDialog;->setOnBack(Lkotlin/jvm/functions/Function0;)V
  .line 174
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BackupDialog;->show()V
  .line 175
    return-void
.end method

.method private write()V
  .catchall { :L1 .. :L6 } :L10
  .registers 10
  .line 192
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 193
    nop
  .line 194
    nop
  .line 196
    const/4 v0, 1
  :L1
    invoke-static { }, Lcom/innioasis/ipp/M3u;->dir()Ljava/io/File;
    move-result-object v1
  .line 197
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-nez v2, :L3
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
    move-result v2
    if-eqz v2, :L2
    goto :L3
  :L2
    new-instance v1, Ljava/lang/IllegalStateException;
    const-string v2, "no dir"
    invoke-direct { v1, v2 }, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v1
  :L3
  .line 198
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
    const/4 v5, 0
  :L4
    iget-object v6, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L7
  .line 199
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v3, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Job;
  .line 200
    iget-boolean v6, v3, Lcom/innioasis/ipp/M3u$Job;->overwrite:Z
    if-eqz v6, :L5
  .line 201
    new-instance v6, Ljava/io/File;
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v8, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, ".m3u"
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-direct { v6, v1, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v6 }, Ljava/io/File;->delete()Z
  .line 202
    new-instance v6, Ljava/io/File;
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v8, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, ".m3u8"
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-direct { v6, v1, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v6 }, Ljava/io/File;->delete()Z
  :L5
  .line 204
    new-instance v6, Ljava/io/File;
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v8, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    iget-object v8, v3, Lcom/innioasis/ipp/M3u$Job;->ext:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-direct { v6, v1, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    iget-object v7, v3, Lcom/innioasis/ipp/M3u$Job;->text:Ljava/lang/String;
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/M3u;->access$400(Ljava/io/File;Ljava/lang/String;)V
  .line 205
    iget v6, v3, Lcom/innioasis/ipp/M3u$Job;->songs:I
  :L6
    add-int/2addr v5, v6
  .line 206
    nop
  .line 198
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 212
    nop
  .line 213
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v4, 2
    if-ne v1, v0, :L8
  .line 214
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    new-array v4, v4, [Ljava/lang/Object;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v7, v3, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Job;->ext:Ljava/lang/String;
    invoke-virtual { v6, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    aput-object v3, v4, v2
  .line 215
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    aput-object v2, v4, v0
  .line 214
    const v2, 2131821153
    invoke-virtual { v1, v2, v4 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    goto :L9
  :L8
  .line 216
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    new-array v3, v4, [Ljava/lang/Object;
    iget-object v4, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
  .line 217
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v4
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    aput-object v4, v3, v2
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    aput-object v2, v3, v0
  .line 216
    const v2, 2131821154
    invoke-virtual { v1, v2, v3 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
  :L9
  .line 218
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    invoke-static { v2, v1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 219
    return-void
  :L10
  .line 208
    move-exception v1
  .line 209
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "m3u export failed: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 210
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->a:Landroid/app/Activity;
    const v2, 2131821155
    invoke-static { v1, v2, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 211
    return-void
.end method

.method answer(IZ)V
  .registers 5
  .line 178
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    iget v1, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Job;
  .line 179
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/M3u$Export;->apply(Lcom/innioasis/ipp/M3u$Job;I)V
  .line 180
    if-eqz p2, :L0
    iput p1, p0, Lcom/innioasis/ipp/M3u$Export;->choice:I
  :L0
  .line 181
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    iget-object p2, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { p2 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 182
    iget p1, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    add-int/lit8 p1, p1, 1
    iput p1, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
  .line 183
    invoke-virtual { p0 }, Lcom/innioasis/ipp/M3u$Export;->next()V
  .line 184
    return-void
.end method

.method next()V
  .registers 4
  .line 144
    nop
  :L0
    iget v0, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 145
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Export;->jobs:Ljava/util/ArrayList;
    iget v1, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Job;
  .line 146
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    iget-object v2, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v2 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
  .line 147
    iget-object v1, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/M3u;->access$100(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    goto :L3
  :L1
  .line 148
    iget-object v1, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/M3u;->access$200(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L3
  .line 149
    iget v1, p0, Lcom/innioasis/ipp/M3u$Export;->choice:I
    if-gez v1, :L2
  .line 150
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/M3u$Export;->ask(Lcom/innioasis/ipp/M3u$Job;)V
  .line 151
    return-void
  :L2
  .line 153
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/M3u$Export;->apply(Lcom/innioasis/ipp/M3u$Job;I)V
  :L3
  .line 155
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Export;->taken:Ljava/util/HashSet;
    iget-object v0, v0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-virtual { v0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 156
    iget v0, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/ipp/M3u$Export;->at:I
  .line 157
    goto :L0
  :L4
  .line 158
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Export;->write()V
  .line 159
    return-void
.end method

.method start()V
  .registers 1
  .line 140
    invoke-virtual { p0 }, Lcom/innioasis/ipp/M3u$Export;->next()V
  .line 141
    return-void
.end method
