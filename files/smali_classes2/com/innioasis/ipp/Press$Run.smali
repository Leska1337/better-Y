.class public final Lcom/innioasis/ipp/Press$Run;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Press.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Press;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Run"
.end annotation

.field private final a:Lcom/innioasis/y1/base/BaseActivity;

.method constructor <init>(Lcom/innioasis/y1/base/BaseActivity;)V
  .registers 2
  .line 138
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 139
    iput-object p1, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
  .line 140
    return-void
.end method

.method public run()V
  .registers 3
  .line 144
    invoke-static { p0 }, Lcom/innioasis/ipp/Press;->clearPending(Ljava/lang/Runnable;)V
  .line 145
    iget-object v0, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
    if-eqz v0, :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 149
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 150
    if-eqz v0, :L1
  .line 151
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->muteOrNoMuteMusic(Z)V
  .line 152
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->playOrPause()V
  :L1
  .line 154
    iget-object v0, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
    sget-object v1, Lcom/innioasis/y1/base/BaseActivity$Direction;->BOTTOM:Lcom/innioasis/y1/base/BaseActivity$Direction;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/base/BaseActivity;->direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .line 155
    return-void
  :L2
  .line 146
    return-void
.end method
