.class public Lcom/sigma/mobile/calificaciones/DetalleActivity;
.super Lcom/sigma/mobile/core/BaseActivity;
.source "DetalleActivity.java"


# static fields
.field public static final ACTIVITY_ID:I = 0x1

.field private static final CLOSE_REQUEST:I = 0x1

.field static final KEY_ABOUT:Ljava/lang/String; = "ShowingAbout"


# instance fields
.field private aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

.field df:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/sigma/mobile/core/BaseActivity;-><init>()V

    .line 26
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#0.0"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->df:Ljava/text/DecimalFormat;

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    return-void
.end method

.method public static getCloseRequest()I
    .locals 1

    .prologue
    .line 191
    const/4 v0, 0x1

    return v0
.end method

.method private mostrarDatos()V
    .locals 13

    .prologue
    const v12, 0x7f09001c

    const v11, 0x7f09001a

    const/4 v10, 0x0

    const v9, 0x7f060046

    const v8, 0x7f09000c

    .line 125
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sigma/mobile/calificaciones/util/Cache;->getDatosCalificaciones()Lcom/sigma/restful/msg/RespuestaCalificaciones;

    move-result-object v4

    iput-object v4, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 128
    const v4, 0x7f09000e

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 129
    .local v1, headerText:Landroid/widget/TextView;
    iget-object v4, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v4}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v4

    if-nez v4, :cond_3

    .line 130
    const-string v4, "Apellido1 Apellido2, Nombre"

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    :goto_0
    invoke-static {}, Lcom/sigma/mobile/calificaciones/util/Cache;->getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sigma/mobile/calificaciones/util/Cache;->getEscogido()Lcom/sigma/restful/msg/Calificacion;

    move-result-object v0

    .line 137
    .local v0, cal:Lcom/sigma/restful/msg/Calificacion;
    const v4, 0x7f090021

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getAnoAcademico()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    const v4, 0x7f09000f

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getAsignatura()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    const v4, 0x7f090012

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getCalificacion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isPresentaExamen()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 143
    const v4, 0x7f090014

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/view/View;->setVisibility(I)V

    .line 144
    const v4, 0x7f090016

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->df:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getNota()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    :cond_0
    const v4, 0x7f09000b

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const-string v5, "dd/MM/yyyy"

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getTime()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    const v4, 0x7f090025

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getConvocatoria()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    const v4, 0x7f090027

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getCreditos()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    const v4, 0x7f09002a

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getTipoAsignatura()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getCodCalificacion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isSuperada()Z

    move-result v4

    if-nez v4, :cond_5

    .line 154
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isPresentaExamen()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 155
    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020015

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 169
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isProvisional()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 170
    const v4, 0x7f090018

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/view/View;->setVisibility(I)V

    .line 171
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getFechaRevision()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_6

    .line 172
    invoke-virtual {p0, v11}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const-string v5, "dd/MM/yyyy"

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getFechaRevision()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    :goto_2
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getHoraRevision()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_7

    const-string v4, ""

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getHoraRevision()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 177
    invoke-virtual {p0, v12}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getHoraRevision()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    :goto_3
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getLugarRevision()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_8

    const-string v4, ""

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getLugarRevision()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 182
    const v4, 0x7f09001e

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getLugarRevision()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    :cond_2
    :goto_4
    return-void

    .line 132
    .end local v0           #cal:Lcom/sigma/restful/msg/Calificacion;
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v5}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v5

    invoke-virtual {v5}, Lcom/sigma/msg/commons/Persona;->getApellido1()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v5}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v5

    invoke-virtual {v5}, Lcom/sigma/msg/commons/Persona;->getApellido2()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->datos:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v5}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getAlumno()Lcom/sigma/msg/commons/Persona;

    move-result-object v5

    invoke-virtual {v5}, Lcom/sigma/msg/commons/Persona;->getNombre()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 158
    .restart local v0       #cal:Lcom/sigma/restful/msg/Calificacion;
    :cond_4
    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 159
    .local v3, tv:Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020016

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    const v4, 0x7f06000c

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 161
    .local v2, hideCodigoCalificacionSinExamen:Ljava/lang/String;
    const-string v4, "true"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 162
    const-string v4, "*"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 166
    .end local v2           #hideCodigoCalificacionSinExamen:Ljava/lang/String;
    .end local v3           #tv:Landroid/widget/TextView;
    :cond_5
    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020017

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 174
    :cond_6
    invoke-virtual {p0, v11}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 179
    :cond_7
    invoke-virtual {p0, v12}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 184
    :cond_8
    const v4, 0x7f09001e

    invoke-virtual {p0, v4}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->requestWindowFeature(I)Z

    .line 39
    const v1, 0x7f030002

    invoke-virtual {p0, v1}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->setContentView(I)V

    .line 40
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->mostrarDatos()V

    .line 43
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 44
    .local v0, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-direct {v1, p0}, Lcom/sigma/mobile/calificaciones/AboutDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    .line 45
    if-eqz v0, :cond_1

    const-string v1, "showing"

    const-string v2, "aboutDialog"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 48
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :cond_1
    if-eqz p1, :cond_0

    const-string v1, "ShowingAbout"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 86
    new-instance v0, Landroid/view/MenuInflater;

    invoke-direct {v0, p0}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 87
    .local v0, inflater:Landroid/view/MenuInflater;
    const v1, 0x7f080001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 89
    const/4 v1, 0x1

    return v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 111
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 121
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 114
    :pswitch_0
    invoke-static {}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->getCloseRequest()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->setResult(I)V

    .line 115
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->finish()V

    goto :goto_0

    .line 118
    :pswitch_1
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->show()V

    goto :goto_0

    .line 111
    :pswitch_data_0
    .packed-switch 0x7f09003d
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 95
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 96
    .local v0, retainedObjects:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v1}, Lcom/sigma/mobile/calificaciones/AboutDialog;->dismiss()V

    .line 99
    const-string v1, "aboutDialog"

    const-string v2, "showing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 105
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
    .line 76
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 77
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    const-string v0, "ShowingAbout"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    const-string v0, "ShowingAbout"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method protected updateLanguage()V
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/DetalleActivity;->aDialog:Lcom/sigma/mobile/calificaciones/AboutDialog;

    invoke-virtual {v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->updateLanguage()V

    .line 61
    :cond_0
    const v0, 0x7f09000d

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060013

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 62
    const v0, 0x7f090011

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060015

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 63
    const v0, 0x7f090015

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060016

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 64
    const v0, 0x7f090017

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060017

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 65
    const v0, 0x7f090019

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060039

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 66
    const v0, 0x7f09001b

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060038

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 67
    const v0, 0x7f09001d

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f06003a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 68
    const v0, 0x7f090020

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060019

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 69
    const v0, 0x7f090023

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060014

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 70
    const v0, 0x7f090026

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060018

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 71
    const v0, 0x7f090029

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/DetalleActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f06001a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 72
    return-void
.end method
