.class public final Lcom/innioasis/ipp/Ebook;
.super Ljava/lang/Object;
.source "Ebook.java"

.field public final static EXTRA:Ljava/lang/String; = "ipp_library"

.field private final static LIBRARY_ROW:I = 2

.field private static fixed:I

.method static constructor <clinit>()V
  .registers 1
  .line 160
    const/4 v0, 2
    sput v0, Lcom/innioasis/ipp/Ebook;->fixed:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 26
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static beforeShow(Landroid/app/Activity;I)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 138
    if-nez p0, :L0
    return-void
  :L0
  .line 139
    sput p1, Lcom/innioasis/ipp/Ebook;->fixed:I
  .line 140
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
  .line 141
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 142
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ebook;->minMark(Landroid/app/Activity;I)I
    move-result p1
  .line 143
    if-ge v1, p1, :L1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    move v1, p1
  :L1
  .line 144
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L2
    return-void
  :L2
  .line 145
    const p1, 2131362552
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 146
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez p1, :L3
    return-void
  :L3
  .line 147
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 148
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->adapter(Landroidx/recyclerview/widget/RecyclerView;)Landroid/widget/ListAdapter;
    move-result-object p1
  .line 149
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L4
    return-void
  :L4
  .line 151
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L5
  .line 152
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-le v0, v1, :L6
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-lez v0, :L6
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
    goto :L5
  :L6
  .line 153
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-ge v0, v1, :L7
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    add-int/lit8 v2, v2, -1
    if-ge v0, v2, :L7
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L6
  :L7
  .line 154
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L8
  .line 156
    goto :L10
  :L9
  .line 155
    move-exception p0
  :L10
  .line 157
    return-void
.end method

.method public static belowFirst(Landroid/app/Activity;III)I
  .registers 5
  .line 92
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Ebook;->maxMark(Landroid/app/Activity;II)I
    move-result p1
  :L0
    return p1
.end method

.method private static books(Landroid/app/Activity;)I
  .registers 3
  .line 126
    const v0, 2131362311
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 127
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 128
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 129
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  :L2
    return v1
.end method

