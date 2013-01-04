.class Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;
.super Landroid/os/AsyncTask;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sigma/mobile/calificaciones/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CargaDiferidaTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sigma/restful/msg/RespuestaCalificaciones;",
        ">;"
    }
.end annotation


# instance fields
.field dialog:Landroid/app/ProgressDialog;

.field errorMsg:Ljava/lang/String;

.field exception:Lcom/sigma/mobile/system/SGMException;

.field mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;


# direct methods
.method public constructor <init>(Lcom/sigma/mobile/calificaciones/MainActivity;)V
    .locals 1
    .parameter "app"

    .prologue
    .line 336
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 376
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    .line 337
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    .line 338
    return-void
.end method

.method private static final getString(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    .line 446
    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private showDialog()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 354
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    if-eqz v0, :cond_0

    .line 355
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    const-string v1, ""

    const v2, 0x7f060025

    invoke-static {v2}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask$1;

    invoke-direct {v5, p0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask$1;-><init>(Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;)V

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    .line 369
    :cond_0
    return-void
.end method


# virtual methods
.method attach(Lcom/sigma/mobile/calificaciones/MainActivity;)V
    .locals 0
    .parameter "app"

    .prologue
    .line 341
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    .line 342
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->showDialog()V

    .line 343
    return-void
.end method

.method public deattach()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 346
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 347
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 349
    :cond_0
    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    .line 350
    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    .line 351
    return-void
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .locals 7
    .parameter "params"

    .prologue
    .line 383
    :try_start_0
    iget-object v4, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-virtual {v4}, Lcom/sigma/mobile/calificaciones/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-virtual {v5}, Lcom/sigma/mobile/calificaciones/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget-object v0, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/sigma/mobile/system/SGMException; {:try_start_0 .. :try_end_0} :catch_1

    .line 390
    .local v0, appVer:Ljava/lang/String;
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    .line 391
    .local v1, cache:Lcom/sigma/mobile/calificaciones/util/Cache;
    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->isDemo()Z

    move-result v6

    invoke-static {v4, v5, v0, v6}, Lcom/sigma/mobile/calificaciones/Controlador;->recuperarDatos(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sigma/restful/msg/RespuestaCalificaciones;

    move-result-object v2

    .line 400
    .end local v0           #appVer:Ljava/lang/String;
    .end local v1           #cache:Lcom/sigma/mobile/calificaciones/util/Cache;
    :goto_1
    return-object v2

    .line 384
    :catch_0
    move-exception v3

    .line 385
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v0, ""

    .line 386
    .restart local v0       #appVer:Ljava/lang/String;
    const-string v4, "MainActivity"

    invoke-virtual {v3}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    invoke-virtual {v3}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V
    :try_end_1
    .catch Lcom/sigma/mobile/system/SGMException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 397
    .end local v0           #appVer:Ljava/lang/String;
    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v3

    .line 398
    .local v3, e:Lcom/sigma/mobile/system/SGMException;
    iput-object v3, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    .line 399
    const-string v4, "SIGMA"

    const-string v5, "MainActivity"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 400
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 329
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->doInBackground([Ljava/lang/Void;)Lcom/sigma/restful/msg/RespuestaCalificaciones;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 436
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    #calls: Lcom/sigma/mobile/calificaciones/MainActivity;->gotoLogin()V
    invoke-static {v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->access$000(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    .line 437
    return-void
.end method

.method protected onPostExecute(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V
    .locals 2
    .parameter "result"

    .prologue
    const/4 v1, 0x0

    .line 407
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    if-nez v0, :cond_1

    .line 431
    :cond_0
    :goto_0
    return-void

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 412
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 413
    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    .line 416
    :cond_2
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    #setter for: Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;
    invoke-static {v0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity;->access$102(Lcom/sigma/mobile/calificaciones/MainActivity;Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;)Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    .line 417
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    #setter for: Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;
    invoke-static {v0, p1}, Lcom/sigma/mobile/calificaciones/MainActivity;->access$202(Lcom/sigma/mobile/calificaciones/MainActivity;Lcom/sigma/restful/msg/RespuestaCalificaciones;)Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 418
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    #calls: Lcom/sigma/mobile/calificaciones/MainActivity;->mostrarDatos()V
    invoke-static {v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->access$300(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    .line 420
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    invoke-virtual {v0}, Lcom/sigma/mobile/system/SGMException;->getIdMsgError()I

    move-result v0

    if-eqz v0, :cond_3

    .line 423
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    invoke-virtual {v0}, Lcom/sigma/mobile/system/SGMException;->getIdMsgError()I

    move-result v0

    invoke-static {v0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->errorMsg:Ljava/lang/String;

    .line 428
    :goto_1
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->mainActivity:Lcom/sigma/mobile/calificaciones/MainActivity;

    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity;->errorDialog(Ljava/lang/String;)V

    goto :goto_0

    .line 425
    :cond_3
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->exception:Lcom/sigma/mobile/system/SGMException;

    invoke-virtual {v0}, Lcom/sigma/mobile/system/SGMException;->getMessage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->errorMsg:Ljava/lang/String;

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 329
    check-cast p1, Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->onPostExecute(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 373
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->showDialog()V

    .line 374
    return-void
.end method
