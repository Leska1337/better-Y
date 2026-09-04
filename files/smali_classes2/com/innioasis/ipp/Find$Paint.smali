.class final Lcom/innioasis/ipp/Find$Paint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Find.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Find;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Paint"
.end annotation

.field private final bmp:Landroid/graphics/Bitmap;

.field private final def:Landroid/graphics/Bitmap;

.field private final icon:Landroid/widget/ImageView;

.field private final tag:Ljava/lang/String;

.method constructor <init>(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .registers 5
  .line 257
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 258
    iput-object p1, p0, Lcom/innioasis/ipp/Find$Paint;->icon:Landroid/widget/ImageView;
  .line 259
    iput-object p2, p0, Lcom/innioasis/ipp/Find$Paint;->tag:Ljava/lang/String;
  .line 260
    iput-object p3, p0, Lcom/innioasis/ipp/Find$Paint;->bmp:Landroid/graphics/Bitmap;
  .line 261
    iput-object p4, p0, Lcom/innioasis/ipp/Find$Paint;->def:Landroid/graphics/Bitmap;
  .line 262
    return-void
.end method

.method public run()V
  .registers 3
  .line 265
    iget-object v0, p0, Lcom/innioasis/ipp/Find$Paint;->tag:Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/ipp/Find$Paint;->icon:Landroid/widget/ImageView;
    invoke-virtual { v1 }, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 266
    iget-object v0, p0, Lcom/innioasis/ipp/Find$Paint;->icon:Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/innioasis/ipp/Find$Paint;->bmp:Landroid/graphics/Bitmap;
    if-eqz v1, :L1
    goto :L2
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Find$Paint;->def:Landroid/graphics/Bitmap;
  :L2
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 267
    return-void
.end method
