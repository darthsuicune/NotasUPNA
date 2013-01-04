.class public final Lcom/google/sigma_gson/FieldAttributes;
.super Ljava/lang/Object;
.source "FieldAttributes.java"


# static fields
.field private static final ANNOTATION_CACHE:Lcom/google/sigma_gson/Cache; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/sigma_gson/Cache",
            "<",
            "Lcom/google/sigma_gson/Pair",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final MAX_CACHE_PROPERTY_NAME:Ljava/lang/String; = "com.google.sigma_gson.annotation_cache_size_hint"


# instance fields
.field private annotations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation
.end field

.field private final declaredType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final declaringClazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final field:Ljava/lang/reflect/Field;

.field private genericType:Ljava/lang/reflect/Type;

.field private final isSynthetic:Z

.field private final modifiers:I

.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    new-instance v0, Lcom/google/sigma_gson/LruCache;

    invoke-static {}, Lcom/google/sigma_gson/FieldAttributes;->getMaxCacheSize()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/sigma_gson/LruCache;-><init>(I)V

    sput-object v0, Lcom/google/sigma_gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/sigma_gson/Cache;

    return-void
.end method

.method constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V
    .locals 1
    .parameter
    .parameter "f"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            ")V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, declaringClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 61
    iput-object p1, p0, Lcom/google/sigma_gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    .line 62
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->name:Ljava/lang/String;

    .line 63
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->declaredType:Ljava/lang/Class;

    .line 64
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->isSynthetic()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/sigma_gson/FieldAttributes;->isSynthetic:Z

    .line 65
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    iput v0, p0, Lcom/google/sigma_gson/FieldAttributes;->modifiers:I

    .line 66
    iput-object p2, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    .line 67
    return-void
.end method

.method private static getAnnotationFromArray(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, annotations:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    .local p1, annotation:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/annotation/Annotation;

    .line 223
    .local v0, a:Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 227
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getMaxCacheSize()I
    .locals 6

    .prologue
    const/16 v3, 0x7d0

    .line 70
    const/16 v0, 0x7d0

    .line 72
    .local v0, defaultMaxCacheSize:I
    :try_start_0
    const-string v4, "com.google.sigma_gson.annotation_cache_size_hint"

    const/16 v5, 0x7d0

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, propertyValue:Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 76
    .end local v2           #propertyValue:Ljava/lang/String;
    :goto_0
    return v3

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, e:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method


# virtual methods
.method get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "instance"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, annotation:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Lcom/google/sigma_gson/FieldAttributes;->getAnnotations()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/sigma_gson/FieldAttributes;->getAnnotationFromArray(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotations()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    iget-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    if-nez v1, :cond_0

    .line 156
    new-instance v0, Lcom/google/sigma_gson/Pair;

    iget-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    iget-object v2, p0, Lcom/google/sigma_gson/FieldAttributes;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/google/sigma_gson/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .local v0, key:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;Ljava/lang/String;>;"
    sget-object v1, Lcom/google/sigma_gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/sigma_gson/Cache;

    invoke-interface {v1, v0}, Lcom/google/sigma_gson/Cache;->getElement(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    iput-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    .line 158
    iget-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    if-nez v1, :cond_0

    .line 159
    iget-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    .line 161
    sget-object v1, Lcom/google/sigma_gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/sigma_gson/Cache;

    iget-object v2, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    invoke-interface {v1, v0, v2}, Lcom/google/sigma_gson/Cache;->addElement(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 164
    .end local v0           #key:Lcom/google/sigma_gson/Pair;,"Lcom/google/sigma_gson/Pair<Ljava/lang/Class<*>;Ljava/lang/String;>;"
    :cond_0
    iget-object v1, p0, Lcom/google/sigma_gson/FieldAttributes;->annotations:Ljava/util/Collection;

    return-object v1
.end method

.method public getDeclaredClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->declaredType:Ljava/lang/Class;

    return-object v0
.end method

.method public getDeclaredType()Ljava/lang/reflect/Type;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    if-nez v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getDeclaringClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    return-object v0
.end method

.method getFieldObject()Ljava/lang/reflect/Field;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hasModifier(I)Z
    .locals 1
    .parameter "modifier"

    .prologue
    .line 178
    iget v0, p0, Lcom/google/sigma_gson/FieldAttributes;->modifiers:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isSynthetic()Z
    .locals 1

    .prologue
    .line 208
    iget-boolean v0, p0, Lcom/google/sigma_gson/FieldAttributes;->isSynthetic:Z

    return v0
.end method

.method set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .parameter "instance"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/sigma_gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 189
    return-void
.end method
