.class final Lcom/innioasis/ipp/Folders$RowSort;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RowSort"
.end annotation

.field private final files:Lcom/innioasis/ipp/Folders$FileSort;

.method constructor <init>(ZZ)V
  .registers 4
  .line 804
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    new-instance v0, Lcom/innioasis/ipp/Folders$FileSort;
    invoke-direct { v0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;-><init>(ZZ)V
    iput-object v0, p0, Lcom/innioasis/ipp/Folders$RowSort;->files:Lcom/innioasis/ipp/Folders$FileSort;
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 807
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->access$200(Ljava/lang/Object;)Ljava/io/File;
    move-result-object p1
    invoke-static { p2 }, Lcom/innioasis/ipp/Folders;->access$200(Ljava/lang/Object;)Ljava/io/File;
    move-result-object p2
  .line 808
    if-eqz p1, :L1
    if-nez p2, :L0
    goto :L1
  :L0
  .line 809
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$RowSort;->files:Lcom/innioasis/ipp/Folders$FileSort;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    move-result p1
    return p1
  :L1
  .line 808
    const/4 p1, 0
    return p1
.end method
