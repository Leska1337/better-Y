.class public final Lcom/innioasis/ipp/Genres$NamePick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "NamePick"
.end annotation

.field private final a:Lcom/innioasis/music/GenresActivity;

.field private final level:I

.method constructor <init>(Lcom/innioasis/music/GenresActivity;I)V
  .registers 3
  .line 760
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Genres$NamePick;->a:Lcom/innioasis/music/GenresActivity;
    iput p2, p0, Lcom/innioasis/ipp/Genres$NamePick;->level:I
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 5
  .line 763
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 764
    nop
  .line 765
    iget-object p2, p0, Lcom/innioasis/ipp/Genres$NamePick;->a:Lcom/innioasis/music/GenresActivity;
    const v0, 2131820971
    invoke-virtual { p2, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    const/4 v0, 1
    if-eqz p2, :L2
    const/4 p1, 1
    goto :L5
  :L2
  .line 766
    iget-object p2, p0, Lcom/innioasis/ipp/Genres$NamePick;->a:Lcom/innioasis/music/GenresActivity;
    const v1, 2131821028
    invoke-virtual { p2, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L3
    const/4 p1, 2
    goto :L5
  :L3
  .line 767
    iget-object p2, p0, Lcom/innioasis/ipp/Genres$NamePick;->a:Lcom/innioasis/music/GenresActivity;
    const v1, 2131821029
    invoke-virtual { p2, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L4
    const/4 p1, 3
    goto :L5
  :L4
    const/4 p1, 0
  :L5
  .line 768
    iget-object p2, p0, Lcom/innioasis/ipp/Genres$NamePick;->a:Lcom/innioasis/music/GenresActivity;
    iget v1, p0, Lcom/innioasis/ipp/Genres$NamePick;->level:I
    invoke-static { p2, v1, p1 }, Lcom/innioasis/ipp/Genres;->access$100(Lcom/innioasis/music/GenresActivity;II)V
  .line 769
    invoke-static { }, Lcom/innioasis/ipp/Genres;->access$200()Lcom/innioasis/music/util/SubMenuDialog;
    move-result-object p1
    if-eqz p1, :L6
    invoke-static { }, Lcom/innioasis/ipp/Genres;->access$200()Lcom/innioasis/music/util/SubMenuDialog;
    move-result-object p1
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  :L6
  .line 770
    return v0
.end method
