.class public final Lcom/innioasis/ipp/Lists;
.super Ljava/lang/Object;
.source "Lists.java"

.field private static last:Ljava/lang/Object;

.field private final static refs:Ljava/util/ArrayList;

.method static constructor <clinit>()V
  .registers 1
  .line 28
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 26
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static note(Landroid/widget/BaseAdapter;)V
  .catchall { :L1 .. :L6 } :L7
  .registers 4
  .line 38
    if-eqz p0, :L9
    sget-object v0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/Object;
    if-ne p0, v0, :L0
    goto :L9
  :L0
  .line 39
    sput-object p0, Lcom/innioasis/ipp/Lists;->last:Ljava/lang/Object;
  :L1
  .line 41
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 42
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 43
    if-nez v2, :L3
  .line 44
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    goto :L4
  :L3
  .line 45
    if-ne v2, p0, :L4
  .line 46
    return-void
  :L4
  .line 41
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 49
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 52
    goto :L8
  :L7
  .line 50
    move-exception p0
  :L8
  .line 53
    return-void
  :L9
  .line 38
    return-void
.end method

.method public static refresh()V
  .catchall { :L0 .. :L2 } :L8
  .catchall { :L3 .. :L4 } :L5
  .registers 3
  :L0
  .line 58
    sget-object v0, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L1
    if-ltz v0, :L7
  .line 59
    sget-object v1, Lcom/innioasis/ipp/Lists;->refs:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 60
    if-nez v2, :L3
  .line 61
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L2
  .line 62
    goto :L6
  :L3
  .line 65
    check-cast v2, Landroid/widget/BaseAdapter;
    invoke-virtual { v2 }, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
  :L4
  .line 68
    goto :L6
  :L5
  .line 66
    move-exception v1
  :L6
  .line 58
    add-int/lit8 v0, v0, -1
    goto :L1
  :L7
  .line 72
    goto :L9
  :L8
  .line 70
    move-exception v0
  :L9
  .line 73
    return-void
.end method
