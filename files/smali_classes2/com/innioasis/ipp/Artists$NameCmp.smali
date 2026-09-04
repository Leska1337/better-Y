.class final Lcom/innioasis/ipp/Artists$NameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Artists.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Artists;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NameCmp"
.end annotation

.field private final rev:Z

.method constructor <init>(Z)V
  .registers 2
  .line 418
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/Artists$NameCmp;->rev:Z
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 420
    check-cast p1, Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->access$000(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    check-cast p2, Ljava/lang/String;
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->access$000(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
  .line 421
    iget-boolean p2, p0, Lcom/innioasis/ipp/Artists$NameCmp;->rev:Z
    if-eqz p2, :L0
    neg-int p1, p1
  :L0
    return p1
.end method
