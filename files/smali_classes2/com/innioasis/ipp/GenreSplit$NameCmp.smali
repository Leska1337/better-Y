.class final Lcom/innioasis/ipp/GenreSplit$NameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "GenreSplit.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreSplit;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NameCmp"
.end annotation

.field private final rev:Z

.method constructor <init>(Z)V
  .registers 2
  .line 304
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/GenreSplit$NameCmp;->rev:Z
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 306
    check-cast p1, Ljava/lang/String;
    check-cast p2, Ljava/lang/String;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/GenreSplit;->access$100(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
  .line 307
    iget-boolean p2, p0, Lcom/innioasis/ipp/GenreSplit$NameCmp;->rev:Z
    if-eqz p2, :L0
    neg-int p1, p1
  :L0
    return p1
.end method
