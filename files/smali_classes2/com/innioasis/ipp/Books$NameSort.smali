.class final Lcom/innioasis/ipp/Books$NameSort;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Books.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Books;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NameSort"
.end annotation

.field private final keys:Ljava/util/HashMap;

.field private final reverse:Z

.method constructor <init>(Z)V
  .registers 3
  .line 302
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 300
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Books$NameSort;->keys:Ljava/util/HashMap;
  .line 302
    iput-boolean p1, p0, Lcom/innioasis/ipp/Books$NameSort;->reverse:Z
    return-void
.end method

.method private key(Ljava/lang/Object;)Ljava/lang/String;
  .registers 4
  .line 310
    instance-of v0, p1, Ljava/lang/String;
    if-eqz v0, :L0
    check-cast p1, Ljava/lang/String;
    goto :L1
  :L0
    const-string p1, ""
  :L1
  .line 311
    iget-object v0, p0, Lcom/innioasis/ipp/Books$NameSort;->keys:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 312
    if-nez v0, :L2
  .line 313
    invoke-static { p1 }, Lcom/innioasis/ipp/Books;->access$200(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 314
    iget-object v1, p0, Lcom/innioasis/ipp/Books$NameSort;->keys:Ljava/util/HashMap;
    invoke-virtual { v1, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 316
    return-object v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 305
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Books$NameSort;->key(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Books$NameSort;->key(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
  .line 306
    iget-boolean p2, p0, Lcom/innioasis/ipp/Books$NameSort;->reverse:Z
    if-eqz p2, :L0
    neg-int p1, p1
  :L0
    return p1
.end method
