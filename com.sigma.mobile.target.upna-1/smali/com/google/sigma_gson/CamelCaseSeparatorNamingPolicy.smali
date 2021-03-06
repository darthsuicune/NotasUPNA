.class final Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;
.super Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;
.source "CamelCaseSeparatorNamingPolicy.java"


# instance fields
.field private final separatorString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "separatorString"

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;-><init>()V

    .line 54
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 55
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/sigma_gson/Preconditions;->checkArgument(Z)V

    .line 56
    iput-object p1, p0, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;->separatorString:Ljava/lang/String;

    .line 57
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
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
    .line 62
    .local p3, annnotations:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .local v2, translation:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 64
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 65
    .local v0, character:C
    invoke-static {v0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 66
    iget-object v3, p0, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;->separatorString:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    :cond_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 71
    .end local v0           #character:C
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
