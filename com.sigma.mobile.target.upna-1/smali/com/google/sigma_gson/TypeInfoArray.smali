.class final Lcom/google/sigma_gson/TypeInfoArray;
.super Lcom/google/sigma_gson/TypeInfo;
.source "TypeInfoArray.java"


# instance fields
.field private final componentRawType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final secondLevel:Ljava/lang/reflect/Type;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Type;)V
    .locals 3
    .parameter "type"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/google/sigma_gson/TypeInfo;-><init>(Ljava/lang/reflect/Type;)V

    .line 34
    iget-object v0, p0, Lcom/google/sigma_gson/TypeInfoArray;->rawClass:Ljava/lang/Class;

    .line 35
    .local v0, rootComponentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 38
    :cond_0
    iput-object v0, p0, Lcom/google/sigma_gson/TypeInfoArray;->componentRawType:Ljava/lang/Class;

    .line 39
    iget-object v1, p0, Lcom/google/sigma_gson/TypeInfoArray;->actualType:Ljava/lang/reflect/Type;

    iget-object v2, p0, Lcom/google/sigma_gson/TypeInfoArray;->rawClass:Ljava/lang/Class;

    invoke-static {v1, v2}, Lcom/google/sigma_gson/TypeInfoArray;->extractSecondLevelType(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v1

    iput-object v1, p0, Lcom/google/sigma_gson/TypeInfoArray;->secondLevel:Ljava/lang/reflect/Type;

    .line 40
    return-void
.end method

.method private static extractSecondLevelType(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 1
    .parameter "actualType"
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
    .line 43
    .local p1, rawClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v0

    :goto_0
    return-object v0

    .restart local p0
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public getComponentRawType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/google/sigma_gson/TypeInfoArray;->componentRawType:Ljava/lang/Class;

    return-object v0
.end method

.method public getSecondLevelType()Ljava/lang/reflect/Type;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/sigma_gson/TypeInfoArray;->secondLevel:Ljava/lang/reflect/Type;

    return-object v0
.end method
