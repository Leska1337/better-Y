.class final Lcom/innioasis/y1/activity/IppActivity$ByPath;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "ByPath"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 1432
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
  .registers 2
  .line 1432
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 1435
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    const/4 v1, 0
    if-eqz v0, :L0
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
    move-object p1, v1
  :L1
  .line 1436
    instance-of v0, p2, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L2
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L2
  .line 1437
    if-nez p1, :L5
    if-nez v1, :L3
    const/4 p1, 0
    goto :L4
  :L3
    const/4 p1, -1
  :L4
    return p1
  :L5
  .line 1438
    if-nez v1, :L6
    const/4 p1, 1
    return p1
  :L6
  .line 1439
    invoke-virtual { p1, v1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method
