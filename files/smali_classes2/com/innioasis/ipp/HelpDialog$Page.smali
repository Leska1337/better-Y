.class final Lcom/innioasis/ipp/HelpDialog$Page;
.super Ljava/lang/Object;
.source "HelpDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/HelpDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Page"
.end annotation

.field final cap:Ljava/lang/String;

.field final img:Ljava/lang/String;

.field final text:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 106
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 107
    iput-object p1, p0, Lcom/innioasis/ipp/HelpDialog$Page;->text:Ljava/lang/String;
  .line 108
    iput-object p2, p0, Lcom/innioasis/ipp/HelpDialog$Page;->img:Ljava/lang/String;
  .line 109
    iput-object p3, p0, Lcom/innioasis/ipp/HelpDialog$Page;->cap:Ljava/lang/String;
  .line 110
    return-void
.end method
