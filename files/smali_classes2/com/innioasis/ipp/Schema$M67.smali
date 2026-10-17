.class final Lcom/innioasis/ipp/Schema$M67;
.super Landroidx/room/migration/Migration;
.source "Schema.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Schema;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "M67"
.end annotation

.method constructor <init>()V
  .registers 3
  .line 30
    const/4 v0, 6
    const/4 v1, 7
    invoke-direct { p0, v0, v1 }, Landroidx/room/migration/Migration;-><init>(II)V
    return-void
.end method

.method public migrate(Landroidx/sqlite/db/SupportSQLiteDatabase;)V
  .registers 3
  .line 34
    const-string v0, "ALTER TABLE `Song` ADD COLUMN `albumArtist` TEXT"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 35
    const-string v0, "ALTER TABLE `Song` ADD COLUMN `track` TEXT"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 36
    const-string v0, "ALTER TABLE `Song` ADD COLUMN `disc` TEXT"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 37
    const-string v0, "ALTER TABLE `Song` ADD COLUMN `year` TEXT"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 38
    const-string v0, "ALTER TABLE `Song` ADD COLUMN `lyrics` INTEGER NOT NULL DEFAULT 0"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 39
    return-void
.end method
