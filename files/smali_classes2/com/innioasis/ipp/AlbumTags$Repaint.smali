.class final Lcom/innioasis/ipp/AlbumTags$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "AlbumTags.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumTags;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Repaint"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 258
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/AlbumTags$1;)V
  .registers 2
  .line 258
    invoke-direct { p0 }, Lcom/innioasis/ipp/AlbumTags$Repaint;-><init>()V
    return-void
.end method

.method public run()V
  .registers 1
  .line 260
    invoke-static { }, Lcom/innioasis/ipp/Lists;->refresh()V
  .line 261
    return-void
.end method
