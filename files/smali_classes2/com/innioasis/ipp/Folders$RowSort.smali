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
  .line 682
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    new-instance v0, Lcom/innioasis/ipp/Folders$FileSort;
    invoke-direct { v0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;-><init>(ZZ)V
    iput-object v0, p0, Lcom/innioasis/ipp/Folders$RowSort;->files:Lcom/innioasis/ipp/Folders$FileSort;
    return-void
.end method

.method private fileOf(Ljava/lang/Object;)Ljava/io/File;
  .registers 4
  .line 685
    instance-of v0, p1, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 686
    check-cast p1, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 687
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getTargetFile()Ljava/io/File;
    move-result-object v0
  .line 688
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 689
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getVideoInfo()Lcom/innioasis/y1/database/video/VideoInfo;
    move-result-object p1
  .line 690
    if-nez p1, :L2
    move-object p1, v1
    goto :L3
  :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/video/VideoInfo;->getFilePath()Ljava/lang/String;
    move-result-object p1
  :L3
  .line 691
    if-nez p1, :L4
    goto :L5
  :L4
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L5
    return-object v1
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 695
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Folders$RowSort;->fileOf(Ljava/lang/Object;)Ljava/io/File;
    move-result-object p1
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Folders$RowSort;->fileOf(Ljava/lang/Object;)Ljava/io/File;
    move-result-object p2
  .line 696
    if-eqz p1, :L1
    if-nez p2, :L0
    goto :L1
  :L0
  .line 697
    iget-object v0, p0, Lcom/innioasis/ipp/Folders$RowSort;->files:Lcom/innioasis/ipp/Folders$FileSort;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    move-result p1
    return p1
  :L1
  .line 696
    const/4 p1, 0
    return p1
.end method
