.class final Lcom/innioasis/ipp/Ahead$Read;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Ahead.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ahead;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Read"
.end annotation

.field private final mine:I

.field private final path:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;I)V
  .registers 3
  .line 181
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 182
    iput-object p1, p0, Lcom/innioasis/ipp/Ahead$Read;->path:Ljava/lang/String;
  .line 183
    iput p2, p0, Lcom/innioasis/ipp/Ahead$Read;->mine:I
  .line 184
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L2 .. :L6 } :L7
  .catchall { :L6 .. :L10 } :L11
  .registers 8
  .line 187
    nop
  .line 189
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileInputStream;
    iget-object v2, p0, Lcom/innioasis/ipp/Ahead$Read;->path:Ljava/lang/String;
    invoke-direct { v1, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
  :L1
  .line 190
    const/high16 v0, 0x00020000
  :L2
    new-array v0, v0, [B
  .line 191
    const-wide/16 v2, 0
  :L3
  .line 192
    sget v4, Lcom/innioasis/ipp/Ahead;->turn:I
    iget v5, p0, Lcom/innioasis/ipp/Ahead$Read;->mine:I
    if-ne v4, v5, :L5
    const-wide/32 v4, 33554432
    cmp-long v6, v2, v4
    if-gez v6, :L5
  .line 193
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
    move-result v4
  .line 194
    if-gez v4, :L4
    goto :L5
  :L4
  .line 195
    int-to-long v4, v4
    add-long/2addr v2, v4
  .line 196
    const-wide/16 v4, 20
    invoke-static { v4, v5 }, Ljava/lang/Thread;->sleep(J)V
  .line 197
    goto :L3
  :L5
  .line 198
    sget v0, Lcom/innioasis/ipp/Ahead;->turn:I
    iget v2, p0, Lcom/innioasis/ipp/Ahead$Read;->mine:I
    if-ne v0, v2, :L6
    iget-object v0, p0, Lcom/innioasis/ipp/Ahead$Read;->path:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Ahead;->access$402(Ljava/lang/String;)Ljava/lang/String;
  :L6
  .line 201
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
    goto :L12
  :L7
  .line 199
    move-exception v0
    move-object v0, v1
    goto :L9
  :L8
    move-exception v1
  :L9
  .line 201
    if-eqz v0, :L12
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  :L10
    goto :L12
  :L11
    move-exception v0
  .line 202
    nop
  :L12
  .line 203
    return-void
.end method
