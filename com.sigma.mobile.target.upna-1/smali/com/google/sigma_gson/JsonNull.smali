.class public final Lcom/google/sigma_gson/JsonNull;
.super Lcom/google/sigma_gson/JsonElement;
.source "JsonNull.java"


# static fields
.field private static final INSTANCE:Lcom/google/sigma_gson/JsonNull;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    new-instance v0, Lcom/google/sigma_gson/JsonNull;

    invoke-direct {v0}, Lcom/google/sigma_gson/JsonNull;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/JsonNull;->INSTANCE:Lcom/google/sigma_gson/JsonNull;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/google/sigma_gson/JsonElement;-><init>()V

    .line 36
    return-void
.end method

.method static createJsonNull()Lcom/google/sigma_gson/JsonNull;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/google/sigma_gson/JsonNull;->INSTANCE:Lcom/google/sigma_gson/JsonNull;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "other"

    .prologue
    .line 56
    instance-of v0, p1, Lcom/google/sigma_gson/JsonNull;

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 48
    const-class v0, Lcom/google/sigma_gson/JsonNull;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method protected toString(Ljava/lang/Appendable;Lcom/google/sigma_gson/Escaper;)V
    .locals 1
    .parameter "sb"
    .parameter "escaper"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    const-string v0, "null"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 41
    return-void
.end method
