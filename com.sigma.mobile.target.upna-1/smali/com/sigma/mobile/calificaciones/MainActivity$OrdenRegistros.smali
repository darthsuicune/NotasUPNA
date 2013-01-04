.class final enum Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;
.super Ljava/lang/Enum;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sigma/mobile/calificaciones/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "OrdenRegistros"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

.field public static final enum POR_NOMBRE:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

.field public static final enum POR_NOVEDAD:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    new-instance v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    const-string v1, "POR_NOVEDAD"

    invoke-direct {v0, v1, v2}, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOVEDAD:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    new-instance v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    const-string v1, "POR_NOMBRE"

    invoke-direct {v0, v1, v3}, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOMBRE:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    sget-object v1, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOVEDAD:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->POR_NOMBRE:Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    aput-object v1, v0, v3

    sput-object v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->$VALUES:[Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;
    .locals 1
    .parameter "name"

    .prologue
    .line 44
    const-class v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    return-object v0
.end method

.method public static values()[Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->$VALUES:[Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    invoke-virtual {v0}, [Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sigma/mobile/calificaciones/MainActivity$OrdenRegistros;

    return-object v0
.end method
