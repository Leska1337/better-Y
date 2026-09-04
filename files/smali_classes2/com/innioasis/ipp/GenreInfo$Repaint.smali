.class final Lcom/innioasis/ipp/GenreInfo$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "GenreInfo.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/GenreInfo;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.field private final adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 2
  .line 136
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/GenreInfo$Repaint;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 138
    iget-object v0, p0, Lcom/innioasis/ipp/GenreInfo$Repaint;->adapter:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 139
    return-void
.end method
