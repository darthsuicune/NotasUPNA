.class Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;
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
    name = "UriTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/net/URI;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/net/URI;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 439
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 439
    invoke-direct {p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;-><init>()V

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
    .line 439
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/net/URI;
    .locals 3
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 446
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 447
    :catch_0
    move-exception v0

    .line 448
    .local v0, e:Ljava/net/URISyntaxException;
    new-instance v1, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 439
    check-cast p1, Ljava/net/URI;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;->serialize(Ljava/net/URI;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/net/URI;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 2
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 441
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-virtual {p1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 453
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
