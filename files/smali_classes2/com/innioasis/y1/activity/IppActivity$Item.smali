.class final Lcom/innioasis/y1/activity/IppActivity$Item;
.super Ljava/lang/Object;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Item"
.end annotation

.field final choices:[I

.field final count:I

.field final key:Ljava/lang/String;

.field label:Ljava/lang/String;

.field showIf:Ljava/lang/String;

.field final type:I

.field values:[Ljava/lang/String;

.method constructor <init>(ILjava/lang/String;I[ILjava/lang/String;)V
  .registers 6
  .line 114
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 115
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
  .line 116
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
  .line 117
    iput p3, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 118
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
  .line 119
    iput-object p5, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 120
    return-void
.end method
