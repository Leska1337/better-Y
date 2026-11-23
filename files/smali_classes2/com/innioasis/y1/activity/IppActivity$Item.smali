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

.field indent:Z

.field final key:Ljava/lang/String;

.field label:Ljava/lang/String;

.field parent:Ljava/lang/String;

.field showIf:Ljava/lang/String;

.field final type:I

.field values:[Ljava/lang/String;

.field wheel:Z

.method constructor <init>(ILjava/lang/String;I[ILjava/lang/String;)V
  .registers 6
  .line 135
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 136
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->type:I
  .line 137
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->key:Ljava/lang/String;
  .line 138
    iput p3, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->count:I
  .line 139
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->choices:[I
  .line 140
    iput-object p5, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->showIf:Ljava/lang/String;
  .line 141
    return-void
.end method

.method in(Ljava/lang/String;)Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 2
  .line 144
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->parent:Ljava/lang/String;
  .line 145
    return-object p0
.end method

.method indent()Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 2
  .line 154
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->indent:Z
  .line 155
    return-object p0
.end method

.method wheel()Lcom/innioasis/y1/activity/IppActivity$Item;
  .registers 2
  .line 149
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$Item;->wheel:Z
  .line 150
    return-object p0
.end method
