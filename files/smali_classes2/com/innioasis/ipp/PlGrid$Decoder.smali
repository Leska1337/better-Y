.class final Lcom/innioasis/ipp/PlGrid$Decoder;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Decoder"
.end annotation
.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
  }
.end annotation

.field private final static queue:Ljava/util/LinkedList;

.field private static repaintPosted:Z

.field private static running:Z

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 1081
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
  .line 1083
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 1080
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$1700()Ljava/util/LinkedList;
  .registers 1
  .line 1080
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$1802(Z)Z
  .registers 1
  .line 1080
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    return p0
.end method

.method static all(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  :L0
  .line 1117
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$1300()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 1118
    if-nez v0, :L1
    return-void
  :L1
  .line 1119
    const/4 v1, 0
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 1120
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 1121
    instance-of v4, v3, Lcom/innioasis/y1/database/Playlist;
    if-eqz v4, :L3
    check-cast v3, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v3
    invoke-static { v3, p0, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L3
  .line 1119
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 1124
    goto :L6
  :L5
  .line 1123
    move-exception p0
  :L6
  .line 1125
    return-void
.end method

.method static attach(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 1088
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 1089
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
  .line 1090
    monitor-exit v0
  .line 1091
    return-void
  :L1
  .line 1090
    move-exception p0
    monitor-exit v0
  :L2
    throw p0
.end method

.method static grid()Landroidx/recyclerview/widget/RecyclerView;
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 1094
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 1095
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    monitor-exit v0
    return-object v1
  :L1
  .line 1096
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static repaint()V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 3
  .line 1177
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 1178
    sget-boolean v1, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1179
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 1180
    if-nez v1, :L2
  .line 1181
    const-string v1, "playlist covers: no grid to repaint"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1182
    monitor-exit v0
    return-void
  :L2
  .line 1184
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
  .line 1185
    monitor-exit v0
  :L3
  .line 1188
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$200()Landroid/os/Handler;
    move-result-object v0
    new-instance v2, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1189
    return-void
  :L4
  .line 1185
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method static want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  .catchall { :L1 .. :L7 } :L2
  .catchall { :L8 .. :L9 } :L2
  .registers 5
  .line 1100
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 1101
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  .line 1102
    if-eqz p1, :L3
  :L1
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    goto :L3
  :L2
  .line 1108
    move-exception p0
    goto :L8
  :L3
  .line 1103
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z
  .line 1104
    if-eqz p2, :L4
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V
    goto :L5
  :L4
  .line 1105
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  :L5
  .line 1106
    sget-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
    if-eqz p0, :L6
    monitor-exit v0
    return-void
  :L6
  .line 1107
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 1108
    monitor-exit v0
  :L7
  .line 1109
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/ipp/PlGrid$Decoder;
    invoke-direct { p2 }, Lcom/innioasis/ipp/PlGrid$Decoder;-><init>()V
    const-string v0, "ipp-pl-covers"
    invoke-direct { p1, p2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 1110
    invoke-virtual { p1, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 1111
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 1112
    return-void
  :L8
  .line 1108
    monitor-exit v0
  :L9
    throw p0
.end method

.method public run()V
  .catchall { :L1 .. :L3 } :L19
  .catchall { :L4 .. :L10 } :L12
  .catchall { :L14 .. :L20 } :L19
  .registers 17
  .line 1128
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 1129
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;
  .line 1130
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 1131
    nop
  .line 1132
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v5, 0
    const/4 v6, 0
  :L0
  .line 1135
    sget-object v7, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v7
  :L1
  .line 1136
    invoke-virtual { v7 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-nez v0, :L14
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L2
    goto/16 :L14
  :L2
  .line 1146
    invoke-virtual { v7 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/util/UUID;
  .line 1147
    monitor-exit v7
  :L3
  .line 1149
    const/16 v7, 32
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$1400(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v8
  .line 1150
    invoke-virtual { v8 }, Ljava/io/File;->lastModified()J
    move-result-wide v9
  .line 1151
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$1500()Ljava/util/Hashtable;
    move-result-object v11
    invoke-virtual { v11, v0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, [Ljava/lang/Object;
  .line 1152
    const-wide/16 v12, 0
    cmp-long v14, v9, v12
    if-eqz v14, :L11
    const/4 v12, 1
    if-eqz v11, :L5
    aget-object v13, v11, v5
    check-cast v13, Ljava/lang/Long;
    invoke-virtual { v13 }, Ljava/lang/Long;->longValue()J
    move-result-wide v13
    cmp-long v15, v13, v9
    if-nez v15, :L5
    aget-object v11, v11, v12
    check-cast v11, Landroid/graphics/Bitmap;
  .line 1153
    invoke-static { v11 }, Lcom/innioasis/ipp/PlGrid;->access$1600(Landroid/graphics/Bitmap;)Z
    move-result v11
    if-nez v11, :L5
    goto :L11
  :L5
  .line 1155
    invoke-virtual { v8 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8, v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v8
  .line 1157
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileCardSide()I
    move-result v11
  .line 1158
    if-eqz v8, :L7
    if-lez v11, :L7
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v13
    if-le v13, v11, :L7
  .line 1159
    nop
  .line 1160
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v13
    mul-int v13, v13, v11
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v14
    div-int/2addr v13, v14
    invoke-static { v12, v13 }, Ljava/lang/Math;->max(II)I
    move-result v13
  .line 1159
    invoke-static { v8, v11, v13, v12 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v11
  .line 1161
    if-eq v11, v8, :L6
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->recycle()V
  :L6
  .line 1162
    move-object v8, v11
  :L7
  .line 1164
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$1500()Ljava/util/Hashtable;
    move-result-object v11
    const/4 v13, 2
    new-array v13, v13, [Ljava/lang/Object;
    invoke-static { v9, v10 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v13, v5
    aput-object v8, v13, v12
    invoke-virtual { v11, v0, v13 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 1165
    if-eqz v8, :L8
    add-int/lit8 v6, v6, 1
    goto :L9
  :L8
  .line 1166
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
  :L9
  .line 1167
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->repaint()V
  :L10
  .line 1170
    goto :L13
  :L11
  .line 1153
    goto/16 :L0
  :L12
  .line 1168
    move-exception v0
  .line 1169
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v7, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L13
  .line 1171
    goto/16 :L0
  :L14
  .line 1137
    invoke-virtual { v7 }, Ljava/util/LinkedList;->clear()V
  .line 1138
    sput-boolean v5, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 1139
    if-gtz v6, :L15
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->length()I
    move-result v0
    if-lez v0, :L18
  :L15
  .line 1140
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "playlist covers: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " read in "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1141
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v2
    invoke-virtual { v0, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1142
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->length()I
    move-result v1
    if-lez v1, :L16
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, ", did not:"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    goto :L17
  :L16
    const-string v1, ""
  :L17
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1140
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L18
  .line 1144
    monitor-exit v7
    return-void
  :L19
  .line 1147
    move-exception v0
    monitor-exit v7
  :L20
    goto :L22
  :L21
    throw v0
  :L22
    goto :L21
.end method
