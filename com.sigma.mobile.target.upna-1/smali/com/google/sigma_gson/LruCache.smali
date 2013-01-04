.class final Lcom/google/sigma_gson/LruCache;
.super Ljava/util/LinkedHashMap;
.source "LruCache.java"

# interfaces
.implements Lcom/google/sigma_gson/Cache;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedHashMap",
        "<TK;TV;>;",
        "Lcom/google/sigma_gson/Cache",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final maxCapacity:I


# direct methods
.method constructor <init>(I)V
    .locals 2
    .parameter "maxCapacity"

    .prologue
    .line 36
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    const v0, 0x3f333333

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    .line 37
    iput p1, p0, Lcom/google/sigma_gson/LruCache;->maxCapacity:I

    .line 38
    return-void
.end method


# virtual methods
.method public addElement(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, value:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, p1, p2}, Lcom/google/sigma_gson/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    return-void
.end method

.method public clear()V
    .locals 0

    .prologue
    .line 46
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    invoke-super {p0}, Ljava/util/LinkedHashMap;->clear()V

    .line 47
    return-void
.end method

.method public getElement(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/sigma_gson/LruCache;->size()I

    move-result v0

    iget v1, p0, Lcom/google/sigma_gson/LruCache;->maxCapacity:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeElement(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    invoke-virtual {p0, p1}, Lcom/google/sigma_gson/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 59
    .local p0, this:Lcom/google/sigma_gson/LruCache;,"Lcom/google/sigma_gson/LruCache<TK;TV;>;"
    invoke-super {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    return v0
.end method
