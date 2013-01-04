.class final Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;
.super Lcom/google/sigma_gson/JsonDeserializationVisitor;
.source "JsonObjectDeserializationVisitor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/sigma_gson/JsonDeserializationVisitor",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V
    .locals 0
    .parameter "json"
    .parameter "type"
    .parameter "factory"
    .parameter "objectConstructor"
    .parameter
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/JsonElement;",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/sigma_gson/ObjectNavigatorFactory;",
            "Lcom/google/sigma_gson/ObjectConstructor;",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;",
            "Lcom/google/sigma_gson/JsonDeserializationContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    .local p5, deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    invoke-direct/range {p0 .. p6}, Lcom/google/sigma_gson/JsonDeserializationVisitor;-><init>(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V

    .line 35
    return-void
.end method

.method private getFieldName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;
    .locals 2
    .parameter "f"

    .prologue
    .line 91
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    iget-object v1, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    invoke-virtual {v1}, Lcom/google/sigma_gson/ObjectNavigatorFactory;->getFieldNamingPolicy()Lcom/google/sigma_gson/FieldNamingStrategy2;

    move-result-object v0

    .line 92
    .local v0, namingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;
    invoke-interface {v0, p1}, Lcom/google/sigma_gson/FieldNamingStrategy2;->translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected constructTarget()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    iget-object v1, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->targetType:Ljava/lang/reflect/Type;

    invoke-interface {v0, v1}, Lcom/google/sigma_gson/ObjectConstructor;->construct(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public startVisitingObject(Ljava/lang/Object;)V
    .locals 0
    .parameter "node"

    .prologue
    .line 45
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    return-void
.end method

.method public visitArray(Ljava/lang/Object;Ljava/lang/reflect/Type;)V
    .locals 3
    .parameter "array"
    .parameter "componentType"

    .prologue
    .line 49
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expecting object but found array: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visitArrayField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 8
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 73
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    :try_start_0
    iget-object v5, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->isJsonObject()Z

    move-result v5

    if-nez v5, :cond_0

    .line 74
    new-instance v5, Lcom/google/sigma_gson/JsonParseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expecting object found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :catch_0
    move-exception v1

    .line 86
    .local v1, e:Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 76
    .end local v1           #e:Ljava/lang/IllegalAccessException;
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v4

    .line 77
    .local v4, jsonObject:Lcom/google/sigma_gson/JsonObject;
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->getFieldName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, fName:Ljava/lang/String;
    invoke-virtual {v4, v2}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v3

    check-cast v3, Lcom/google/sigma_gson/JsonArray;

    .line 79
    .local v3, jsonChild:Lcom/google/sigma_gson/JsonArray;
    if-eqz v3, :cond_1

    .line 80
    invoke-virtual {p0, p2, v3}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->visitChildAsArray(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonArray;)Ljava/lang/Object;

    move-result-object v0

    .line 81
    .local v0, array:Ljava/lang/Object;
    invoke-virtual {p1, p3, v0}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .end local v0           #array:Ljava/lang/Object;
    :goto_0
    return-void

    .line 83
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {p1, p3, v5}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public visitFieldUsingCustomHandler(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)Z
    .locals 11
    .parameter "f"
    .parameter "declaredTypeOfField"
    .parameter "parent"

    .prologue
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 97
    :try_start_0
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->getFieldName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, fName:Ljava/lang/String;
    iget-object v9, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v9}, Lcom/google/sigma_gson/JsonElement;->isJsonObject()Z

    move-result v9

    if-nez v9, :cond_0

    .line 99
    new-instance v7, Lcom/google/sigma_gson/JsonParseException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Expecting object found: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .end local v2           #fName:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 122
    .local v1, e:Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7}, Ljava/lang/RuntimeException;-><init>()V

    throw v7

    .line 101
    .end local v1           #e:Ljava/lang/IllegalAccessException;
    .restart local v2       #fName:Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v9, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v9}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v9

    invoke-virtual {v9, v2}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 102
    .local v0, child:Lcom/google/sigma_gson/JsonElement;
    new-instance v5, Lcom/google/sigma_gson/TypeInfo;

    invoke-direct {v5, p2}, Lcom/google/sigma_gson/TypeInfo;-><init>(Ljava/lang/reflect/Type;)V

    .line 103
    .local v5, typeInfo:Lcom/google/sigma_gson/TypeInfo;
    if-nez v0, :cond_2

    .line 120
    :cond_1
    :goto_0
    return v7

    .line 105
    :cond_2
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 106
    invoke-virtual {v5}, Lcom/google/sigma_gson/TypeInfo;->isPrimitive()Z

    move-result v8

    if-nez v8, :cond_1

    .line 107
    const/4 v8, 0x0

    invoke-virtual {p1, p3, v8}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 111
    :cond_3
    new-instance v3, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v3, v9, p2, v10}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    .line 112
    .local v3, objTypePair:Lcom/google/sigma_gson/ObjectTypePair;
    iget-object v9, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v3, v9}, Lcom/google/sigma_gson/ObjectTypePair;->getMatchingHandler(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)Lcom/google/sigma_gson/Pair;

    move-result-object v4

    .line 113
    .local v4, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Lcom/google/sigma_gson/JsonDeserializer<*>;Lcom/google/sigma_gson/ObjectTypePair;>;"
    if-nez v4, :cond_4

    move v7, v8

    .line 114
    goto :goto_0

    .line 116
    :cond_4
    invoke-virtual {p0, v0, v4}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->invokeCustomDeserializer(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/Pair;)Ljava/lang/Object;

    move-result-object v6

    .line 117
    .local v6, value:Ljava/lang/Object;
    if-nez v6, :cond_5

    invoke-virtual {v5}, Lcom/google/sigma_gson/TypeInfo;->isPrimitive()Z

    move-result v8

    if-nez v8, :cond_1

    .line 118
    :cond_5
    invoke-virtual {p1, p3, v6}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public visitObjectField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 8
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 54
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    :try_start_0
    iget-object v5, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->isJsonObject()Z

    move-result v5

    if-nez v5, :cond_0

    .line 55
    new-instance v5, Lcom/google/sigma_gson/JsonParseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expecting object found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :catch_0
    move-exception v1

    .line 67
    .local v1, e:Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 57
    .end local v1           #e:Ljava/lang/IllegalAccessException;
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v4

    .line 58
    .local v4, jsonObject:Lcom/google/sigma_gson/JsonObject;
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->getFieldName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v2

    .line 59
    .local v2, fName:Ljava/lang/String;
    invoke-virtual {v4, v2}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v3

    .line 60
    .local v3, jsonChild:Lcom/google/sigma_gson/JsonElement;
    if-eqz v3, :cond_1

    .line 61
    invoke-virtual {p0, p2, v3}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->visitChildAsObject(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonElement;)Ljava/lang/Object;

    move-result-object v0

    .line 62
    .local v0, child:Ljava/lang/Object;
    invoke-virtual {p1, p3, v0}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .end local v0           #child:Ljava/lang/Object;
    :goto_0
    return-void

    .line 64
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {p1, p3, v5}, Lcom/google/sigma_gson/FieldAttributes;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public visitPrimitive(Ljava/lang/Object;)V
    .locals 4
    .parameter "primitive"

    .prologue
    .line 128
    .local p0, this:Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;,"Lcom/google/sigma_gson/JsonObjectDeserializationVisitor<TT;>;"
    iget-object v1, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonElement;->isJsonPrimitive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 129
    new-instance v1, Lcom/google/sigma_gson/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Type information is unavailable, and the target object is not a primitive: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 132
    :cond_0
    iget-object v1, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonPrimitive()Lcom/google/sigma_gson/JsonPrimitive;

    move-result-object v0

    .line 133
    .local v0, prim:Lcom/google/sigma_gson/JsonPrimitive;
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonPrimitive;->getAsObject()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;->target:Ljava/lang/Object;

    .line 134
    return-void
.end method
