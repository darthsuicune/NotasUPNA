.class final Lcom/google/sigma_gson/LowerCamelCaseSeparatorNamingPolicy;
.super Lcom/google/sigma_gson/CompositionFieldNamingPolicy;
.source "LowerCamelCaseSeparatorNamingPolicy.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .parameter "separatorString"

    .prologue
    .line 41
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;

    const/4 v1, 0x0

    new-instance v2, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;

    invoke-direct {v2, p1}, Lcom/google/sigma_gson/CamelCaseSeparatorNamingPolicy;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/google/sigma_gson/LowerCaseNamingPolicy;

    invoke-direct {v2}, Lcom/google/sigma_gson/LowerCaseNamingPolicy;-><init>()V

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/google/sigma_gson/CompositionFieldNamingPolicy;-><init>([Lcom/google/sigma_gson/RecursiveFieldNamingPolicy;)V

    .line 42
    return-void
.end method
