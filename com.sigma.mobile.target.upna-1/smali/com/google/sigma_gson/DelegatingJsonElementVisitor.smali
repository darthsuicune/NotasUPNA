.class Lcom/google/sigma_gson/DelegatingJsonElementVisitor;
.super Ljava/lang/Object;
.source "DelegatingJsonElementVisitor.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonElementVisitor;


# instance fields
.field private final delegate:Lcom/google/sigma_gson/JsonElementVisitor;


# direct methods
.method protected constructor <init>(Lcom/google/sigma_gson/JsonElementVisitor;)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 52
    iput-object p1, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    .line 53
    return-void
.end method


# virtual methods
.method public endArray(Lcom/google/sigma_gson/JsonArray;)V
    .locals 1
    .parameter "array"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/JsonElementVisitor;->endArray(Lcom/google/sigma_gson/JsonArray;)V

    .line 57
    return-void
.end method

.method public endObject(Lcom/google/sigma_gson/JsonObject;)V
    .locals 1
    .parameter "object"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/JsonElementVisitor;->endObject(Lcom/google/sigma_gson/JsonObject;)V

    .line 61
    return-void
.end method

.method public startArray(Lcom/google/sigma_gson/JsonArray;)V
    .locals 1
    .parameter "array"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/JsonElementVisitor;->startArray(Lcom/google/sigma_gson/JsonArray;)V

    .line 65
    return-void
.end method

.method public startObject(Lcom/google/sigma_gson/JsonObject;)V
    .locals 1
    .parameter "object"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/JsonElementVisitor;->startObject(Lcom/google/sigma_gson/JsonObject;)V

    .line 69
    return-void
.end method

.method public visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonArray;Z)V
    .locals 1
    .parameter "parent"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/sigma_gson/JsonElementVisitor;->visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonArray;Z)V

    .line 79
    return-void
.end method

.method public visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonObject;Z)V
    .locals 1
    .parameter "parent"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/sigma_gson/JsonElementVisitor;->visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonObject;Z)V

    .line 84
    return-void
.end method

.method public visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonPrimitive;Z)V
    .locals 1
    .parameter "parent"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/sigma_gson/JsonElementVisitor;->visitArrayMember(Lcom/google/sigma_gson/JsonArray;Lcom/google/sigma_gson/JsonPrimitive;Z)V

    .line 74
    return-void
.end method

.method public visitNull()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0}, Lcom/google/sigma_gson/JsonElementVisitor;->visitNull()V

    .line 112
    return-void
.end method

.method public visitNullArrayMember(Lcom/google/sigma_gson/JsonArray;Z)V
    .locals 1
    .parameter "parent"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2}, Lcom/google/sigma_gson/JsonElementVisitor;->visitNullArrayMember(Lcom/google/sigma_gson/JsonArray;Z)V

    .line 116
    return-void
.end method

.method public visitNullObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Z)V
    .locals 1
    .parameter "parent"
    .parameter "memberName"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/sigma_gson/JsonElementVisitor;->visitNullObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Z)V

    .line 104
    return-void
.end method

.method public visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonArray;Z)V
    .locals 1
    .parameter "parent"
    .parameter "memberName"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/sigma_gson/JsonElementVisitor;->visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonArray;Z)V

    .line 94
    return-void
.end method

.method public visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonObject;Z)V
    .locals 1
    .parameter "parent"
    .parameter "memberName"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/sigma_gson/JsonElementVisitor;->visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonObject;Z)V

    .line 99
    return-void
.end method

.method public visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonPrimitive;Z)V
    .locals 1
    .parameter "parent"
    .parameter "memberName"
    .parameter "member"
    .parameter "isFirst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/sigma_gson/JsonElementVisitor;->visitObjectMember(Lcom/google/sigma_gson/JsonObject;Ljava/lang/String;Lcom/google/sigma_gson/JsonPrimitive;Z)V

    .line 89
    return-void
.end method

.method public visitPrimitive(Lcom/google/sigma_gson/JsonPrimitive;)V
    .locals 1
    .parameter "primitive"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/sigma_gson/DelegatingJsonElementVisitor;->delegate:Lcom/google/sigma_gson/JsonElementVisitor;

    invoke-interface {v0, p1}, Lcom/google/sigma_gson/JsonElementVisitor;->visitPrimitive(Lcom/google/sigma_gson/JsonPrimitive;)V

    .line 108
    return-void
.end method
