.class final Lcom/innioasis/ipp/Folders$Key;
.super Ljava/lang/Object;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Key"
.end annotation

.field final dir:Z

.field final item:Ljava/lang/Object;

.field final name:Ljava/lang/String;

.field final time:J

.method constructor <init>(Ljava/lang/Object;ZLjava/lang/String;J)V
  .registers 6
  .line 656
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 657
    iput-object p1, p0, Lcom/innioasis/ipp/Folders$Key;->item:Ljava/lang/Object;
    iput-boolean p2, p0, Lcom/innioasis/ipp/Folders$Key;->dir:Z
    iput-object p3, p0, Lcom/innioasis/ipp/Folders$Key;->name:Ljava/lang/String;
    iput-wide p4, p0, Lcom/innioasis/ipp/Folders$Key;->time:J
  .line 658
    return-void
.end method
