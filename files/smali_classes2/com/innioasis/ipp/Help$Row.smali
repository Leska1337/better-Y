.class public final Lcom/innioasis/ipp/Help$Row;
.super Ljava/lang/Object;
.source "Help.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Help;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Row"
.end annotation

.field public body:Ljava/lang/String;

.field public final group:Z

.field public final key:Ljava/lang/String;

.field public label:Ljava/lang/String;

.field public showIf:Ljava/lang/String;

.field public values:[Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;Z)V
  .registers 3
  .line 80
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 81
    iput-object p1, p0, Lcom/innioasis/ipp/Help$Row;->key:Ljava/lang/String;
  .line 82
    iput-boolean p2, p0, Lcom/innioasis/ipp/Help$Row;->group:Z
  .line 83
    return-void
.end method
