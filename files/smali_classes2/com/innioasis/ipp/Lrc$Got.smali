.class final Lcom/innioasis/ipp/Lrc$Got;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lrc.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lrc;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Got"
.end annotation

.field private final a:Lcom/innioasis/y1/base/BasePlayerActivity;

.field private final path:Ljava/lang/String;

.field private final text:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 123
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 124
    iput-object p1, p0, Lcom/innioasis/ipp/Lrc$Got;->a:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 125
    iput-object p2, p0, Lcom/innioasis/ipp/Lrc$Got;->path:Ljava/lang/String;
  .line 126
    iput-object p3, p0, Lcom/innioasis/ipp/Lrc$Got;->text:Ljava/lang/String;
  .line 127
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L5
  .registers 3
  :L0
  .line 131
    iget-object v0, p0, Lcom/innioasis/ipp/Lrc$Got;->path:Ljava/lang/String;
    invoke-static { }, Lcom/innioasis/ipp/Lrc;->access$100()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    invoke-static { }, Lcom/innioasis/ipp/Lrc;->access$200()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L4
    invoke-static { }, Lcom/innioasis/ipp/Lrc;->access$200()Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Lrc$Got;->path:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/Lrc;->access$300(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    goto :L4
  :L1
  .line 132
    iget-object v0, p0, Lcom/innioasis/ipp/Lrc$Got;->a:Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 133
    iget-object v0, p0, Lcom/innioasis/ipp/Lrc$Got;->a:Lcom/innioasis/y1/base/BasePlayerActivity;
    iget-object v1, p0, Lcom/innioasis/ipp/Lrc$Got;->text:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Lrc;->access$400(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  :L3
  .line 135
    goto :L6
  :L4
  .line 131
    return-void
  :L5
  .line 134
    move-exception v0
  :L6
  .line 136
    return-void
.end method
