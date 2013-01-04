.class public Lcom/sigma/mobile/calificaciones/MainActivity;
.super Lcom/sigma/mobile/core/BaseActivity;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;,
        Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;
    }
.end annotation


# static fields
.field static final KEY_ABOUT:Ljava/lang/String; = "ShowingAbout"

.field private static final TAG:Ljava/lang/String; = "MainActivity"


# instance fields
.field private aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

.field private adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

.field private alertDialog:Landroid/app/AlertDialog;

.field private cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

.field ordenRegistros:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/sigma/mobile/core/BaseActivity;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    .line 45
    sget-object v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOVEDAD:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->ordenRegistros:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    .line 329
    return-void
.end method

.method static synthetic access$000(Lcom/sigma/mobile/calificaciones/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->gotoLogin()V

    return-void
.end method

.method static synthetic access$102(Lcom/sigma/mobile/calificaciones/MainActivity;Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;)Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    return-object p1
.end method

.method static synthetic access$202(Lcom/sigma/mobile/calificaciones/MainActivity;Lcom/sigma/restful/msg/RespuestaCalificaciones;)Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    return-object p1
.end method

.method static synthetic access$300(Lcom/sigma/mobile/calificaciones/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->mostrarDatos()V

    return-void
.end method

.method private gotoLogin()V
    .locals 2

    .prologue
    .line 294
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sigma/mobile/calificaciones/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 295
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 297
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->finish()V

    .line 298
    return-void
.end method

.method private mostrarDatos()V
    .locals 8

    .prologue
    .line 235
    iget-object v6, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    if-nez v6, :cond_1

    .line 258
    :cond_0
    :goto_0
    return-void

    .line 240
    :cond_1
    const v6, 0x7f09000e

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 241
    .local v2, headerText:Landroid/widget/TextView;
    iget-object v6, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v6}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v6

    if-nez v6, :cond_3

    .line 242
    const-string v6, "Apellido1 Apellido2, Nombre"

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    :goto_1
    iget-object v6, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v6}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getListaResultados()Ljava/util/List;

    move-result-object v5

    .line 248
    .local v5, lista:Ljava/util/List;,"Ljava/util/List<Lcom/sigma/restful/msg/Expediente;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sigma/restful/msg/Expediente;

    .line 249
    .local v1, exp:Lcom/sigma/restful/msg/Expediente;
    invoke-virtual {v1}, Lcom/sigma/restful/msg/Expediente;->getCalificaciones()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sigma/restful/msg/Calificacion;

    .line 250
    .local v0, cal:Lcom/sigma/restful/msg/Calificacion;
    iget-object v6, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v6, v0, v1}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->addItem(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Expediente;)V

    goto :goto_2

    .line 244
    .end local v0           #cal:Lcom/sigma/restful/msg/Calificacion;
    .end local v1           #exp:Lcom/sigma/restful/msg/Expediente;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #lista:Ljava/util/List;,"Ljava/util/List<Lcom/sigma/restful/msg/Expediente;>;"
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v7}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v7

    invoke-virtual {v7}, Lcom/sigma/msg/commons/Persona;->getApellido1()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v7}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v7

    invoke-virtual {v7}, Lcom/sigma/msg/commons/Persona;->getApellido2()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v7}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v7

    invoke-virtual {v7}, Lcom/sigma/msg/commons/Persona;->getNombre()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 255
    .restart local v5       #lista:Ljava/util/List;,"Ljava/util/List<Lcom/sigma/restful/msg/Expediente;>;"
    :cond_4
    iget-object v6, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v6}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->notifyDataSetChanged()V

    .line 256
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x2

    if-ge v6, v7, :cond_0

    .line 257
    const v6, 0x7f090035

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ExpandableListView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/ExpandableListView;->expandGroup(I)Z

    goto/16 :goto_0
.end method


