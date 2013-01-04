.class public interface abstract Lcom/google/sigma_gson/ObjectNavigator$Visitor;
.super Ljava/lang/Object;
.source "ObjectNavigator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/ObjectNavigator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Visitor"
.end annotation


# virtual methods
.method public abstract end(Lcom/google/sigma_gson/ObjectTypePair;)V
.end method

.method public abstract getTarget()Ljava/lang/Object;
.end method

.method public abstract start(Lcom/google/sigma_gson/ObjectTypePair;)V
.end method

.method public abstract startVisitingObject(Ljava/lang/Object;)V
.end method

.method public abstract visitArray(Ljava/lang/Object;Ljava/lang/reflect/Type;)V
.end method

.method public abstract visitArrayField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
.end method

.method public abstract visitFieldUsingCustomHandler(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)Z
.end method

.method public abstract visitObjectField(Lcom/google/sigma_gson/FieldAttributes;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
.end method

.method public abstract visitPrimitive(Ljava/lang/Object;)V
.end method

.method public abstract visitUsingCustomHandler(Lcom/google/sigma_gson/ObjectTypePair;)Z
.end method
