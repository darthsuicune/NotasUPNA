.class Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonSerializer;
.implements Lcom/google/sigma_gson/JsonDeserializer;
.implements Lcom/google/sigma_gson/InstanceCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MapTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/util/Map;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/util/Map;",
        ">;",
        "Lcom/google/sigma_gson/InstanceCreator",
        "<",
        "Ljava/util/Map;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 574
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructMapType(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Map;
    .locals 3
    .parameter "mapType"
    .parameter "context"

    .prologue
    .line 615
    move-object v0, p2

    check-cast v0, Lcom/google/sigma_gson/JsonDeserializationContextDefault;

    .line 616
    .local v0, contextImpl:Lcom/google/sigma_gson/JsonDeserializationContextDefault;
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonDeserializationContextDefault;->getObjectConstructor()Lcom/google/sigma_gson/ObjectConstructor;

    move-result-object v1

    .line 617
    .local v1, objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;
    invoke-interface {v1, p1}, Lcom/google/sigma_gson/ObjectConstructor;->construct(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    return-object v2
.end method


# virtual methods
.method public bridge synthetic createInstance(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 573
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;->createInstance(Ljava/lang/reflect/Type;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public createInstance(Ljava/lang/reflect/Type;)Ljava/util/Map;
    .locals 1
    .parameter "type"

    .prologue
    .line 621
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    return-object v0
.end method

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
    .line 573
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Map;
    .locals 8
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 604
    invoke-direct {p0, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;->constructMapType(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Map;

    move-result-object v3

    .line 605
    .local v3, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    new-instance v4, Lcom/google/sigma_gson/TypeInfoMap;

    invoke-direct {v4, p2}, Lcom/google/sigma_gson/TypeInfoMap;-><init>(Ljava/lang/reflect/Type;)V

    .line 606
    .local v4, mapTypeInfo:Lcom/google/sigma_gson/TypeInfoMap;
    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/sigma_gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 607
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    new-instance v7, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v7, v6}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/google/sigma_gson/TypeInfoMap;->getKeyType()Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-interface {p3, v7, v6}, Lcom/google/sigma_gson/JsonDeserializationContext;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    .line 608
    .local v2, key:Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v4}, Lcom/google/sigma_gson/TypeInfoMap;->getValueType()Ljava/lang/reflect/Type;

    move-result-object v7

    invoke-interface {p3, v6, v7}, Lcom/google/sigma_gson/JsonDeserializationContext;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5

    .line 609
    .local v5, value:Ljava/lang/Object;
    invoke-interface {v3, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 611
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    .end local v2           #key:Ljava/lang/Object;
    .end local v5           #value:Ljava/lang/Object;
    :cond_0
    return-object v3
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 573
    check-cast p1, Ljava/util/Map;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;->serialize(Ljava/util/Map;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/util/Map;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 8
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 578
    new-instance v4, Lcom/google/sigma_gson/JsonObject;

    invoke-direct {v4}, Lcom/google/sigma_gson/JsonObject;-><init>()V

    .line 579
    .local v4, map:Lcom/google/sigma_gson/JsonObject;
    const/4 v0, 0x0

    .line 580
    .local v0, childGenericType:Ljava/lang/reflect/Type;
    instance-of v7, p2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_0

    .line 581
    new-instance v7, Lcom/google/sigma_gson/TypeInfoMap;

    invoke-direct {v7, p2}, Lcom/google/sigma_gson/TypeInfoMap;-><init>(Ljava/lang/reflect/Type;)V

    invoke-virtual {v7}, Lcom/google/sigma_gson/TypeInfoMap;->getValueType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 584
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 585
    .local v2, entry:Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 588
    .local v5, value:Ljava/lang/Object;
    if-nez v5, :cond_1

    .line 589
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v6

    .line 595
    .local v6, valueElement:Lcom/google/sigma_gson/JsonElement;
    :goto_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    goto :goto_0

    .line 591
    .end local v6           #valueElement:Lcom/google/sigma_gson/JsonElement;
    :cond_1
    if-nez v0, :cond_2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 593
    .local v1, childType:Ljava/lang/reflect/Type;
    :goto_2
    invoke-interface {p3, v5, v1}, Lcom/google/sigma_gson/JsonSerializationContext;->serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v6

    .restart local v6       #valueElement:Lcom/google/sigma_gson/JsonElement;
    goto :goto_1

    .end local v1           #childType:Ljava/lang/reflect/Type;
    .end local v6           #valueElement:Lcom/google/sigma_gson/JsonElement;
    :cond_2
    move-object v1, v0

    .line 591
    goto :goto_2

    .line 597
    .end local v2           #entry:Ljava/util/Map$Entry;
    .end local v5           #value:Ljava/lang/Object;
    :cond_3
    return-object v4
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 626
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
