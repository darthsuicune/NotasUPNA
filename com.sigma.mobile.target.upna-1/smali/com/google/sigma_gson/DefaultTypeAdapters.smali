.class final Lcom/google/sigma_gson/DefaultTypeAdapters;
.super Ljava/lang/Object;
.source "DefaultTypeAdapters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/sigma_gson/DefaultTypeAdapters$1;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleSerializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$LongSerializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;,
        Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;
    }
.end annotation


# static fields
.field private static final BIG_DECIMAL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;

.field private static final BIG_INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;

.field private static final BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

.field private static final BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

.field private static final CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

.field private static final COLLECTION_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

.field private static final DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

.field private static final DEFAULT_DESERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final DEFAULT_INSTANCE_CREATORS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final DEFAULT_SERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final DOUBLE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;

.field private static final ENUM_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;

.field private static final FLOAT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

.field private static final GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

.field private static final HASH_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;

.field private static final INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

.field private static final JAVA_SQL_DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;

.field private static final LOCALE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;

.field private static final LONG_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;

.field private static final MAP_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

.field private static final NUMBER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;

.field private static final PROPERTIES_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;

.field private static final SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

.field private static final STRING_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

.field private static final TIMESTAMP_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;

.field private static final TIME_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;

.field private static final TREE_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;

.field private static final URI_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

.field private static final URL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;

