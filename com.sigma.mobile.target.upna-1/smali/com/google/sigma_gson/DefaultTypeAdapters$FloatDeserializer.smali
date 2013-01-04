.class Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonDeserializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FloatDeserializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 780
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 780
    invoke-direct {p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/Float;
    .locals 1
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 783
    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsFloat()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 780
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 788
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
