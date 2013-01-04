.class final Lcom/google/sigma_gson/Streams;
.super Ljava/lang/Object;
.source "Streams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/sigma_gson/Streams$1;,
        Lcom/google/sigma_gson/Streams$AppendableWriter;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    return-void
.end method

.method static parse(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;
    .locals 3
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 36
    const/4 v1, 0x1

    .line 38
    .local v1, isEmpty:Z
    :try_start_0
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->peek()Lcom/google/sigma_gson/stream/JsonToken;

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {p0}, Lcom/google/sigma_gson/Streams;->parseRecursive(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/sigma_gson/stream/MalformedJsonException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v2

    .line 47
    :goto_0
    return-object v2

    .line 41
    :catch_0
    move-exception v0

    .line 46
    .local v0, e:Ljava/io/EOFException;
    if-eqz v1, :cond_0

    .line 47
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v2

    goto :goto_0

    .line 49
    :cond_0
    new-instance v2, Lcom/google/sigma_gson/JsonIOException;

    invoke-direct {v2, v0}, Lcom/google/sigma_gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 50
    .end local v0           #e:Ljava/io/EOFException;
    :catch_1
    move-exception v0

    .line 51
    .local v0, e:Lcom/google/sigma_gson/stream/MalformedJsonException;
    new-instance v2, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v2, v0}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 52
    .end local v0           #e:Lcom/google/sigma_gson/stream/MalformedJsonException;
    :catch_2
    move-exception v0

    .line 53
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lcom/google/sigma_gson/JsonIOException;

    invoke-direct {v2, v0}, Lcom/google/sigma_gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 54
    .end local v0           #e:Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 55
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v2, v0}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static parseRecursive(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;
    .locals 5
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    sget-object v3, Lcom/google/sigma_gson/Streams$1;->$SwitchMap$com$google$gson$stream$JsonToken:[I

    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->peek()Lcom/google/sigma_gson/stream/JsonToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/sigma_gson/stream/JsonToken;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 92
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 62
    :pswitch_0
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    .line 86
    :goto_0
    return-object v0

    .line 64
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, number:Ljava/lang/String;
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-static {v1}, Lcom/google/sigma_gson/JsonPrimitive;->stringToNumber(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Number;)V

    goto :goto_0

    .line 67
    .end local v1           #number:Ljava/lang/String;
    :pswitch_2
    new-instance v0, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->nextBoolean()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/Boolean;)V

    goto :goto_0

    .line 69
    :pswitch_3
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->nextNull()V

    .line 70
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    goto :goto_0

    .line 72
    :pswitch_4
    new-instance v0, Lcom/google/sigma_gson/JsonArray;

    invoke-direct {v0}, Lcom/google/sigma_gson/JsonArray;-><init>()V

    .line 73
    .local v0, array:Lcom/google/sigma_gson/JsonArray;
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->beginArray()V

    .line 74
    :goto_1
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 75
    invoke-static {p0}, Lcom/google/sigma_gson/Streams;->parseRecursive(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/sigma_gson/JsonArray;->add(Lcom/google/sigma_gson/JsonElement;)V

    goto :goto_1

    .line 77
    :cond_0
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->endArray()V

    goto :goto_0

    .line 80
    .end local v0           #array:Lcom/google/sigma_gson/JsonArray;
    :pswitch_5
    new-instance v2, Lcom/google/sigma_gson/JsonObject;

    invoke-direct {v2}, Lcom/google/sigma_gson/JsonObject;-><init>()V

    .line 81
    .local v2, object:Lcom/google/sigma_gson/JsonObject;
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->beginObject()V

    .line 82
    :goto_2
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 83
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lcom/google/sigma_gson/Streams;->parseRecursive(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/sigma_gson/JsonObject;->add(Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;)V

    goto :goto_2

    .line 85
    :cond_1
    invoke-virtual {p0}, Lcom/google/sigma_gson/stream/JsonReader;->endObject()V

    move-object v0, v2

    .line 86
    goto :goto_0

    .line 60
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method static write(Lcom/google/sigma_gson/JsonElement;ZLcom/google/sigma_gson/stream/JsonWriter;)V
    .locals 8
    .parameter "element"
    .parameter "serializeNulls"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 102
    :cond_0
    if-eqz p1, :cond_1

    .line 103
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->nullValue()Lcom/google/sigma_gson/stream/JsonWriter;

    .line 143
    :cond_1
    :goto_0
    return-void

    .line 106
    :cond_2
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->isJsonPrimitive()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 107
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->getAsJsonPrimitive()Lcom/google/sigma_gson/JsonPrimitive;

    move-result-object v3

    .line 108
    .local v3, primitive:Lcom/google/sigma_gson/JsonPrimitive;
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonPrimitive;->isNumber()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 109
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonPrimitive;->getAsNumber()Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/sigma_gson/stream/JsonWriter;->value(Ljava/lang/Number;)Lcom/google/sigma_gson/stream/JsonWriter;

    goto :goto_0

    .line 110
    :cond_3
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonPrimitive;->isBoolean()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 111
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonPrimitive;->getAsBoolean()Z

    move-result v5

    invoke-virtual {p2, v5}, Lcom/google/sigma_gson/stream/JsonWriter;->value(Z)Lcom/google/sigma_gson/stream/JsonWriter;

    goto :goto_0

    .line 113
    :cond_4
    invoke-virtual {v3}, Lcom/google/sigma_gson/JsonPrimitive;->getAsString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/sigma_gson/stream/JsonWriter;->value(Ljava/lang/String;)Lcom/google/sigma_gson/stream/JsonWriter;

    goto :goto_0

    .line 116
    .end local v3           #primitive:Lcom/google/sigma_gson/JsonPrimitive;
    :cond_5
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->isJsonArray()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 117
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->beginArray()Lcom/google/sigma_gson/stream/JsonWriter;

    .line 118
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->getAsJsonArray()Lcom/google/sigma_gson/JsonArray;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/JsonElement;

    .line 120
    .local v0, e:Lcom/google/sigma_gson/JsonElement;
    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 121
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->nullValue()Lcom/google/sigma_gson/stream/JsonWriter;

    goto :goto_1

    .line 124
    :cond_6
    invoke-static {v0, p1, p2}, Lcom/google/sigma_gson/Streams;->write(Lcom/google/sigma_gson/JsonElement;ZLcom/google/sigma_gson/stream/JsonWriter;)V

    goto :goto_1

    .line 126
    .end local v0           #e:Lcom/google/sigma_gson/JsonElement;
    :cond_7
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->endArray()Lcom/google/sigma_gson/stream/JsonWriter;

    goto :goto_0

    .line 128
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_8
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->isJsonObject()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 129
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->beginObject()Lcom/google/sigma_gson/stream/JsonWriter;

    .line 130
    invoke-virtual {p0}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/sigma_gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_9
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 131
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/sigma_gson/JsonElement;

    .line 132
    .local v4, value:Lcom/google/sigma_gson/JsonElement;
    if-nez p1, :cond_a

    invoke-virtual {v4}, Lcom/google/sigma_gson/JsonElement;->isJsonNull()Z

    move-result v5

    if-nez v5, :cond_9

    .line 135
    :cond_a
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p2, v5}, Lcom/google/sigma_gson/stream/JsonWriter;->name(Ljava/lang/String;)Lcom/google/sigma_gson/stream/JsonWriter;

    .line 136
    invoke-static {v4, p1, p2}, Lcom/google/sigma_gson/Streams;->write(Lcom/google/sigma_gson/JsonElement;ZLcom/google/sigma_gson/stream/JsonWriter;)V

    goto :goto_2

    .line 138
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/sigma_gson/JsonElement;>;"
    .end local v4           #value:Lcom/google/sigma_gson/JsonElement;
    :cond_b
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->endObject()Lcom/google/sigma_gson/stream/JsonWriter;

    goto/16 :goto_0

    .line 141
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_c
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Couldn\'t write "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method static writerForAppendable(Ljava/lang/Appendable;)Ljava/io/Writer;
    .locals 2
    .parameter "appendable"

    .prologue
    .line 146
    instance-of v0, p0, Ljava/io/Writer;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/io/Writer;

    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Lcom/google/sigma_gson/Streams$AppendableWriter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/sigma_gson/Streams$AppendableWriter;-><init>(Ljava/lang/Appendable;Lcom/google/sigma_gson/Streams$1;)V

    move-object p0, v0

    goto :goto_0
.end method
