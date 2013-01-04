.class abstract Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
.super Ljava/lang/Object;
.source "RecursiveFieldNamingPolicy.java"

# interfaces
.implements Lcom/google/sigma_gson/FieldNamingStrategy2;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;
    .locals 3
    .parameter "f"

    .prologue
    .line 33
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 34
    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getDeclaredType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getAnnotations()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;->translateName(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract translateName(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/util/Collection;)Ljava/lang/String;
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
.end method
