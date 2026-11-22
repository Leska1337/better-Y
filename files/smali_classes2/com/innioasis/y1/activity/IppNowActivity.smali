.class public final Lcom/innioasis/y1/activity/IppNowActivity;
.super Lcom/innioasis/y1/base/BasePlayerActivity;
.source "IppNowActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppNowActivity$Load;,
    Lcom/innioasis/y1/activity/IppNowActivity$Got;
  }
.end annotation

.field private final static BAND_H:I = 45

.field private final static BAND_W:I = 460

.field private final static BLANK:Ljava/lang/String; = "np_blank"

.field private final static CATS:[Ljava/lang/String;

.field private final static COUNTS:[I

.field public final static KEY_STYLE:Ljava/lang/String; = "np_style"

.field private final static LYRICS:I = 4

.field private final static NO_TIME:Ljava/lang/String; = "99:59:59"

.field private final static TILT:I = 3

.field private final static TIP:Ljava/lang/String; = "ss_tip"

.field private final static TIP_OFF:Ljava/lang/String; = "style_hint_off"

.field private final static ZERO:Ljava/lang/String; = "00:00"

.field private band:Landroid/widget/TextView;

.field private cat:I

.field private down:I

.field private path:Ljava/lang/String;

.field private src:Landroid/graphics/Bitmap;

.field private tip:Lcom/innioasis/ipp/TipDialog;

.field private final ui:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 5
  .line 53
    const/4 v0, 5
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "icon_tint"
    aput-object v2, v0, v1
    const/4 v1, 1
    const-string v2, "text_tint"
    aput-object v2, v0, v1
    const-string v1, "box_tint"
    const/4 v2, 2
    aput-object v1, v0, v2
    const-string v1, "cover_tilt"
    const/4 v3, 3
    aput-object v1, v0, v3
    const-string v1, "lyrics_tint"
    const/4 v4, 4
    aput-object v1, v0, v4
    sput-object v0, Lcom/innioasis/y1/activity/IppNowActivity;->CATS:[Ljava/lang/String;
  .line 55
    filled-new-array { v3, v3, v4, v2, v3 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/y1/activity/IppNowActivity;->COUNTS:[I
    return-void
.end method

.method public constructor <init>()V
  .registers 3
  .line 48
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;-><init>()V
  .line 68
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->ui:Landroid/os/Handler;
  .line 72
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->down:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppNowActivity;)Landroid/os/Handler;
  .registers 1
  .line 48
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppNowActivity;)Ljava/lang/String;
  .registers 1
  .line 48
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->path:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$202(Lcom/innioasis/y1/activity/IppNowActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 2
  .line 48
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppNowActivity;)V
  .registers 1
  .line 48
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->showCover()V
    return-void
.end method

.method private bands()V
  .registers 7
  .line 163
    iget v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    const/4 v1, 4
    const/4 v2, 1
    if-ne v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 164
    const v1, 2131361956
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->show(IZ)V
  .line 165
    xor-int/2addr v0, v2
    const v1, 2131361957
    invoke-direct { p0, v1, v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->show(IZ)V
  .line 166
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    if-nez v0, :L2
    return-void
  :L2
  .line 167
    sget-object v0, Lcom/innioasis/y1/activity/IppNowActivity;->CATS:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    aget-object v0, v0, v1
  .line 168
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object v1
  .line 169
    if-eqz v1, :L3
    iget-object v3, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    if-eqz v3, :L3
    iget-object v0, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
  :L3
  .line 170
    iget v3, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppNowActivity;->current(I)I
    move-result v3
  .line 172
    iget v4, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    const/4 v5, 3
    if-ne v4, v5, :L6
    if-ne v3, v2, :L4
    const v1, 2131821018
    goto :L5
  :L4
    const v1, 2131821019
  :L5
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    goto :L8
  :L6
  .line 173
    if-eqz v1, :L7
    iget-object v4, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v4, :L7
    iget-object v4, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v4, v4
    if-ge v3, v4, :L7
    iget-object v1, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v1, v1, v3
    goto :L8
  :L7
  .line 174
    add-int/2addr v3, v2
    invoke-static { v3 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v1
  :L8
  .line 175
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
  .line 176
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    const/16 v2, 460
    const/16 v3, 41
    const/high16 v4, 0x41B00000
    invoke-static { v1, v4, v0, v2, v3 }, Lcom/innioasis/y1/activity/IppNowActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 177
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 178
    return-void
.end method

.method private blanks()[Ljava/lang/String;
  .registers 6
  .line 263
    const/4 v0, 4
    new-array v1, v0, [Ljava/lang/String;
    const-string v2, "Title"
    const/4 v3, 0
    aput-object v2, v1, v3
    const/4 v2, 1
    const-string v4, "Artist"
    aput-object v4, v1, v2
    const/4 v2, 2
    const-string v4, "Album"
    aput-object v4, v1, v2
    const/4 v2, 3
    const-string v4, "Lyrics"
    aput-object v4, v1, v2
  .line 264
    const-string v2, "np_blank"
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object v2
  .line 265
    if-eqz v2, :L1
    iget-object v4, v2, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v4, :L1
  .line 266
    nop
  :L0
    if-ge v3, v0, :L1
    iget-object v4, v2, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v4, v4
    if-ge v3, v4, :L1
    iget-object v4, v2, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v4, v4, v3
    aput-object v4, v1, v3
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 268
    return-object v1
.end method

.method private change(I)V
  .registers 5
  .line 151
    sget-object v0, Lcom/innioasis/y1/activity/IppNowActivity;->COUNTS:[I
    iget v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    aget v0, v0, v1
  .line 152
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->current(I)I
    move-result v1
    add-int/2addr v1, p1
    add-int/2addr v1, v0
    rem-int/2addr v1, v0
  .line 153
    iget p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    const/4 v0, 3
    if-ne p1, v0, :L2
    const/4 p1, 1
    if-ne v1, p1, :L0
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    const-string v1, "cover_tilt"
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
    goto :L3
  :L2
  .line 154
    sget-object v2, Lcom/innioasis/y1/activity/IppNowActivity;->CATS:[Ljava/lang/String;
    aget-object p1, v2, p1
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L3
  .line 155
    invoke-static { p0 }, Lcom/innioasis/ipp/Tint;->player(Landroid/app/Activity;)V
  .line 156
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 157
    iget p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    if-ne p1, v0, :L4
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->showCover()V
  :L4
  .line 158
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->bands()V
  .line 159
    return-void
.end method

.method private current(I)I
  .registers 4
  .line 145
    const/4 v0, 3
    if-ne p1, v0, :L0
    const-string p1, "cover_tilt"
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p1
    return p1
  :L0
  .line 146
    sget-object v0, Lcom/innioasis/y1/activity/IppNowActivity;->CATS:[Ljava/lang/String;
    aget-object v0, v0, p1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 147
    if-ltz v0, :L1
    sget-object v1, Lcom/innioasis/y1/activity/IppNowActivity;->COUNTS:[I
    aget p1, v1, p1
    if-lt v0, p1, :L2
  :L1
    const/4 v0, 0
  :L2
    return v0
.end method

.method private static fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .registers 9
  .line 187
    new-instance v0, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 188
    nop
  :L0
  .line 189
    const/high16 v1, 0x41000000
    cmpl-float v1, p1, v1
    if-lez v1, :L2
  .line 190
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 191
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v1
  .line 192
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
  .line 189
    const/high16 v1, 0x3F800000
    sub-float/2addr p1, v1
    goto :L0
  :L2
  .line 194
    const/4 p2, 0
    invoke-virtual { p0, p2, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 195
    return-void
.end method

.method private lyrics(Ljava/lang/String;)V
  .registers 5
  .line 273
    const v0, 2131362183
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 274
    instance-of v1, v0, Lme/wcy/lrcview/LrcView;
    if-nez v1, :L0
    return-void
  :L0
  .line 275
    check-cast v0, Lme/wcy/lrcview/LrcView;
  .line 276
    invoke-virtual { v0, p1 }, Lme/wcy/lrcview/LrcView;->setLabel(Ljava/lang/String;)V
  .line 277
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "[00:00.00]"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\n[99:00.00]"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\n[99:01.00]"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Lme/wcy/lrcview/LrcView;->loadLrc(Ljava/lang/String;)V
  .line 278
    return-void
.end method

.method private setPath(Ljava/lang/String;)V
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 283
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->path:Ljava/lang/String;
    if-nez p1, :L0
    if-eqz v0, :L2
    goto :L1
  :L0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
  :L1
  .line 284
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->path:Ljava/lang/String;
  .line 285
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
  :L2
  .line 287
    if-eqz p1, :L7
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
    if-nez v0, :L7
  :L3
  .line 289
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
  :L4
  .line 291
    goto :L6
  :L5
  .line 290
    move-exception v0
  :L6
  .line 292
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
    if-nez v0, :L7
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L7
  .line 293
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppNowActivity$Load;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/y1/activity/IppNowActivity$Load;-><init>(Lcom/innioasis/y1/activity/IppNowActivity;Ljava/lang/String;)V
    const-string p1, "ipp-now-cover"
    invoke-direct { v0, v1, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L7
  .line 296
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->showCover()V
  .line 297
    return-void
.end method

.method private show(IZ)V
  .registers 3
  .line 181
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 182
    if-eqz p1, :L2
    if-eqz p2, :L0
    const/4 p2, 0
    goto :L1
  :L0
    const/16 p2, 8
  :L1
    invoke-virtual { p1, p2 }, Landroid/view/View;->setVisibility(I)V
  :L2
  .line 183
    return-void
.end method

.method private showCover()V
  .registers 2
  .line 300
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Cover;->preview(Lcom/innioasis/y1/base/BasePlayerActivity;Landroid/graphics/Bitmap;)V
  .line 301
    return-void
.end method

.method private time(Ljava/lang/String;)V
  .registers 4
  .line 251
    const v0, 2131362494
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v0
  .line 252
    const v1, 2131362493
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v1
  .line 253
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 254
    if-eqz v1, :L1
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 255
    return-void
.end method

.method private tv(I)Landroid/widget/TextView;
  .registers 3
  .line 258
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 259
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L0
    check-cast p1, Landroid/widget/TextView;
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return-object p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
  .registers 7
  .line 120
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 121
    invoke-static { p1 }, Lcom/innioasis/ipp/Force;->key(Landroid/view/KeyEvent;)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 122
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v1
  .line 123
    sget-object v2, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 124
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v3
    const/4 v4, -1
    if-nez v3, :L9
  .line 125
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->key(Landroid/view/KeyEvent;)V
  .line 126
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v3
    if-nez v3, :L2
    iput v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->down:I
  :L2
  .line 127
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v3
    if-eq v1, v3, :L6
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v3
    if-ne v1, v3, :L3
    goto :L6
  :L3
  .line 129
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
  .line 130
    iget p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v2
    if-ne v1, v2, :L5
    const/4 v4, 1
  :L5
    add-int/2addr p1, v4
    sget-object v1, Lcom/innioasis/y1/activity/IppNowActivity;->CATS:[Ljava/lang/String;
    array-length v2, v1
    add-int/2addr p1, v2
    array-length v1, v1
    rem-int/2addr p1, v1
    iput p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->cat:I
  .line 131
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->bands()V
    goto :L8
  :L6
  .line 128
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result p1
    if-ne v1, p1, :L7
    const/4 v4, 1
  :L7
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppNowActivity;->change(I)V
  :L8
  .line 133
    return v0
  :L9
  .line 135
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result p1
    if-ne p1, v0, :L10
    iget p1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->down:I
    if-ne v1, p1, :L10
  .line 136
    iput v4, p0, Lcom/innioasis/y1/activity/IppNowActivity;->down:I
  .line 137
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result p1
    if-ne v1, p1, :L10
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->finish()V
  :L10
  .line 139
    return v0
.end method

.method public initView()V
  .registers 6
  .line 79
    invoke-super { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->initView()V
  .line 80
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
  .line 81
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 82
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 83
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v3, 1
    invoke-virtual { v0, v2, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 84
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v0, v3 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 85
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    const/high16 v2, 0xB3000000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setBackgroundColor(I)V
  .line 86
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->band:Landroid/widget/TextView;
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v3, 45
    const/16 v4, 48
    invoke-direct { v2, v1, v3, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppNowActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 87
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->refreshUI()V
  .line 88
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->bands()V
  .line 89
    const-string v0, "ss_tip"
    const-string v1, "style_hint_off"
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/TipDialog;->show(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/innioasis/ipp/TipDialog;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->tip:Lcom/innioasis/ipp/TipDialog;
  .line 90
    return-void
.end method

.method public longPressEnter()V
  .registers 1
  .line 112
    return-void
.end method

.method public longPressMenu()V
  .registers 1
  .line 116
    return-void
.end method

.method protected onDestroy()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 100
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->ui:Landroid/os/Handler;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
  :L0
  .line 102
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
  :L1
  .line 104
    goto :L3
  :L2
  .line 103
    move-exception v0
  :L3
  .line 105
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->tip:Lcom/innioasis/ipp/TipDialog;
  .line 106
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity;->src:Landroid/graphics/Bitmap;
  .line 107
    invoke-super { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->onDestroy()V
  .line 108
    return-void
.end method

.method protected onStop()V
  .registers 1
  .line 94
    invoke-super { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->onStop()V
  .line 95
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->finish()V
  .line 96
    return-void
.end method

.method public refreshUI()V
  .catchall { :L4 .. :L6 } :L8
  .catchall { :L16 .. :L19 } :L20
  .registers 14
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 203
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppNowActivity;->blanks()[Ljava/lang/String;
    move-result-object v0
  .line 204
    const/4 v1, 3
    aget-object v1, v0, v1
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->lyrics(Ljava/lang/String;)V
  .line 205
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 206
    const/4 v2, 0
    if-nez v1, :L0
    move-object v3, v2
    goto :L1
  :L0
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v3
  :L1
  .line 207
    const v4, 2131362486
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v4
  .line 208
    const v5, 2131362501
    invoke-direct { p0, v5 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v5
  .line 209
    const v6, 2131362487
    invoke-direct { p0, v6 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v6
  .line 210
    const v7, 2131362484
    invoke-direct { p0, v7 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v7
  .line 211
    const v8, 2131362490
    invoke-direct { p0, v8 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v8
  .line 212
    const-string v9, "00:00"
    const/4 v10, 1
    const/4 v11, 0
    if-nez v3, :L4
  .line 213
    aget-object v1, v0, v11
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 214
    aget-object v1, v0, v11
    invoke-static { v5, v1 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 215
    aget-object v1, v0, v10
    invoke-static { v6, v1, v11 }, Lcom/innioasis/ipp/Ipp;->playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .line 216
    const/4 v1, 2
    aget-object v0, v0, v1
    invoke-static { v7, v0, v10 }, Lcom/innioasis/ipp/Ipp;->playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .line 217
    if-eqz v8, :L2
    const-string v0, "0/0"
    invoke-virtual { v8, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 218
    invoke-direct { p0, v9 }, Lcom/innioasis/y1/activity/IppNowActivity;->time(Ljava/lang/String;)V
  .line 219
    const v0, 2131362288
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ProgressBar;
  .line 220
    if-eqz v0, :L3
    invoke-virtual { v0, v11 }, Landroid/widget/ProgressBar;->setProgress(I)V
  :L3
  .line 221
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppNowActivity;->setPath(Ljava/lang/String;)V
  .line 222
    return-void
  :L4
  .line 225
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L5
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L7
  :L5
  .line 226
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    new-instance v2, Ljava/io/File;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v12
    invoke-direct { v2, v12 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L6
    move-object v3, v0
  :L7
  .line 229
    goto :L9
  :L8
  .line 228
    move-exception v0
  :L9
  .line 230
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingAudiobook()Lcom/innioasis/y1/database/Song;
    move-result-object v0
    if-ne v3, v0, :L10
    const/4 v0, 1
    goto :L11
  :L10
    const/4 v0, 0
  :L11
  .line 231
    if-eqz v0, :L12
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v12
    invoke-static { p0, v2, v12 }, Lcom/innioasis/ipp/Audio;->title(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    goto :L13
  :L12
  .line 232
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v12
    invoke-static { p0, v2, v12 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Feat;->title(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
  :L13
  .line 233
    invoke-static { v4, v2 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 234
    invoke-static { v5, v2 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 235
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 236
    if-eqz v0, :L14
    goto :L15
  :L14
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Feat;->artist(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
  :L15
    invoke-static { v6, v2, v11 }, Lcom/innioasis/ipp/Ipp;->playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .line 237
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static { v7, v2, v10 }, Lcom/innioasis/ipp/Ipp;->playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .line 239
    if-eqz v0, :L17
  :L16
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v0
    goto :L18
  :L17
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v0
  :L18
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 240
    if-eqz v8, :L19
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->trackNo(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, "/"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v8, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L19
  .line 242
    goto :L21
  :L20
  .line 241
    move-exception v0
  :L21
  .line 243
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v0
    if-eqz v0, :L22
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/y1/utils/TimeUtils;->time(J)Ljava/lang/String;
    move-result-object v9
  :L22
  .line 244
    const v0, 2131362493
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->tv(I)Landroid/widget/TextView;
    move-result-object v0
  .line 245
    if-eqz v0, :L23
    const-string v1, "99:59:59"
    invoke-virtual { v1, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L23
    invoke-virtual { v0, v9 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L23
  .line 246
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->setPath(Ljava/lang/String;)V
  .line 247
    return-void
.end method
