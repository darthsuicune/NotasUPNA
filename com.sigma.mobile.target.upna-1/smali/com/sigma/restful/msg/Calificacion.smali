.class public Lcom/sigma/restful/msg/Calificacion;
.super Ljava/lang/Object;
.source "Calificacion.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x18d696ab440036a9L


# instance fields
.field private anoAcademico:Ljava/lang/String;

.field private asignatura:Ljava/lang/String;

.field private calificacion:Ljava/lang/String;

.field private codCalificacion:Ljava/lang/String;

.field private convocatoria:Ljava/lang/String;

.field private creditos:D

.field private horaRevision:Ljava/lang/String;

.field private lugarRevision:Ljava/lang/String;

.field private nota:F

.field private numConvocatoria:I

.field private presentaExamen:Z

.field private provisional:Z

.field private superada:Z

.field private time:J

.field private timeRevision:J

.field private tipoAsignatura:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAnoAcademico()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->anoAcademico:Ljava/lang/String;

    return-object v0
.end method

.method public getAsignatura()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->asignatura:Ljava/lang/String;

    return-object v0
.end method

.method public getCalificacion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->calificacion:Ljava/lang/String;

    return-object v0
.end method

.method public getCodCalificacion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->codCalificacion:Ljava/lang/String;

    return-object v0
.end method

.method public getConvocatoria()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->convocatoria:Ljava/lang/String;

    return-object v0
.end method

.method public getCreditos()D
    .locals 2

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->creditos:D

    return-wide v0
.end method

.method public getFechaRevision()J
    .locals 2

    .prologue
    .line 140
    iget-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->timeRevision:J

    return-wide v0
.end method

.method public getHoraRevision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->horaRevision:Ljava/lang/String;

    return-object v0
.end method

.method public getLugarRevision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->lugarRevision:Ljava/lang/String;

    return-object v0
.end method

.method public getNota()F
    .locals 1

    .prologue
    .line 172
    iget v0, p0, Lcom/sigma/restful/msg/Calificacion;->nota:F

    return v0
.end method

.method public getNumConvocatoria()I
    .locals 1

    .prologue
    .line 205
    iget v0, p0, Lcom/sigma/restful/msg/Calificacion;->numConvocatoria:I

    return v0
.end method

.method public getTime()J
    .locals 2

    .prologue
    .line 115
    iget-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->time:J

    return-wide v0
.end method

.method public getTipoAsignatura()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/sigma/restful/msg/Calificacion;->tipoAsignatura:Ljava/lang/String;

    return-object v0
.end method

.method public isPresentaExamen()Z
    .locals 1

    .prologue
    .line 230
    iget-boolean v0, p0, Lcom/sigma/restful/msg/Calificacion;->presentaExamen:Z

    return v0
.end method

.method public isProvisional()Z
    .locals 1

    .prologue
    .line 185
    iget-boolean v0, p0, Lcom/sigma/restful/msg/Calificacion;->provisional:Z

    return v0
.end method

.method public isSuperada()Z
    .locals 1

    .prologue
    .line 159
    iget-boolean v0, p0, Lcom/sigma/restful/msg/Calificacion;->superada:Z

    return v0
.end method

.method public setAnoAcademico(Ljava/lang/String;)V
    .locals 0
    .parameter "anoAcademico"

    .prologue
    .line 245
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->anoAcademico:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setAsignatura(Ljava/lang/String;)V
    .locals 0
    .parameter "asignatura"

    .prologue
    .line 91
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->asignatura:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setCalificacion(Ljava/lang/String;)V
    .locals 0
    .parameter "calificacion"

    .prologue
    .line 77
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->calificacion:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setCodCalificacion(Ljava/lang/String;)V
    .locals 0
    .parameter "codCalificacion"

    .prologue
    .line 223
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->codCalificacion:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public setConvocatoria(Ljava/lang/String;)V
    .locals 0
    .parameter "convocatoria"

    .prologue
    .line 155
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->convocatoria:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public setCreditos(D)V
    .locals 0
    .parameter "creditos"

    .prologue
    .line 61
    iput-wide p1, p0, Lcom/sigma/restful/msg/Calificacion;->creditos:D

    .line 62
    return-void
.end method

.method public setFecha(Ljava/util/Date;)V
    .locals 2
    .parameter "fecha"

    .prologue
    .line 106
    if-eqz p1, :cond_0

    .line 107
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->time:J

    .line 112
    :goto_0
    return-void

    .line 109
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->time:J

    goto :goto_0
.end method

.method public setFechaRevision(Ljava/util/Date;)V
    .locals 2
    .parameter "fecha"

    .prologue
    .line 125
    if-eqz p1, :cond_0

    .line 126
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->timeRevision:J

    .line 131
    :goto_0
    return-void

    .line 128
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sigma/restful/msg/Calificacion;->timeRevision:J

    goto :goto_0
.end method

.method public setHoraRevision(Ljava/lang/String;)V
    .locals 0
    .parameter "horaRevision"

    .prologue
    .line 193
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->horaRevision:Ljava/lang/String;

    .line 194
    return-void
.end method

.method public setLugarRevision(Ljava/lang/String;)V
    .locals 0
    .parameter "lugarRevision"

    .prologue
    .line 189
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->lugarRevision:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setNota(F)V
    .locals 0
    .parameter "nota"

    .prologue
    .line 177
    iput p1, p0, Lcom/sigma/restful/msg/Calificacion;->nota:F

    .line 178
    return-void
.end method

.method public setNumConvocatoria(I)V
    .locals 0
    .parameter "numConvocatoria"

    .prologue
    .line 209
    iput p1, p0, Lcom/sigma/restful/msg/Calificacion;->numConvocatoria:I

    .line 210
    return-void
.end method

.method public setPresentaExamen(Z)V
    .locals 0
    .parameter "presentaExamen"

    .prologue
    .line 237
    iput-boolean p1, p0, Lcom/sigma/restful/msg/Calificacion;->presentaExamen:Z

    .line 238
    return-void
.end method

.method public setProvisional(Z)V
    .locals 0
    .parameter "provisional"

    .prologue
    .line 181
    iput-boolean p1, p0, Lcom/sigma/restful/msg/Calificacion;->provisional:Z

    .line 182
    return-void
.end method

.method public setSuperada(Ljava/lang/String;)V
    .locals 1
    .parameter "indSupera"

    .prologue
    .line 164
    const-string v0, "S"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sigma/restful/msg/Calificacion;->superada:Z

    .line 168
    :goto_0
    return-void

    .line 167
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sigma/restful/msg/Calificacion;->superada:Z

    goto :goto_0
.end method

.method public setTipoAsignatura(Ljava/lang/String;)V
    .locals 0
    .parameter "tipoAsignatura"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/sigma/restful/msg/Calificacion;->tipoAsignatura:Ljava/lang/String;

    .line 48
    return-void
.end method
