.class final Lcom/google/sigma_gson/ObjectNavigatorFactory;
.super Ljava/lang/Object;
.source "ObjectNavigatorFactory.java"


# instance fields
.field private final fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

.field private final strategy:Lcom/google/sigma_gson/ExclusionStrategy;


# direct methods
.method public constructor <init>(Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/FieldNamingStrategy2;)V
    .locals 0
    .parameter "strategy"
    .parameter "fieldNamingPolicy"

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {p2}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 41
    if-nez p1, :cond_0

    new-instance p1, Lcom/google/sigma_gson/NullExclusionStrategy;

    .end local p1
    invoke-direct {p1}, Lcom/google/sigma_gson/NullExclusionStrategy;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/google/sigma_gson/ObjectNavigatorFactory;->strategy:Lcom/google/sigma_gson/ExclusionStrategy;

    .line 42
    iput-object p2, p0, Lcom/google/sigma_gson/ObjectNavigatorFactory;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 43
    return-void
.end method


# virtual methods
.method public create(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectNavigator;
    .locals 2
    .parameter "objTypePair"

    .prologue
    .line 55
    new-instance v0, Lcom/google/sigma_gson/ObjectNavigator;

    iget-object v1, p0, Lcom/google/sigma_gson/ObjectNavigatorFactory;->strategy:Lcom/google/sigma_gson/ExclusionStrategy;

    invoke-direct {v0, p1, v1}, Lcom/google/sigma_gson/ObjectNavigator;-><init>(Lcom/google/sigma_gson/ObjectTypePair;Lcom/google/sigma_gson/ExclusionStrategy;)V

    return-object v0
.end method

.method getFieldNamingPolicy()Lcom/google/sigma_gson/FieldNamingStrategy2;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/google/sigma_gson/ObjectNavigatorFactory;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    return-object v0
.end method
