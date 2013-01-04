.class final Lcom/google/sigma_gson/JsonSerializationContextDefault;
.super Ljava/lang/Object;
.source "JsonSerializationContextDefault.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonSerializationContext;


# instance fields
.field private final ancestors:Lcom/google/sigma_gson/MemoryRefStack;

.field private final factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

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
.method constructor <init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V
    .locals 1
    .parameter "factory"
    .parameter "serializeNulls"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/ObjectNavigatorFactory;",
            "Z",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    .line 36
    iput-boolean p2, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serializeNulls:Z

    .line 37
    iput-object p3, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 38
    new-instance v0, Lcom/google/sigma_gson/MemoryRefStack;

    invoke-direct {v0}, Lcom/google/sigma_gson/MemoryRefStack;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    .line 39
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;
    .locals 2
    .parameter "src"

    .prologue
    .line 42
    if-nez p1, :cond_0

    .line 43
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    .line 45
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    goto :goto_0
.end method

.method public serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "src"
    .parameter "typeOfSrc"

    .prologue
    .line 49
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)Lcom/google/sigma_gson/JsonElement;
    .locals 7
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "preserveType"

    .prologue
    .line 53
    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    new-instance v2, Lcom/google/sigma_gson/ObjectTypePair;

    invoke-direct {v2, p1, p2, p3}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    invoke-virtual {v1, v2}, Lcom/google/sigma_gson/ObjectNavigatorFactory;->create(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectNavigator;

    move-result-object v6

    .line 54
    .local v6, on:Lcom/google/sigma_gson/ObjectNavigator;
    new-instance v0, Lcom/google/sigma_gson/JsonSerializationVisitor;

    iget-object v1, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    iget-boolean v2, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serializeNulls:Z

    iget-object v3, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    iget-object v5, p0, Lcom/google/sigma_gson/JsonSerializationContextDefault;->ancestors:Lcom/google/sigma_gson/MemoryRefStack;

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/sigma_gson/JsonSerializationVisitor;-><init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonSerializationContext;Lcom/google/sigma_gson/MemoryRefStack;)V

    .line 56
    .local v0, visitor:Lcom/google/sigma_gson/JsonSerializationVisitor;
    invoke-virtual {v6, v0}, Lcom/google/sigma_gson/ObjectNavigator;->accept(Lcom/google/sigma_gson/ObjectNavigator$Visitor;)V

    .line 57
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonSerializationVisitor;->getJsonElement()Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    return-object v1
.end method
