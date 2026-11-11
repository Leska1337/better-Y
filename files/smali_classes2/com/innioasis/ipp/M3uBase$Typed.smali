.class final Lcom/innioasis/ipp/M3uBase$Typed;
.super Ljava/lang/Object;
.implements Lcom/innioasis/y1/utils/InputMethodDialog$Callback;
.source "M3uBase.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3uBase;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Typed"
.end annotation

.field private final a:Landroid/app/Activity;

.field private live:Landroidx/lifecycle/MutableLiveData;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 260
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 261
    iput-object p1, p0, Lcom/innioasis/ipp/M3uBase$Typed;->a:Landroid/app/Activity;
  .line 262
    iput-object p2, p0, Lcom/innioasis/ipp/M3uBase$Typed;->path:Ljava/lang/String;
  .line 263
    return-void
.end method

.method public onBack()V
  .registers 4
  .line 274
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Typed;->live:Landroidx/lifecycle/MutableLiveData;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 275
    if-nez v0, :L2
    const-string v0, ""
    goto :L3
  :L2
    invoke-static { v0 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3uBase;->trim(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 276
    iget-object v1, p0, Lcom/innioasis/ipp/M3uBase$Typed;->a:Landroid/app/Activity;
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L4
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Typed;->path:Ljava/lang/String;
  :L4
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/M3uBase;->ask(Landroid/app/Activity;Ljava/lang/String;)V
  .line 277
    return-void
.end method

.method public onInit(Landroidx/lifecycle/MutableLiveData;)V
  .registers 2
  .line 266
    iput-object p1, p0, Lcom/innioasis/ipp/M3uBase$Typed;->live:Landroidx/lifecycle/MutableLiveData;
  .line 267
    return-void
.end method

.method seed(Ljava/lang/String;)V
  .registers 3
  .line 270
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Typed;->live:Landroidx/lifecycle/MutableLiveData;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V
  :L0
  .line 271
    return-void
.end method
