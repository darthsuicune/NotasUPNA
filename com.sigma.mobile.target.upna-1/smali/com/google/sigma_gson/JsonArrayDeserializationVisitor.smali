.class final Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;
.super Lcom/google/sigma_gson/JsonDeserializationVisitor;
.source "JsonArrayDeserializationVisitor.java"


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
.method constructor <init>(Lcom/google/sigma_gson/JsonArray;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V
    .locals 0
    .parameter "jsonArray"
    .parameter "arrayType"
    .parameter "factory"
    .parameter "objectConstructor"
    .parameter
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/JsonArray;",
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
    .line 35
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    .local p5, deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    invoke-direct/range {p0 .. p6}, Lcom/google/sigma_gson/JsonDeserializationVisitor;-><init>(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected constructTarget()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v2, Lcom/google/sigma_gson/TypeInfo;

    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->targetType:Ljava/lang/reflect/Type;

    invoke-direct {v2, v3}, Lcom/google/sigma_gson/TypeInfo;-><init>(Ljava/lang/reflect/Type;)V

    .line 44
    .local v2, typeInfo:Lcom/google/sigma_gson/TypeInfo;
    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonElement;->isJsonArray()Z

    move-result v3

    if-nez v3, :cond_0

    .line 45
    new-instance v3, Lcom/google/sigma_gson/JsonParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expecting array found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 47
    :cond_0
    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v1

    .line 48
    .local v1, jsonArray:Lcom/google/sigma_gson/JsonArray;
    invoke-virtual {v2}, Lcom/google/sigma_gson/TypeInfo;->isArray()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 49
    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->targetType:Ljava/lang/reflect/Type;

    invoke-static {v3}, Lcom/google/sigma_gson/TypeInfoFactory;->getTypeInfoForArray(Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/TypeInfoArray;

    move-result-object v0

    .line 52
    .local v0, arrayTypeInfo:Lcom/google/sigma_gson/TypeInfoArray;
    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    invoke-virtual {v0}, Lcom/google/sigma_gson/TypeInfoArray;->getSecondLevelType()Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonArray;->size()I

    move-result v5

    invoke-interface {v3, v4, v5}, Lcom/google/sigma_gson/ObjectConstructor;->constructArray(Ljava/lang/reflect/Type;I)Ljava/lang/Object;

    move-result-object v3

    .line 56
    .end local v0           #arrayTypeInfo:Lcom/google/sigma_gson/TypeInfoArray;
    :goto_0
    return-object v3

    :cond_1
    iget-object v3, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    invoke-virtual {v2}, Lcom/google/sigma_gson/TypeInfo;->getRawClass()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/google/sigma_gson/ObjectConstructor;->construct(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public startVisitingObject(Ljava/lang/Object;)V
    .locals 3
    .parameter "node"

    .prologue
    .line 90
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expecting array but found object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visitArray(Ljava/lang/Object;Ljava/lang/reflect/Type;)V
    .locals 8
    .parameter "array"
    .parameter "arrayType"

    .prologue
    .line 60
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    iget-object v5, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->isJsonArray()Z

    move-result v5

    if-nez v5, :cond_0

    .line 61
    new-instance v5, Lcom/google/sigma_gson/JsonParseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expecting array found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 63
    :cond_0
    iget-object v5, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v3

    .line 64
    .local v3, jsonArray:Lcom/google/sigma_gson/JsonArray;
    invoke-static {p2}, Lcom/google/sigma_gson/TypeInfoFactory;->getTypeInfoForArray(Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/TypeInfoArray;

    move-result-object v0

    .line 65
    .local v0, arrayTypeInfo:Lcom/google/sigma_gson/TypeInfoArray;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonArray;->size()I

    move-result v5

    if-ge v2, v5, :cond_6

    .line 66
    invoke-virtual {v3, v2}, Lcom/google/sigma_gson/JsonArray;->get(I)Lcom/google/sigma_gson/JsonElement;

    move-result-object v4

    .line 69
    .local v4, jsonChild:Lcom/google/sigma_gson/JsonElement;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 70
    :cond_1
    const/4 v1, 0x0

    .line 81
    :goto_1
    invoke-static {p1, v2, v1}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 65
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 71
    :cond_2
    instance-of v5, v4, Lcom/google/sigma_gson/JsonObject;

    if-eqz v5, :cond_3

    .line 72
    invoke-virtual {v0}, Lcom/google/sigma_gson/TypeInfoArray;->getComponentRawType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v4}, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->visitChildAsObject(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonElement;)Ljava/lang/Object;

    move-result-object v1

    .local v1, child:Ljava/lang/Object;
    goto :goto_1

    .line 73
    .end local v1           #child:Ljava/lang/Object;
    :cond_3
    instance-of v5, v4, Lcom/google/sigma_gson/JsonArray;

    if-eqz v5, :cond_4

    .line 74
    invoke-virtual {v0}, Lcom/google/sigma_gson/TypeInfoArray;->getSecondLevelType()Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->visitChildAsArray(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonArray;)Ljava/lang/Object;

    move-result-object v1

    .restart local v1       #child:Ljava/lang/Object;
    goto :goto_1

    .line 75
    .end local v1           #child:Ljava/lang/Object;
    :cond_4
    instance-of v5, v4, Lcom/google/sigma_gson/JsonPrimitive;

    if-eqz v5, :cond_5

    .line 76
    invoke-virtual {v0}, Lcom/google/sigma_gson/TypeInfoArray;->getComponentRawType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/sigma_gson/JsonElement;->getAsJsonPrimitive()Lcom/google/sigma_gson/JsonPrimitive;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->visitChildAsObject(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonElement;)Ljava/lang/Object;

    move-result-object v1

    .restart local v1       #child:Ljava/lang/Object;
    goto :goto_1

    .line 79
    .end local v1           #child:Ljava/lang/Object;
    :cond_5
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 83
    .end local v4           #jsonChild:Lcom/google/sigma_gson/JsonElement;
    :cond_6
    return-void
.end method

.method public visitArrayField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 3
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 94
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expecting array but found array field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visitFieldUsingCustomHandler(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)Z
    .locals 3
    .parameter "f"
    .parameter "actualTypeOfField"
    .parameter "parent"

    .prologue
    .line 104
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expecting array but found field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visitObjectField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 3
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 99
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expecting array but found object field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visitPrimitive(Ljava/lang/Object;)V
    .locals 3
    .parameter "primitive"

    .prologue
    .line 109
    .local p0, this:Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;,"Lcom/google/sigma_gson/JsonArrayDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Type information is unavailable, and the target is not a primitive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
