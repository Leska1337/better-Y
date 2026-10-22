.class final Lcom/innioasis/ipp/Lab$Survivors;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Survivors"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 59
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Lab$1;)V
  .registers 2
  .line 59
    invoke-direct { p0 }, Lcom/innioasis/ipp/Lab$Survivors;-><init>()V
    return-void
.end method

.method public run()V
  .registers 7
  .line 61
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 62
    invoke-static { }, Ljava/lang/System;->runFinalization()V
  .line 63
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 64
    invoke-static { }, Lcom/innioasis/ipp/Lab;->access$100()Ljava/util/WeakHashMap;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 65
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "screens alive "
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    array-length v2, v0
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const/16 v2, 58
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 66
    const/4 v2, 0
  :L0
    array-length v3, v0
    if-ge v2, v3, :L4
  .line 67
    aget-object v3, v0, v2
    check-cast v3, Landroid/app/Activity;
  .line 68
    if-nez v3, :L1
    goto :L3
  :L1
  .line 69
    const/16 v4, 32
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 35
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-static { }, Lcom/innioasis/ipp/Lab;->access$100()Ljava/util/WeakHashMap;
    move-result-object v5
    invoke-virtual { v5, v3 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
  .line 70
    invoke-virtual { v3 }, Landroid/app/Activity;->isDestroyed()Z
    move-result v4
    if-eqz v4, :L2
    const-string v3, "(destroyed)"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L3
  :L2
  .line 71
    invoke-virtual { v3 }, Landroid/app/Activity;->isFinishing()Z
    move-result v3
    if-eqz v3, :L3
    const-string v3, "(finishing)"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 66
    add-int/lit8 v2, v2, 1
    goto :L0
  :L4
  .line 73
    const-string v0, "ipplab"
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 74
    return-void
.end method
