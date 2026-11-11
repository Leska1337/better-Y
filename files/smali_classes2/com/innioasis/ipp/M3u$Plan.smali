.class public final Lcom/innioasis/ipp/M3u$Plan;
.super Ljava/lang/Object;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Plan"
.end annotation

.field base:Ljava/lang/String;

.field public final dups:Ljava/util/ArrayList;

.field public fav:Z

.field public file:Ljava/lang/String;

.field public found:I

.field final infos:Ljava/util/ArrayList;

.field public final lines:Ljava/util/ArrayList;

.field public final missing:Ljava/util/ArrayList;

.field public mode:I

.field public name:Ljava/lang/String;

.field public picked:Z

.field target:Lcom/innioasis/y1/database/Playlist;

.method public constructor <init>()V
  .registers 2
  .line 356
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 361
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
  .line 362
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Plan;->infos:Ljava/util/ArrayList;
  .line 365
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/ipp/M3u$Plan;->mode:I
  .line 370
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
  .line 371
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    return-void
.end method