# virtual methods
.method public errorDialog(Ljava/lang/String;)V
    .locals 3
    .parameter "errorMsg"

    .prologue
    .line 313
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 314
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 315
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    const-string v1, "OK"

    new-instance v2, Lcom/sigma/mobile/calificaciones/MainActivity$2;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/MainActivity$2;-><init>(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 320
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 321
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 322
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 272
    invoke-super {p0, p1, p2, p3}, Lcom/sigma/mobile/core/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 274
    packed-switch p1, :pswitch_data_0

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 277
    :pswitch_0
    invoke-static {}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getCloseRequest()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 278
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->finish()V

    goto :goto_0

    .line 281
    :pswitch_1
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 283
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->reload()V

    goto :goto_0

    .line 274
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 261
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sigma/mobile/calificaciones/DetalleActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 262
    .local v0, intent:Landroid/content/Intent;
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sigma/restful/msg/Calificacion;

    invoke-virtual {v2, v1}, Lcom/sigma/mobile/calificaciones/util/Cache;->setEscogido(Lcom/sigma/restful/msg/Calificacion;)V

    .line 263
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v1, v2}, Lcom/sigma/mobile/calificaciones/util/Cache;->setDatosCalificaciones(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V

    .line 264
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 265
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/MainActivity;->requestWindowFeature(I)Z

    .line 56
    const v2, 0x7f030005

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/MainActivity;->setContentView(I)V

    .line 59
    const v2, 0x7f090035

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    .line 60
    .local v0, listView:Landroid/widget/ExpandableListView;
    new-instance v2, Lcom/sigma/mobile/calificaciones/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/MainActivity$1;-><init>(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/ExpandableListView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    .line 71
    new-instance v2, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v2, p0, v3, v4}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    .line 72
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v0, v2}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 75
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 76
    .local v1, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_0

    const-string v2, "cargaDiferidaTask"

    const-string v3, "cargaDiferidaTask"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 77
    const-string v2, "cargaDiferidaTask"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    .line 79
    :cond_0
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    if-eqz v2, :cond_2

    .line 80
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    invoke-virtual {v2, p0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->attach(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    .line 102
    :goto_0
    new-instance v2, Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/AboutDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    .line 103
    if-eqz v1, :cond_7

    const-string v2, "showing"

    const-string v3, "aboutDialog"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v2}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_7

    .line 104
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v2}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    .line 109
    :cond_1
    :goto_1
    return-void

    .line 82
    :cond_2
    if-eqz v1, :cond_3

    const-string v2, "datos"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 84
    const-string v2, "datos"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sigma/restful/msg/RespuestaCalificaciones;

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 86
    :cond_3
    if-eqz v1, :cond_4

    const-string v2, "alertDialog"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 88
    const-string v2, "alertDialog"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlertDialog;

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 90
    :cond_4
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    if-eqz v2, :cond_5

    .line 91
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->mostrarDatos()V

    goto :goto_0

    .line 93
    :cond_5
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_6

    .line 94
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 97
    :cond_6
    new-instance v2, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    invoke-direct {v2, p0}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;-><init>(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    .line 99
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 105
    :cond_7
    if-eqz p1, :cond_1

    const-string v2, "ShowingAbout"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v2}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x1

    .line 165
    new-instance v0, Landroid/view/MenuInflater;

    invoke-direct {v0, p0}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 166
    .local v0, inflater:Landroid/view/MenuInflater;
    const/high16 v2, 0x7f08

    invoke-virtual {v0, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 168
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 170
    const v2, 0x7f09003c

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 171
    .local v1, item:Landroid/view/MenuItem;
    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 172
    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 174
    .end local v1           #item:Landroid/view/MenuItem;
    :cond_0
    return v3
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    .line 181
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 210
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 184
    :pswitch_0
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->finish()V

    goto :goto_0

    .line 187
    :pswitch_1
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->reload()V

    goto :goto_0

    .line 191
    :pswitch_2
    sget-object v1, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOVEDAD:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->ordenRegistros:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    .line 192
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->ordenarPorNovedad()V

    goto :goto_0

    .line 196
    :pswitch_3
    sget-object v1, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOMBRE:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->ordenRegistros:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    .line 197
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->ordenarPorNombre()V

    goto :goto_0

    .line 201
    :pswitch_4
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sigma/mobile/calificaciones/OptionsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 202
    .local v0, intent:Landroid/content/Intent;
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v1, v2}, Lcom/sigma/mobile/calificaciones/util/Cache;->setDatosCalificaciones(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V

    .line 203
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 207
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_5
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    goto :goto_0

    .line 181
    :pswitch_data_0
    .packed-switch 0x7f090039
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 6
    .parameter "menu"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 213
    const v2, 0x7f090039

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 214
    .local v1, itemnovedad:Landroid/view/MenuItem;
    const v2, 0x7f09003a

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 216
    .local v0, itemalfa:Landroid/view/MenuItem;
    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->ordenRegistros:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    sget-object v3, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOMBRE:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    if-ne v2, v3, :cond_0

    .line 217
    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 218
    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 219
    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 220
    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 227
    :goto_0
    return v4

    .line 222
    :cond_0
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 223
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 224
    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 225
    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 136
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 137
    .local v0, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->deattach()V

    .line 140
    const-string v1, "cargaDiferidaTask"

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 144
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->dismiss()V

    .line 145
    const-string v1, "aboutDialog"

    const-string v2, "showing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    :cond_1
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    if-eqz v1, :cond_2

    .line 149
    const-string v1, "datos"

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_2
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_3

    .line 152
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 153
    const-string v1, "alertDialog"

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    :cond_3
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 158
    .end local v0           #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v0

    .restart local v0       #retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4
    invoke-super {p0}, Lcom/sigma/mobile/core/BaseActivity;->onRetainNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 126
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 127
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    const-string v0, "ShowingAbout"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 131
    :goto_0
    return-void

    .line 130
    :cond_0
    const-string v0, "ShowingAbout"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public reload()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 301
    iput-object v2, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 302
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/sigma/mobile/calificaciones/util/Cache;->setDatosCalificaciones(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V

    .line 304
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 305
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 306
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/MainActivity;->finish()V

    .line 308
    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 309
    return-void
.end method

.method public updateLanguage()V
    .locals 2

    .prologue
    .line 114
    const v0, 0x7f09000d

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060013

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 115
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->adapter:Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->notifyDataSetChanged()V

    .line 116
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->updateLanguage()V

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    iget-object v0, v0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    iget-object v0, v0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 121
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity;->cargaDiferidaTask:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    iget-object v0, v0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->dialog:Landroid/app/ProgressDialog;

    const v1, 0x7f060025

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 122
    :cond_1
    return-void
.end method
