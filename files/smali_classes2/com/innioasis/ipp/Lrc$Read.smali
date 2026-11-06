.class final Lcom/innioasis/ipp/Lrc$Read;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lrc.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lrc;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Read"
.end annotation

.field private final a:Lcom/innioasis/y1/base/BasePlayerActivity;

.field private final path:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .registers 3
  .line 106
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 107
    iput-object p1, p0, Lcom/innioasis/ipp/Lrc$Read;->a:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 108
    iput-object p2, p0, Lcom/innioasis/ipp/Lrc$Read;->path:Ljava/lang/String;
  .line 109
    return-void
.end method

.method public run()V
  .registers 6
  .line 112
    iget-object v0, p0, Lcom/innioasis/ipp/Lrc$Read;->path:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->lyrics(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 113
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Lrc;->access$000()Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/ipp/Lrc$Got;
    iget-object v3, p0, Lcom/innioasis/ipp/Lrc$Read;->a:Lcom/innioasis/y1/base/BasePlayerActivity;
    iget-object v4, p0, Lcom/innioasis/ipp/Lrc$Read;->path:Ljava/lang/String;
    invoke-direct { v2, v3, v4, v0 }, Lcom/innioasis/ipp/Lrc$Got;-><init>(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 114
    return-void
.end method
