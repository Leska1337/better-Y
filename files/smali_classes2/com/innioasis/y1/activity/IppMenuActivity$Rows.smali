.class final Lcom/innioasis/y1/activity/IppMenuActivity$Rows;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "IppMenuActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppMenuActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rows"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppMenuActivity;

.field private final labels:[I

.field private final main:Z

.method constructor <init>(Lcom/innioasis/y1/activity/IppMenuActivity;[IZ)V
  .registers 4
  .line 257
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
  .line 258
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->a:Lcom/innioasis/y1/activity/IppMenuActivity;
  .line 259
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->labels:[I
  .line 260
    iput-boolean p3, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
  .line 261
    return-void
.end method

.method public getItemCount()I
  .registers 2
  .line 265
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->labels:[I
    array-length v0, v0
    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .registers 10
  .line 276
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
  .line 277
    const/4 v0, 1
    const/4 v1, 0
    if-nez p2, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
  .line 278
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 279
    iget-boolean v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz v4, :L2
    const v4, 2131362491
    goto :L3
  :L2
    const v4, 2131362459
  :L3
    invoke-virtual { p1, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/TextView;
  .line 280
    iget-boolean v5, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz v5, :L4
    const v5, 2131362144
    goto :L5
  :L4
    const v5, 2131361881
  :L5
    invoke-virtual { p1, v5 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v5
    check-cast v5, Landroid/widget/ImageView;
  .line 281
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->labels:[I
    aget p2, v6, p2
    invoke-virtual { v4, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 282
    iget-boolean p2, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    const/16 v6, 8
    if-nez p2, :L6
    const p2, 2131362437
    invoke-virtual { p1, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p2
    invoke-virtual { p2, v6 }, Landroid/view/View;->setVisibility(I)V
  :L6
  .line 283
    iget-boolean p2, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz p2, :L7
    const p2, 2131362152
    invoke-virtual { p1, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L7
  .line 284
    if-eqz v2, :L10
  .line 285
    const p2, 2131231052
    invoke-virtual { v3, p1, p2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 286
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz p1, :L8
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->a:Lcom/innioasis/y1/activity/IppMenuActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    const p2, 2131100252
    invoke-virtual { p1, p2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p1
    goto :L9
  :L8
  .line 287
    const p1, -12779554
  :L9
    nop
  .line 286
    invoke-virtual { v3, v4, p1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 288
    const p1, 2131623981
    invoke-virtual { v3, v5, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 289
    invoke-virtual { v5, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
    goto :L14
  :L10
  .line 291
    iget-boolean p2, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz p2, :L11
    const p2, 2131231044
    goto :L12
  :L11
    const/4 p2, 0
  :L12
    invoke-virtual { v3, p1, p2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 292
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->a:Lcom/innioasis/y1/activity/IppMenuActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    const p2, 2131100267
    invoke-virtual { p1, p2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p1
    invoke-virtual { v3, v4, p1, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 293
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz p1, :L13
    const/4 v6, 4
  :L13
    invoke-virtual { v5, v6 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L14
  .line 295
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 6
  .line 270
    new-instance p2, Lcom/innioasis/y1/activity/IppMenuActivity$Holder;
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->a:Lcom/innioasis/y1/activity/IppMenuActivity;
    invoke-static { v0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v0
  .line 271
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;->main:Z
    if-eqz v1, :L0
    const v1, 2131558521
    goto :L1
  :L0
    const v1, 2131558526
  :L1
  .line 270
    const/4 v2, 0
    invoke-virtual { v0, v1, p1, v2 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object p1
    invoke-direct { p2, p1 }, Lcom/innioasis/y1/activity/IppMenuActivity$Holder;-><init>(Landroid/view/View;)V
    return-object p2
.end method
