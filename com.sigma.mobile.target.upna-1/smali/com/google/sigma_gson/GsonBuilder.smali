.class public final Lcom/google/sigma_gson/GsonBuilder;
.super Ljava/lang/Object;
.source "GsonBuilder.java"


# static fields
.field private static final exposeAnnotationDeserializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationDeserializationExclusionStrategy;

.field private static final exposeAnnotationSerializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationSerializationExclusionStrategy;

.field private static final innerClassExclusionStrategy:Lcom/google/sigma_gson/InnerClassExclusionStrategy;


# instance fields
.field private datePattern:Ljava/lang/String;

.field private dateStyle:I

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

.field private escapeHtmlChars:Z

.field private excludeFieldsWithoutExposeAnnotation:Z

.field private final exclusionStrategies:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/google/sigma_gson/ExclusionStrategy;",
            ">;"
        }
    .end annotation
.end field

.field private fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

.field private generateNonExecutableJson:Z

.field private ignoreVersionsAfter:D

.field private final instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<*>;>;"
        }
    .end annotation
.end field

.field private longSerializationPolicy:Lcom/google/sigma_gson/LongSerializationPolicy;

.field private modifierBasedExclusionStrategy:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

.field private prettyPrinting:Z

.field private serializeInnerClasses:Z

.field private serializeNulls:Z

.field private serializeSpecialFloatingPointValues:Z

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

.field private timeStyle:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    new-instance v0, Lcom/google/sigma_gson/InnerClassExclusionStrategy;

    invoke-direct {v0}, Lcom/google/sigma_gson/InnerClassExclusionStrategy;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/GsonBuilder;->innerClassExclusionStrategy:Lcom/google/sigma_gson/InnerClassExclusionStrategy;

    .line 58
    new-instance v0, Lcom/google/sigma_gson/ExposeAnnotationSerializationExclusionStrategy;

    invoke-direct {v0}, Lcom/google/sigma_gson/ExposeAnnotationSerializationExclusionStrategy;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/GsonBuilder;->exposeAnnotationSerializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationSerializationExclusionStrategy;

    .line 61
    new-instance v0, Lcom/google/sigma_gson/ExposeAnnotationDeserializationExclusionStrategy;

    invoke-direct {v0}, Lcom/google/sigma_gson/ExposeAnnotationDeserializationExclusionStrategy;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/GsonBuilder;->exposeAnnotationDeserializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationDeserializationExclusionStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    .line 93
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_ANON_LOCAL_CLASS_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/AnonymousAndLocalClassExclusionStrategy;

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 94
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    sget-object v1, Lcom/google/sigma_gson/Gson;->DEFAULT_SYNTHETIC_FIELD_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/SyntheticFieldExclusionStrategy;

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 97
    const-wide/high16 v0, -0x4010

    iput-wide v0, p0, Lcom/google/sigma_gson/GsonBuilder;->ignoreVersionsAfter:D

    .line 98
    iput-boolean v3, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeInnerClasses:Z

    .line 99
    iput-boolean v2, p0, Lcom/google/sigma_gson/GsonBuilder;->prettyPrinting:Z

    .line 100
    iput-boolean v3, p0, Lcom/google/sigma_gson/GsonBuilder;->escapeHtmlChars:Z

    .line 101
    sget-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_MODIFIER_BASED_EXCLUSION_STRATEGY:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->modifierBasedExclusionStrategy:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    .line 102
    iput-boolean v2, p0, Lcom/google/sigma_gson/GsonBuilder;->excludeFieldsWithoutExposeAnnotation:Z

    .line 103
    sget-object v0, Lcom/google/sigma_gson/LongSerializationPolicy;->DEFAULT:Lcom/google/sigma_gson/LongSerializationPolicy;

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->longSerializationPolicy:Lcom/google/sigma_gson/LongSerializationPolicy;

    .line 104
    sget-object v0, Lcom/google/sigma_gson/Gson;->DEFAULT_NAMING_POLICY:Lcom/google/sigma_gson/FieldNamingStrategy2;

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 105
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 106
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 107
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 108
    iput-boolean v2, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeNulls:Z

    .line 109
    iput v4, p0, Lcom/google/sigma_gson/GsonBuilder;->dateStyle:I

    .line 110
    iput v4, p0, Lcom/google/sigma_gson/GsonBuilder;->timeStyle:I

    .line 111
    iput-boolean v2, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeSpecialFloatingPointValues:Z

    .line 112
    iput-boolean v2, p0, Lcom/google/sigma_gson/GsonBuilder;->generateNonExecutableJson:Z

    .line 113
    return-void
