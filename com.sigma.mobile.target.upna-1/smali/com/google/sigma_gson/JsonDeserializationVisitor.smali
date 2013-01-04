.class abstract Lcom/google/sigma_gson/JsonDeserializationVisitor;
.super Ljava/lang/Object;
.source "JsonDeserializationVisitor.java"

# interfaces
.implements Lcom/google/sigma_gson/ObjectNavigator$Visitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/ObjectNavigator$Visitor;"
    }
.end annotation


# instance fields
.field protected constructed:Z

.field protected final context:Lcom/google/sigma_gson/JsonDeserializationContext;

.field protected final deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected final factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

.field protected final json:Lcom/google/sigma_gson/JsonElement;

.field protected final objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

.field protected target:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final targetType:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V
    .locals 1
    .parameter "json"
    .parameter "targetType"
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
    .line 43
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    .local p5, deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 45
    iput-object p2, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->targetType:Ljava/lang/reflect/Type;

    .line 46
    iput-object p3, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    .line 47
    iput-object p4, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    .line 48
    iput-object p5, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 49
    iput-object p1, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    .line 50
    iput-object p6, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->context:Lcom/google/sigma_gson/JsonDeserializationContext;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->constructed:Z

    .line 52
    return-void
.end method

.method private visitChild(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationVisitor;)Ljava/lang/Object;
    .locals 5
    .parameter "type"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/sigma_gson/JsonDeserializationVisitor",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    .local p2, childVisitor:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<*>;"
    iget-object v1, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    new-instance v2, Lcom/google/sigma_gson/ObjectTypePair;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v3, p1, v4}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    invoke-virtual {v1, v2}, Lcom/google/sigma_gson/ObjectNavigatorFactory;->create(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectNavigator;

    move-result-object v0

    .line 107
    .local v0, on:Lcom/google/sigma_gson/ObjectNavigator;
    invoke-virtual {v0, p2}, Lcom/google/sigma_gson/ObjectNavigator;->accept(Lcom/google/sigma_gson/ObjectNavigator$Visitor;)V

    .line 110
    invoke-virtual {p2}, Lcom/google/sigma_gson/JsonDeserializationVisitor;->getTarget()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected abstract constructTarget()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public end(Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 0
    .parameter "node"

    .prologue
    .line 68
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    return-void
.end method

.method public getTarget()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    iget-boolean v0, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->constructed:Z

    if-nez v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonDeserializationVisitor;->constructTarget()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->target:Ljava/lang/Object;

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->constructed:Z

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->target:Ljava/lang/Object;

    return-object v0
.end method

.method protected invokeCustomDeserializer(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/Pair;)Ljava/lang/Object;
    .locals 3
    .parameter "element"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/JsonElement;",
            "Lcom/google/sigma_gson/Pair",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;",
            "Lcom/google/sigma_gson/ObjectTypePair;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    .local p2, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Lcom/google/sigma_gson/JsonDeserializer<*>;Lcom/google/sigma_gson/ObjectTypePair;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 85
    :cond_0
    const/4 v1, 0x0

    .line 88
    :goto_0
    return-object v1

    .line 87
    :cond_1
    iget-object v1, p2, Lcom/google/sigma_gson/Pair;->second:Ljava/lang/Object;

    check-cast v1, Lcom/google/sigma_gson/ObjectTypePair;

    iget-object v0, v1, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    .line 88
    .local v0, objType:Ljava/lang/reflect/Type;
    iget-object v1, p2, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/google/sigma_gson/JsonDeserializer;

    iget-object v2, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->context:Lcom/google/sigma_gson/JsonDeserializationContext;

    invoke-interface {v1, p1, v0, v2}, Lcom/google/sigma_gson/JsonDeserializer;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public start(Lcom/google/sigma_gson/ObjectTypePair;)V
    .locals 0
    .parameter "node"

    .prologue
    .line 65
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    return-void
.end method

.method final visitChildAsArray(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonArray;)Ljava/lang/Object;
    .locals 7
    .parameter "childType"
    .parameter "jsonChild"

    .prologue
    .line 99
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;

    invoke-virtual {p2}, Lcom/google/sigma_gson/JsonArray;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v1

    iget-object v3, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    iget-object v4, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    iget-object v5, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    iget-object v6, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->context:Lcom/google/sigma_gson/JsonDeserializationContext;

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/sigma_gson/JsonArrayDeserializationVisitor;-><init>(Lcom/google/sigma_gson/JsonArray;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V

    .line 102
    .local v0, childVisitor:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<*>;"
    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/JsonDeserializationVisitor;->visitChild(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationVisitor;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method final visitChildAsObject(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonElement;)Ljava/lang/Object;
    .locals 7
    .parameter "childType"
    .parameter "jsonChild"

    .prologue
    .line 92
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;

    iget-object v3, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->factory:Lcom/google/sigma_gson/ObjectNavigatorFactory;

    iget-object v4, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->objectConstructor:Lcom/google/sigma_gson/ObjectConstructor;

    iget-object v5, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    iget-object v6, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->context:Lcom/google/sigma_gson/JsonDeserializationContext;

    move-object v1, p2

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/sigma_gson/JsonObjectDeserializationVisitor;-><init>(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ObjectConstructor;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/JsonDeserializationContext;)V

    .line 95
    .local v0, childVisitor:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<*>;"
    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/JsonDeserializationVisitor;->visitChild(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationVisitor;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final visitUsingCustomHandler(Lcom/google/sigma_gson/ObjectTypePair;)Z
    .locals 4
    .parameter "objTypePair"

    .prologue
    .local p0, this:Lcom/google/sigma_gson/JsonDeserializationVisitor;,"Lcom/google/sigma_gson/JsonDeserializationVisitor<TT;>;"
    const/4 v2, 0x1

    .line 72
    iget-object v3, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {p1, v3}, Lcom/google/sigma_gson/ObjectTypePair;->getMatchingHandler(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)Lcom/google/sigma_gson/Pair;

    move-result-object v0

    .line 73
    .local v0, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Lcom/google/sigma_gson/JsonDeserializer<*>;Lcom/google/sigma_gson/ObjectTypePair;>;"
    if-nez v0, :cond_0

    .line 74
    const/4 v2, 0x0

    .line 79
    :goto_0
    return v2

    .line 76
    :cond_0
    iget-object v3, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->json:Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {p0, v3, v0}, Lcom/google/sigma_gson/JsonDeserializationVisitor;->invokeCustomDeserializer(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/Pair;)Ljava/lang/Object;

    move-result-object v1

    .line 77
    .local v1, value:Ljava/lang/Object;
    iput-object v1, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->target:Ljava/lang/Object;

    .line 78
    iput-boolean v2, p0, Lcom/google/sigma_gson/JsonDeserializationVisitor;->constructed:Z

    goto :goto_0
.end method
