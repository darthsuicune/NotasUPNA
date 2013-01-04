.class final Lcom/google/sigma_gson/ObjectTypePair;
.super Ljava/lang/Object;
.source "ObjectTypePair.java"


# instance fields
.field private obj:Ljava/lang/Object;

.field private final preserveType:Z

.field final type:Ljava/lang/reflect/Type;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V
    .locals 0
    .parameter "obj"
    .parameter "type"
    .parameter "preserveType"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    .line 32
    iput-object p2, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    .line 33
    iput-boolean p3, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    .line 34
    return-void
.end method

.method static getActualTypeIfMoreSpecific(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 2
    .parameter "type"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, actualClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    instance-of v1, p0, Ljava/lang/Class;

    if-eqz v1, :cond_1

    move-object v0, p0

    .line 86
    check-cast v0, Ljava/lang/Class;

    .line 87
    .local v0, typeAsClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    move-object p0, p1

    .line 90
    :cond_0
    const-class v1, Ljava/lang/Object;

    if-ne p0, v1, :cond_1

    .line 91
    move-object p0, p1

    .line 94
    .end local v0           #typeAsClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_1
    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 106
    if-ne p0, p1, :cond_1

    move v2, v1

    .line 130
    :cond_0
    :goto_0
    return v2

    .line 109
    :cond_1
    if-eqz p1, :cond_0

    .line 112
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_0

    move-object v0, p1

    .line 115
    check-cast v0, Lcom/google/sigma_gson/ObjectTypePair;

    .line 116
    .local v0, other:Lcom/google/sigma_gson/ObjectTypePair;
    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-nez v3, :cond_4

    .line 117
    iget-object v3, v0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-nez v3, :cond_0

    .line 123
    :cond_2
    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    if-nez v3, :cond_5

    .line 124
    iget-object v3, v0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    if-nez v3, :cond_0

    .line 130
    :cond_3
    iget-boolean v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    iget-boolean v4, v0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    if-ne v3, v4, :cond_6

    :goto_1
    move v2, v1

    goto :goto_0

    .line 120
    :cond_4
    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    iget-object v4, v0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-eq v3, v4, :cond_2

    goto :goto_0

    .line 127
    :cond_5
    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    iget-object v4, v0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    :cond_6
    move v1, v2

    .line 130
    goto :goto_1
.end method

.method getMatchingHandler(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)Lcom/google/sigma_gson/Pair;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<HAND",
            "LER:Ljava/lang/Object;",
            ">(",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<THAND",
            "LER;",
            ">;)",
            "Lcom/google/sigma_gson/Pair",
            "<THAND",
            "LER;",
            "Lcom/google/sigma_gson/ObjectTypePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, handlers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<THANDLER;>;"
    const/4 v0, 0x0

    .line 56
    .local v0, handler:Ljava/lang/Object;,"THANDLER;"
    iget-boolean v2, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/google/sigma_gson/ObjectTypePair;->toMoreSpecificType()Lcom/google/sigma_gson/ObjectTypePair;

    move-result-object v1

    .line 59
    .local v1, moreSpecificType:Lcom/google/sigma_gson/ObjectTypePair;
    iget-object v2, v1, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-virtual {p1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getHandlerFor(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    new-instance v2, Lcom/google/sigma_gson/Pair;

    invoke-direct {v2, v0, v1}, Lcom/google/sigma_gson/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .end local v1           #moreSpecificType:Lcom/google/sigma_gson/ObjectTypePair;
    :goto_0
    return-object v2

    .line 65
    .end local v0           #handler:Ljava/lang/Object;,"THANDLER;"
    :cond_0
    iget-object v2, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-virtual {p1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->getHandlerFor(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    .line 66
    .restart local v0       #handler:Ljava/lang/Object;,"THANDLER;"
    if-nez v0, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/google/sigma_gson/Pair;

    invoke-direct {v2, v0, p0}, Lcom/google/sigma_gson/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method getObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method getType()Ljava/lang/reflect/Type;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/16 v0, 0x1f

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public isPreserveType()Z
    .locals 1

    .prologue
    .line 134
    iget-boolean v0, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    return v0
.end method

.method setObject(Ljava/lang/Object;)V
    .locals 0
    .parameter "obj"

    .prologue
    .line 41
    iput-object p1, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    .line 42
    return-void
.end method

.method toMoreSpecificType()Lcom/google/sigma_gson/ObjectTypePair;
    .locals 4

    .prologue
    .line 70
    iget-boolean v1, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 77
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 73
    .restart local p0
    :cond_1
    iget-object v1, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    iget-object v2, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/sigma_gson/ObjectTypePair;->getActualTypeIfMoreSpecific(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 74
    .local v0, actualType:Ljava/lang/reflect/Type;
    iget-object v1, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    if-eq v0, v1, :cond_0

    .line 77
    new-instance v1, Lcom/google/sigma_gson/ObjectTypePair;

    iget-object v2, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    iget-boolean v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    invoke-direct {v1, v2, v0, v3}, Lcom/google/sigma_gson/ObjectTypePair;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)V

    move-object p0, v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 50
    const-string v0, "preserveType: %b, type: %s, obj: %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-boolean v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->preserveType:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/sigma_gson/ObjectTypePair;->obj:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
