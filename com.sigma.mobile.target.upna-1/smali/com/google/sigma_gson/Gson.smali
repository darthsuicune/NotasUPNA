.class public final Lcom/google/sigma_gson/Gson;
.super Ljava/lang/Object;
.source "Gson.java"


# static fields
.field static final DEFAULT_ANON_LOCAL_CLASS_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy; = null

.field private static final DEFAULT_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ExclusionStrategy; = null

.field static final DEFAULT_JSON_NON_EXECUTABLE:Z = false

.field static final DEFAULT_MODIFIER_BASED_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy; = null

.field static final DEFAULT_NAMING_POLICY:Lcom/google/sigma_gson/FieldNamingStrategy2; = null

.field static final DEFAULT_SYNTHETIC_FIELD_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy; = null

.field private static final JSON_NON_EXECUTABLE_PREFIX:Ljava/lang/String; = ")]}\'\n"

.field private static final NULL_STRING:Ljava/lang/String; = "null"


# instance fields
.field private final deserializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

.field private final deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

.field private final generateNonExecutableJson:Z

.field private final htmlSafe:Z

.field private final objectConstructor:Lcom/google/sigma_gson/MappedObjectConstructor;

.field private final prettyPrinting:Z

.field private final serializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

.field private final serializeNulls:Z

.field private final serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 86
    new-instance v0, Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy;

    invoke-direct {v0}, Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_ANON_LOCAL_CLASS_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy;

    .line 88
    new-instance v0, Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy;-><init>(Z)V

    sput-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_SYNTHETIC_FIELD_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy;

    .line 90
    new-instance v0, Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;-><init>([I)V

    sput-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_MODIFIER_BASED_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    .line 92
    new-instance v0, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;

    new-instance v1, Lcom/google/sigma_gson/JavaFieldNamingPolicy;

    invoke-direct {v1}, Lcom/google/sigma_gson/JavaFieldNamingPolicy;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;-><init>(Lcom/google/sigma_gson/FieldNamingStrategy2;)V

    sput-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_NAMING_POLICY:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 95
    const-wide/high16 v0, -0x4010

    invoke-static {v0, v1}, Lcom/google/sigma_gson/Gson;->createExclusionStrategy(D)Lcom/google/sigma_gson/ExclusionStrategy;

    move-result-object v0

    sput-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ExclusionStrategy;

    return-void

    .line 90
    nop

    :array_0
    .array-data 0x4
        0x80t 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 11

    .prologue
    const/4 v5, 0x0

    .line 153
    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ExclusionStrategy;

    sget-object v2, Lcom/google/sigma_gson/Gson;->DEFAULT_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ExclusionStrategy;

    sget-object v3, Lcom/google/sigma_gson/Gson;->DEFAULT_NAMING_POLICY:Lcom/google/sigma_gson/FieldNamingStrategy2;

    new-instance v4, Lcom/google/sigma_gson/MappedObjectConstructor;

    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultInstanceCreators()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v0

    invoke-direct {v4, v0}, Lcom/google/sigma_gson/MappedObjectConstructor;-><init>(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultSerializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v6

    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultDeserializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v7

    const/4 v9, 0x1

    move-object v0, p0

    move v8, v5

    move v10, v5

    invoke-direct/range {v0 .. v10}, Lcom/google/sigma_gson/Gson;-><init>(Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/FieldNamingStrategy2;Lcom/google/sigma_gson/MappedObjectConstructor;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;ZZZ)V

    .line 157
    return-void
.end method

.method constructor <init>(Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/FieldNamingStrategy2;Lcom/google/sigma_gson/MappedObjectConstructor;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;ZZZ)V
    .locals 0
    .parameter "serializationStrategy"
    .parameter "deserializationStrategy"
    .parameter "fieldNamingPolicy"
    .parameter "objectConstructor"
    .parameter "serializeNulls"
    .parameter
    .parameter
    .parameter "generateNonExecutableGson"
    .parameter "htmlSafe"
    .parameter "prettyPrinting"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/ExclusionStrategy;",
            "Lcom/google/sigma_gson/ExclusionStrategy;",
            "Lcom/google/sigma_gson/FieldNamingStrategy2;",
            "Lcom/google/sigma_gson/MappedObjectConstructor;",
            "Z",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;ZZZ)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p6, serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    .local p7, deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p1, p0, Lcom/google/sigma_gson/Gson;->serializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

    .line 165
    iput-object p2, p0, Lcom/google/sigma_gson/Gson;->deserializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

    .line 166
    iput-object p3, p0, Lcom/google/sigma_gson/Gson;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 167
    iput-object p4, p0, Lcom/google/sigma_gson/Gson;->objectConstructor:Lcom/google/sigma_gson/MappedObjectConstructor;

    .line 168
    iput-boolean p5, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    .line 169
    iput-object p6, p0, Lcom/google/sigma_gson/Gson;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 170
    iput-object p7, p0, Lcom/google/sigma_gson/Gson;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 171
    iput-boolean p8, p0, Lcom/google/sigma_gson/Gson;->generateNonExecutableJson:Z

    .line 172
    iput-boolean p9, p0, Lcom/google/sigma_gson/Gson;->htmlSafe:Z

    .line 173
    iput-boolean p10, p0, Lcom/google/sigma_gson/Gson;->prettyPrinting:Z

    .line 174
    return-void
.end method

.method private static assertFullConsumption(Ljava/lang/Object;Lcom/google/sigma_gson/stream/JsonReader;)V
    .locals 3
    .parameter "obj"
    .parameter "reader"

    .prologue
    .line 491
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p1}, Lcom/google/sigma_gson/stream/JsonReader;->peek()Lcom/google/sigma_gson/stream/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/google/sigma_gson/stream/JsonToken;->END_DOCUMENT:Lcom/google/sigma_gson/stream/JsonToken;

    if-eq v1, v2, :cond_0

    .line 492
    new-instance v1, Lcom/google/sigma_gson/JsonIOException;

    const-string v2, "JSON document was not fully consumed."

    invoke-direct {v1, v2}, Lcom/google/sigma_gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lcom/google/sigma_gson/stream/MalformedJsonException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 494
    :catch_0
    move-exception v0

    .line 495
    .local v0, e:Lcom/google/sigma_gson/stream/MalformedJsonException;
    new-instance v1, Lcom/google/sigma_gson/JsonSyntaxException;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 496
    .end local v0           #e:Lcom/google/sigma_gson/stream/MalformedJsonException;
    :catch_1
    move-exception v0

    .line 497
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lcom/google/sigma_gson/JsonIOException;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 499
    .end local v0           #e:Ljava/io/IOException;
    :cond_0
    return-void
