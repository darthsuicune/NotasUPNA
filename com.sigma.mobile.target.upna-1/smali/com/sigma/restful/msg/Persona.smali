.class public Lcom/sigma/restful/msg/Persona;
.super Lcom/sigma/msg/commons/Persona;
.source "Persona.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0xfebc2586eaf6c55L


# instance fields
.field documento:Ljava/lang/String;

.field nip:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/sigma/msg/commons/Persona;-><init>()V

    return-void
.end method


# virtual methods
.method public getDocumento()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/sigma/restful/msg/Persona;->documento:Ljava/lang/String;

    return-object v0
.end method

.method public getNip()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/sigma/restful/msg/Persona;->nip:Ljava/lang/Integer;

    return-object v0
.end method

.method public setDocumento(Ljava/lang/String;)V
    .locals 0
    .parameter "documento"

    .prologue
    .line 20
    iput-object p1, p0, Lcom/sigma/restful/msg/Persona;->documento:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public setNip(Ljava/lang/Integer;)V
    .locals 0
    .parameter "nip"

    .prologue
    .line 28
    iput-object p1, p0, Lcom/sigma/restful/msg/Persona;->nip:Ljava/lang/Integer;

    .line 29
    return-void
.end method
