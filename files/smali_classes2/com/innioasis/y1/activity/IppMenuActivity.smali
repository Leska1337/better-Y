.class public final Lcom/innioasis/y1/activity/IppMenuActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppMenuActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppMenuActivity$Rows;,
    Lcom/innioasis/y1/activity/IppMenuActivity$Holder;
  }
.end annotation

.field private final static BAND_H:I = 45

.field private final static BAND_W:I = 460

.field private final static CATS:[Ljava/lang/String;

.field public final static KEY_STYLE:Ljava/lang/String; = "menu_look"

.field private final static MAIN_ROWS:[I

.field private final static MARGINS:I = 1

.field private final static SET_ROWS:[I

.field private final static STYLE:I = 0

.field private final static STYLES:[I

.field private final static TEXT:I = 2

.field private final static TIP:Ljava/lang/String; = "ss_tip"

.field private band:Landroid/widget/TextView;

.field private cat:I

.field private down:I

.field private mainList:Landroidx/recyclerview/widget/RecyclerView;

.field private mainPage:Landroid/view/View;

.field private mainPic:Landroid/widget/ImageView;

.field private panel:Landroid/view/View;

.field private setBack:Landroid/widget/ImageView;

.field private setList:Landroidx/recyclerview/widget/RecyclerView;

.field private setPage:Landroid/view/View;

.field private tip:Lcom/innioasis/ipp/TipDialog;

.method static constructor <clinit>()V
  .registers 5
  .line 49
    const/4 v0, 3
    new-array v0, v0, [Ljava/lang/String;
    const-string v1, "menu_style"
    const/4 v2, 0
    aput-object v1, v0, v2
    const-string v1, "fixed_menu_pad"
    const/4 v3, 1
    aput-object v1, v0, v3
    const-string v1, "preview_text"
    const/4 v4, 2
    aput-object v1, v0, v4
    sput-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->CATS:[Ljava/lang/String;
  .line 54
    filled-new-array { v2, v4, v3 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->STYLES:[I
  .line 59
    const/16 v0, 9
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->MAIN_ROWS:[I
  .line 62
    const/4 v0, 7
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->SET_ROWS:[I
    return-void
  :L0
  .array-data 4
      2131820769
      2131820768
      2131820773
      2131820762
      2131820764
      2131820770
      2131820767
      2131820763
      2131820772
  .end array-data
  :L1
  .array-data 4
      2131821015
      2131820925
      2131820928
      2131820959
      2131820908
      2131820930
      2131820931
  .end array-data
.end method

.method public constructor <init>()V
  .registers 2
  .line 44
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 69
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->down:I
    return-void
.end method

.method private bands()V
  .registers 6
  .line 225
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 226
    sget-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->CATS:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    aget-object v0, v0, v1
  .line 227
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object v1
  .line 228
    if-eqz v1, :L1
    iget-object v2, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    if-eqz v2, :L1
    iget-object v0, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
  :L1
  .line 229
    iget v2, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppMenuActivity;->shown(I)I
    move-result v2
  .line 230
    if-eqz v1, :L2
    iget-object v3, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v3, :L2
    iget-object v3, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v3, v3
    if-ge v2, v3, :L2
    iget-object v1, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v1, v1, v2
    goto :L3
  :L2
  .line 231
    add-int/lit8 v2, v2, 1
    invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v1
  :L3
  .line 232
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "\u2039  "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ": "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "  \u203a"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 233
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    const/16 v2, 460
    const/16 v3, 41
    const/high16 v4, 0x41B00000
    invoke-static { v1, v4, v0, v2, v3 }, Lcom/innioasis/y1/activity/IppMenuActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 234
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 235
    return-void
.end method

.method private change(I)V
  .registers 5
  .line 213
    iget v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->shown(I)I
    move-result v0
  .line 214
    iget v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    const/4 v2, 1
    if-ne v1, v2, :L2
  .line 215
    if-nez v0, :L0
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    const-string p1, "fixed_menu_pad"
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
    goto :L4
  :L2
  .line 217
    add-int/2addr v0, p1
    add-int/lit8 v0, v0, 3
    rem-int/lit8 v0, v0, 3
  .line 218
    sget-object p1, Lcom/innioasis/y1/activity/IppMenuActivity;->CATS:[Ljava/lang/String;
    aget-object p1, p1, v1
    if-nez v1, :L3
    sget-object v1, Lcom/innioasis/y1/activity/IppMenuActivity;->STYLES:[I
    aget v0, v1, v0
  :L3
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L4
  .line 220
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->restyle()V
  .line 221
    return-void
.end method

.method private static fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .registers 9
  .line 239
    new-instance v0, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 240
    nop
  :L0
  .line 241
    const/high16 v1, 0x41000000
    cmpl-float v1, p1, v1
    if-lez v1, :L2
  .line 242
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 243
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v1
  .line 244
    invoke-virtual { v0, p2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    int-to-float v3, p3
    cmpg-float v2, v2, v3
    if-gtz v2, :L1
    iget v2, v1, Landroid/graphics/Paint$FontMetrics;->descent:F
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F
    sub-float/2addr v2, v1
    int-to-float v1, p4
    cmpg-float v1, v2, v1
    if-gtz v1, :L1
    goto :L2
  :L1
  .line 241
    const/high16 v1, 0x3F800000
    sub-float/2addr p1, v1
    goto :L0
  :L2
  .line 246
    const/4 p2, 0
    invoke-virtual { p0, p2, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 247
    return-void
.end method

.method private static page()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
  .registers 2
  .line 127
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    const/4 v1, -1
    invoke-direct { v0, v1, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 128
    const/4 v1, 0
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 129
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 130
    return-object v0
.end method

.method private shown(I)I
  .registers 6
  .line 201
    const/4 v0, 1
    if-ne p1, v0, :L0
    const-string p1, "fixed_menu_pad"
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
  :L0
  .line 202
    sget-object v0, Lcom/innioasis/y1/activity/IppMenuActivity;->CATS:[Ljava/lang/String;
    aget-object v0, v0, p1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 203
    const/4 v1, 0
    if-nez p1, :L4
  .line 204
    const/4 p1, 0
  :L1
    sget-object v2, Lcom/innioasis/y1/activity/IppMenuActivity;->STYLES:[I
    array-length v3, v2
    if-ge p1, v3, :L3
  .line 205
    aget v2, v2, p1
    if-ne v2, v0, :L2
    return p1
  :L2
  .line 204
    add-int/lit8 p1, p1, 1
    goto :L1
  :L3
  .line 207
    return v1
  :L4
  .line 209
    if-ltz v0, :L5
    const/4 p1, 2
    if-le v0, p1, :L6
  :L5
    const/4 v0, 0
  :L6
    return v0
.end method

.method public antiClockwise()V
  .registers 1
  .line 306
    return-void
.end method

.method public clockwise()V
  .registers 1
  .line 310
    return-void
.end method

.method public confirm()V
  .registers 1
  .line 314
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 2
  .line 318
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
  .registers 7
  .line 175
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 176
    invoke-static { p1 }, Lcom/innioasis/ipp/Force;->key(Landroid/view/KeyEvent;)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 177
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v1
  .line 178
    sget-object v2, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 179
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v3
    const/4 v4, -1
    if-nez v3, :L9
  .line 180
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->key(Landroid/view/KeyEvent;)V
  .line 181
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v3
    if-nez v3, :L2
    iput v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->down:I
  :L2
  .line 182
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v3
    if-eq v1, v3, :L6
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v3
    if-ne v1, v3, :L3
    goto :L6
  :L3
  .line 184
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p1
    if-nez p1, :L8
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result p1
    if-eq v1, p1, :L4
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result p1
    if-ne v1, p1, :L8
  :L4
  .line 185
    iget p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v2
    if-ne v1, v2, :L5
    const/4 v4, 1
  :L5
    add-int/2addr p1, v4
    sget-object v1, Lcom/innioasis/y1/activity/IppMenuActivity;->CATS:[Ljava/lang/String;
    array-length v2, v1
    add-int/2addr p1, v2
    array-length v1, v1
    rem-int/2addr p1, v1
    iput p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
  .line 186
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->restyle()V
    goto :L8
  :L6
  .line 183
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result p1
    if-ne v1, p1, :L7
    const/4 v4, 1
  :L7
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppMenuActivity;->change(I)V
  :L8
  .line 188
    return v0
  :L9
  .line 190
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result p1
    if-ne p1, v0, :L10
    iget p1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->down:I
    if-ne v1, p1, :L10
  .line 191
    iput v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->down:I
  .line 192
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result p1
    if-ne v1, p1, :L10
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->finish()V
  :L10
  .line 194
    return v0
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 44
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 80
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 10
  .line 85
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 86
    const v0, 2131362153
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 87
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
  .line 88
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v0
    const/4 v2, 1
    add-int/2addr v0, v2
  .line 89
    invoke-static { p0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v3
  .line 91
    const v4, 2131558452
    const/4 v5, 0
    invoke-virtual { v3, v4, v1, v5 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object v4
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPage:Landroid/view/View;
  .line 92
    invoke-static { }, Lcom/innioasis/y1/activity/IppMenuActivity;->page()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object v6
    invoke-virtual { v1, v4, v0, v6 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 93
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPage:Landroid/view/View;
    const v6, 2131362308
    invoke-virtual { v4, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainList:Landroidx/recyclerview/widget/RecyclerView;
  .line 94
    new-instance v6, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { v6, p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    invoke-virtual { v4, v6 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 95
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainList:Landroidx/recyclerview/widget/RecyclerView;
    new-instance v6, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;
    sget-object v7, Lcom/innioasis/y1/activity/IppMenuActivity;->MAIN_ROWS:[I
    invoke-direct { v6, p0, v7, v2 }, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;-><init>(Lcom/innioasis/y1/activity/IppMenuActivity;[IZ)V
    invoke-virtual { v4, v6 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 96
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPage:Landroid/view/View;
    const v6, 2131362147
    invoke-virtual { v4, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/ImageView;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPic:Landroid/widget/ImageView;
  .line 97
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPic:Landroid/widget/ImageView;
    const v7, 2131231079
    invoke-virtual { v4, v6, v7 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 98
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPage:Landroid/view/View;
    const v6, 2131361890
    invoke-virtual { v4, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/ImageView;
  .line 99
    const/4 v7, 0
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 100
    sget-object v8, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v8, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->setDeskMask(Landroid/widget/ImageView;)V
  .line 102
    const v4, 2131558463
    invoke-virtual { v3, v4, v1, v5 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
  .line 103
    add-int/2addr v0, v2
    invoke-static { }, Lcom/innioasis/y1/activity/IppMenuActivity;->page()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object v4
    invoke-virtual { v1, v3, v0, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 104
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v1, 2131362310
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setList:Landroidx/recyclerview/widget/RecyclerView;
  .line 105
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { v1, p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 106
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setList:Landroidx/recyclerview/widget/RecyclerView;
    new-instance v1, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;
    sget-object v3, Lcom/innioasis/y1/activity/IppMenuActivity;->SET_ROWS:[I
    invoke-direct { v1, p0, v3, v5 }, Lcom/innioasis/y1/activity/IppMenuActivity$Rows;-><init>(Lcom/innioasis/y1/activity/IppMenuActivity;[IZ)V
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 107
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v1, 2131362326
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->panel:Landroid/view/View;
  .line 108
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/TextView;
    const v1, 2131821015
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(I)V
  .line 109
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v1, 2131362097
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/TextView;
    const v1, 2131821014
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(I)V
  .line 110
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v1, 2131362323
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->betterY(Landroid/widget/ImageView;)V
  .line 111
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    invoke-virtual { v0, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setBack:Landroid/widget/ImageView;
  .line 112
    invoke-virtual { v0, v7 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 113
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setBack:Landroid/widget/ImageView;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  .line 115
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
  .line 116
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 117
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 118
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v3, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 119
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 120
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    const/high16 v2, 0xB3000000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setBackgroundColor(I)V
  .line 121
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->band:Landroid/widget/TextView;
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v3, 45
    const/16 v4, 48
    invoke-direct { v2, v1, v3, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppMenuActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 122
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->restyle()V
  .line 123
    const-string v0, "ss_tip"
    const-string v1, "style_hint_off"
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/TipDialog;->show(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/innioasis/ipp/TipDialog;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->tip:Lcom/innioasis/ipp/TipDialog;
  .line 124
    return-void
.end method

.method public longConfirm()V
  .registers 1
  .line 322
    return-void
.end method

.method protected onDestroy()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 164
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
  :L1
  .line 166
    goto :L3
  :L2
  .line 165
    move-exception v0
  :L3
  .line 167
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->tip:Lcom/innioasis/ipp/TipDialog;
  .line 168
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainList:Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L4
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L4
  .line 169
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setList:Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L5
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L5
  .line 170
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 171
    return-void
.end method

.method protected onStop()V
  .registers 1
  .line 157
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onStop()V
  .line 158
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->finish()V
  .line 159
    return-void
.end method

.method public quit()V
  .registers 1
  .line 326
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->finish()V
  .line 327
    return-void
.end method

.method public restyle()V
  .registers 6
  .line 135
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPage:Landroid/view/View;
    if-nez v0, :L0
    return-void
  :L0
  .line 136
    iget v1, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->cat:I
    const/4 v2, 2
    const/4 v3, 0
    if-ne v1, v2, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 137
    const/16 v2, 8
    if-eqz v1, :L3
    const/16 v4, 8
    goto :L4
  :L3
    const/4 v4, 0
  :L4
    invoke-virtual { v0, v4 }, Landroid/view/View;->setVisibility(I)V
  .line 138
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    if-eqz v1, :L5
    const/4 v2, 0
  :L5
    invoke-virtual { v0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 139
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainList:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->mainPic:Landroid/widget/ImageView;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/MenuStyle;->page(Landroid/view/View;Landroid/view/View;)Z
  .line 140
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setList:Landroidx/recyclerview/widget/RecyclerView;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->panel:Landroid/view/View;
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/MenuStyle;->page(Landroid/view/View;Landroid/view/View;)Z
  .line 141
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setBack:Landroid/widget/ImageView;
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v2
    if-eqz v2, :L6
    const/4 v3, 4
  :L6
    invoke-virtual { v0, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 142
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->fg(Landroid/content/Context;)I
    move-result v0
  .line 143
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v3, 2131362326
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/TextView;
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 144
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppMenuActivity;->setPage:Landroid/view/View;
    const v3, 2131362097
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/TextView;
    invoke-virtual { v2, v0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 145
    if-eqz v1, :L7
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L8
  :L7
  .line 146
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getDesktopBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  :L8
  .line 147
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
  .line 148
    if-eqz v0, :L9
    const v2, 2131361890
    invoke-virtual { v1, v2 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v3
    if-eq v3, v0, :L9
  .line 149
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-direct { v3, v4, v0 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v3 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 150
    invoke-virtual { v1, v2, v0 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L9
  .line 152
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppMenuActivity;->bands()V
  .line 153
    return-void
.end method
