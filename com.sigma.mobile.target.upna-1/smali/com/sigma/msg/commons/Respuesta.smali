.class public Lcom/sigma/msg/commons/Respuesta;
.super Ljava/lang/Object;
.source "Respuesta.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ERROR_MOROSIDAD:I = -0xbb8

.field public static final ERROR_NO_HAY_CALIFICACIONES:I = -0x3

.field public static final ERROR_NO_HAY_EXPEDIENTES:I = -0x2

.field public static final ERROR_SERVICIO_CERRADO:I = -0x1

.field public static final ERROR_SQL:I = -0x1388

.field public static final TRAZA_NO_INSERTADA:I = -0x7d0

.field public static final USUARIO_SIN_IDENTIFICAR:I = -0x3e8

.field private static final serialVersionUID:J = -0x6048366d624ffd1eL


# instance fields
.field private error:I

.field private msgError:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getError()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/sigma/msg/commons/Respuesta;->error:I

    return v0
.end method

.method public getMsgError()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/sigma/msg/commons/Respuesta;->msgError:Ljava/lang/String;

    return-object v0
.end method

.method public setError(I)V
    .locals 0
    .parameter "error"

    .prologue
    .line 29
    iput p1, p0, Lcom/sigma/msg/commons/Respuesta;->error:I

    .line 30
    return-void
.end method

.method public setMsgError(Ljava/lang/String;)V
    .locals 0
    .parameter "msgError"

    .prologue
    .line 37
    iput-object p1, p0, Lcom/sigma/msg/commons/Respuesta;->msgError:Ljava/lang/String;

    .line 38
    return-void
.end method
