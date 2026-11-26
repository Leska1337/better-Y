.class final Lcom/innioasis/ipp/PlGrid$Rebind;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rebind"
.end annotation

.field private final a:Lcom/innioasis/music/adapter/rv/RVBaseAdapter;

.method constructor <init>(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 2
  .line 989
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$Rebind;->a:Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    return-void
.end method

.method public run()V
  .registers 2
  .line 992
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Rebind;->a:Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  .line 993
    return-void
.end method
