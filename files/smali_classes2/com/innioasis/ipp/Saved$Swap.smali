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
  .line 179
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 180
    iput-object p1, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
  .line 181
    iput-object p2, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
  .line 182
    iput-object p3, p0, Lcom/innioasis/ipp/Saved$Swap;->row:[Lcom/innioasis/y1/database/Song;
  .line 183
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  :L0
  .line 187
    iget-object v0, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    array-length v1, v1
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 188
    const/4 v0, 0
  :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    array-length v2, v1
    if-ge v0, v2, :L4
  .line 189
    aget-object v1, v1, v0
    if-eqz v1, :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->was:[Lcom/innioasis/y1/database/Song;
    aget-object v2, v2, v0
    if-ne v1, v2, :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Saved$Swap;->list:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/ipp/Saved$Swap;->row:[Lcom/innioasis/y1/database/Song;
    aget-object v2, v2, v0
    invoke-interface { v1, v0, v2 }, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 188
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 192
    goto :L6
  :L5
  .line 191
    move-exception v0
  :L6
  .line 193
    return-void
.end method
