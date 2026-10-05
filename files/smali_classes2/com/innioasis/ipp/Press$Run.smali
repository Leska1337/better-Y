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
  .line 113
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 114
    iput-object p1, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
  .line 115
    return-void
.end method

.method public run()V
  .registers 3
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Press;->clearPending(Ljava/lang/Runnable;)V
  .line 120
    iget-object v0, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 124
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 125
    if-eqz v0, :L1
  .line 126
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->muteOrNoMuteMusic(Z)V
  :L1
  .line 128
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 129
    if-eqz v0, :L2
  .line 130
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->playOrPause()V
  :L2
  .line 132
    iget-object v0, p0, Lcom/innioasis/ipp/Press$Run;->a:Lcom/innioasis/y1/base/BaseActivity;
    sget-object v1, Lcom/innioasis/y1/base/BaseActivity$Direction;->BOTTOM:Lcom/innioasis/y1/base/BaseActivity$Direction;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/base/BaseActivity;->direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .line 133
    return-void
  :L3
  .line 121
    return-void
.end method