.end method

.method private createDefaultObjectNavigatorFactory(Lcom/google/sigma_gson/ExclusionStrategy;)Lcom/google/sigma_gson/ObjectNavigatorFactory;
    .locals 2
    .parameter "strategy"

    .prologue
    .line 177
    new-instance v0, Lcom/google/sigma_gson/ObjectNavigatorFactory;

    iget-object v1, p0, Lcom/google/sigma_gson/Gson;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    invoke-direct {v0, p1, v1}, Lcom/google/sigma_gson/ObjectNavigatorFactory;-><init>(Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/FieldNamingStrategy2;)V

    return-object v0
.end method

.method private static createExclusionStrategy(D)Lcom/google/sigma_gson/ExclusionStrategy;
    .locals 3
    .parameter "version"

    .prologue
    .line 181
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 182
    .local v0, strategies:Ljava/util/List;,"Ljava/util/List<Lcom/google/sigma_gson/ExclusionStrategy;>;"
    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_ANON_LOCAL_CLASS_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_SYNTHETIC_FIELD_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_MODIFIER_BASED_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    const-wide/high16 v1, -0x4010

    cmpl-double v1, p0, v1

    if-eqz v1, :cond_0

    .line 186
    new-instance v1, Lcom/google/sigma_gson/VersionExclusionStrategy;

    invoke-direct {v1, p0, p1}, Lcom/google/sigma_gson/VersionExclusionStrategy;-><init>(D)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    :cond_0
    new-instance v1, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;

    invoke-direct {v1, v0}, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method private writeOutNullString(Ljava/lang/Appendable;)V
    .locals 1
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 578
    const-string v0, "null"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 579
    return-void
.end method


