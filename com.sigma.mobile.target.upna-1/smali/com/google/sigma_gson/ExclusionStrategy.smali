.class public interface abstract Lcom/google/sigma_gson/ExclusionStrategy;
.super Ljava/lang/Object;
.source "ExclusionStrategy.java"


# virtual methods
.method public abstract shouldSkipClass(Ljava/lang/Class;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation
.end method

.method public abstract shouldSkipField(Lcom/google/sigma_gson/FieldAttributes;)Z
.end method
