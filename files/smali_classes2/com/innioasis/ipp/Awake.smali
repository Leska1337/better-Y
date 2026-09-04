.class public final Lcom/innioasis/ipp/Awake;
.super Ljava/lang/Object;
.source "Awake.java"

.method private constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static book(Landroid/app/Activity;)V
  .registers 3
  .line 60
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/text/TextActivity;
    const/4 v1, 1
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/epub/EpubActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/pdf/PdfActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/word/WordActivity;
    if-eqz v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
    goto :L2
  :L1
    const/4 v0, 1
  :L2
  .line 62
    if-eqz v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Awake;->enabled(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L3
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Awake;->set(Landroid/app/Activity;Z)V
  :L3
  .line 63
    return-void
.end method

.method private static enabled(Landroid/app/Activity;)Z
  .registers 2
  .line 31
    const-string v0, "keep_awake"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static lyrics(Landroid/app/Activity;)V
  .registers 2
  .line 49
    instance-of v0, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 50
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v0
  .line 51
    if-eqz v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Awake;->enabled(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Awake;->set(Landroid/app/Activity;Z)V
  .line 52
    return-void
.end method

.method private static set(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 36
    const/16 v0, 128
    if-eqz p1, :L1
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/Window;->addFlags(I)V
    goto :L2
  :L1
  .line 37
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/Window;->clearFlags(I)V
  :L2
  .line 40
    goto :L4
  :L3
  .line 38
    move-exception p0
  :L4
  .line 41
    return-void
.end method
