.class final Lcom/innioasis/ipp/Genres$KeyCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "KeyCmp"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 590
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Genres$1;)V
  .registers 2
  .line 590
    invoke-direct { p0 }, Lcom/innioasis/ipp/Genres$KeyCmp;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 592
    check-cast p1, Ljava/lang/String;
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p1
    check-cast p2, Ljava/lang/String;
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p2, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method
