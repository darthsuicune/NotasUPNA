.class Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"

# interfaces
.implements Lcom/google/sigma_gson/JsonSerializer;
.implements Lcom/google/sigma_gson/JsonDeserializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/DefaultTypeAdapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DefaultDateTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/util/Date;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# instance fields
.field private final format:Ljava/text/DateFormat;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    .line 248
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .parameter "style"

    .prologue
    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    invoke-static {p1}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    .line 256
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    invoke-static {p1, p2}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    .line 260
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "datePattern"

    .prologue
    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    .line 252
    return-void
.end method


# virtual methods
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
    .line 243
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/Date;
    .locals 4
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 273
    instance-of v1, p1, Lcom/google/sigma_gson/JsonPrimitive;

    if-nez v1, :cond_0

    .line 274
    new-instance v1, Lcom/google/sigma_gson/JsonParseException;

    const-string v2, "The date should be a string value"

    invoke-direct {v1, v2}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    monitor-enter v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    :try_start_1
    iget-object v1, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 279
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0

    .line 280
    :catch_0
    move-exception v0

    .line 281
    .local v0, e:Ljava/text/ParseException;
    new-instance v1, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 243
    check-cast p1, Ljava/util/Date;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->serialize(Ljava/util/Date;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/util/Date;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 3
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 265
    iget-object v2, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    monitor-enter v2

    .line 266
    :try_start_0
    iget-object v1, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 267
    .local v0, dateFormatAsString:Ljava/lang/String;
    new-instance v1, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    monitor-exit v2

    return-object v1

    .line 268
    .end local v0           #dateFormatAsString:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 287
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 288
    .local v0, sb:Ljava/lang/StringBuilder;
    const-class v1, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;->format:Ljava/text/DateFormat;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 290
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
