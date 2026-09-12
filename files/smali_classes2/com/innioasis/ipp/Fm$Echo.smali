.class final Lcom/innioasis/ipp/Fm$Echo;
.super Ljava/lang/Object;
.implements Landroid/text/TextWatcher;
.source "Fm.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fm;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Echo"
.end annotation

.field private final out:Landroid/widget/TextView;

.method constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 309
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 310
    iput-object p1, p0, Lcom/innioasis/ipp/Fm$Echo;->out:Landroid/widget/TextView;
  .line 311
    return-void
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 319
    iget-object v0, p0, Lcom/innioasis/ipp/Fm$Echo;->out:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 322
    goto :L3
  :L2
  .line 320
    move-exception p1
  :L3
  .line 323
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
  .registers 5
  .line 313
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
  .registers 5
  .line 315
    return-void
.end method
