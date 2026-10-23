.class final Lcom/innioasis/ipp/Lab$Layouts;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Layouts"
.end annotation

.field private lastDump:J

.field private final perScreen:Ljava/util/HashMap;

.field private final seen:Ljava/util/HashMap;

.method constructor <init>()V
  .registers 3
  .line 145
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 146
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
  .line 147
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->lastDump:J
  .line 148
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->perScreen:Ljava/util/HashMap;
    return-void
.end method

.method private static focused()Landroid/app/Activity;
  .registers 4
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Lab;->access$100()Ljava/util/WeakHashMap;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 186
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 187
    aget-object v2, v0, v1
    check-cast v2, Landroid/app/Activity;
  .line 188
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/app/Activity;->isFinishing()Z
    move-result v3
    if-nez v3, :L1
    invoke-virtual { v2 }, Landroid/app/Activity;->hasWindowFocus()Z
    move-result v3
    if-eqz v3, :L1
    return-object v2
  :L1
  .line 186
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 190
    const/4 v0, 0
    return-object v0
.end method

.method private origins(Landroid/view/View;Ljava/lang/String;)V
  .catchall { :L5 .. :L6 } :L9
  .registers 10
  .line 194
    const-string v0, ""
  .line 195
    instance-of v1, p1, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 196
    move-object v1, p1
    check-cast v1, Landroid/view/ViewGroup;
  .line 197
    const/4 v3, 0
  :L0
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v4
    if-ge v2, v4, :L2
  .line 198
    invoke-virtual { v1, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v4
  .line 199
    if-eqz v4, :L1
    invoke-virtual { v4 }, Landroid/view/View;->getVisibility()I
    move-result v5
    const/16 v6, 8
    if-eq v5, v6, :L1
    invoke-virtual { v4 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v5
    if-eqz v5, :L1
  .line 200
    nop
  .line 201
    invoke-direct { p0, v4, p2 }, Lcom/innioasis/ipp/Lab$Layouts;->origins(Landroid/view/View;Ljava/lang/String;)V
    const/4 v3, 1
  :L1
  .line 197
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
    move v2, v3
  :L3
  .line 205
    if-eqz v2, :L4
    return-void
  :L4
  .line 206
    nop
  :L5
  .line 208
    invoke-virtual { p1 }, Landroid/view/View;->getId()I
    move-result v1
    const/4 v2, -1
    if-eq v1, v2, :L7
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "/"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { p1 }, Landroid/view/View;->getId()I
    move-result v3
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  :L6
    goto :L8
  :L7
    move-object v1, v0
  :L8
  .line 210
    goto :L10
  :L9
  .line 209
    move-exception v1
    move-object v1, v0
  :L10
  .line 211
    invoke-virtual { p1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-nez v2, :L11
    goto :L12
  :L11
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, " in "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L12
  .line 212
    iget-object v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    const-string v3, " "
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/Lab$Stacks;->access$200(Ljava/util/HashMap;Ljava/lang/String;)V
  .line 213
    return-void
.end method

.method public doFrame(J)V
  .catchall { :L0 .. :L7 } :L8
  .registers 11
  :L0
  .line 152
    invoke-static { }, Lcom/innioasis/ipp/Lab$Layouts;->focused()Landroid/app/Activity;
    move-result-object p1
  .line 153
    if-nez p1, :L1
    const/4 p2, 0
    goto :L2
  :L1
    invoke-virtual { p1 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/view/Window;->peekDecorView()Landroid/view/View;
    move-result-object p2
  :L2
  .line 154
    const/4 v0, 0
    const/4 v1, 1
    if-eqz p2, :L4
  .line 155
    invoke-virtual { p1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object p1
  .line 156
    iget-object v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->perScreen:Ljava/util/HashMap;
    invoke-virtual { v2, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [I
  .line 157
    if-nez v2, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->perScreen:Ljava/util/HashMap;
    const/4 v3, 2
    new-array v3, v3, [I
    invoke-virtual { v2, p1, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-object v2, v3
  :L3
  .line 158
    aget v3, v2, v0
    add-int/2addr v3, v1
    aput v3, v2, v0
  .line 159
    invoke-virtual { p2 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v3
    if-eqz v3, :L4
  .line 160
    aget v3, v2, v1
    add-int/2addr v3, v1
    aput v3, v2, v1
  .line 161
    invoke-direct { p0, p2, p1 }, Lcom/innioasis/ipp/Lab$Layouts;->origins(Landroid/view/View;Ljava/lang/String;)V
  :L4
  .line 164
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p1
  .line 165
    iget-wide v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->lastDump:J
    sub-long v2, p1, v2
    const-wide/16 v4, 20000
    cmp-long v6, v2, v4
    if-ltz v6, :L7
  .line 166
    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "layouts:"
    invoke-direct { v2, v3 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
  .line 167
    iget-object v3, p0, Lcom/innioasis/ipp/Lab$Layouts;->perScreen:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 168
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L6
  .line 169
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 170
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, [I
  .line 171
    const/16 v6, 32
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v7, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    aget v6, v5, v1
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v6, 47
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    aget v5, v5, v0
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 172
    goto :L5
  :L6
  .line 173
    const-string v0, "ipplab"
    const-string v1, " |"
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
    const/16 v3, 15
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Lab$Stacks;->access$000(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 174
    iget-object v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 175
    iget-object v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->perScreen:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 176
    iput-wide p1, p0, Lcom/innioasis/ipp/Lab$Layouts;->lastDump:J
  :L7
  .line 179
    goto :L9
  :L8
  .line 178
    move-exception p1
  :L9
  .line 180
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 181
    return-void
.end method
