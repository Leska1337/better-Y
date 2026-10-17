.class final Lcom/innioasis/ipp/Menus$Chosen;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Menus.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Menus;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Chosen"
.end annotation

.field private final cb:Ljava/lang/Object;

.field private final entries:Ljava/util/List;

.field private final full:[I

.field private final parent:Landroid/app/Dialog;

.field private final pick:[I

.method constructor <init>(Landroid/app/Dialog;Ljava/lang/Object;Ljava/util/List;[I[I)V
  .registers 6
  .line 326
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 327
    iput-object p1, p0, Lcom/innioasis/ipp/Menus$Chosen;->parent:Landroid/app/Dialog;
  .line 328
    iput-object p2, p0, Lcom/innioasis/ipp/Menus$Chosen;->cb:Ljava/lang/Object;
  .line 329
    iput-object p3, p0, Lcom/innioasis/ipp/Menus$Chosen;->entries:Ljava/util/List;
  .line 330
    iput-object p4, p0, Lcom/innioasis/ipp/Menus$Chosen;->full:[I
  .line 331
    iput-object p5, p0, Lcom/innioasis/ipp/Menus$Chosen;->pick:[I
  .line 332
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 6
  .line 335
    if-ltz p1, :L0
    iget-object p2, p0, Lcom/innioasis/ipp/Menus$Chosen;->pick:[I
    array-length v0, p2
    if-ge p1, v0, :L0
  .line 336
    aget p1, p2, p1
  .line 337
    iget-object p2, p0, Lcom/innioasis/ipp/Menus$Chosen;->parent:Landroid/app/Dialog;
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Chosen;->cb:Ljava/lang/Object;
    iget-object v1, p0, Lcom/innioasis/ipp/Menus$Chosen;->entries:Ljava/util/List;
    invoke-interface { v1, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Menus$Chosen;->full:[I
    aget p1, v2, p1
    invoke-static { p2, v0, v1, p1 }, Lcom/innioasis/ipp/Menus;->access$200(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
  :L0
  .line 339
    const/4 p1, 1
    return p1
.end method
