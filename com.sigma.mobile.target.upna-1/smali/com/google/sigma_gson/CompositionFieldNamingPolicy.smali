.class abstract Lcom/google/sigma_gson/CompositionFieldNamingPolicy;
.super Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
.source "CompositionFieldNamingPolicy.java"


# instance fields
.field private final fieldPolicies:[Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;


# direct methods
.method public varargs constructor <init>([Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;)V
    .locals 2
    .parameter "fieldNamingPolicies"

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;-><init>()V

    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "naming policies can not be null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/google/sigma_gson/CompositionFieldNamingPolicy;->fieldPolicies:[Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;

    .line 37
    return-void
.end method


# virtual methods
.method protected translateName(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/util/Collection;)Ljava/lang/String;
    .locals 4
    .parameter "target"
    .parameter "fieldType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 41
    .local p3, annotations:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/CompositionFieldNamingPolicy;->fieldPolicies:[Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;

    .local v0, arr$:[Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 42
    .local v3, policy:Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
    invoke-virtual {v3, p1, p2, p3}, Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;->translateName(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p1

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 44
    .end local v3           #policy:Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
    :cond_0
    return-object p1
.end method
