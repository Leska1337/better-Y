.class final Lcom/innioasis/ipp/GenreSplit$FileNameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "GenreSplit.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreSplit;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "FileNameCmp"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 296
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/GenreSplit$1;)V
  .registers 2
  .line 296
    invoke-direct { p0 }, Lcom/innioasis/ipp/GenreSplit$FileNameCmp;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 298
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/GenreSplit;->access$100(Ljava/lang/String;Ljava/lang/String;)I
    move-result p1
    return p1
.end method