.field private static final UUUID_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 57
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    invoke-direct {v0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    .line 58
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;

    invoke-direct {v0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->JAVA_SQL_DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;

    .line 60
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;

    invoke-direct {v0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->TIME_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;

    .line 62
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;

    invoke-direct {v0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->TIMESTAMP_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;

    .line 66
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->ENUM_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;

    .line 67
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->URL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;

    .line 68
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->URI_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

    .line 69
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->UUUID_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;

    .line 70
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->LOCALE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;

    .line 71
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->COLLECTION_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

    .line 72
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    invoke-direct {v0}, Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;-><init>()V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->MAP_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    .line 73
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_DECIMAL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;

    .line 74
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;

    .line 76
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    .line 77
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    .line 78
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    .line 79
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DOUBLE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;

    .line 80
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->FLOAT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

    .line 81
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    .line 82
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->LONG_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;

    .line 83
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->NUMBER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;

    .line 84
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    .line 85
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->STRING_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

    .line 87
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->PROPERTIES_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;

    .line 88
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->TREE_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;

    .line 89
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->HASH_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;

    .line 90
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;-><init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    .line 96
    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->createDefaultSerializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v0

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_SERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 98
    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->createDefaultDeserializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v0

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_DESERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    .line 100
    invoke-static {}, Lcom/google/sigma_gson/DefaultTypeAdapters;->createDefaultInstanceCreators()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v0

    sput-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_INSTANCE_CREATORS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 884
    return-void
.end method

.method private static createDefaultDeserializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 142
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    .line 144
    .local v0, map:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonDeserializer<*>;>;"
    const-class v1, Ljava/lang/Enum;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->ENUM_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 145
    const-class v1, Ljava/net/URL;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->URL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 146
    const-class v1, Ljava/net/URI;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->URI_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 147
    const-class v1, Ljava/util/UUID;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->UUUID_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 148
    const-class v1, Ljava/util/Locale;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->LOCALE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 149
    const-class v1, Ljava/util/Collection;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->COLLECTION_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 150
    const-class v1, Ljava/util/Map;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->MAP_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 151
    const-class v1, Ljava/util/Date;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 152
    const-class v1, Ljava/sql/Date;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->JAVA_SQL_DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 153
    const-class v1, Ljava/sql/Timestamp;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->TIMESTAMP_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimestampDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 154
    const-class v1, Ljava/sql/Time;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->TIME_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 155
    const-class v1, Ljava/util/Calendar;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 156
    const-class v1, Ljava/util/GregorianCalendar;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 157
    const-class v1, Ljava/math/BigDecimal;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_DECIMAL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 158
    const-class v1, Ljava/math/BigInteger;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 161
    const-class v1, Ljava/lang/Boolean;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 162
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 163
    const-class v1, Ljava/lang/Byte;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 164
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 165
    const-class v1, Ljava/lang/Character;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 166
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 167
    const-class v1, Ljava/lang/Double;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->DOUBLE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 168
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->DOUBLE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 169
    const-class v1, Ljava/lang/Float;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->FLOAT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 170
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->FLOAT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$FloatDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 171
    const-class v1, Ljava/lang/Integer;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 172
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 173
    const-class v1, Ljava/lang/Long;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->LONG_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 174
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->LONG_DESERIALIZER:Lcom/google/sigma_gson/DefaultTypeAdapters$LongDeserializer;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 175
    const-class v1, Ljava/lang/Number;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->NUMBER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 176
    const-class v1, Ljava/lang/Short;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 177
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 178
    const-class v1, Ljava/lang/String;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->STRING_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

    invoke-static {v2}, Lcom/google/sigma_gson/DefaultTypeAdapters;->wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 180
    invoke-virtual {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 181
    return-object v0
.end method

.method private static createDefaultInstanceCreators()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 185
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    .line 187
    .local v0, map:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/InstanceCreator<*>;>;"
    const-class v1, Ljava/util/Map;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->MAP_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 190
    const-class v1, Ljava/util/Collection;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->COLLECTION_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 192
    const-class v1, Ljava/util/Set;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->HASH_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$HashSetCreator;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 193
    const-class v1, Ljava/util/SortedSet;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->TREE_SET_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$TreeSetCreator;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 194
    const-class v1, Ljava/util/Properties;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->PROPERTIES_CREATOR:Lcom/google/sigma_gson/DefaultTypeAdapters$PropertiesCreator;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 195
    invoke-virtual {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 196
    return-object v0
.end method

.method private static createDefaultSerializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    .line 107
    .local v0, map:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    const-class v1, Ljava/lang/Enum;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->ENUM_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$EnumTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 108
    const-class v1, Ljava/net/URL;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->URL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UrlTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 109
    const-class v1, Ljava/net/URI;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->URI_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UriTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 110
    const-class v1, Ljava/util/UUID;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->UUUID_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$UuidTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 111
    const-class v1, Ljava/util/Locale;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->LOCALE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$LocaleTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 112
    const-class v1, Ljava/util/Collection;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->COLLECTION_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CollectionTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 113
    const-class v1, Ljava/util/Map;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->MAP_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$MapTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerForTypeHierarchy(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 114
    const-class v1, Ljava/util/Date;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 115
    const-class v1, Ljava/sql/Date;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->JAVA_SQL_DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 116
    const-class v1, Ljava/sql/Timestamp;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->DATE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultDateTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 117
    const-class v1, Ljava/sql/Time;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->TIME_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$DefaultTimeTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 118
    const-class v1, Ljava/util/Calendar;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 119
    const-class v1, Ljava/util/GregorianCalendar;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->GREGORIAN_CALENDAR_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 120
    const-class v1, Ljava/math/BigDecimal;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_DECIMAL_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigDecimalTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 121
    const-class v1, Ljava/math/BigInteger;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BIG_INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BigIntegerTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 124
    const-class v1, Ljava/lang/Boolean;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 125
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BOOLEAN_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$BooleanTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 126
    const-class v1, Ljava/lang/Byte;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 127
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->BYTE_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ByteTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 128
    const-class v1, Ljava/lang/Character;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 129
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->CHARACTER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$CharacterTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 130
    const-class v1, Ljava/lang/Integer;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 131
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->INTEGER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$IntegerTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 132
    const-class v1, Ljava/lang/Number;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->NUMBER_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$NumberTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 133
    const-class v1, Ljava/lang/Short;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 134
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->SHORT_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$ShortTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 135
    const-class v1, Ljava/lang/String;

    sget-object v2, Lcom/google/sigma_gson/DefaultTypeAdapters;->STRING_TYPE_ADAPTER:Lcom/google/sigma_gson/DefaultTypeAdapters$StringTypeAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->register(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 137
    invoke-virtual {v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->makeUnmodifiable()V

    .line 138
    return-object v0
.end method

.method static getDefaultDeserializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 236
    sget-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_DESERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    return-object v0
.end method

.method static getDefaultInstanceCreators()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/InstanceCreator",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 240
    sget-object v0, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_INSTANCE_CREATORS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    return-object v0
.end method

.method static getDefaultSerializers()Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 205
    const/4 v0, 0x0

    sget-object v1, Lcom/google/sigma_gson/LongSerializationPolicy;->DEFAULT:Lcom/google/sigma_gson/LongSerializationPolicy;

    invoke-static {v0, v1}, Lcom/google/sigma_gson/DefaultTypeAdapters;->getDefaultSerializers(ZLcom/google/sigma_gson/LongSerializationPolicy;)Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    move-result-object v0

    return-object v0
.end method

.method static getDefaultSerializers(ZLcom/google/sigma_gson/LongSerializationPolicy;)Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;
    .locals 5
    .parameter "serializeSpecialFloatingPointValues"
    .parameter "longSerializationPolicy"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/google/sigma_gson/LongSerializationPolicy;",
            ")",
            "Lcom/google/sigma_gson/ParameterizedTypeHandlerMap",
            "<",
            "Lcom/google/sigma_gson/JsonSerializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 210
    new-instance v3, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-direct {v3}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;-><init>()V

    .line 214
    .local v3, serializers:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;,"Lcom/google/sigma_gson/ParameterizedTypeHandlerMap<Lcom/google/sigma_gson/JsonSerializer<*>;>;"
    new-instance v0, Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleSerializer;

    invoke-direct {v0, p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleSerializer;-><init>(Z)V

    .line 216
    .local v0, doubleSerializer:Lcom/google/sigma_gson/DefaultTypeAdapters$DoubleSerializer;
    const-class v4, Ljava/lang/Double;

    invoke-virtual {v3, v4, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 217
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v3, v4, v0}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 220
    new-instance v1, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;

    invoke-direct {v1, p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;-><init>(Z)V

    .line 222
    .local v1, floatSerializer:Lcom/google/sigma_gson/DefaultTypeAdapters$FloatSerializer;
    const-class v4, Ljava/lang/Float;

    invoke-virtual {v3, v4, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 223
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v3, v4, v1}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 226
    new-instance v2, Lcom/google/sigma_gson/DefaultTypeAdapters$LongSerializer;

    const/4 v4, 0x0

    invoke-direct {v2, p1, v4}, Lcom/google/sigma_gson/DefaultTypeAdapters$LongSerializer;-><init>(Lcom/google/sigma_gson/LongSerializationPolicy;Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V

    .line 228
    .local v2, longSerializer:Lcom/google/sigma_gson/DefaultTypeAdapters$LongSerializer;
    const-class v4, Ljava/lang/Long;

    invoke-virtual {v3, v4, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 229
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Ljava/lang/reflect/Type;Ljava/lang/Object;)V

    .line 231
    sget-object v4, Lcom/google/sigma_gson/DefaultTypeAdapters;->DEFAULT_SERIALIZERS:Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;

    invoke-virtual {v3, v4}, Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;->registerIfAbsent(Lcom/google/sigma_gson/ParameterizedTypeHandlerMap;)V

    .line 232
    return-object v3
.end method

.method private static wrapDeserializer(Lcom/google/sigma_gson/JsonDeserializer;)Lcom/google/sigma_gson/JsonDeserializer;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;)",
            "Lcom/google/sigma_gson/JsonDeserializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, deserializer:Lcom/google/sigma_gson/JsonDeserializer;,"Lcom/google/sigma_gson/JsonDeserializer<*>;"
    new-instance v0, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;

    invoke-direct {v0, p0}, Lcom/google/sigma_gson/JsonDeserializerExceptionWrapper;-><init>(Lcom/google/sigma_gson/JsonDeserializer;)V

    return-object v0
.end method
