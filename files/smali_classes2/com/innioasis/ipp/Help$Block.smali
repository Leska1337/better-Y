.class public final Lcom/innioasis/ipp/Help$Block;
.super Ljava/lang/Object;
.source "Help.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Help;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Block"
.end annotation

.field public final cap:Ljava/lang/String;

.field public final img:Ljava/lang/String;

.field public final text:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 59
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 60
    iput-object p1, p0, Lcom/innioasis/ipp/Help$Block;->text:Ljava/lang/String;
  .line 61
    iput-object p2, p0, Lcom/innioasis/ipp/Help$Block;->img:Ljava/lang/String;
  .line 62
    iput-object p3, p0, Lcom/innioasis/ipp/Help$Block;->cap:Ljava/lang/String;
  .line 63
    return-void
.end method