# virtual methods
.method public fromJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .parameter "json"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/sigma_gson/JsonElement;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 538
    .local p2, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    .line 539
    .local v0, object:Ljava/lang/Object;
    invoke-static {p2}, Lcom/google/sigma_gson/Primitives;->wrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public fromJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 5
    .parameter "json"
    .parameter "typeOfT"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/sigma_gson/JsonElement;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 562
    if-nez p1, :cond_0

    .line 563
    const/4 v1, 0x0

    .line 569
    :goto_0
    return-object v1

    .line 565
    :cond_0
    new-instance v0, Lcom/google/sigma_gson/JsonDeserializationContextDefault;

    iget-object v2, p0, Lcom/google/sigma_gson/Gson;->deserializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

    invoke-direct {p0, v2}, Lcom/google/sigma_gson/Gson;->createDefaultObjectNavigatorFactory(Lcom/google/sigma_gson/ExclusionStrategy;)Lcom/google/sigma_gson/ObjectNavigatorFactory;

    move-result-object v2

    iget-object v3, p0, Lcom/google/sigma_gson/Gson;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    iget-object v4, p0, Lcom/google/sigma_gson/Gson;->objectConstructor:Lcom/google/sigma_gson/MappedObjectConstructor;

    invoke-direct {v0, v2, v3, v4}, Lcom/google/sigma_gson/JsonDeserializationContextDefault;-><init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/MappedObjectConstructor;)V

    .line 568
    .local v0, context:Lcom/google/sigma_gson/JsonDeserializationContext;
    invoke-interface {v0, p1, p2}, Lcom/google/sigma_gson/JsonDeserializationContext;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    .line 569
    .local v1, target:Ljava/lang/Object;,"TT;"
    goto :goto_0
.end method

