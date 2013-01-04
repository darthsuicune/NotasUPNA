.class public Lcom/sigma/restful/msg/Expediente;
.super Ljava/lang/Object;
.source "Expediente.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x5dc46523f3ebde0L


# instance fields
.field private calificaciones:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sigma/restful/msg/Calificacion;",
            ">;"
        }
    .end annotation
.end field

.field private centroDescripcion:Ljava/lang/String;

.field private creditosSuperados:F

.field private creditosTotalesPlan:F

.field private estudioDescripcion:Ljava/lang/String;

.field private planDescripcion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sigma/restful/msg/Expediente;->calificaciones:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCalificaciones()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/sigma/restful/msg/Calificacion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcom/sigma/restful/msg/Expediente;->calificaciones:Ljava/util/List;

    return-object v0
.end method

.method public getCentroDescripcion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/sigma/restful/msg/Expediente;->centroDescripcion:Ljava/lang/String;

    return-object v0
.end method

.method public getCreditosSuperados()F
    .locals 1

    .prologue
    .line 107
    iget v0, p0, Lcom/sigma/restful/msg/Expediente;->creditosSuperados:F

    return v0
.end method

.method public getCreditosTotalesPlan()F
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lcom/sigma/restful/msg/Expediente;->creditosTotalesPlan:F

    return v0
.end method

.method public getEstudioDescripcion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/sigma/restful/msg/Expediente;->estudioDescripcion:Ljava/lang/String;

    return-object v0
.end method

.method public getPlanDescripcion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/sigma/restful/msg/Expediente;->planDescripcion:Ljava/lang/String;

    return-object v0
.end method

.method public setCalificaciones(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/sigma/restful/msg/Calificacion;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, calificaciones:Ljava/util/List;,"Ljava/util/List<Lcom/sigma/restful/msg/Calificacion;>;"
    iput-object p1, p0, Lcom/sigma/restful/msg/Expediente;->calificaciones:Ljava/util/List;

    .line 100
    return-void
.end method

.method public setCentroDescripcion(Ljava/lang/String;)V
    .locals 0
    .parameter "centroDescripcion"

    .prologue
    .line 57
    iput-object p1, p0, Lcom/sigma/restful/msg/Expediente;->centroDescripcion:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setCreditosSuperados(F)V
    .locals 0
    .parameter "creditosSuperados"

    .prologue
    .line 103
    iput p1, p0, Lcom/sigma/restful/msg/Expediente;->creditosSuperados:F

    .line 104
    return-void
.end method

.method public setCreditosTotalesPlan(F)V
    .locals 0
    .parameter "creditosTotalesPlan"

    .prologue
    .line 111
    iput p1, p0, Lcom/sigma/restful/msg/Expediente;->creditosTotalesPlan:F

    .line 112
    return-void
.end method

.method public setEstudioDescripcion(Ljava/lang/String;)V
    .locals 0
    .parameter "estudioDescripcion"

    .prologue
    .line 71
    iput-object p1, p0, Lcom/sigma/restful/msg/Expediente;->estudioDescripcion:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setPlanDescripcion(Ljava/lang/String;)V
    .locals 0
    .parameter "planDescripcion"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/sigma/restful/msg/Expediente;->planDescripcion:Ljava/lang/String;

    .line 44
    return-void
.end method
