.class final Lcom/innioasis/ipp/PlGrid$Tidy;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tidy"
.end annotation

.field private final static REST_MS:J = 300L

.field private final static T:Lcom/innioasis/ipp/PlGrid$Tidy;

.field private final static WORTH:J = 1048576L

.field private static rv:Ljava/lang/ref/WeakReference;

.field private static seen:J

.method static constructor <clinit>()V
  .registers 2
  .line 245
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Tidy;
    invoke-direct { v0 }, Lcom/innioasis/ipp/PlGrid$Tidy;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Tidy;->T:Lcom/innioasis/ipp/PlGrid$Tidy;
  .line 246
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Tidy;->rv:Ljava/lang/ref/WeakReference;
  .line 256
    const-wide/16 v0, -1
    sput-wide v0, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 243
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static at(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 249
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Tidy;->rv:Ljava/lang/ref/WeakReference;
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$200()Landroid/os/Handler;
    move-result-object p0
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Tidy;->T:Lcom/innioasis/ipp/PlGrid$Tidy;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$200()Landroid/os/Handler;
    move-result-object p0
    const-wide/16 v1, 300
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 252
    return-void
.end method

.method private static collect()V
  .registers 7
  .line 259
    sget-wide v0, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-gez v4, :L0
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L0
  .line 260
    invoke-static { }, Landroid/os/Debug;->getGlobalAllocSize()I
    move-result v0
    int-to-long v0, v0
  .line 261
    sget-wide v4, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
    cmp-long v6, v0, v4
    if-gez v6, :L1
    sput-wide v0, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
  :L1
  .line 262
    sget-wide v4, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
    cmp-long v6, v4, v2
    if-ltz v6, :L2
    sub-long v2, v0, v4
    const-wide/32 v4, 1048576
    cmp-long v6, v2, v4
    if-gez v6, :L2
    return-void
  :L2
  .line 263
    sput-wide v0, Lcom/innioasis/ipp/PlGrid$Tidy;->seen:J
  .line 264
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 265
    return-void
.end method

.method static now()V
  .registers 0
  .line 268
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Tidy;->collect()V
  .line 269
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  :L0
  .line 273
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Tidy;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 274
    if-eqz v0, :L4
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
    if-eqz v1, :L4
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 275
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
  .line 276
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v2
  .line 277
    if-eqz v1, :L2
    add-int/lit8 v2, v2, -1
    if-ne v1, v2, :L3
  :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v0
    const/4 v1, 0
    cmpl-float v0, v0, v1
    if-nez v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Tidy;->collect()V
  :L3
  .line 279
    goto :L6
  :L4
  .line 274
    return-void
  :L5
  .line 278
    move-exception v0
  :L6
  .line 280
    return-void
.end method
