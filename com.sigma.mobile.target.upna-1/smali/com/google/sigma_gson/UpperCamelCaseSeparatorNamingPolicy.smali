.class final Lcom/google/sigma_gson/UpperCamelCaseSeparatorNamingPolicy;
.super Lcom/google/sigma_gson/CompositionFieldNamingPolicy;
.source "UpperCamelCaseSeparatorNamingPolicy.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .parameter "separatorString"

    .prologue
    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;

    const/4 v1, 0x0

    new-instance v2, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;

    invoke-direct {v2, p1}, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy;

    sget-object v3, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->UPPER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    invoke-direct {v2, v3}, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy;-><init>(Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;)V

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/google/sigma_gson/CompositionFieldNamingPolicy;-><init>([Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;)V

    .line 44
    return-void
.end method
