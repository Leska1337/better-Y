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
  .line 145
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 146
    iput-object p1, p0, Lcom/innioasis/ipp/Ahead$Head;->path:Ljava/lang/String;
  .line 147
    iput p2, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
  .line 148
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L11
  .catchall { :L3 .. :L7 } :L10
  .catchall { :L9 .. :L13 } :L14
  .registers 12
  .line 151
    nop
  .line 153
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 154
    if-nez v1, :L1
  .line 170
    nop
  .line 154
    return-void
  :L1
  .line 155
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 1500
    add-long/2addr v2, v4
  .line 156
    nop
  .line 157
    new-instance v4, Ljava/io/FileInputStream;
    iget-object v5, p0, Lcom/innioasis/ipp/Ahead$Head;->path:Ljava/lang/String;
    invoke-direct { v4, v5 }, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
  :L2
  .line 158
    const/high16 v0, 0x00010000
  :L3
    new-array v0, v0, [B
  .line 159
    const/4 v5, 0
    const-wide/16 v6, 0
  :L4
  .line 160
    sget v8, Lcom/innioasis/ipp/Ahead;->headTurn:I
    iget v9, p0, Lcom/innioasis/ipp/Ahead$Head;->mine:I
    if-ne v8, v9, :L9
    const-wide/32 v8, 3145728
    cmp-long v10, v6, v8
    if-gez v10, :L9
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
    cmp-long v10, v8, v2
    if-gez v10, :L9
  .line 161
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v8
  .line 162
    if-nez v8, :L5
    const/4 v5, 1
    goto :L6
  :L5
  .line 163
    if-eqz v5, :L6
    goto :L9
  :L6
  .line 164
    invoke-virtual { v4, v0 }, Ljava/io/FileInputStream;->read([B)I
    move-result v8
  :L7
  .line 165
    if-gez v8, :L8
    goto :L9
  :L8
  .line 166
    int-to-long v8, v8
    add-long/2addr v6, v8
  .line 167
    goto :L4
  :L9
  .line 170
    invoke-virtual { v4 }, Ljava/io/FileInputStream;->close()V
    goto :L15
  :L10
  .line 168
    move-exception v0
    move-object v0, v4
    goto :L12
  :L11
    move-exception v1
  :L12
  .line 170
    if-eqz v0, :L15
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  :L13
    goto :L15
  :L14
    move-exception v0
  .line 171
    nop
  :L15
  .line 172
    return-void
.end method
