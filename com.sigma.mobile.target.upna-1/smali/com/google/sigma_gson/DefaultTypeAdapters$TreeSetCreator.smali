.class Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/InstanceCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TreeSetCreator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/InstanceCreator",
        "<",
        "Ljava/util/TreeSet",
        "<*>;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 874
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 874
    invoke-direct {p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createInstance(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 874
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;->createInstance(Ljava/lang/reflect/Type;)Ljava/util/TreeSet;

    move-result-object v0

    return-object v0
.end method

.method public createInstance(Ljava/lang/reflect/Type;)Ljava/util/TreeSet;
    .locals 1
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/util/TreeSet",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 876
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 880
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
