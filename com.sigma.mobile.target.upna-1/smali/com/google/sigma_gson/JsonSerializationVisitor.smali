.class final Lcom/google/sigma_gson/JsonSerializationVisitor;
.super Ljava/lang/Object;
.source "JsonSerializationVisitor.java"

# interfaces
.implements Lcom/google/sigma_gson/ObjectNavigator$Visitor;


# instance fields
.field private final ancestors:Lcom/google/sigma_gson/MemoryRefStack;

.field private final context:Lcom/google/sigma_gson/JsonSerializationContext;

.field private final factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

.field private root:Lcom/google/sigma_gson/JsonElement;

.field private final serializeNulls:Z

.field private final serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonSerializationContext;Lcom/google/sigma_gson/MemoryRefStack;)V
    .locals 0
    .parameter "factory"
    .parameter "serializeNulls"
    .parameter
    .parameter "context"
    .parameter "ancestors"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/ObjectNavigatorFactory;",
            "Z",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;",
            "Lcom/google/sigma_gson/JsonSerializationContext;",
            "Lcom/google/sigma_gson/MemoryRefStack;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    .line 41
    iput-boolean p2, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    .line 42
    iput-object p3, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 43
    iput-object p4, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->context:Lcom/google/sigma_gson/JsonSerializationContext;

    .line 44
    iput-object p5, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    .line 45
    return-void
.end method

