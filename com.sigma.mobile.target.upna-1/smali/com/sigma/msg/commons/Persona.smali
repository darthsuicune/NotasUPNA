.class public Lcom/sigma/msg/commons/Persona;
.super Ljava/lang/Object;
.source "Persona.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0xfebc2586eaf6c54L


# instance fields
.field apellido1:Ljava/lang/String;

.field apellido2:Ljava/lang/String;

.field private email:Ljava/lang/String;

.field nia:Ljava/lang/Integer;

.field nombre:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "nia"
    .parameter "nombre"
    .parameter "apellido1"
    .parameter "apellido2"
    .parameter "email"

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->nia:Ljava/lang/Integer;

    .line 20
    iput-object p2, p0, Lcom/sigma/msg/commons/Persona;->nombre:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lcom/sigma/msg/commons/Persona;->apellido1:Ljava/lang/String;

    .line 22
    iput-object p4, p0, Lcom/sigma/msg/commons/Persona;->apellido2:Ljava/lang/String;

    .line 23
    iput-object p5, p0, Lcom/sigma/msg/commons/Persona;->email:Ljava/lang/String;

    .line 24
    return-void
.end method


# virtual methods
.method public getApellido1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/sigma/msg/commons/Persona;->apellido1:Ljava/lang/String;

    return-object v0
.end method

.method public getApellido2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/sigma/msg/commons/Persona;->apellido2:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/sigma/msg/commons/Persona;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getNia()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/sigma/msg/commons/Persona;->nia:Ljava/lang/Integer;

    return-object v0
.end method

.method public getNombre()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/sigma/msg/commons/Persona;->nombre:Ljava/lang/String;

    return-object v0
.end method

.method public setApellido1(Ljava/lang/String;)V
    .locals 0
    .parameter "apellido1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->apellido1:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setApellido2(Ljava/lang/String;)V
    .locals 0
    .parameter "apellido2"

    .prologue
    .line 42
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->apellido2:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .parameter "email"

    .prologue
    .line 66
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->email:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setNia(Ljava/lang/Integer;)V
    .locals 0
    .parameter "nia"

    .prologue
    .line 50
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->nia:Ljava/lang/Integer;

    .line 51
    return-void
.end method

.method public setNombre(Ljava/lang/String;)V
    .locals 0
    .parameter "nombre"

    .prologue
    .line 58
    iput-object p1, p0, Lcom/sigma/msg/commons/Persona;->nombre:Ljava/lang/String;

    .line 59
    return-void
.end method
