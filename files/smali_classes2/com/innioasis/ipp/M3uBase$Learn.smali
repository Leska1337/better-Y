.class public final Lcom/innioasis/ipp/M3uBase$Learn;
.super Ljava/lang/Object;
.source "M3uBase.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3uBase;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Learn"
.end annotation

.field private final votes:Ljava/util/HashMap;

.method public constructor <init>()V
  .registers 2
  .line 157
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 158
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3uBase$Learn;->votes:Ljava/util/HashMap;
    return-void
.end method

.method public best()Ljava/lang/String;
  .registers 7
  .line 186
    nop
  .line 187
    nop
  .line 188
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Learn;->votes:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v0
    const/4 v1, 0
    const/4 v2, 0
    const/4 v3, 0
  :L0
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L2
  .line 189
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, [Ljava/lang/Object;
  .line 190
    const/4 v5, 1
    aget-object v5, v4, v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
  .line 191
    if-le v5, v3, :L1
  .line 192
    nop
  .line 193
    aget-object v1, v4, v2
    check-cast v1, Ljava/lang/String;
    move v3, v5
  :L1
  .line 195
    goto :L0
  :L2
  .line 196
    return-object v1
.end method

.method note(Ljava/lang/String;Ljava/lang/String;)V
  .registers 15
  .line 161
    nop
  .line 162
    if-eqz p1, :L11
    if-eqz p2, :L11
    const-string v0, "/storage/sdcard0/Music/"
    invoke-virtual { p2, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L0
    goto/16 :L11
  :L0
  .line 163
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->pct(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 164
    const/4 v2, 1
    const/4 v3, 0
    const-string v4, "file:"
    const/4 v5, 0
    const/4 v6, 5
    move-object v1, p1
    invoke-virtual/range { v1 .. v6 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 165
    const/16 v1, 92
    const/16 v2, 47
    invoke-virtual { p1, v1, v2 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object v3
  .line 166
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v9, 2
    const/4 v10, 0
    const/4 v11, 1
    if-lt v1, v9, :L2
    invoke-virtual { v3, v10 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    invoke-static { v1 }, Ljava/lang/Character;->isLetter(C)Z
    move-result v1
    if-eqz v1, :L2
    invoke-virtual { v3, v11 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v4, 58
    if-ne v1, v4, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 167
    if-nez v1, :L4
    const-string v4, "/"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L4
    return-void
  :L4
  .line 168
    if-nez v1, :L5
    invoke-static { v3 }, Lcom/innioasis/ipp/M3u;->onCard(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
    return-void
  :L5
  .line 169
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    invoke-virtual { p2, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
  .line 170
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result p2
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v0
    sub-int v5, p2, v0
  .line 171
    if-lt v5, v9, :L10
    add-int/lit8 p2, v5, -1
    invoke-virtual { v3, p2 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    if-eq v0, v2, :L6
    goto :L10
  :L6
  .line 172
    const/4 v4, 1
    const/4 v7, 0
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v8
    invoke-virtual/range { v3 .. v8 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result v0
    if-nez v0, :L7
    return-void
  :L7
  .line 173
    invoke-virtual { p1, v10, p2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 174
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p2
    if-nez p2, :L8
    return-void
  :L8
  .line 175
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->access$000(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
  .line 176
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Learn;->votes:Ljava/util/HashMap;
    invoke-virtual { v0, p2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/Object;
  .line 177
    if-nez v0, :L9
  .line 178
    new-array v0, v9, [Ljava/lang/Object;
    aput-object p1, v0, v10
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    aput-object p1, v0, v11
  .line 179
    iget-object p1, p0, Lcom/innioasis/ipp/M3uBase$Learn;->votes:Ljava/util/HashMap;
    invoke-virtual { p1, p2, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 181
    aget-object p1, v0, v11
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
    add-int/2addr p1, v11
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    aput-object p1, v0, v11
  .line 182
    return-void
  :L10
  .line 171
    return-void
  :L11
  .line 162
    return-void
.end method
