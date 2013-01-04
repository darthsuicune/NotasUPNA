.class Lcom/google/sigma_gson/LongSerializationPolicy$DefaultStrategy;
.super Ljava/lang/Object;
.source "LongSerializationPolicy.java"

# interfaces
.implements Lcom/google/sigma_gson/LongSerializationPolicy$Strategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/LongSerializationPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultStrategy"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/LongSerializationPolicy$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/google/sigma_gson/LongSerializationPolicy$DefaultStrategy;-><init>()V

    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Long;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "value"

    .prologue
    .line 65
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Number;)V

    return-object v0
.end method
