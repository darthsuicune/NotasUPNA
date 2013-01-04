.class Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonSerializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FloatSerializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# instance fields
.field private final serializeSpecialFloatingPointValues:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .parameter "serializeSpecialDoubleValues"

    .prologue
    .line 764
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 765
    iput-boolean p1, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;->serializeSpecialFloatingPointValues:Z

    .line 766
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Float;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 3
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 769
    iget-boolean v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;->serializeSpecialFloatingPointValues:Z

    if-nez v0, :cond_1

    .line 770
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 771
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid float value as per JSON specification. To override this"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 776
    :cond_1
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Number;)V

    return-object v0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 761
    check-cast p1, Ljava/lang/Float;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;->serialize(Ljava/lang/Float;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method
