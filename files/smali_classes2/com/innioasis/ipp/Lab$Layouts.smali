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

.field private frames:I

.field private laid:I

.field private lastDump:J

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
    return-void
.end method

.method private origins(Landroid/view/View;Ljava/lang/String;)V
  .catchall { :L5 .. :L6 } :L9
  .registers 9
  .line 172
    const-string v0, ""
  .line 173
    instance-of v1, p1, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 174
    move-object v1, p1
    check-cast v1, Landroid/view/ViewGroup;
  .line 175
    const/4 v3, 0
  :L0
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v4
    if-ge v2, v4, :L2
  .line 176
    invoke-virtual { v1, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v4
  .line 177
    if-eqz v4, :L1
    invoke-virtual { v4 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v5
    if-eqz v5, :L1
  .line 178
    nop
  .line 179
    invoke-direct { p0, v4, p2 }, Lcom/innioasis/ipp/Lab$Layouts;->origins(Landroid/view/View;Ljava/lang/String;)V
    const/4 v3, 1
  :L1
  .line 175
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
    move v2, v3
  :L3
  .line 183
    if-eqz v2, :L4
    return-void
  :L4
  .line 184
    nop
  :L5
  .line 186
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
  .line 188
    goto :L10
  :L9
  .line 187
    move-exception v1
    move-object v1, v0
  :L10
  .line 189
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
  .line 190
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
  .line 191
    return-void
.end method

.method public doFrame(J)V
  .catchall { :L0 .. :L6 } :L7
  .registers 8
  :L0
  .line 152
    invoke-static { }, Lcom/innioasis/ipp/Lab;->access$000()Ljava/lang/ref/WeakReference;
    move-result-object p1
    const/4 p2, 0
    if-nez p1, :L1
    move-object p1, p2
    goto :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Lab;->access$000()Ljava/lang/ref/WeakReference;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/app/Activity;
  :L2
  .line 153
    if-eqz p1, :L4
    invoke-virtual { p1 }, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L3
    goto :L4
  :L3
    invoke-virtual { p1 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/view/Window;->peekDecorView()Landroid/view/View;
    move-result-object p2
  :L4
  .line 154
    iget v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->frames:I
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->frames:I
  .line 155
    if-eqz p2, :L5
    invoke-virtual { p2 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v0
    if-eqz v0, :L5
  .line 156
    iget v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->laid:I
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->laid:I
  .line 157
    invoke-virtual { p1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object p1
    invoke-direct { p0, p2, p1 }, Lcom/innioasis/ipp/Lab$Layouts;->origins(Landroid/view/View;Ljava/lang/String;)V
  :L5
  .line 159
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p1
  .line 160
    iget-wide v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->lastDump:J
    sub-long v0, p1, v0
    const-wide/16 v2, 20000
    cmp-long v4, v0, v2
    if-ltz v4, :L6
  .line 161
    const-string v0, "ipplab"
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "layouts: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->laid:I
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " of "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->frames:I
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " frames:"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
    const/16 v3, 15
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Lab$Stacks;->access$100(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 162
    iget-object v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->seen:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 163
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->laid:I
    iput v0, p0, Lcom/innioasis/ipp/Lab$Layouts;->frames:I
  .line 164
    iput-wide p1, p0, Lcom/innioasis/ipp/Lab$Layouts;->lastDump:J
  :L6
  .line 167
    goto :L8
  :L7
  .line 166
    move-exception p1
  :L8
  .line 168
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 169
    return-void
.end method
