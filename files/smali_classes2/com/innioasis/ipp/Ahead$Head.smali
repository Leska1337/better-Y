.class final Lcom/innioasis/ipp/Ahead$Head;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Ahead.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ahead;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Head"
.end annotation

.field private final mine:I

.field private final path:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;I)V
  .registers 3
  .line 161
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 162
    iput-object p1, p0, Lcom/innioasis/ipp/Ahead$Head;->path:Ljava/lang/String;
  .line 163
    iput p2, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
  .line 164
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L16
  .catchall { :L4 .. :L5 } :L16
  .catchall { :L6 .. :L10 } :L15
  .catchall { :L13 .. :L14 } :L21
  .catchall { :L19 .. :L20 } :L21
  .registers 11
  .line 167
    nop
  .line 169
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  :L1
  .line 170
    if-nez v1, :L3
  .line 182
    sget v1, Lcom/innioasis/ipp/Ahead;->headTurn:I
    iget v2, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
    if-ne v1, v2, :L2
    sput-object v0, Lcom/innioasis/ipp/Ahead;->headPath:Ljava/lang/String;
  :L2
  .line 183
    nop
  .line 170
    return-void
  :L3
  .line 171
    nop
  :L4
  .line 172
    new-instance v2, Ljava/io/FileInputStream;
    iget-object v3, p0, Lcom/innioasis/ipp/Ahead$Head;->path:Ljava/lang/String;
    invoke-direct { v2, v3 }, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
  :L5
  .line 173
    const/high16 v3, 0x00010000
  :L6
    new-array v3, v3, [B
    const/4 v4, 0
  :L7
  .line 174
    sget v5, Lcom/innioasis/ipp/Ahead;->headTurn:I
    iget v6, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
    if-ne v5, v6, :L12
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sget-wide v7, Lcom/innioasis/ipp/Ahead;->headUntil:J
    cmp-long v9, v5, v7
    if-gez v9, :L12
  .line 175
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v5
  .line 176
    if-nez v5, :L8
    const/4 v4, 1
    goto :L9
  :L8
  .line 177
    if-eqz v4, :L9
    goto :L12
  :L9
  .line 178
    invoke-virtual { v2, v3 }, Ljava/io/FileInputStream;->read([B)I
    move-result v5
  :L10
    if-gez v5, :L11
    goto :L12
  :L11
  .line 179
    goto :L7
  :L12
  .line 182
    sget v1, Lcom/innioasis/ipp/Ahead;->headTurn:I
    iget v3, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
    if-ne v1, v3, :L13
    sput-object v0, Lcom/innioasis/ipp/Ahead;->headPath:Ljava/lang/String;
  :L13
  .line 183
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  :L14
    goto :L22
  :L15
  .line 180
    move-exception v1
    goto :L17
  :L16
    move-exception v1
    move-object v2, v0
  :L17
  .line 182
    sget v1, Lcom/innioasis/ipp/Ahead;->headTurn:I
    iget v3, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
    if-ne v1, v3, :L18
    sput-object v0, Lcom/innioasis/ipp/Ahead;->headPath:Ljava/lang/String;
  :L18
  .line 183
    if-eqz v2, :L22
  :L19
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception v0
  .line 184
    nop
  :L22
  .line 185
    return-void
.end method
