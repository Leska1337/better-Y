.class final Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "AddTask"
.end annotation

.field private final id:Ljava/util/UUID;

.field private final songs:Ljava/util/List;

.method constructor <init>(Ljava/util/List;Ljava/util/UUID;)V
  .registers 3
  .line 1249
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1250
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;->songs:Ljava/util/List;
  .line 1251
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;->id:Ljava/util/UUID;
  .line 1252
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 1257
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1258
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;->songs:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;->id:Ljava/util/UUID;
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  :L1
  .line 1261
    goto :L3
  :L2
  .line 1259
    move-exception v0
  :L3
  .line 1262
    return-void
.end method
