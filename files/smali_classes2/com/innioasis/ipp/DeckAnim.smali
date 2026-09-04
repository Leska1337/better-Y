.class public final Lcom/innioasis/ipp/DeckAnim;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "DeckAnim.java"

.method public constructor <init>()V
  .registers 1
  .line 10
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 1
  .line 14
    invoke-static { }, Lcom/innioasis/ipp/Deck;->animTick()V
  .line 15
    return-void
.end method
