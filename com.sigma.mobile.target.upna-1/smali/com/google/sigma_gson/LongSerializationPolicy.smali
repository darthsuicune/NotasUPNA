.class public final enum Lcom/google/sigma_gson/LongSerializationPolicy;
.super Ljava/lang/Enum;
.source "LongSerializationPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/sigma_gson/LongSerializationPolicy$1;,
        Lcom/google/sigma_gson/LongSerializationPolicy$StringStrategy;,
        Lcom/google/sigma_gson/LongSerializationPolicy$DefaultStrategy;,
        Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/sigma_gson/LongSerializationPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/sigma_gson/LongSerializationPolicy;

.field public static final enum DEFAULT:Lcom/google/sigma_gson/LongSerializationPolicy;

.field public static final enum STRING:Lcom/google/sigma_gson/LongSerializationPolicy;


# instance fields
.field private final strategy:Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    new-instance v0, Lcom/google/sigma_gson/LongSerializationPolicy;

    const-string v1, "DEFAULT"

    new-instance v2, Lcom/google/sigma_gson/LongSerializationPolicy$DefaultStrategy;

    invoke-direct {v2, v5}, Lcom/google/sigma_gson/LongSerializationPolicy$DefaultStrategy;-><init>(Lcom/google/sigma_gson/LongSerializationPolicy$1;)V

    invoke-direct {v0, v1, v3, v2}, Lcom/google/sigma_gson/LongSerializationPolicy;-><init>(Ljava/lang/String;ILcom/google/sigma_gson/LongSerializationPolicy$Strategy;)V

    sput-object v0, Lcom/google/sigma_gson/LongSerializationPolicy;->DEFAULT:Lcom/google/sigma_gson/LongSerializationPolicy;

    .line 41
    new-instance v0, Lcom/google/sigma_gson/LongSerializationPolicy;

    const-string v1, "STRING"

    new-instance v2, Lcom/google/sigma_gson/LongSerializationPolicy$StringStrategy;

    invoke-direct {v2, v5}, Lcom/google/sigma_gson/LongSerializationPolicy$StringStrategy;-><init>(Lcom/google/sigma_gson/LongSerializationPolicy$1;)V

    invoke-direct {v0, v1, v4, v2}, Lcom/google/sigma_gson/LongSerializationPolicy;-><init>(Ljava/lang/String;ILcom/google/sigma_gson/LongSerializationPolicy$Strategy;)V

    sput-object v0, Lcom/google/sigma_gson/LongSerializationPolicy;->STRING:Lcom/google/sigma_gson/LongSerializationPolicy;

    .line 27
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/sigma_gson/LongSerializationPolicy;

    sget-object v1, Lcom/google/sigma_gson/LongSerializationPolicy;->DEFAULT:Lcom/google/sigma_gson/LongSerializationPolicy;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/sigma_gson/LongSerializationPolicy;->STRING:Lcom/google/sigma_gson/LongSerializationPolicy;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/sigma_gson/LongSerializationPolicy;->$VALUES:[Lcom/google/sigma_gson/LongSerializationPolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/google/sigma_gson/LongSerializationPolicy$Strategy;)V
    .locals 0
    .parameter
    .parameter
    .parameter "strategy"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 46
    iput-object p3, p0, Lcom/google/sigma_gson/LongSerializationPolicy;->strategy:Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;

    .line 47
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/sigma_gson/LongSerializationPolicy;
    .locals 1
    .parameter "name"

    .prologue
    .line 27
    const-class v0, Lcom/google/sigma_gson/LongSerializationPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/LongSerializationPolicy;

    return-object v0
.end method

.method public static values()[Lcom/google/sigma_gson/LongSerializationPolicy;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/google/sigma_gson/LongSerializationPolicy;->$VALUES:[Lcom/google/sigma_gson/LongSerializationPolicy;

    invoke-virtual {v0}, [Lcom/google/sigma_gson/LongSerializationPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/sigma_gson/LongSerializationPolicy;

    return-object v0
.end method


# virtual methods
.method public serialize(Ljava/lang/Long;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "value"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/sigma_gson/LongSerializationPolicy;->strategy:Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;->serialize(Ljava/lang/Long;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method
