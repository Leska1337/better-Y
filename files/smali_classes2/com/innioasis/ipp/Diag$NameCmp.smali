.class final Lcom/innioasis/ipp/Diag$NameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "NameCmp"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 295
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 297
    check-cast p1, Ljava/io/File;
    invoke-virtual { p1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p1
    check-cast p2, Ljava/io/File;
    invoke-virtual { p2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method