.method public static confirm(Landroid/app/Activity;I)Z
  .catchall { :L1 .. :L4 } :L6
  .registers 5
  .line 111
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 112
    const/4 v1, 1
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v2
    if-nez v2, :L3
  .line 113
    const/4 v2, 2
    if-eq p1, v2, :L2
    return v0
  :L2
  .line 114
    new-instance p1, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    invoke-direct { p1, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 115
    const-string v0, "ipp_library"
    invoke-virtual { p1, v0, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 116
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 117
    return v1
  :L3
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->books(Landroid/app/Activity;)I
    move-result p0
  :L4
    if-nez p0, :L5
    const/4 v0, 1
  :L5
    return v0
  :L6
  .line 120
    move-exception p0
  .line 121
    return v1
.end method

.method static firstMark()I
  .registers 1
  .line 163
    sget v0, Lcom/innioasis/ipp/Ebook;->fixed:I
    return v0
.end method

.method public static hidden(Ljava/io/File;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 218
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 219
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
  .line 220
    if-eqz v1, :L2
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L1
    if-eqz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 221
    move-exception p0
  .line 222
    return v0
.end method

.method public static library(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 34
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_library"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 35
    move-exception p0
  .line 36
    return v0
  :L3
  .line 34
    return v0
.end method

.method static librarySub(Landroid/view/View;)V
  .registers 6
  .line 177
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    const v1, 2131362301
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  :L1
  .line 178
    if-nez p0, :L2
    goto :L3
  :L2
    const v0, 2131362455
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L3
  .line 179
    instance-of p0, v1, Landroid/widget/TextView;
    if-eqz p0, :L8
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    instance-of p0, p0, Landroid/view/ViewGroup;
    if-nez p0, :L4
    goto :L8
  :L4
  .line 180
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 181
    const/4 v2, 0
  :L5
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L7
  .line 182
    invoke-virtual { p0, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 183
    instance-of v4, v3, Landroid/widget/TextView;
    if-eqz v4, :L6
    if-eq v3, v1, :L6
    if-eq v3, v0, :L6
    move-object v4, v1
    check-cast v4, Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  :L6
  .line 181
    add-int/lit8 v2, v2, 1
    goto :L5
  :L7
  .line 185
    return-void
  :L8
  .line 179
    return-void
.end method

.method public static librarySub(Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;)V
  .registers 5
  .line 200
    if-eqz p0, :L5
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;->progress:Landroid/widget/TextView;
    if-nez v0, :L0
    goto :L5
  :L0
  .line 201
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;->progress:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 202
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L1
    return-void
  :L1
  .line 203
    check-cast v0, Landroid/view/ViewGroup;
  .line 204
    const/4 v1, 0
  :L2
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L4
  .line 205
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 206
    instance-of v3, v2, Landroid/widget/TextView;
    if-eqz v3, :L3
    iget-object v3, p0, Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;->progress:Landroid/widget/TextView;
    if-eq v2, v3, :L3
    iget-object v3, p0, Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;->time:Landroid/widget/TextView;
    if-eq v2, v3, :L3
  .line 207
    iget-object v3, p0, Lcom/innioasis/y1/databinding/ItemBookLibraryBinding;->progress:Landroid/widget/TextView;
    check-cast v2, Landroid/widget/TextView;
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  :L3
  .line 204
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 210
    return-void
  :L5
  .line 200
    return-void
.end method

.method public static maxMark(Landroid/app/Activity;II)I
  .registers 3
  .line 85
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 2
    return p0
  :L0
  .line 86
    add-int/lit8 p1, p1, -1
    add-int/2addr p1, p2
  .line 87
    if-ge p1, p2, :L1
    goto :L2
  :L1
    move p2, p1
  :L2
    return p2
.end method

.method public static menuFloor(Landroid/app/Activity;I)I
  .registers 2
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const p1, 2147483647
  :L1
    return p1
.end method

.method public static minMark(Landroid/app/Activity;I)I
  .registers 2
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method public static pastLast(Landroid/app/Activity;I)I
  .registers 3
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ebook;->minMark(Landroid/app/Activity;I)I
    move-result p0
    goto :L1
  :L0
    const/4 p0, -1
  :L1
    return p0
.end method

.method public static searchSub(Lcom/innioasis/y1/databinding/ItemBookSearchBinding;)V
  .registers 3
  .line 189
    if-nez p0, :L0
    return-void
  :L0
  .line 190
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemBookSearchBinding;->name:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ItemBookSearchBinding;->size:Landroid/widget/TextView;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 191
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemBookSearchBinding;->name:Landroid/widget/TextView;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemBookSearchBinding;->time:Landroid/widget/TextView;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 192
    return-void
.end method

.method public static setup(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 9
  .line 43
    if-nez p0, :L0
    return-void
  :L0
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v0
  .line 45
    const v1, 2131361973
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 46
    const v2, 2131362179
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 47
    const v3, 2131362552
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
  .line 48
    const v4, 2131361901
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
  .line 49
    const v5, 2131362553
    invoke-virtual { p0, v5 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
  .line 50
    const v6, 2131362311
    invoke-virtual { p0, v6 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v6
  .line 53
    const/4 v7, 0
    invoke-static { v1, v7 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 54
    invoke-static { v2, v7 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 55
    if-nez v0, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 56
    invoke-static { v6, v0 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 58
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 59
    invoke-static { v5, v7 }, Lcom/innioasis/ipp/Ebook;->show(Landroid/view/View;Z)V
  .line 61
    const v1, 2131820617
    if-eqz v0, :L3
  .line 62
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/base/BaseActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 63
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v0, 2
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    goto :L4
  :L3
  .line 64
    instance-of v0, v3, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L4
  .line 65
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 66
    const v2, 2131820611
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 67
    const v2, 2131820618
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 68
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 69
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;
    new-instance v1, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-direct { v1, p0, v0 }, Lcom/innioasis/music/adapter/MainAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  :L4
  .line 72
    goto :L6
  :L5
  .line 71
    move-exception p0
  :L6
  .line 73
    return-void
.end method

.method private static show(Landroid/view/View;Z)V
  .registers 2
  .line 76
    if-eqz p0, :L2
    if-eqz p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    const/16 p1, 8
  :L1
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L2
  .line 77
    return-void
.end method

.method public static step(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 171
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v0
    if-eqz v0, :L1
    if-gez p1, :L0
    goto :L1
  :L0
  .line 172
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 173
    return-void
  :L1
  .line 171
    return-void
.end method
