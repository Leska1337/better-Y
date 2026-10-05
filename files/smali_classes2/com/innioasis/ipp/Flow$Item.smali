.class public final Lcom/innioasis/ipp/Flow$Item;
.super Ljava/lang/Object;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Item"
.end annotation

.field public volatile artist:Ljava/lang/String;

.field public final key:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final rep:Lcom/innioasis/y1/database/Song;

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 96
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 97
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
  .line 98
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
  .line 99
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
  .line 100
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p3, p2 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 101
    return-void
.end method
