.class Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;
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
    accessFlags = 0xa
    name = "GregorianCalendarTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/sigma_gson/JsonSerializer",
        "<",
        "Ljava/util/GregorianCalendar;",
        ">;",
        "Lcom/google/sigma_gson/JsonDeserializer",
        "<",
        "Ljava/util/GregorianCalendar;",
        ">;"
    }
.end annotation


# static fields
.field private static final DAY_OF_MONTH:Ljava/lang/String; = "dayOfMonth"

.field private static final HOUR_OF_DAY:Ljava/lang/String; = "hourOfDay"

.field private static final MINUTE:Ljava/lang/String; = "minute"

.field private static final MONTH:Ljava/lang/String; = "month"

.field private static final SECOND:Ljava/lang/String; = "second"

.field private static final YEAR:Ljava/lang/String; = "year"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/sigma_gson/DefaultTypeAdapters$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 360
    invoke-direct {p0}, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;-><init>()V

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
    .line 360
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;->deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/GregorianCalendar;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/google/sigma_gson/JsonElement;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonDeserializationContext;)Ljava/util/GregorianCalendar;
    .locals 8
    .parameter "json"
    .parameter "typeOfT"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/sigma_gson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 384
    invoke-virtual {p1}, Lcom/google/sigma_gson/JsonElement;->getAsJsonObject()Lcom/google/sigma_gson/JsonObject;

    move-result-object v7

    .line 385
    .local v7, obj:Lcom/google/sigma_gson/JsonObject;
    const-string v0, "year"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v1

    .line 386
    .local v1, year:I
    const-string v0, "month"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v2

    .line 387
    .local v2, month:I
    const-string v0, "dayOfMonth"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v3

    .line 388
    .local v3, dayOfMonth:I
    const-string v0, "hourOfDay"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v4

    .line 389
    .local v4, hourOfDay:I
    const-string v0, "minute"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v5

    .line 390
    .local v5, minute:I
    const-string v0, "second"

    invoke-virtual {v7, v0}, Lcom/google/sigma_gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/sigma_gson/JsonElement;->getAsInt()I

    move-result v6

    .line 391
    .local v6, second:I
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct/range {v0 .. v6}, Ljava/util/GregorianCalendar;-><init>(IIIIII)V

    return-object v0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 360
    check-cast p1, Ljava/util/GregorianCalendar;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;->serialize(Ljava/util/GregorianCalendar;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/util/GregorianCalendar;Ljava/lang/reflect/Type;Lcom/google/sigma_gson/JsonSerializationContext;)Lcom/google/sigma_gson/JsonElement;
    .locals 3
    .parameter "src"
    .parameter "typeOfSrc"
    .parameter "context"

    .prologue
    .line 372
    new-instance v0, Lcom/google/sigma_gson/JsonObject;

    invoke-direct {v0}, Lcom/google/sigma_gson/JsonObject;-><init>()V

    .line 373
    .local v0, obj:Lcom/google/sigma_gson/JsonObject;
    const-string v1, "year"

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 374
    const-string v1, "month"

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 375
    const-string v1, "dayOfMonth"

    const/4 v2, 0x5

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 376
    const-string v1, "hourOfDay"

    const/16 v2, 0xb

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 377
    const-string v1, "minute"

    const/16 v2, 0xc

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 378
    const-string v1, "second"

    const/16 v2, 0xd

    invoke-virtual {p1, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/sigma_gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 379
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 396
    const-class v0, Lcom/google/sigma_gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
