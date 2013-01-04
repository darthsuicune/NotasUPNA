.class Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;
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
    name = "DefaultTimeTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/sql/Time;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/sql/Time;",
        ">;"
    }
.end annotation


# instance fields
.field private final format:Ljava/text/DateFormat;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm:ss a"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->format:Ljava/text/DateFormat;

    .line 337
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
    .line 333
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/sql/Time;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/sql/Time;
    .locals 6
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 346
    instance-of v2, p1, Lcom/google/sigma_gson/JsonPrimitive;

    if-nez v2, :cond_0

    .line 347
    new-instance v2, Lcom/google/sigma_gson/JsonParseException;

    const-string v3, "The date should be a string value"

    invoke-direct {v2, v3}, Lcom/google/sigma_gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 350
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->format:Ljava/text/DateFormat;

    monitor-enter v3
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 351
    :try_start_1
    iget-object v2, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->format:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 352
    .local v0, date:Ljava/util/Date;
    new-instance v2, Ljava/sql/Time;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/sql/Time;-><init>(J)V

    monitor-exit v3

    return-object v2

    .line 353
    .end local v0           #date:Ljava/util/Date;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0

    .line 354
    :catch_0
    move-exception v1

    .line 355
    .local v1, e:Ljava/text/ParseException;
    new-instance v2, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v2, v1}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 333
    check-cast p1, Ljava/sql/Time;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->serialize(Ljava/sql/Time;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/sql/Time;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 3
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 339
    iget-object v2, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->format:Ljava/text/DateFormat;

    monitor-enter v2

    .line 340
    :try_start_0
    iget-object v1, p0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;->format:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, dateFormatAsString:Ljava/lang/String;
    new-instance v1, Lcom/google/sigma_gson/JsonPrimitive;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonPrimitive;-><init>(Ljava/lang/String;)V

    monitor-exit v2

    return-object v1

    .line 342
    .end local v0           #dateFormatAsString:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
