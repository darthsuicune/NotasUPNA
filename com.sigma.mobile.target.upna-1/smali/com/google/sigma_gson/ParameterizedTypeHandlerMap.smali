.class final Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
.super Ljava/lang/Object;
.source "ParameterizedTypeHandlerMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Type;",
            "TT;>;"
        }
    .end annotation
.end field

.field private modifiable:Z

.field private final typeHierarchyList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/sigma_gson/Pair",
            "<",
            "Ljava/lang/Class",
            "<*>;TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 36
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z

    return-void
.end method

.method private getHandlerForTypeHierarchy(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)TT;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    iget-object v2, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/Pair;

    .line 138
    .local v0, entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    iget-object v2, v0, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 139
    iget-object v2, v0, Lcom/google/sigma_gson/Pair;->second:Ljava/lang/Object;

    .line 142
    .end local v0           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getIndexOfAnOverriddenHandler(Ljava/lang/Class;)I
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    iget-object v2, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-ltz v1, :cond_1

    .line 70
    iget-object v2, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/Pair;

    .line 71
    .local v0, entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    iget-object v2, v0, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 75
    .end local v0           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    .end local v1           #i:I
    :goto_1
    return v1

    .line 69
    .restart local v0       #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 75
    .end local v0           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    :cond_1
    const/4 v1, -0x1

    goto :goto_1
.end method

.method private declared-synchronized getIndexOfSpecificHandlerForTypeHierarchy(Ljava/lang/Class;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 151
    iget-object v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/sigma_gson/Pair;

    iget-object v1, v1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 155
    .end local v0           #i:I
    :goto_1
    monitor-exit p0

    return v0

    .line 150
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 155
    :cond_1
    const/4 v0, -0x1

    goto :goto_1

    .line 150
    .end local v0           #i:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 198
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    invoke-static {p1}, Lcom/google/sigma_gson/TypeUtils;->toRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized copyOf()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    .line 160
    .local v0, copy:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    iget-object v4, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 161
    .local v2, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Type;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 159
    .end local v0           #copy:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .end local v2           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 163
    .restart local v0       #copy:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/sigma_gson/Pair;

    .line 164
    .local v1, entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    invoke-virtual {v0, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Lcom/google/sigma_gson/Pair;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 166
    .end local v1           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    :cond_1
    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getHandlerFor(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 3
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 123
    .local v0, handler:Ljava/lang/Object;,"TT;"
    if-nez v0, :cond_1

    .line 124
    invoke-static {p1}, Lcom/google/sigma_gson/TypeUtils;->toRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    .line 125
    .local v1, rawClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    if-eq v1, p1, :cond_0

    .line 126
    invoke-virtual {p0, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getHandlerFor(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    .line 128
    :cond_0
    if-nez v0, :cond_1

    .line 130
    invoke-direct {p0, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getHandlerForTypeHierarchy(Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 133
    .end local v1           #rawClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_1
    monitor-exit p0

    return-object v0

    .line 122
    .end local v0           #handler:Ljava/lang/Object;,"TT;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized hasSpecificHandlerFor(Ljava/lang/reflect/Type;)Z
    .locals 1
    .parameter "type"

    .prologue
    .line 146
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized makeUnmodifiable()V
    .locals 1

    .prologue
    .line 118
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    monitor-exit p0

    return-void

    .line 118
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 3
    .parameter "typeOfT"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p2, value:Ljava/lang/Object;,"TT;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempted to modify an unmodifiable map."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 82
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->hasSpecificHandlerFor(Ljava/lang/reflect/Type;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    sget-object v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v2, "Overriding the existing type handler for {0}"

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized registerForTypeHierarchy(Lcom/google/sigma_gson/Pair;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/Pair",
            "<",
            "Ljava/lang/Class",
            "<*>;TT;>;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z

    if-nez v1, :cond_0

    .line 50
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Attempted to modify an unmodifiable map."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 52
    :cond_0
    :try_start_1
    iget-object v1, p1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Class;

    invoke-direct {p0, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getIndexOfSpecificHandlerForTypeHierarchy(Ljava/lang/Class;)I

    move-result v0

    .line 53
    .local v0, index:I
    if-ltz v0, :cond_1

    .line 54
    sget-object v1, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "Overriding the existing type handler for {0}"

    iget-object v4, p1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 55
    iget-object v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 57
    :cond_1
    iget-object v1, p1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Class;

    invoke-direct {p0, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getIndexOfAnOverriddenHandler(Ljava/lang/Class;)I

    move-result v0

    .line 58
    if-ltz v0, :cond_2

    .line 59
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The specified type handler for type "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " hides the previously registered type hierarchy handler for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/sigma_gson/Pair;

    iget-object v1, v1, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ". Gson does not allow this."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 65
    :cond_2
    iget-object v1, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;TT;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, typeOfT:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, value:Ljava/lang/Object;,"TT;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/google/sigma_gson/Pair;

    invoke-direct {v0, p1, p2}, Lcom/google/sigma_gson/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .local v0, pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    invoke-virtual {p0, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Lcom/google/sigma_gson/Pair;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    monitor-exit p0

    return-void

    .line 44
    .end local v0           #pair:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized registerIfAbsent(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p1, other:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v5, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z

    if-nez v5, :cond_0

    .line 90
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Attempted to modify an unmodifiable map."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 92
    :cond_0
    :try_start_1
    iget-object v5, p1, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 93
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    iget-object v5, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 94
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Type;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    goto :goto_0

    .line 99
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    :cond_2
    iget-object v5, p1, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .local v2, i:I
    :goto_1
    if-ltz v2, :cond_4

    .line 100
    iget-object v5, p1, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/Pair;

    .line 101
    .local v0, entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    iget-object v5, v0, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Class;

    invoke-direct {p0, v5}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getIndexOfSpecificHandlerForTypeHierarchy(Ljava/lang/Class;)I

    move-result v4

    .line 102
    .local v4, index:I
    if-gez v4, :cond_3

    .line 103
    invoke-virtual {p0, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Lcom/google/sigma_gson/Pair;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 106
    .end local v0           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    .end local v4           #index:I
    :cond_4
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 2
    .parameter "typeOfT"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    .local p2, value:Ljava/lang/Object;,"TT;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->modifiable:Z

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempted to modify an unmodifiable map."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 112
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 113
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    .local p0, this:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<TT;>;"
    const/16 v7, 0x3a

    const/16 v6, 0x2c

    .line 171
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "{mapForTypeHierarchy:{"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .local v4, sb:Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 173
    .local v2, first:Z
    iget-object v5, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeHierarchyList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/Pair;

    .line 174
    .local v0, entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    if-eqz v2, :cond_0

    .line 175
    const/4 v2, 0x0

    .line 179
    :goto_1
    iget-object v5, v0, Lcom/google/sigma_gson/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/reflect/Type;

    invoke-direct {p0, v5}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 180
    iget-object v5, v0, Lcom/google/sigma_gson/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 177
    :cond_0
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 182
    .end local v0           #entry:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;TT;>;"
    :cond_1
    const-string v5, "},map:{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const/4 v2, 0x1

    .line 184
    iget-object v5, p0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->map:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 185
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    if-eqz v2, :cond_2

    .line 186
    const/4 v2, 0x0

    .line 190
    :goto_3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Type;

    invoke-direct {p0, v5}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 188
    :cond_2
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 193
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/Type;TT;>;"
    :cond_3
    const-string v5, "}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
