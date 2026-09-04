.class public final Lcom/innioasis/ipp/Book;
.super Ljava/lang/Object;
.source "Book.java"

.method private constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static line(Ljava/lang/String;)Ljava/lang/CharSequence;
  .registers 4
  .line 22
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 23
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
  :L1
  .line 24
    if-lez v0, :L3
  .line 25
    add-int/lit8 v1, v0, -1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 26
    const/16 v2, 10
    if-eq v1, v2, :L2
    const/16 v2, 13
    if-eq v1, v2, :L2
    goto :L3
  :L2
  .line 27
    add-int/lit8 v0, v0, -1
  .line 28
    goto :L1
  :L3
  .line 29
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-ne v0, v1, :L4
    goto :L5
  :L4
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L5
    return-object p0
.end method
