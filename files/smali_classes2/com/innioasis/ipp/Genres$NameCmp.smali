.class final Lcom/innioasis/ipp/Genres$NameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NameCmp"
.end annotation

.field private final desc:Z

.method constructor <init>(Z)V
  .registers 2
  .line 927
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/Genres$NameCmp;->desc:Z
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 931
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->access$1000(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 932
    invoke-static { p2 }, Lcom/innioasis/ipp/Genres;->access$1000(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
  .line 933
    const-string v0, ""
    if-nez p1, :L0
    move-object p1, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p1
  :L1
  .line 934
    if-nez p2, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p2, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 935
    invoke-virtual { p1, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
  .line 936
    iget-boolean p2, p0, Lcom/innioasis/ipp/Genres$NameCmp;->desc:Z
    if-eqz p2, :L4
    neg-int p1, p1
  :L4
    return p1
.end method