.method public fromJson(Lcom/google/sigma_gson/stream/JsonReader;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 3
    .parameter "reader"
    .parameter "typeOfT"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/sigma_gson/stream/JsonReader;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;,
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 511
    invoke-virtual {p1}, Lcom/google/sigma_gson/stream/JsonReader;->isLenient()Z

    move-result v0

    .line 512
    .local v0, oldLenient:Z
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/google/sigma_gson/stream/JsonReader;->setLenient(Z)V

    .line 514
    :try_start_0
    invoke-static {p1}, Lcom/google/sigma_gson/Streams;->parse(Lcom/google/sigma_gson/stream/JsonReader;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    .line 515
    .local v1, root:Lcom/google/sigma_gson/JsonElement;
    invoke-virtual {p0, v1, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 517
    invoke-virtual {p1, v0}, Lcom/google/sigma_gson/stream/JsonReader;->setLenient(Z)V

    return-object v2

    .end local v1           #root:Lcom/google/sigma_gson/JsonElement;
    :catchall_0
    move-exception v2

    invoke-virtual {p1, v0}, Lcom/google/sigma_gson/stream/JsonReader;->setLenient(Z)V

    throw v2
.end method

.method public fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .parameter "json"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/Reader;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonSyntaxException;,
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 457
    .local p2, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/google/sigma_gson/stream/JsonReader;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/stream/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 458
    .local v0, jsonReader:Lcom/google/sigma_gson/stream/JsonReader;
    invoke-virtual {p0, v0, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Lcom/google/sigma_gson/stream/JsonReader;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    .line 459
    .local v1, object:Ljava/lang/Object;
    invoke-static {v1, v0}, Lcom/google/sigma_gson/Gson;->assertFullConsumption(Ljava/lang/Object;Lcom/google/sigma_gson/stream/JsonReader;)V

    .line 460
    invoke-static {p2}, Lcom/google/sigma_gson/Primitives;->wrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public fromJson(Ljava/io/Reader;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 2
    .parameter "json"
    .parameter "typeOfT"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/Reader;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;,
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 483
    new-instance v0, Lcom/google/sigma_gson/stream/JsonReader;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/stream/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 484
    .local v0, jsonReader:Lcom/google/sigma_gson/stream/JsonReader;
    invoke-virtual {p0, v0, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Lcom/google/sigma_gson/stream/JsonReader;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    .line 485
    .local v1, object:Ljava/lang/Object;,"TT;"
    invoke-static {v1, v0}, Lcom/google/sigma_gson/Gson;->assertFullConsumption(Ljava/lang/Object;Lcom/google/sigma_gson/stream/JsonReader;)V

    .line 486
    return-object v1
.end method

.method public fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .parameter "json"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 406
    .local p2, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    .line 407
    .local v0, object:Ljava/lang/Object;
    invoke-static {p2}, Lcom/google/sigma_gson/Primitives;->wrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 2
    .parameter "json"
    .parameter "typeOfT"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonSyntaxException;
        }
    .end annotation

    .prologue
    .line 430
    if-nez p1, :cond_0

    .line 431
    const/4 v1, 0x0

    .line 435
    :goto_0
    return-object v1

    .line 433
    :cond_0
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 434
    .local v0, reader:Ljava/io/StringReader;
    invoke-virtual {p0, v0, p2}, Lcom/google/sigma_gson/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    .line 435
    .local v1, target:Ljava/lang/Object;,"TT;"
    goto :goto_0
.end method

.method public toJson(Lcom/google/sigma_gson/JsonElement;)Ljava/lang/String;
    .locals 2
    .parameter "jsonElement"

    .prologue
    .line 341
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 342
    .local v0, writer:Ljava/io/StringWriter;
    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/Gson;->toJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/Appendable;)V

    .line 343
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toJson(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "src"

    .prologue
    .line 250
    if-nez p1, :cond_1

    .line 251
    iget-boolean v0, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    if-eqz v0, :cond_0

    const-string v0, "null"

    .line 253
    :goto_0
    return-object v0

    .line 251
    :cond_0
    const-string v0, ""

    goto :goto_0

    .line 253
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;)Ljava/lang/String;
    .locals 2
    .parameter "src"
    .parameter "typeOfSrc"

    .prologue
    .line 272
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 273
    .local v0, writer:Ljava/io/StringWriter;
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/Gson;->toJsonTree(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/google/sigma_gson/Gson;->toJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/Appendable;)V

    .line 274
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toJson(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/stream/JsonWriter;)V
    .locals 4
    .parameter "jsonElement"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 374
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->isLenient()Z

    move-result v2

    .line 375
    .local v2, oldLenient:Z
    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Lcom/google/sigma_gson/stream/JsonWriter;->setLenient(Z)V

    .line 376
    invoke-virtual {p2}, Lcom/google/sigma_gson/stream/JsonWriter;->isHtmlSafe()Z

    move-result v1

    .line 377
    .local v1, oldHtmlSafe:Z
    iget-boolean v3, p0, Lcom/google/sigma_gson/Gson;->htmlSafe:Z

    invoke-virtual {p2, v3}, Lcom/google/sigma_gson/stream/JsonWriter;->setHtmlSafe(Z)V

    .line 379
    :try_start_0
    iget-boolean v3, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    invoke-static {p1, v3, p2}, Lcom/google/sigma_gson/Streams;->write(Lcom/google/sigma_gson/JsonElement;ZLcom/google/sigma_gson/stream/JsonWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    invoke-virtual {p2, v2}, Lcom/google/sigma_gson/stream/JsonWriter;->setLenient(Z)V

    .line 384
    invoke-virtual {p2, v1}, Lcom/google/sigma_gson/stream/JsonWriter;->setHtmlSafe(Z)V

    .line 386
    return-void

    .line 380
    :catch_0
    move-exception v0

    .line 381
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    new-instance v3, Lcom/google/sigma_gson/JsonIOException;

    invoke-direct {v3, v0}, Lcom/google/sigma_gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 383
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-virtual {p2, v2}, Lcom/google/sigma_gson/stream/JsonWriter;->setLenient(Z)V

    .line 384
    invoke-virtual {p2, v1}, Lcom/google/sigma_gson/stream/JsonWriter;->setHtmlSafe(Z)V

    throw v3
.end method

.method public toJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/Appendable;)V
    .locals 3
    .parameter "jsonElement"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 356
    :try_start_0
    iget-boolean v2, p0, Lcom/google/sigma_gson/Gson;->generateNonExecutableJson:Z

    if-eqz v2, :cond_0

    .line 357
    const-string v2, ")]}\'\n"

    invoke-interface {p2, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 359
    :cond_0
    new-instance v1, Lcom/google/sigma_gson/stream/JsonWriter;

    invoke-static {p2}, Lcom/google/sigma_gson/Streams;->writerForAppendable(Ljava/lang/Appendable;)Ljava/io/Writer;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/sigma_gson/stream/JsonWriter;-><init>(Ljava/io/Writer;)V

    .line 360
    .local v1, jsonWriter:Lcom/google/sigma_gson/stream/JsonWriter;
    iget-boolean v2, p0, Lcom/google/sigma_gson/Gson;->prettyPrinting:Z

    if-eqz v2, :cond_1

    .line 361
    const-string v2, "  "

    invoke-virtual {v1, v2}, Lcom/google/sigma_gson/stream/JsonWriter;->setIndent(Ljava/lang/String;)V

    .line 363
    :cond_1
    invoke-virtual {p0, p1, v1}, Lcom/google/sigma_gson/Gson;->toJson(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/stream/JsonWriter;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    return-void

    .line 364
    .end local v1           #jsonWriter:Lcom/google/sigma_gson/stream/JsonWriter;
    :catch_0
    move-exception v0

    .line 365
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public toJson(Ljava/lang/Object;Ljava/lang/Appendable;)V
    .locals 2
    .parameter "src"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 293
    if-eqz p1, :cond_1

    .line 294
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, p1, v1, p2}, Lcom/google/sigma_gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/lang/Appendable;)V

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 295
    :cond_1
    iget-boolean v1, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    if-eqz v1, :cond_0

    .line 296
    invoke-direct {p0, p2}, Lcom/google/sigma_gson/Gson;->writeOutNullString(Ljava/lang/Appendable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, ioe:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/stream/JsonWriter;)V
    .locals 1
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 330
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/Gson;->toJsonTree(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, v0, p3}, Lcom/google/sigma_gson/Gson;->toJson(Lcom/google/sigma_gson/JsonElement;Lcom/google/sigma_gson/stream/JsonWriter;)V

    .line 331
    return-void
.end method

.method public toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/lang/Appendable;)V
    .locals 1
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonIOException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/Gson;->toJsonTree(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    .line 321
    .local v0, jsonElement:Lcom/google/sigma_gson/JsonElement;
    invoke-virtual {p0, v0, p3}, Lcom/google/sigma_gson/Gson;->toJson(Lcom/google/sigma_gson/JsonElement;Ljava/lang/Appendable;)V

    .line 322
    return-void
.end method

.method public toJsonTree(Ljava/lang/Object;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "src"

    .prologue
    .line 205
    if-nez p1, :cond_0

    .line 206
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v0

    .line 208
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/sigma_gson/Gson;->toJsonTree(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    goto :goto_0
.end method

.method public toJsonTree(Ljava/lang/Object;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/JsonElement;
    .locals 4
    .parameter "src"
    .parameter "typeOfSrc"

    .prologue
    .line 228
    if-nez p1, :cond_0

    .line 229
    invoke-static {}, Lcom/google/sigma_gson/JsonNull;->createJsonNull()Lcom/google/sigma_gson/JsonNull;

    move-result-object v1

    .line 233
    :goto_0
    return-object v1

    .line 231
    :cond_0
    new-instance v0, Lcom/google/sigma_gson/JsonSerializationContextDefault;

    iget-object v1, p0, Lcom/google/sigma_gson/Gson;->serializationStrategy:Lcom/google/sigma_gson/ExclusionStrategy;

    invoke-direct {p0, v1}, Lcom/google/sigma_gson/Gson;->createDefaultObjectNavigatorFactory(Lcom/google/sigma_gson/ExclusionStrategy;)Lcom/google/sigma_gson/ObjectNavigatorFactory;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    iget-object v3, p0, Lcom/google/sigma_gson/Gson;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/sigma_gson/JsonSerializationContextDefault;-><init>(Lcom/google/sigma_gson/ObjectNavigatorFactory;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 233
    .local v0, context:Lcom/google/sigma_gson/JsonSerializationContextDefault;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/sigma_gson/JsonSerializationContextDefault;->serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Z)Lcom/google/sigma_gson/JsonElement;

    move-result-object v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 583
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "serializeNulls:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/sigma_gson/Gson;->serializeNulls:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",serializers:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/sigma_gson/Gson;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",deserializers:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/sigma_gson/Gson;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",instanceCreators:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/sigma_gson/Gson;->objectConstructor:Lcom/google/sigma_gson/MappedObjectConstructor;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 593
    .local v0, sb:Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
