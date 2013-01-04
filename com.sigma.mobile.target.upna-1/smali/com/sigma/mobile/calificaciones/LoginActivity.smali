.class public Lcom/sigma/mobile/calificaciones/LoginActivity;
.super Lcom/sigma/mobile/core/BaseActivity;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "LoginActivity"

.field private static final TEXT_PASSWORD:I = 0x81


# instance fields
.field private haGirado:Z

.field private mostrarChangelog:Z

.field private mostrarPassword:Z

.field private pwdPrimVez:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Lcom/sigma/mobile/core/BaseActivity;-><init>()V

    .line 37
    iput-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->haGirado:Z

    .line 38
    iput-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    .line 39
    iput-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    return-void
.end method

.method static synthetic access$002(Lcom/sigma/mobile/calificaciones/LoginActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    return p1
.end method

.method static synthetic access$100(Lcom/sigma/mobile/calificaciones/LoginActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->continuar(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/sigma/mobile/calificaciones/LoginActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->guardarPassword(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private continuar(Z)V
    .locals 2
    .parameter "isDemo"

    .prologue
    .line 291
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 292
    .local v0, intent:Landroid/content/Intent;
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/sigma/mobile/calificaciones/util/Cache;->setDemo(Z)V

    .line 293
    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 294
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->finish()V

    .line 295
    return-void
.end method

.method private guardarPassword(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "login"
    .parameter "password"

    .prologue
    .line 298
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 299
    .local v5, settings:Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 303
    .local v2, editor:Landroid/content/SharedPreferences$Editor;
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 304
    move-object v3, p1

    .line 305
    .local v3, newLogin:Ljava/lang/String;
    move-object v4, p2

    .line 310
    .local v4, newPassword:Ljava/lang/String;
    :goto_0
    const-string v0, ""

    .line 311
    .local v0, crypto:Ljava/lang/String;
    const-string v6, "usr"

    invoke-interface {v2, v6, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 314
    :try_start_0
    const-string v6, "133546459836"

    invoke-static {v6, v4}, Lcom/sigma/mobile/core/CryptoUtility;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 315
    const-string v6, "crypto"

    const-string v7, "true"

    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    :goto_1
    const-string v6, "pass"

    invoke-interface {v2, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 322
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 324
    return-void

    .line 307
    .end local v0           #crypto:Ljava/lang/String;
    .end local v3           #newLogin:Ljava/lang/String;
    .end local v4           #newPassword:Ljava/lang/String;
    :cond_0
    const v6, 0x7f090030

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 308
    .restart local v3       #newLogin:Ljava/lang/String;
    const v6, 0x7f090031

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4       #newPassword:Ljava/lang/String;
    goto :goto_0

    .line 316
    .restart local v0       #crypto:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 317
    .local v1, e:Ljava/lang/Exception;
    move-object v0, v4

    .line 318
    const-string v6, "crypto"

    invoke-interface {v2, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 319
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private loadLastPassword()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 328
    invoke-virtual {p0, v7}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 329
    .local v4, settings:Landroid/content/SharedPreferences;
    const-string v5, "usr"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, login:Ljava/lang/String;
    const-string v5, "pass"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 331
    .local v2, password:Ljava/lang/String;
    const-string v5, "crypto"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 332
    .local v3, prePassword:Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 334
    :try_start_0
    const-string v5, "133546459836"

    invoke-static {v5, v2}, Lcom/sigma/mobile/core/CryptoUtility;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 343
    :goto_0
    if-eqz v1, :cond_0

    .line 344
    const v5, 0x7f090030

    invoke-virtual {p0, v5}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    :cond_0
    if-eqz v2, :cond_2

    .line 348
    const v5, 0x7f090031

    invoke-virtual {p0, v5}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/sigma/mobile/calificaciones/util/Cache;->setPwdPrimVez(Z)V

    .line 354
    :goto_1
    return-void

    .line 335
    :catch_0
    move-exception v0

    .line 336
    .local v0, e:Ljava/lang/Exception;
    const-string v5, "LoginActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 340
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->guardarPassword(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 351
    :cond_2
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/sigma/mobile/calificaciones/util/Cache;->setPwdPrimVez(Z)V

    goto :goto_1
.end method

.method private loginPassHaCambiado()Z
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 357
    invoke-virtual {p0, v7}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 358
    .local v5, settings:Landroid/content/SharedPreferences;
    const-string v6, "usr"

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 359
    .local v1, login:Ljava/lang/String;
    const-string v6, "pass"

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 361
    .local v4, password:Ljava/lang/String;
    :try_start_0
    const-string v6, "133546459836"

    invoke-static {v6, v4}, Lcom/sigma/mobile/core/CryptoUtility;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 366
    :goto_0
    const v6, 0x7f090030

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 367
    .local v2, newLogin:Ljava/lang/String;
    const v6, 0x7f090031

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 369
    .local v3, newPassword:Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    :cond_0
    const/4 v6, 0x1

    :goto_1
    return v6

    .line 362
    .end local v2           #newLogin:Ljava/lang/String;
    .end local v3           #newPassword:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 363
    .local v0, e:Ljava/lang/Exception;
    const-string v6, "LoginActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/lang/Exception;
    .restart local v2       #newLogin:Ljava/lang/String;
    .restart local v3       #newPassword:Ljava/lang/String;
    :cond_1
    move v6, v7

    .line 369
    goto :goto_1
.end method

.method private mostrarChangelog()V
    .locals 4

    .prologue
    .line 158
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 160
    .local v0, changelogDialog:Landroid/app/AlertDialog$Builder;
    const v2, 0x7f02000b

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 161
    const v2, 0x7f060047

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 163
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 164
    .local v1, wv:Landroid/webkit/WebView;
    const v2, 0x7f060048

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 165
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 167
    const v2, 0x7f060045

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sigma/mobile/calificaciones/LoginActivity$1;

    invoke-direct {v3, p0}, Lcom/sigma/mobile/calificaciones/LoginActivity$1;-><init>(Lcom/sigma/mobile/calificaciones/LoginActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 173
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 174
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    .line 175
    return-void
.end method

.method private final mostrarTextoPassword(Z)V
    .locals 3
    .parameter "checked"

    .prologue
    .line 179
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->isPwdPrimVez()Z

    move-result v1

    iput-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->pwdPrimVez:Z

    .line 180
    const v1, 0x7f090031

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 182
    .local v0, pwd:Landroid/widget/TextView;
    if-eqz p1, :cond_1

    .line 183
    iget-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->pwdPrimVez:Z

    if-eqz v1, :cond_0

    .line 184
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/sigma/mobile/calificaciones/util/Cache;->setPwdPrimVez(Z)V

    .line 185
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    :cond_0
    const/16 v1, 0x90

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_1
    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_0
.end method

.method private validar()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 278
    const v0, 0x7f090030

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_0

    const v0, 0x7f090031

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 281
    :cond_0
    const v0, 0x7f060023

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    move v0, v2

    .line 285
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    .line 257
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 275
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 259
    :pswitch_1
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->validar()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    const v0, 0x7f090030

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sigma/mobile/calificaciones/util/Cache;->setUserName(Ljava/lang/String;)V

    .line 261
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    const v0, 0x7f090031

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sigma/mobile/calificaciones/util/Cache;->setPassword(Ljava/lang/String;)V

    .line 263
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->loginPassHaCambiado()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 264
    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->showDialog(I)V

    goto :goto_0

    .line 266
    :cond_1
    invoke-direct {p0, v2}, Lcom/sigma/mobile/calificaciones/LoginActivity;->continuar(Z)V

    goto :goto_0

    .line 272
    :pswitch_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->continuar(Z)V

    goto :goto_0

    .line 257
    :pswitch_data_0
    .packed-switch 0x7f090032
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const v6, 0x7f090030

    const/4 v5, 0x1

    .line 44
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    invoke-virtual {p0, v5}, Lcom/sigma/mobile/calificaciones/LoginActivity;->requestWindowFeature(I)Z

    .line 46
    const v3, 0x7f030004

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->setContentView(I)V

    .line 49
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/sigma/mobile/calificaciones/util/Cache;->setDatosCalificaciones(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V

    .line 51
    const v3, 0x7f090034

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    const v3, 0x7f090032

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    const v3, 0x7f060004

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, showDemo:Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string v3, "false"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 63
    :cond_0
    const v3, 0x7f090033

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 66
    :cond_1
    const v3, 0x7f060006

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, authType:Ljava/lang/String;
    const-string v3, "DNI"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 68
    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    const v4, 0x7f060032

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(I)V

    .line 74
    :goto_0
    const v3, 0x7f090031

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    const v4, 0x7f060034

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(I)V

    .line 77
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 78
    .local v1, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_7

    const-string v3, "showing"

    const-string v4, "changelogDialog"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 79
    iput-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    .line 83
    :cond_2
    :goto_1
    if-eqz v1, :cond_8

    const-string v3, "true"

    const-string v4, "mostrarPassword"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 84
    iput-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    .line 89
    :cond_3
    :goto_2
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v3

    invoke-virtual {v3}, Lcom/sigma/mobile/calificaciones/util/Cache;->isPwdPrimVez()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 90
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->loadLastPassword()V

    .line 92
    :cond_4
    return-void

    .line 69
    .end local v1           #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    const-string v3, "NIA"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 70
    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    const v4, 0x7f060031

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(I)V

    goto :goto_0

    .line 72
    :cond_6
    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    const v4, 0x7f060033

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(I)V

    goto :goto_0

    .line 80
    .restart local v1       #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_7
    if-eqz p1, :cond_2

    const-string v3, "changelogDialog"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    iput-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    goto :goto_1

    .line 85
    :cond_8
    if-eqz p1, :cond_3

    const-string v3, "mostrarPassword"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 86
    iput-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    goto :goto_2
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 374
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f06001c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060021

    new-instance v2, Lcom/sigma/mobile/calificaciones/LoginActivity$3;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/LoginActivity$3;-><init>(Lcom/sigma/mobile/calificaciones/LoginActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060022

    new-instance v2, Lcom/sigma/mobile/calificaciones/LoginActivity$2;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/LoginActivity$2;-><init>(Lcom/sigma/mobile/calificaciones/LoginActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    .line 130
    new-instance v0, Landroid/view/MenuInflater;

    invoke-direct {v0, p0}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 131
    .local v0, inflater:Landroid/view/MenuInflater;
    const v1, 0x7f080002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 133
    iget-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    if-eqz v1, :cond_0

    .line 134
    const v1, 0x7f09003f

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    const v2, 0x7f06001e

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 136
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->haGirado:Z

    if-nez v0, :cond_0

    .line 250
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->setPwdPrimVez(Z)V

    .line 252
    :cond_0
    invoke-super {p0}, Lcom/sigma/mobile/core/BaseActivity;->onDestroy()V

    .line 253
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 142
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 154
    :goto_0
    return v1

    .line 145
    :pswitch_0
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    .line 146
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    invoke-direct {p0, v0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarTextoPassword(Z)V

    .line 147
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    if-eqz v0, :cond_1

    .line 148
    const v0, 0x7f06001e

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0

    .line 145
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 150
    :cond_1
    const v0, 0x7f06001d

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x7f09003f
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 97
    invoke-super {p0}, Lcom/sigma/mobile/core/BaseActivity;->onResume()V

    .line 99
    iget-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    invoke-direct {p0, v5}, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarTextoPassword(Z)V

    .line 103
    iget-boolean v5, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    if-eqz v5, :cond_1

    .line 104
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog()V

    .line 125
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 109
    .local v3, settings:Landroid/content/SharedPreferences;
    :try_start_0
    const-string v5, "app_version_code"

    const/4 v6, 0x0

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 110
    .local v4, storedVersion:I
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget v0, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 112
    .local v0, currentVersion:I
    if-ge v4, v0, :cond_0

    .line 113
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 114
    .local v2, editor:Landroid/content/SharedPreferences$Editor;
    const-string v5, "app_version_code"

    invoke-interface {v2, v5, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 115
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 117
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog()V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    .end local v0           #currentVersion:I
    .end local v2           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v4           #storedVersion:I
    :catch_0
    move-exception v1

    .line 121
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "LoginActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error comiteando el codigo de version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 229
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 231
    .local v0, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->haGirado:Z

    .line 233
    iget-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    if-eqz v1, :cond_0

    .line 235
    const-string v1, "changelogDialog"

    const-string v2, "showing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    :cond_0
    const-string v1, "mostrarPassword"

    iget-boolean v2, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 243
    .end local v0           #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v0

    .restart local v0       #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    invoke-super {p0}, Lcom/sigma/mobile/core/BaseActivity;->onRetainNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 217
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 218
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarChangelog:Z

    if-eqz v0, :cond_0

    .line 219
    const-string v0, "changelogDialog"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 223
    :goto_0
    const-string v0, "mostrarPassword"

    iget-boolean v1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity;->mostrarPassword:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 224
    return-void

    .line 221
    :cond_0
    const-string v0, "changelogDialog"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method protected updateLanguage()V
    .locals 4

    .prologue
    const v3, 0x7f090030

    .line 196
    const v1, 0x7f090032

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const v2, 0x7f06001f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 198
    const v1, 0x7f060006

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, authType:Ljava/lang/String;
    const-string v1, "DNI"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 201
    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f060032

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 211
    :goto_0
    const v1, 0x7f090031

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f060034

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 213
    return-void

    .line 203
    :cond_0
    const-string v1, "NIA"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 205
    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f060031

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    goto :goto_0

    .line 209
    :cond_1
    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f060033

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    goto :goto_0
.end method
