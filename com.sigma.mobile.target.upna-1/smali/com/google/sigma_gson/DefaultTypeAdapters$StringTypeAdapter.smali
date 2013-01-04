.class Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonSerializer;
.implements Lcom/google/sigma_gson/JsonDeserializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/lang/String;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 840
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 840
    invoke-direct {p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 840
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/String;
    .locals 1
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 848
    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 840
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;->serialize(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 843
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 853
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