.method private addAsArrayElement(Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 3
    .parameter "elementTypePair"

    .prologue
    .line 135
    invoke-virtual {p1}, Lcom/google/sigma_gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v1

    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/sigma_gson/JsonArray;->add(Lcom/google/sigma_gson/JsonElement;)V

    .line 141
    :goto_0
    return-void

    .line 138
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getJsonElementForChild(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 139
    .local v0, childElement:Lcom/google/sigma_gson/JsonElement;
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/sigma_gson/JsonArray;->add(Lcom/google/sigma_gson/JsonElement;)V

    goto :goto_0
.end method

.method private addAsChildOfObject(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 1
    .parameter "f"
    .parameter "fieldValuePair"

    .prologue
    .line 125
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getJsonElementForChild(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 126
    .local v0, childElement:Lcom/google/sigma_gson/JsonElement;
    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V

    .line 127
    return-void
.end method

.method private addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V
    .locals 3
    .parameter "f"
    .parameter "childElement"

    .prologue
    .line 130
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    invoke-virtual {v1}, Lcom/google/sigma_gson/ObjectNavigatorFactory;->getFieldNamingPolicy()Lcom/google/sigma_gson/FieldNamingStrategy2;

    move-result-object v0

    .line 131
    .local v0, namingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v1

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/FieldNamingStrategy2;->translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    .line 132
    return-void
.end method

.method private assignToRoot(Lcom/google/sigma_gson/JsonElement;)V
    .locals 0
    .parameter "newRoot"

    .prologue
    .line 217
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 218
    iput-object p1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    .line 219
    return-void
.end method

.method private findAndInvokeCustomSerializer(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;
    .locals 6
    .parameter "objTypePair"

    .prologue
    .line 176
    iget-object v3, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {p1, v3}, Lcom/google/sigma_gson/ObjectTypePair;->getMatchingHandler(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)Lcom/google/sigma_gson/Pair;

    move-result-object v1

    .line 177
    .local v1, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Lcom/google/sigma_gson/JsonSerializer<*>;Lcom/google/sigma_gson/ObjectTypePair;>;"
    if-nez v1, :cond_0

    .line 178
    const/4 v0, 0x0

    .line 188
    :goto_0
    return-object v0

    .line 180
    :cond_0
    iget-object v2, v1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lcom/google/sigma_gson/JsonSerializer;

    .line 181
    .local v2, serializer:Lcom/google/sigma_gson/JsonSerializer;
    iget-object p1, v1, Lcom/google/sigma_gson/Pair;->second:Ljava/lang/Object;

    .end local p1
    check-cast p1, Lcom/google/sigma_gson/ObjectTypePair;

    .line 182
    .restart local p1
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->start(Lcom/google/sigma_gson/ObjectTypePair;)V

    .line 184
    :try_start_0
    invoke-virtual {p1}, Lcom/google/sigma_gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/sigma_gson/ObjectTypePair;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    iget-object v5, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->context:Lcom/google/sigma_gson/JsonSerializationContext;

    invoke-interface {v2, v3, v4, v5}, Lcom/google/sigma_gson/JsonSerializer;->serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 186
    .local v0, element:Lcom/google/sigma_gson/JsonElement;
    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 188
    .end local v0           #element:Lcom/google/sigma_gson/JsonElement;
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->end(Lcom/google/sigma_gson/ObjectTypePair;)V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->end(Lcom/google/sigma_gson/ObjectTypePair;)V

    throw v3
.end method

.method private getFieldValue(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "f"
    .parameter "obj"

    .prologue
    .line 227
    :try_start_0
    invoke-virtual {p1, p2}, Lcom/google/sigma_gson/FieldAttributes;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 228
    :catch_0
    move-exception v0

    .line 229
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getJsonElementForChild(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;
    .locals 7
    .parameter "fieldValueTypePair"

    .prologue
    .line 144
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    invoke-virtual {v1, p1}, Lcom/google/sigma_gson/ObjectNavigatorFactory;->create(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectNavigator;

    move-result-object v6

    .line 145
    .local v6, on:Lcom/google/sigma_gson/ObjectNavigator;
    new-instance v0, Lcom/google/sigma_gson/JsonSerializationVisitor;

    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    iget-boolean v2, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    iget-object v3, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    iget-object v4, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->context:Lcom/google/sigma_gson/JsonSerializationContext;

    iget-object v5, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    invoke-direct/range {v0 .. v5}, Lcom/google/sigma_gson/JsonSerializationVisitor;-><init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonSerializationContext;Lcom/google/sigma_gson/MemoryRefStack;)V

    .line 147
    .local v0, childVisitor:Lcom/google/sigma_gson/JsonSerializationVisitor;
    invoke-virtual {v6, v0}, Lcom/google/sigma_gson/ObjectNavigator;->accept(Lcom/google/sigma_gson/ObjectNavigator$Visitor;)V

    .line 148
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getJsonElement()Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    return-object v1
.end method

.method private isFieldNull(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Z
    .locals 1
    .parameter "f"
    .parameter "obj"

    .prologue
    .line 222
    invoke-direct {p0, p1, p2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getFieldValue(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public end(Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 1
    .parameter "node"

    .prologue
    .line 62
    if-eqz p1, :cond_0

    .line 63
    iget-object v0, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    invoke-virtual {v0}, Lcom/google/sigma_gson/MemoryRefStack;->pop()Lcom/google/sigma_gson/ObjectTypePair;

    .line 65
    :cond_0
    return-void
.end method

.method public getJsonElement()Lcom/google/sigma_gson/JsonElement;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    return-object v0
.end method

.method public getTarget()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    return-object v0
.end method

.method public start(Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 1
    .parameter "node"

    .prologue
    .line 52
    if-nez p1, :cond_0

    .line 59
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    invoke-virtual {v0, p1}, Lcom/google/sigma_gson/MemoryRefStack;->contains(Lcom/google/sigma_gson/ObjectTypePair;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 56
    new-instance v0, Lcom/google/sigma_gson/CircularReferenceException;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/CircularReferenceException;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    invoke-virtual {v0, p1}, Lcom/google/sigma_gson/MemoryRefStack;->push(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectTypePair;

    goto :goto_0
.end method

.method public startVisitingObject(Ljava/lang/Object;)V
    .locals 1
    .parameter "node"

    .prologue
    .line 68
    new-instance v0, Lcom/google/sigma_gson/JsonObject;

    invoke-direct {v0}, Lcom/google/sigma_gson/JsonObject;-><init>()V

    invoke-direct {p0, v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->assignToRoot(Lcom/google/sigma_gson/JsonElement;)V

    .line 69
    return-void
.end method

.method public visitArray(Ljava/lang/Object;Ljava/lang/reflect/Type;)V
    .locals 8
    .parameter "array"
    .parameter "arrayType"

    .prologue
    .line 72
    new-instance v6, Lcom/google/sigma_gson/JsonArray;

    invoke-direct {v6}, Lcom/google/sigma_gson/JsonArray;-><init>()V

    invoke-direct {p0, v6}, Lcom/google/sigma_gson/JsonSerializationVisitor;->assignToRoot(Lcom/google/sigma_gson/JsonElement;)V

    .line 73
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v5

    .line 74
    .local v5, length:I
    invoke-static {p2}, Lcom/google/sigma_gson/TypeInfoFactory;->getTypeInfoForArray(Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/TypeInfoArray;

    move-result-object v3

    .line 75
    .local v3, fieldTypeInfo:Lcom/google/sigma_gson/TypeInfoArray;
    invoke-virtual {v3}, Lcom/google/sigma_gson/TypeInfoArray;->getSecondLevelType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 76
    .local v2, componentType:Ljava/lang/reflect/Type;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v5, :cond_0

    .line 77
    invoke-static {p1, v4}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    .line 78
    .local v0, child:Ljava/lang/Object;
    move-object v1, v2

    .line 82
    .local v1, childType:Ljava/lang/reflect/Type;
    new-instance v6, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v1, v7}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    invoke-direct {p0, v6}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addAsArrayElement(Lcom/google/sigma_gson/ObjectTypePair;)V

    .line 76
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 84
    .end local v0           #child:Ljava/lang/Object;
    .end local v1           #childType:Ljava/lang/reflect/Type;
    :cond_0
    return-void
.end method

.method public visitArrayField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 4
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 88
    :try_start_0
    invoke-direct {p0, p1, p3}, Lcom/google/sigma_gson/JsonSerializationVisitor;->isFieldNull(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 89
    iget-boolean v2, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    if-eqz v2, :cond_0

    .line 90
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 93
    :cond_1
    invoke-direct {p0, p1, p3}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getFieldValue(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 94
    .local v0, array:Ljava/lang/Object;
    new-instance v2, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v3, 0x0

    invoke-direct {v2, v0, p2, v3}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    invoke-direct {p0, p1, v2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addAsChildOfObject(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/ObjectTypePair;)V
    :try_end_0
    .catch Lcom/google/sigma_gson/CircularReferenceException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    .end local v0           #array:Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 97
    .local v1, e:Lcom/google/sigma_gson/CircularReferenceException;
    invoke-virtual {v1, p1}, Lcom/google/sigma_gson/CircularReferenceException;->createDetailedException(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/IllegalStateException;

    move-result-object v2

    throw v2
.end method

.method public visitFieldUsingCustomHandler(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)Z
    .locals 7
    .parameter "f"
    .parameter "declaredTypeOfField"
    .parameter "parent"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 194
    :try_start_0
    iget-object v6, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->root:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v6}, Lcom/google/sigma_gson/JsonElement;->isJsonObject()Z

    move-result v6

    invoke-static {v6}, Lcom/google/sigma_gson/Preconditions;->checkState(Z)V

    .line 195
    invoke-virtual {p1, p3}, Lcom/google/sigma_gson/FieldAttributes;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 196
    .local v2, obj:Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 197
    iget-boolean v5, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    if-eqz v5, :cond_0

    .line 198
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v5

    invoke-direct {p0, p1, v5}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V

    .line 208
    :cond_0
    :goto_0
    return v4

    .line 202
    :cond_1
    new-instance v3, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v6, 0x0

    invoke-direct {v3, v2, p2, v6}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    .line 203
    .local v3, objTypePair:Lcom/google/sigma_gson/ObjectTypePair;
    invoke-direct {p0, v3}, Lcom/google/sigma_gson/JsonSerializationVisitor;->findAndInvokeCustomSerializer(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 204
    .local v0, child:Lcom/google/sigma_gson/JsonElement;
    if-eqz v0, :cond_2

    .line 205
    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/sigma_gson/CircularReferenceException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 209
    .end local v0           #child:Lcom/google/sigma_gson/JsonElement;
    .end local v2           #obj:Ljava/lang/Object;
    .end local v3           #objTypePair:Lcom/google/sigma_gson/ObjectTypePair;
    :catch_0
    move-exception v1

    .line 210
    .local v1, e:Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4}, Ljava/lang/RuntimeException;-><init>()V

    throw v4

    .end local v1           #e:Ljava/lang/IllegalAccessException;
    .restart local v0       #child:Lcom/google/sigma_gson/JsonElement;
    .restart local v2       #obj:Ljava/lang/Object;
    .restart local v3       #objTypePair:Lcom/google/sigma_gson/ObjectTypePair;
    :cond_2
    move v4, v5

    .line 208
    goto :goto_0

    .line 211
    .end local v0           #child:Lcom/google/sigma_gson/JsonElement;
    .end local v2           #obj:Ljava/lang/Object;
    .end local v3           #objTypePair:Lcom/google/sigma_gson/ObjectTypePair;
    :catch_1
    move-exception v1

    .line 212
    .local v1, e:Lcom/google/sigma_gson/CircularReferenceException;
    invoke-virtual {v1, p1}, Lcom/google/sigma_gson/CircularReferenceException;->createDetailedException(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/IllegalStateException;

    move-result-object v4

    throw v4
.end method

.method public visitObjectField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 4
    .parameter "f"
    .parameter "typeOfF"
    .parameter "obj"

    .prologue
    .line 103
    :try_start_0
    invoke-direct {p0, p1, p3}, Lcom/google/sigma_gson/JsonSerializationVisitor;->isFieldNull(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 104
    iget-boolean v2, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    if-eqz v2, :cond_0

    .line 105
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addChildAsElement(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/JsonElement;)V

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    invoke-direct {p0, p1, p3}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getFieldValue(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 112
    .local v1, fieldValue:Ljava/lang/Object;
    new-instance v2, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v3, 0x0

    invoke-direct {v2, v1, p2, v3}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    invoke-direct {p0, p1, v2}, Lcom/google/sigma_gson/JsonSerializationVisitor;->addAsChildOfObject(Lcom/google/sigma_gson/FieldAttributes;Lcom/google/sigma_gson/ObjectTypePair;)V
    :try_end_0
    .catch Lcom/google/sigma_gson/CircularReferenceException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 114
    .end local v1           #fieldValue:Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 115
    .local v0, e:Lcom/google/sigma_gson/CircularReferenceException;
    invoke-virtual {v0, p1}, Lcom/google/sigma_gson/CircularReferenceException;->createDetailedException(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/IllegalStateException;

    move-result-object v2

    throw v2
.end method

.method public visitPrimitive(Ljava/lang/Object;)V
    .locals 1
    .parameter "obj"

    .prologue
    .line 120
    if-nez p1, :cond_0

    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    .line 121
    .local v0, json:Lcom/google/sigma_gson/JsonElement;
    :goto_0
    invoke-direct {p0, v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->assignToRoot(Lcom/google/sigma_gson/JsonElement;)V

    .line 122
    return-void

    .line 120
    .end local v0           #json:Lcom/google/sigma_gson/JsonElement;
    :cond_0
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public visitUsingCustomHandler(Lcom/google/sigma_gson/ObjectTypePair;)Z
    .locals 5
    .parameter "objTypePair"

    .prologue
    const/4 v3, 0x1

    .line 153
    :try_start_0
    invoke-virtual {p1}, Lcom/google/sigma_gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v2

    .line 154
    .local v2, obj:Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 155
    iget-boolean v4, p0, Lcom/google/sigma_gson/JsonSerializationVisitor;->serializeNulls:Z

    if-eqz v4, :cond_0

    .line 156
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/sigma_gson/JsonSerializationVisitor;->assignToRoot(Lcom/google/sigma_gson/JsonElement;)V

    .line 165
    :cond_0
    :goto_0
    return v3

    .line 160
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->findAndInvokeCustomSerializer(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    .line 161
    .local v1, element:Lcom/google/sigma_gson/JsonElement;
    if-eqz v1, :cond_2

    .line 162
    invoke-direct {p0, v1}, Lcom/google/sigma_gson/JsonSerializationVisitor;->assignToRoot(Lcom/google/sigma_gson/JsonElement;)V
    :try_end_0
    .catch Lcom/google/sigma_gson/CircularReferenceException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 166
    .end local v1           #element:Lcom/google/sigma_gson/JsonElement;
    .end local v2           #obj:Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 167
    .local v0, e:Lcom/google/sigma_gson/CircularReferenceException;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/sigma_gson/CircularReferenceException;->createDetailedException(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/IllegalStateException;

    move-result-object v3

    throw v3

    .line 165
    .end local v0           #e:Lcom/google/sigma_gson/CircularReferenceException;
    .restart local v1       #element:Lcom/google/sigma_gson/JsonElement;
    .restart local v2       #obj:Ljava/lang/Object;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method
