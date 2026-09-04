.class final Lcom/innioasis/ipp/Find$TrackRead;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Find.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Find;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "TrackRead"
.end annotation

.field private final def:Landroid/graphics/Bitmap;

.field private final icon:Landroid/widget/ImageView;

.field private final key:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 5
  .line 192
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 193
    iput-object p1, p0, Lcom/innioasis/ipp/Find$TrackRead;->icon:Landroid/widget/ImageView;
  .line 194
    iput-object p2, p0, Lcom/innioasis/ipp/Find$TrackRead;->key:Ljava/lang/String;
  .line 195
    iput-object p3, p0, Lcom/innioasis/ipp/Find$TrackRead;->path:Ljava/lang/String;
  .line 196
    iput-object p4, p0, Lcom/innioasis/ipp/Find$TrackRead;->def:Landroid/graphics/Bitmap;
  .line 197
    return-void
.end method

.method public run()V
  .catchall { :L3 .. :L4 } :L5
  .registers 5
  .line 200
    iget-object v0, p0, Lcom/innioasis/ipp/Find$TrackRead;->path:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Find;->access$100(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 201
    invoke-static { }, Lcom/innioasis/ipp/Find;->access$200()Ljava/util/Hashtable;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/Hashtable;->size()I
    move-result v1
    const/16 v2, 32
    if-le v1, v2, :L0
    invoke-static { }, Lcom/innioasis/ipp/Find;->access$200()Ljava/util/Hashtable;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/Hashtable;->clear()V
  :L0
  .line 202
    invoke-static { }, Lcom/innioasis/ipp/Find;->access$200()Ljava/util/Hashtable;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Find$TrackRead;->path:Ljava/lang/String;
    if-nez v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Find;->access$300()Ljava/lang/Object;
    move-result-object v3
    goto :L2
  :L1
    move-object v3, v0
  :L2
    invoke-virtual { v1, v2, v3 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 203
    nop
  .line 204
    if-nez v0, :L6
  :L3
  .line 206
    iget-object v0, p0, Lcom/innioasis/ipp/Find$TrackRead;->key:Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/ipp/Find$TrackRead;->path:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 209
    goto :L6
  :L5
  .line 207
    move-exception v0
  .line 208
    const/4 v0, 0
  :L6
  .line 211
    if-nez v0, :L7
    return-void
  :L7
  .line 212
    iget-object v1, p0, Lcom/innioasis/ipp/Find$TrackRead;->icon:Landroid/widget/ImageView;
    iget-object v2, p0, Lcom/innioasis/ipp/Find$TrackRead;->path:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/Find$TrackRead;->def:Landroid/graphics/Bitmap;
    invoke-static { v1, v2, v0, v3 }, Lcom/innioasis/ipp/Find;->access$000(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .line 213
    return-void
.end method
