.class final Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;
.super Ljava/lang/Object;
.source "SerializedNameAnnotationInterceptingNamingPolicy.java"

# interfaces
.implements Lcom/google/sigma_gson/FieldNamingStrategy2;


# static fields
.field private static final fieldNameValidator:Lcom/google/sigma_gson/JsonFieldNameValidator;


# instance fields
.field private final delegate:Lcom/google/sigma_gson/FieldNamingStrategy2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/google/sigma_gson/JsonFieldNameValidator;

    invoke-direct {v0}, Lcom/google/sigma_gson/JsonFieldNameValidator;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;->fieldNameValidator:Lcom/google/sigma_gson/JsonFieldNameValidator;

    return-void
.end method

.method public constructor <init>(Lcom/google/sigma_gson/FieldNamingStrategy2;)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;->delegate:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 40
    return-void
.end method


# virtual methods
.method public translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;
    .locals 3
    .parameter "f"

    .prologue
    .line 43
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 44
    const-class v1, Lcom/google/sigma_gson/annotations/SerializedName;

    invoke-virtual {p1, v1}, Lcom/google/sigma_gson/FieldAttributes;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/annotations/SerializedName;

    .line 45
    .local v0, serializedName:Lcom/google/sigma_gson/annotations/SerializedName;
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;->delegate:Lcom/google/sigma_gson/FieldNamingStrategy2;

    invoke-interface {v1, p1}, Lcom/google/sigma_gson/FieldNamingStrategy2;->translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;->fieldNameValidator:Lcom/google/sigma_gson/JsonFieldNameValidator;

    invoke-interface {v0}, Lcom/google/sigma_gson/annotations/SerializedName;->value()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/sigma_gson/JsonFieldNameValidator;->validate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
