.class public Lcom/sigma/restful/msg/RespuestaCalificaciones;
.super Lcom/sigma/msg/commons/Respuesta;
.source "RespuestaCalificaciones.java"


# static fields
.field private static final serialVersionUID:J = 0x7c5828674a00502fL


# instance fields
.field private alumno:Lcom/sigma/msg/commons/Persona;

.field private anoAcademico:Ljava/lang/String;

.field private listaResultados:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sigma/restful/msg/Expediente;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/sigma/msg/commons/Respuesta;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->listaResultados:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getAlumno()Lcom/sigma/msg/commons/Persona;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->alumno:Lcom/sigma/msg/commons/Persona;

    return-object v0
.end method

.method public getAnoAcademico()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->anoAcademico:Ljava/lang/String;

    return-object v0
.end method

.method public getListaResultados()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/sigma/restful/msg/Expediente;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->listaResultados:Ljava/util/List;

    return-object v0
.end method

.method public setAlumno(Lcom/sigma/msg/commons/Persona;)V
    .locals 0
    .parameter "alumno"

    .prologue
    .line 35
    iput-object p1, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->alumno:Lcom/sigma/msg/commons/Persona;

    .line 36
    return-void
.end method

.method public setAnoAcademico(Ljava/lang/String;)V
    .locals 0
    .parameter "anoAcademico"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/sigma/restful/msg/RespuestaCalificaciones;->anoAcademico:Ljava/lang/String;

    .line 44
    return-void
.end method
