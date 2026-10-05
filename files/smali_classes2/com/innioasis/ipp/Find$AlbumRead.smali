.class final Lcom/innioasis/ipp/Find$AlbumRead;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Find.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Find;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "AlbumRead"
.end annotation

.field private final def:Landroid/graphics/Bitmap;

.field private final icon:Landroid/widget/ImageView;

.field private final key:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 5
  .line 161
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 162
    iput-object p1, p0, Lcom/innioasis/ipp/Find$AlbumRead;->icon:Landroid/widget/ImageView;
  .line 163
    iput-object p2, p0, Lcom/innioasis/ipp/Find$AlbumRead;->key:Ljava/lang/String;
  .line 164
    iput-object p3, p0, Lcom/innioasis/ipp/Find$AlbumRead;->path:Ljava/lang/String;
  .line 165
    iput-object p4, p0, Lcom/innioasis/ipp/Find$AlbumRead;->def:Landroid/graphics/Bitmap;
  .line 166
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 169
    nop
  :L0
  .line 171
    iget-object v0, p0, Lcom/innioasis/ipp/Find$AlbumRead;->key:Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/ipp/Find$AlbumRead;->path:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L1
  .line 174
    goto :L3
  :L2
  .line 172
    move-exception v0
  .line 173
    const/4 v0, 0
  :L3
  .line 175
    if-nez v0, :L4
    return-void
  :L4
  .line 176
    iget-object v1, p0, Lcom/innioasis/ipp/Find$AlbumRead;->icon:Landroid/widget/ImageView;
    iget-object v2, p0, Lcom/innioasis/ipp/Find$AlbumRead;->key:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/Find$AlbumRead;->def:Landroid/graphics/Bitmap;
    invoke-static { v1, v2, v0, v3 }, Lcom/innioasis/ipp/Find;->access$000(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .line 177
    return-void
.end method
