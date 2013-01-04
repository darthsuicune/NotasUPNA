.class Lcom/google/sigma_gson/reflect/TypeToken$SimpleTypeToken;
.super Lcom/google/sigma_gson/reflect/TypeToken;
.source "TypeToken.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/reflect/TypeToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleTypeToken"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/sigma_gson/reflect/TypeToken",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Type;)V
    .locals 1
    .parameter "type"

    .prologue
    .line 372
    .local p0, this:Lcom/google/sigma_gson/reflect/TypeToken$SimpleTypeToken;,"Lcom/google/sigma_gson/reflect/TypeToken$SimpleTypeToken<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/reflect/TypeToken;-><init>(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/reflect/TypeToken$1;)V

    .line 373
    return-void
.end method
