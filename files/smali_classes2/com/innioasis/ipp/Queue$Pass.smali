.class final Lcom/innioasis/ipp/Queue$Pass;
.super Ljava/lang/Object;
.source "Queue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Queue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Pass"
.end annotation

.field hist:Ljava/util/ArrayList;

.field index:I

.field list:Ljava/util/ArrayList;

.field passLen:I

.field plan:Ljava/util/ArrayList;

.field planFor:I

.field skip:Ljava/util/ArrayList;

.field spent:Ljava/util/ArrayList;

.method constructor <init>()V
  .registers 1
  .line 405
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method
