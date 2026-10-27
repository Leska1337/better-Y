.class public final Lcom/innioasis/ipp/Lists;
.super Ljava/lang/Object;
.source "Lists.java"

.field private static last:Ljava/lang/ref/WeakReference;

.field private final static main:Landroid/os/Handler;

.field private final static refs:Ljava/util/ArrayList;

.field private final static watchers:Ljava/util/ArrayList;

.method static constructor <clinit>()V
  .registers 2
  .line 19
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
  .line 44
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Lists;->watchers:Ljava/util/ArrayList;
  .line 45
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Lists;->main:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static note(Landroid/widget/BaseAdapter;)V
  .catchall { :L1 .. :L6 } :L7
  .registers 4
  .line 26
    if-eqz p0, :L9
    sget-object v0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne p0, v0, :L0
    goto :L9
  :L0
  .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/ref/WeakReference;
  :L1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 30
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 31
    if-nez v2, :L3
  .line 32
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    goto :L4
  :L3
  .line 33
    if-ne v2, p0, :L4
  .line 34
    return-void
  :L4
  .line 29
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 37
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 39
    goto :L8
  :L7
  .line 38
    move-exception p0
  :L8
  .line 40
    return-void
  :L9
  .line 26
    return-void
.end method

.method public static refresh()V
  .catchall { :L0 .. :L6 } :L12
  .catchall { :L7 .. :L8 } :L9
  .registers 3
  :L0
  .line 54
    sget-object v0, Lcom/innioasis/ipp/Lists;->watchers:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L1
    if-ltz v0, :L4
  .line 55
    sget-object v1, Lcom/innioasis/ipp/Lists;->watchers:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 56
    if-nez v2, :L2
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    goto :L3
  :L2
  .line 57
    sget-object v1, Lcom/innioasis/ipp/Lists;->main:Landroid/os/Handler;
    check-cast v2, Ljava/lang/Runnable;
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 54
    add-int/lit8 v0, v0, -1
    goto :L1
  :L4
  .line 59
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L5
    if-ltz v0, :L11
  .line 60
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 61
    if-nez v2, :L7
  .line 62
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L6
  .line 63
    goto :L10
  :L7
  .line 66
    check-cast v2, Landroid/widget/BaseAdapter;
    invoke-virtual { v2 }, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
  :L8
  .line 68
    goto :L10
  :L9
  .line 67
    move-exception v1
  :L10
  .line 59
    add-int/lit8 v0, v0, -1
    goto :L5
  :L11
  .line 71
    goto :L13
  :L12
  .line 70
    move-exception v0
  :L13
  .line 72
    return-void
.end method

.method public static watch(Ljava/lang/Runnable;)V
  .registers 3
  .line 48
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Lists;->watchers:Ljava/util/ArrayList;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 49
    invoke-static { }, Lcom/innioasis/ipp/ListWatch;->register()V
  .line 50
    return-void
.end method
