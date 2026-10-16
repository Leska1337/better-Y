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

.field final sort:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/database/Song;)V
  .registers 6
  .line 108
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 109
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
  .line 110
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 111
    if-nez v0, :L0
    const-string v0, ""
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L1
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Item;->sort:Ljava/lang/String;
  .line 112
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
  .line 113
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
  .line 114
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    invoke-static { p1, p3, p2 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 115
    return-void
.end method
