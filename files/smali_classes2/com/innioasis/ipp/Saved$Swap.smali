.class final Lcom/innioasis/ipp/Saved$Swap;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saved.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saved;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Swap"
.end annotation

.field private final list:Ljava/util/List;

.field private final row:[Lcom/innioasis/y1/database/Song;

.field private final was:[Lcom/innioasis/y1/database/Song;

.method constructor <init>(Ljava/util/List;[Lcom/innioasis/y1/database/Song;[Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 157
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 158
    iput-object p1, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
  .line 159
    iput-object p2, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
  .line 160
    iput-object p3, p0, Lcom/innioasis/ipp/Saved$Swap;->row:[Lcom/innioasis/y1/database/Song;
  .line 161
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  :L0
  .line 165
    iget-object v0, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    array-length v1, v1
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 166
    nop
  .line 167
    const/4 v0, 0
    const/4 v1, 0
  :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    array-length v3, v2
    if-ge v0, v3, :L4
  .line 168
    aget-object v2, v2, v0
    if-eqz v2, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    iget-object v3, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    aget-object v3, v3, v0
    if-ne v2, v3, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    iget-object v3, p0, Lcom/innioasis/ipp/Saved$Swap;->row:[Lcom/innioasis/y1/database/Song;
    aget-object v3, v3, v0
    invoke-interface { v2, v0, v3 }, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v1, v1, 1
  :L3
  .line 167
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 170
    const-string v0, "ipplab"
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "saved: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " of "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    array-length v2, v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " swapped"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L5
  .line 172
    goto :L7
  :L6
  .line 171
    move-exception v0
  :L7
  .line 173
    return-void
.end method
