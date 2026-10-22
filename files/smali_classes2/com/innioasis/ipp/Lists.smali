.class public final Lcom/innioasis/ipp/Lists;
.super Ljava/lang/Object;
.source "Lists.java"

.field private static last:Ljava/lang/ref/WeakReference;

.field private final static refs:Ljava/util/ArrayList;

.method static constructor <clinit>()V
  .registers 1
  .line 17
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static note(Landroid/widget/BaseAdapter;)V
  .catchall { :L1 .. :L6 } :L7
  .registers 4
  .line 24
    if-eqz p0, :L9
    sget-object v0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne p0, v0, :L0
    goto :L9
  :L0
  .line 25
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/ref/WeakReference;
  :L1
  .line 27
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 28
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 29
    if-nez v2, :L3
  .line 30
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    goto :L4
  :L3
  .line 31
    if-ne v2, p0, :L4
  .line 32
    return-void
  :L4
  .line 27
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 35
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 37
    goto :L8
  :L7
  .line 36
    move-exception p0
  :L8
  .line 38
    return-void
  :L9
  .line 24
    return-void
.end method

.method public static refresh()V
  .catchall { :L0 .. :L2 } :L8
  .catchall { :L3 .. :L4 } :L5
  .registers 3
  :L0
  .line 42
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L1
    if-ltz v0, :L7
  .line 43
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 44
    if-nez v2, :L3
  .line 45
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L2
  .line 46
    goto :L6
  :L3
  .line 49
    check-cast v2, Landroid/widget/BaseAdapter;
    invoke-virtual { v2 }, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
  :L4
  .line 51
    goto :L6
  :L5
  .line 50
    move-exception v1
  :L6
  .line 42
    add-int/lit8 v0, v0, -1
    goto :L1
  :L7
  .line 54
    goto :L9
  :L8
  .line 53
    move-exception v0
  :L9
  .line 55
    return-void
.end method
