.class final Lcom/innioasis/ipp/Genres$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Warm"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.field private final names:Ljava/util/ArrayList;

.method constructor <init>(Lcom/innioasis/music/GenresActivity;Ljava/util/ArrayList;)V
  .registers 3
  .line 992
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$Warm;->a:Lcom/innioasis/music/GenresActivity;
    iput-object p2, p0, Lcom/innioasis/ipp/Genres$Warm;->names:Ljava/util/ArrayList;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 996
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Warm;->names:Ljava/util/ArrayList;
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 997
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$Warm;->a:Lcom/innioasis/music/GenresActivity;
    new-instance v1, Lcom/innioasis/ipp/Genres$Late;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Genres$Late;-><init>(Lcom/innioasis/music/GenresActivity;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/GenresActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L1
  .line 1000
    goto :L3
  :L2
  .line 998
    move-exception v0
  :L3
  .line 1001
    return-void
.end method
