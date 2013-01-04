.class interface abstract Lcom/google/sigma_gson/JsonElementVisitor;
.super Ljava/lang/Object;
.source "JsonElementVisitor.java"


# virtual methods
.method public abstract endArray(Lcom/google/sigma_gson/JsonArray;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract endObject(Lcom/google/sigma_gson/JsonObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract startArray(Lcom/google/sigma_gson/JsonArray;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract startObject(Lcom/google/sigma_gson/JsonObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonArray;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonObject;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonPrimitive;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitNull()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitNullArrayMember(Lcom/google/sigma_gson/JsonArray;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitNullObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonArray;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonObject;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonPrimitive;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract visitPrimitive(Lcom/google/sigma_gson/JsonPrimitive;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
