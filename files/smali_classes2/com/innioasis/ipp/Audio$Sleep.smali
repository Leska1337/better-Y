.class final Lcom/innioasis/ipp/Audio$Sleep;
.super Landroid/os/CountDownTimer;
.source "Audio.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Audio;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Sleep"
.end annotation

.method constructor <init>(J)V
  .registers 5
  .line 178
    const-wide/16 v0, 1000
    invoke-direct { p0, p1, p2, v0, v1 }, Landroid/os/CountDownTimer;-><init>(JJ)V
  .line 179
    return-void
.end method

.method public onFinish()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 187
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 188
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v1
    sget-object v2, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v1, v2, :L1
  .line 189
    const/4 v1, 2
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1/service/PlayerService;->pause(IZ)V
  :L1
  .line 193
    goto :L3
  :L2
  .line 191
    move-exception v0
  :L3
  .line 194
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    const-wide/16 v1, -1
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookPlayTime(J)V
  .line 195
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/y1/Y1Application;->timer2:Landroid/os/CountDownTimer;
  .line 196
    invoke-static { }, Lcom/innioasis/ipp/Deck;->repaintLast()V
  .line 197
    return-void
.end method

.method public onTick(J)V
  .registers 4
  .line 182
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/y1/Y1Application$Companion;->setMillisUntilFinished2(J)V
  .line 183
    return-void
.end method
