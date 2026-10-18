.class final Lcom/innioasis/ipp/Eq$Track;
.super Landroid/graphics/drawable/LayerDrawable;
.source "Eq.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Eq;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Track"
.end annotation

.field final bar:I

.field final track:I

.method private constructor <init>([Landroid/graphics/drawable/Drawable;II)V
  .registers 4
  .line 322
    invoke-direct { p0, p1 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 323
    iput p2, p0, Lcom/innioasis/ipp/Eq$Track;->bar:I
  .line 324
    iput p3, p0, Lcom/innioasis/ipp/Eq$Track;->track:I
  .line 325
    return-void
.end method

.method static make(IIF)Lcom/innioasis/ipp/Eq$Track;
  .registers 8
  .line 328
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v0 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 329
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 330
    invoke-virtual { v0, p2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 331
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 332
    invoke-virtual { v1, p0 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 333
    invoke-virtual { v1, p2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 334
    new-instance p2, Landroid/graphics/drawable/ClipDrawable;
    const/4 v2, 3
    const/4 v3, 1
    invoke-direct { p2, v1, v2, v3 }, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V
  .line 335
    new-instance v1, Lcom/innioasis/ipp/Eq$Track;
    const/4 v2, 2
    new-array v2, v2, [Landroid/graphics/drawable/Drawable;
    const/4 v4, 0
    aput-object v0, v2, v4
    aput-object p2, v2, v3
    invoke-direct { v1, v2, p0, p1 }, Lcom/innioasis/ipp/Eq$Track;-><init>([Landroid/graphics/drawable/Drawable;II)V
  .line 336
    const/high16 p0, 0x01020000
    invoke-virtual { v1, v4, p0 }, Lcom/innioasis/ipp/Eq$Track;->setId(II)V
  .line 337
    const p0, 16908301
    invoke-virtual { v1, v3, p0 }, Lcom/innioasis/ipp/Eq$Track;->setId(II)V
  .line 338
    return-object v1
.end method
