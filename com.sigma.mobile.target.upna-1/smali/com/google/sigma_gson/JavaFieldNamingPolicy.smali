.class final Lcom/google/sigma_gson/JavaFieldNamingPolicy;
.super Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
.source "JavaFieldNamingPolicy.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;-><init>()V

    return-void
.end method


# virtual methods
.method protected translateName(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/util/Collection;)Ljava/lang/String;
    .locals 0
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
    .line 49
    .local p3, annotations:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    return-object p1
.end method
