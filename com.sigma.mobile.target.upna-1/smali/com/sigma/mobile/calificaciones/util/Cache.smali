.class public final Lcom/sigma/mobile/calificaciones/util/Cache;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static instance:Lcom/sigma/mobile/calificaciones/util/Cache; = null

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private PwdPrimVez:Z

.field private datosCalificaciones:Lcom/sigma/restful/msg/RespuestaCalificaciones;

.field private escogido:Lcom/sigma/restful/msg/Calificacion;

.field private isDemo:Z

.field private password:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/sigma/mobile/calificaciones/util/Cache;

    invoke-direct {v0}, Lcom/sigma/mobile/calificaciones/util/Cache;-><init>()V

    sput-object v0, Lcom/sigma/mobile/calificaciones/util/Cache;->instance:Lcom/sigma/mobile/calificaciones/util/Cache;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->PwdPrimVez:Z

    .line 34
    return-void
.end method

.method public static getInstance()Lcom/sigma/mobile/calificaciones/util/Cache;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/sigma/mobile/calificaciones/util/Cache;->instance:Lcom/sigma/mobile/calificaciones/util/Cache;

    return-object v0
.end method

.method public static remplazarCache(Lcom/sigma/mobile/calificaciones/util/Cache;)V
    .locals 0
    .parameter "cache"

    .prologue
    .line 50
    sput-object p0, Lcom/sigma/mobile/calificaciones/util/Cache;->instance:Lcom/sigma/mobile/calificaciones/util/Cache;

    .line 51
    return-void
.end method


# virtual methods
.method public getDatosCalificaciones()Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->datosCalificaciones:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    return-object v0
.end method

.method public getEscogido()Lcom/sigma/restful/msg/Calificacion;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->escogido:Lcom/sigma/restful/msg/Calificacion;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public isDemo()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->isDemo:Z

    return v0
.end method

.method public isPwdPrimVez()Z
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->PwdPrimVez:Z

    return v0
.end method

.method public setDatosCalificaciones(Lcom/sigma/restful/msg/RespuestaCalificaciones;)V
    .locals 0
    .parameter "datosCalificaciones"

    .prologue
    .line 66
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->datosCalificaciones:Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 67
    return-void
.end method

.method public setDemo(Z)V
    .locals 0
    .parameter "isDemo"

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->isDemo:Z

    .line 91
    return-void
.end method

.method public setEscogido(Lcom/sigma/restful/msg/Calificacion;)V
    .locals 0
    .parameter "escogido"

    .prologue
    .line 54
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->escogido:Lcom/sigma/restful/msg/Calificacion;

    .line 55
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .parameter "password"

    .prologue
    .line 82
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->password:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setPwdPrimVez(Z)V
    .locals 0
    .parameter "pwdPrimVez"

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->PwdPrimVez:Z

    .line 95
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .parameter "userName"

    .prologue
    .line 74
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/util/Cache;->userName:Ljava/lang/String;

    .line 75
    return-void
.end method
