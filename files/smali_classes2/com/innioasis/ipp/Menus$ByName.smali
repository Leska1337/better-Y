.class final Lcom/innioasis/ipp/Menus$ByName;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Menus.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Menus;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ByName"
.end annotation

.field private final entries:Ljava/util/List;

.method constructor <init>(Ljava/util/List;)V
  .registers 2
  .line 404
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 405
    iput-object p1, p0, Lcom/innioasis/ipp/Menus$ByName;->entries:Ljava/util/List;
  .line 406
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 409
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$ByName;->entries:Ljava/util/List;
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 410
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$ByName;->entries:Ljava/util/List;
    check-cast p2, Ljava/lang/Integer;
    invoke-virtual { p2 }, Ljava/lang/Integer;->intValue()I
    move-result p2
    invoke-interface { v0, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p2
  .line 411
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->access$300(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p2 }, Lcom/innioasis/ipp/Menus;->access$300(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I
    move-result p1
    return p1
.end method
