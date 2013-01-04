.class public final Lcom/google/sigma_gson/JsonObject;
.super Lcom/google/sigma_gson/JsonElement;
.source "JsonObject.java"


# instance fields
.field private final members:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/sigma_gson/JsonElement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/google/sigma_gson/JsonElement;-><init>()V

    .line 43
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    .line 44
    return-void
.end method

.method private createJsonElement(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "value"

    .prologue
    .line 124
    if-nez p1, :cond_0

    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    .line 55
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 56
    if-nez p2, :cond_0

    .line 57
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object p2

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    .line 103
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    .line 104
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Character;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    .line 114
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    .line 115
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Number;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    .line 92
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    .line 93
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    .line 81
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    .line 82
    return-void
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/sigma_gson/JsonElement;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;
    .locals 2
    .parameter "memberName"

    .prologue
    .line 154
    iget-object v1, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 155
    iget-object v1, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonElement;

    .line 156
    .local v0, member:Lcom/google/sigma_gson/JsonElement;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    .line 158
    .end local v0           #member:Lcom/google/sigma_gson/JsonElement;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAsJsonArray(Ljava/lang/String;)Lcom/google/sigma_gson/JsonArray;
    .locals 1
    .parameter "memberName"

    .prologue
    .line 178
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonArray;

    return-object v0
.end method

.method public getAsJsonObject(Ljava/lang/String;)Lcom/google/sigma_gson/JsonObject;
    .locals 1
    .parameter "memberName"

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonObject;

    return-object v0
.end method

.method public getAsJsonPrimitive(Ljava/lang/String;)Lcom/google/sigma_gson/JsonPrimitive;
    .locals 1
    .parameter "memberName"

    .prologue
    .line 168
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonPrimitive;

    return-object v0
.end method

.method public has(Ljava/lang/String;)Z
    .locals 1
    .parameter "memberName"

    .prologue
    .line 144
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "property"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonElement;

    return-object v0
.end method

.method protected toString(Ljava/lang/Appendable;Lcom/google/sigma_gson/Escaper;)V
    .locals 4
    .parameter "sb"
    .parameter "escaper"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    const/16 v3, 0x7b

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 194
    const/4 v1, 0x1

    .line 195
    .local v1, first:Z
    iget-object v3, p0, Lcom/google/sigma_gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 196
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    if-eqz v1, :cond_0

    .line 197
    const/4 v1, 0x0

    .line 201
    :goto_1
    const/16 v3, 0x22

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 202
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {p2, v3}, Lcom/google/sigma_gson/Escaper;->escapeJsonString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 203
    const-string v3, "\":"

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 204
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/sigma_gson/JsonElement;

    invoke-virtual {v3, p1, p2}, Lcom/google/sigma_gson/JsonElement;->toString(Ljava/lang/Appendable;Lcom/google/sigma_gson/Escaper;)V

    goto :goto_0

    .line 199
    :cond_0
    const/16 v3, 0x2c

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_1

    .line 206
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    :cond_1
    const/16 v3, 0x7d

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 207
    return-void
.end method
