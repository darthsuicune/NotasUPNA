.class public abstract Lcom/sigma/mobile/core/BaseActivity;
.super Landroid/app/Activity;
.source "BaseActivity.java"


# static fields
.field protected static final BASE_PREFERENCES_FILENAME:Ljava/lang/String; = "com.sigma.mobile.core.BasePreferences"

.field static final KEY_CACHE:Ljava/lang/String; = "cache"

.field protected static final LANGUAGE_PREF_KEY:Ljava/lang/String; = "sigdroid_app_lang"

.field protected static final VERSIONCODE_PREF_KEY:Ljava/lang/String; = "app_version_code"


# instance fields
.field protected datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/sigma/mobile/core/BaseActivity;->updateLanguage()V

    .line 61
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 62
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    if-eqz p1, :cond_0

    .line 34
    const-string v0, "cache"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sigma/mobile/calificaciones/util/Cache;

    invoke-static {v0}, Lcom/sigma/mobile/calificaciones/util/Cache;->remplazarCache(Lcom/sigma/mobile/calificaciones/util/Cache;)V

    .line 36
    :cond_0
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/util/Cache;->getDatosCalificaciones()Lcom/sigma/restful/msg/RespuestaCalificaciones;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/core/BaseActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 38
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 42
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 43
    const-string v0, "cache"

    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 44
    return-void
.end method

.method public onStart()V
    .locals 4

    .prologue
    .line 50
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 52
    const-string v1, "sigdroid_app_lang"

    const v2, 0x7f06000b

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/core/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/sigma/mobile/core/BaseActivity;->retrieveSharedPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, langTokens:[Ljava/lang/String;
    new-instance v1, Ljava/util/Locale;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/core/BaseActivity;->setLanguage(Ljava/util/Locale;)Z

    .line 54
    return-void
.end method

.method public final retrieveSharedPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"
    .parameter "defValue"

    .prologue
    .line 115
    const-string v0, "com.sigma.mobile.core.BasePreferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sigma/mobile/core/BaseActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final setLanguage(Ljava/util/Locale;)Z
    .locals 3
    .parameter "locale"

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/sigma/mobile/core/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 75
    .local v0, config:Landroid/content/res/Configuration;
    iget-object v1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v1, p1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 78
    new-instance v0, Landroid/content/res/Configuration;

    .end local v0           #config:Landroid/content/res/Configuration;
    invoke-direct {v0}, Landroid/content/res/Configuration;-><init>()V

    .line 79
    .restart local v0       #config:Landroid/content/res/Configuration;
    iput-object p1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 80
    invoke-static {p1}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 82
    invoke-virtual {p0}, Lcom/sigma/mobile/core/BaseActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/sigma/mobile/core/BaseActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 83
    invoke-virtual {p0}, Lcom/sigma/mobile/core/BaseActivity;->updateLanguage()V

    .line 84
    const/4 v1, 0x1

    .line 86
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final storeSharedPreference(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .parameter "key"
    .parameter "value"

    .prologue
    .line 98
    const-string v2, "com.sigma.mobile.core.BasePreferences"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/sigma/mobile/core/BaseActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 99
    .local v1, settings:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 101
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 103
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method

.method protected abstract updateLanguage()V
.end method