.end method

.method private static addTypeAdaptersForDate(Ljava/lang/String;IILcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V
    .locals 4
    .parameter "datePattern"
    .parameter "dateStyle"
    .parameter "timeStyle"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .local p3, serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    .local p4, deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    const/4 v3, 0x2

    .line 554
    const/4 v0, 0x0

    .line 555
    .local v0, dateTypeAdapter:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    if-eqz p0, :cond_3

    const-string v1, ""

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 556
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    .end local v0           #dateTypeAdapter:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    invoke-direct {v0, p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;-><init>(Ljava/lang/String;)V

    .line 561
    .restart local v0       #dateTypeAdapter:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 562
    const-class v1, Ljava/util/Date;

    invoke-virtual {p3, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->hasSpecificHandlerFor(Ljava/lang/reflect/Type;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 563
    const-class v1, Ljava/util/Date;

    invoke-virtual {p3, v1, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 565
    :cond_1
    const-class v1, Ljava/util/Date;

    invoke-virtual {p4, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->hasSpecificHandlerFor(Ljava/lang/reflect/Type;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 566
    const-class v1, Ljava/util/Date;

    invoke-virtual {p4, v1, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 569
    :cond_2
    return-void

    .line 557
    :cond_3
    if-eq p1, v3, :cond_0

    if-eq p2, v3, :cond_0

    .line 558
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    .end local v0           #dateTypeAdapter:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    invoke-direct {v0, p1, p2}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;-><init>(II)V

    .restart local v0       #dateTypeAdapter:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    goto :goto_0
.end method

.method private registerDeserializer(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 2
    .parameter "typeOfT"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 413
    .local p2, deserializer:Lcom/google/sigma_gson/JsonDeserializer;,"Lcom/google/sigma_gson/JsonDeserializer<TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    new-instance v1, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;

    invoke-direct {v1, p2}, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;-><init>(Lcom/google/sigma_gson/JsonDeserializer;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 414
    return-object p0
.end method

.method private registerDeserializerForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 463
    .local p1, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, deserializer:Lcom/google/sigma_gson/JsonDeserializer;,"Lcom/google/sigma_gson/JsonDeserializer<TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    new-instance v1, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;

    invoke-direct {v1, p2}, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;-><init>(Lcom/google/sigma_gson/JsonDeserializer;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 465
    return-object p0
.end method

.method private registerInstanceCreator(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/InstanceCreator;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "typeOfT"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<+TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 383
    .local p2, instanceCreator:Lcom/google/sigma_gson/InstanceCreator;,"Lcom/google/sigma_gson/InstanceCreator<+TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v0, p1, p2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 384
    return-object p0
.end method

.method private registerInstanceCreatorForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/InstanceCreator;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<+TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 451
    .local p1, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, instanceCreator:Lcom/google/sigma_gson/InstanceCreator;,"Lcom/google/sigma_gson/InstanceCreator<+TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v0, p1, p2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 452
    return-object p0
.end method

.method private registerSerializer(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializer;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "typeOfT"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 398
    .local p2, serializer:Lcom/google/sigma_gson/JsonSerializer;,"Lcom/google/sigma_gson/JsonSerializer<TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v0, p1, p2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 399
    return-object p0
.end method

.method private registerSerializerForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/JsonSerializer;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<TT;>;)",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 457
    .local p1, classOfT:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, serializer:Lcom/google/sigma_gson/JsonSerializer;,"Lcom/google/sigma_gson/JsonSerializer<TT;>;"
    iget-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v0, p1, p2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 458
    return-object p0
.end method


# virtual methods
.method public create()Lcom/google/sigma_gson/Gson;
    .locals 17

    .prologue
    .line 500
    new-instance v14, Ljava/util/LinkedList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    invoke-direct {v14, v4}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 502
    .local v14, serializationStrategies:Ljava/util/List;,"Ljava/util/List<Lcom/google/sigma_gson/ExclusionStrategy;>;"
    new-instance v13, Ljava/util/LinkedList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    invoke-direct {v13, v4}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 505
    .local v13, deserializationStrategies:Ljava/util/List;,"Ljava/util/List<Lcom/google/sigma_gson/ExclusionStrategy;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->modifierBasedExclusionStrategy:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 506
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->modifierBasedExclusionStrategy:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 508
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/sigma_gson/GsonBuilder;->serializeInnerClasses:Z

    if-nez v4, :cond_0

    .line 509
    sget-object v4, Lcom/google/sigma_gson/GsonBuilder;->innerClassExclusionStrategy:Lcom/google/sigma_gson/InnerClassExclusionStrategy;

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 510
    sget-object v4, Lcom/google/sigma_gson/GsonBuilder;->innerClassExclusionStrategy:Lcom/google/sigma_gson/InnerClassExclusionStrategy;

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 512
    :cond_0
    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/google/sigma_gson/GsonBuilder;->ignoreVersionsAfter:D

    const-wide/high16 v15, -0x4010

    cmpl-double v4, v9, v15

    if-eqz v4, :cond_1

    .line 513
    new-instance v4, Lcom/google/sigma_gson/VersionExclusionStrategy;

    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/google/sigma_gson/GsonBuilder;->ignoreVersionsAfter:D

    invoke-direct {v4, v9, v10}, Lcom/google/sigma_gson/VersionExclusionStrategy;-><init>(D)V

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 514
    new-instance v4, Lcom/google/sigma_gson/VersionExclusionStrategy;

    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/google/sigma_gson/GsonBuilder;->ignoreVersionsAfter:D

    invoke-direct {v4, v9, v10}, Lcom/google/sigma_gson/VersionExclusionStrategy;-><init>(D)V

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/sigma_gson/GsonBuilder;->excludeFieldsWithoutExposeAnnotation:Z

    if-eqz v4, :cond_2

    .line 517
    sget-object v4, Lcom/google/sigma_gson/GsonBuilder;->exposeAnnotationSerializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationSerializationExclusionStrategy;

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 518
    sget-object v4, Lcom/google/sigma_gson/GsonBuilder;->exposeAnnotationDeserializationExclusionStrategy:Lcom/google/sigma_gson/ExposeAnnotationDeserializationExclusionStrategy;

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 520
    :cond_2
    new-instance v2, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;

    invoke-direct {v2, v14}, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;-><init>(Ljava/util/Collection;)V

    .line 522
    .local v2, serializationExclusionStrategy:Lcom/google/sigma_gson/ExclusionStrategy;
    new-instance v3, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;

    invoke-direct {v3, v13}, Lcom/google/sigma_gson/DisjunctionExclusionStrategy;-><init>(Ljava/util/Collection;)V

    .line 525
    .local v3, deserializationExclusionStrategy:Lcom/google/sigma_gson/ExclusionStrategy;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->copyOf()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v7

    .line 526
    .local v7, customSerializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->deserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->copyOf()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v8

    .line 527
    .local v8, customDeserializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->datePattern:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/sigma_gson/GsonBuilder;->dateStyle:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/sigma_gson/GsonBuilder;->timeStyle:I

    invoke-static {v4, v6, v9, v7, v8}, Lcom/google/sigma_gson/GsonBuilder;->addTypeAdaptersForDate(Ljava/lang/String;IILcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 530
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/sigma_gson/GsonBuilder;->serializeSpecialFloatingPointValues:Z

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/sigma_gson/GsonBuilder;->longSerializationPolicy:Lcom/google/sigma_gson/LongSerializationPolicy;

    invoke-static {v4, v6}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultSerializers(ZLcom/google/sigma_gson/LongSerializationPolicy;)Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v4

    invoke-virtual {v7, v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 533
    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultDeserializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v4

    invoke-virtual {v8, v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 535
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->copyOf()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v12

    .line 537
    .local v12, customInstanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/InstanceCreator<*>;>;"
    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultInstanceCreators()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v4

    invoke-virtual {v12, v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 539
    invoke-virtual {v7}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 540
    invoke-virtual {v8}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 541
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->instanceCreators:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 543
    new-instance v5, Lcom/google/sigma_gson/MappedObjectConstructor;

    invoke-direct {v5, v12}, Lcom/google/sigma_gson/MappedObjectConstructor;-><init>(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 545
    .local v5, objConstructor:Lcom/google/sigma_gson/MappedObjectConstructor;
    new-instance v1, Lcom/google/sigma_gson/Gson;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/sigma_gson/GsonBuilder;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/google/sigma_gson/GsonBuilder;->serializeNulls:Z

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/sigma_gson/GsonBuilder;->generateNonExecutableJson:Z

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/google/sigma_gson/GsonBuilder;->escapeHtmlChars:Z

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/sigma_gson/GsonBuilder;->prettyPrinting:Z

    invoke-direct/range {v1 .. v11}, Lcom/google/sigma_gson/Gson;-><init>(Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/ExclusionStrategy;Lcom/google/sigma_gson/FieldNamingStrategy2;Lcom/google/sigma_gson/MappedObjectConstructor;ZLcom/google/sigma_gson/ParameterizedTypeHandlerMap;Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;ZZZ)V

    .line 548
    .local v1, gson:Lcom/google/sigma_gson/Gson;
    return-object v1
.end method

.method public disableHtmlEscaping()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 277
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->escapeHtmlChars:Z

    .line 278
    return-object p0
.end method

.method public disableInnerClassSerialization()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 187
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeInnerClasses:Z

    .line 188
    return-object p0
.end method

.method public varargs excludeFieldsWithModifiers([I)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "modifiers"

    .prologue
    .line 139
    new-instance v0, Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;-><init>([I)V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->modifierBasedExclusionStrategy:Lcom/google/sigma_gson/ModifierBasedExclusionStrategy;

    .line 140
    return-object p0
.end method

.method public excludeFieldsWithoutExposeAnnotation()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->excludeFieldsWithoutExposeAnnotation:Z

    .line 165
    return-object p0
.end method

.method public generateNonExecutableJson()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->generateNonExecutableJson:Z

    .line 154
    return-object p0
.end method

.method public registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "type"
    .parameter "typeAdapter"

    .prologue
    .line 356
    instance-of v0, p2, Lcom/google/sigma_gson/JsonSerializer;

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/google/sigma_gson/JsonDeserializer;

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/google/sigma_gson/InstanceCreator;

    if-eqz v0, :cond_4

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/sigma_gson/Preconditions;->checkArgument(Z)V

    .line 358
    instance-of v0, p2, Lcom/google/sigma_gson/InstanceCreator;

    if-eqz v0, :cond_1

    move-object v0, p2

    .line 359
    check-cast v0, Lcom/google/sigma_gson/InstanceCreator;

    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/GsonBuilder;->registerInstanceCreator(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/InstanceCreator;)Lcom/google/sigma_gson/GsonBuilder;

    .line 361
    :cond_1
    instance-of v0, p2, Lcom/google/sigma_gson/JsonSerializer;

    if-eqz v0, :cond_2

    move-object v0, p2

    .line 362
    check-cast v0, Lcom/google/sigma_gson/JsonSerializer;

    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/GsonBuilder;->registerSerializer(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializer;)Lcom/google/sigma_gson/GsonBuilder;

    .line 364
    :cond_2
    instance-of v0, p2, Lcom/google/sigma_gson/JsonDeserializer;

    if-eqz v0, :cond_3

    .line 365
    check-cast p2, Lcom/google/sigma_gson/JsonDeserializer;

    .end local p2
    invoke-direct {p0, p1, p2}, Lcom/google/sigma_gson/GsonBuilder;->registerDeserializer(Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/GsonBuilder;

    .line 367
    :cond_3
    return-object p0

    .line 356
    .restart local p2
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method registerTypeHierarchyAdapter(Ljava/lang/Class;Ljava/lang/Object;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter
    .parameter "typeAdapter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/sigma_gson/GsonBuilder;"
        }
    .end annotation

    .prologue
    .line 435
    .local p1, baseType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    instance-of v0, p2, Lcom/google/sigma_gson/JsonSerializer;

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/google/sigma_gson/JsonDeserializer;

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/google/sigma_gson/InstanceCreator;

    if-eqz v0, :cond_4

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/sigma_gson/Preconditions;->checkArgument(Z)V

    .line 437
    instance-of v0, p2, Lcom/google/sigma_gson/InstanceCreator;

    if-eqz v0, :cond_1

    move-object v0, p2

    .line 438
    check-cast v0, Lcom/google/sigma_gson/InstanceCreator;

    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/GsonBuilder;->registerInstanceCreatorForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/InstanceCreator;)Lcom/google/sigma_gson/GsonBuilder;

    .line 440
    :cond_1
    instance-of v0, p2, Lcom/google/sigma_gson/JsonSerializer;

    if-eqz v0, :cond_2

    move-object v0, p2

    .line 441
    check-cast v0, Lcom/google/sigma_gson/JsonSerializer;

    invoke-direct {p0, p1, v0}, Lcom/google/sigma_gson/GsonBuilder;->registerSerializerForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/JsonSerializer;)Lcom/google/sigma_gson/GsonBuilder;

    .line 443
    :cond_2
    instance-of v0, p2, Lcom/google/sigma_gson/JsonDeserializer;

    if-eqz v0, :cond_3

    .line 444
    check-cast p2, Lcom/google/sigma_gson/JsonDeserializer;

    .end local p2
    invoke-direct {p0, p1, p2}, Lcom/google/sigma_gson/GsonBuilder;->registerDeserializerForTypeHierarchy(Ljava/lang/Class;Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/GsonBuilder;

    .line 446
    :cond_3
    return-object p0

    .line 435
    .restart local p2
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeNulls()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeNulls:Z

    .line 177
    return-object p0
.end method

.method public serializeSpecialFloatingPointValues()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 489
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->serializeSpecialFloatingPointValues:Z

    .line 490
    return-object p0
.end method

.method public setDateFormat(I)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "style"

    .prologue
    .line 315
    iput p1, p0, Lcom/google/sigma_gson/GsonBuilder;->dateStyle:I

    .line 316
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->datePattern:Ljava/lang/String;

    .line 317
    return-object p0
.end method

.method public setDateFormat(II)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"

    .prologue
    .line 336
    iput p1, p0, Lcom/google/sigma_gson/GsonBuilder;->dateStyle:I

    .line 337
    iput p2, p0, Lcom/google/sigma_gson/GsonBuilder;->timeStyle:I

    .line 338
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->datePattern:Ljava/lang/String;

    .line 339
    return-object p0
.end method

.method public setDateFormat(Ljava/lang/String;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 0
    .parameter "pattern"

    .prologue
    .line 296
    iput-object p1, p0, Lcom/google/sigma_gson/GsonBuilder;->datePattern:Ljava/lang/String;

    .line 297
    return-object p0
.end method

.method public varargs setExclusionStrategies([Lcom/google/sigma_gson/ExclusionStrategy;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 5
    .parameter "strategies"

    .prologue
    .line 252
    move-object v0, p1

    .local v0, arr$:[Lcom/google/sigma_gson/ExclusionStrategy;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 253
    .local v3, strategy:Lcom/google/sigma_gson/ExclusionStrategy;
    iget-object v4, p0, Lcom/google/sigma_gson/GsonBuilder;->exclusionStrategies:Ljava/util/Collection;

    invoke-interface {v4, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 252
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 255
    .end local v3           #strategy:Lcom/google/sigma_gson/ExclusionStrategy;
    :cond_0
    return-object p0
.end method

.method public setFieldNamingPolicy(Lcom/google/sigma_gson/FieldNamingPolicy;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "namingConvention"

    .prologue
    .line 213
    invoke-virtual {p1}, Lcom/google/sigma_gson/FieldNamingPolicy;->getFieldNamingPolicy()Lcom/google/sigma_gson/FieldNamingStrategy2;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/sigma_gson/GsonBuilder;->setFieldNamingStrategy(Lcom/google/sigma_gson/FieldNamingStrategy2;)Lcom/google/sigma_gson/GsonBuilder;

    move-result-object v0

    return-object v0
.end method

.method setFieldNamingStrategy(Lcom/google/sigma_gson/FieldNamingStrategy2;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "fieldNamingStrategy"

    .prologue
    .line 236
    new-instance v0, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/SerializedNameAnnotationInterceptingNamingPolicy;-><init>(Lcom/google/sigma_gson/FieldNamingStrategy2;)V

    iput-object v0, p0, Lcom/google/sigma_gson/GsonBuilder;->fieldNamingPolicy:Lcom/google/sigma_gson/FieldNamingStrategy2;

    .line 238
    return-object p0
.end method

.method public setFieldNamingStrategy(Lcom/google/sigma_gson/FieldNamingStrategy;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 1
    .parameter "fieldNamingStrategy"

    .prologue
    .line 225
    new-instance v0, Lcom/google/sigma_gson/FieldNamingStrategy2Adapter;

    invoke-direct {v0, p1}, Lcom/google/sigma_gson/FieldNamingStrategy2Adapter;-><init>(Lcom/google/sigma_gson/FieldNamingStrategy;)V

    invoke-virtual {p0, v0}, Lcom/google/sigma_gson/GsonBuilder;->setFieldNamingStrategy(Lcom/google/sigma_gson/FieldNamingStrategy2;)Lcom/google/sigma_gson/GsonBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setLongSerializationPolicy(Lcom/google/sigma_gson/LongSerializationPolicy;)Lcom/google/sigma_gson/GsonBuilder;
    .locals 0
    .parameter "serializationPolicy"

    .prologue
    .line 200
    iput-object p1, p0, Lcom/google/sigma_gson/GsonBuilder;->longSerializationPolicy:Lcom/google/sigma_gson/LongSerializationPolicy;

    .line 201
    return-object p0
.end method

.method public setPrettyPrinting()Lcom/google/sigma_gson/GsonBuilder;
    .locals 1

    .prologue
    .line 265
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/sigma_gson/GsonBuilder;->prettyPrinting:Z

    .line 266
    return-object p0
.end method

.method public setVersion(D)Lcom/google/sigma_gson/GsonBuilder;
    .locals 0
    .parameter "ignoreVersionsAfter"

    .prologue
    .line 123
    iput-wide p1, p0, Lcom/google/sigma_gson/GsonBuilder;->ignoreVersionsAfter:D

    .line 124
    return-object p0
.end method
