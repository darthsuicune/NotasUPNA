.class final Lcom/google/sigma_gson/FieldNamingStrategy2Adapter;
.super Ljava/lang/Object;
.source "FieldNamingStrategy2Adapter.java"

# interfaces
.implements Lcom/google/sigma_gson/FieldNamingStrategy2;


# instance fields
.field private final adaptee:Lcom/google/sigma_gson/FieldNamingStrategy;


# direct methods
.method public constructor <init>(Lcom/google/sigma_gson/FieldNamingStrategy;)V
    .locals 0
    .parameter "adaptee"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 31
    iput-object p1, p0, Lcom/google/sigma_gson/FieldNamingStrategy2Adapter;->adaptee:Lcom/google/sigma_gson/FieldNamingStrategy;

    .line 32
    return-void
.end method


# virtual methods
.method public translateName(Lcom/google/sigma_gson/FieldAttributes;)Ljava/lang/String;
    .locals 2
    .parameter "f"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/google/sigma_gson/FieldNamingStrategy2Adapter;->adaptee:Lcom/google/sigma_gson/FieldNamingStrategy;

    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldAttributes;->getFieldObject()Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/sigma_gson/FieldNamingStrategy;->translateName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
