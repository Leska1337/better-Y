.class final Lcom/innioasis/y1/activity/IppActivity$RescanWorker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RescanWorker"
.end annotation

.field private final q:Lcom/innioasis/y1/activity/IppActivity$Rescan;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity$Rescan;)V
  .registers 2
  .line 1237
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1238
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
  .line 1239
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L8
  .registers 3
  .line 1245
    nop
  :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->next()Ljava/io/File;
    move-result-object v0
  :L1
  .line 1246
    if-nez v0, :L2
    goto :L9
  :L2
  .line 1247
    nop
  :L3
  .line 1249
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->access$400(Lcom/innioasis/y1/activity/IppActivity$Rescan;)Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L4
  .line 1252
    goto :L6
  :L5
  .line 1250
    move-exception v0
  .line 1251
    const/4 v0, 0
  :L6
  .line 1253
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built(Lcom/innioasis/y1/database/Song;)V
  :L7
  .line 1254
    goto :L0
  :L8
  .line 1255
    move-exception v0
  :L9
  .line 1257
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->quit()V
  .line 1258
    nop
  .line 1259
    return-void
.end method
