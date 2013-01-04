.class final Lcom/google/sigma_gson/MemoryRefStack;
.super Ljava/lang/Object;
.source "MemoryRefStack.java"


# instance fields
.field private final stack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/sigma_gson/ObjectTypePair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    return-void
.end method


# virtual methods
.method public contains(Lcom/google/sigma_gson/ObjectTypePair;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x0

    .line 75
    if-nez p1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return v2

    .line 79
    :cond_1
    iget-object v3, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/sigma_gson/ObjectTypePair;

    .line 80
    .local v1, stackObject:Lcom/google/sigma_gson/ObjectTypePair;
    invoke-virtual {v1}, Lcom/google/sigma_gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/sigma_gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v4

    if-ne v3, v4, :cond_2

    iget-object v3, v1, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    iget-object v4, p1, Lcom/google/sigma_gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 82
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public peek()Lcom/google/sigma_gson/ObjectTypePair;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/ObjectTypePair;

    return-object v0
.end method

.method public pop()Lcom/google/sigma_gson/ObjectTypePair;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/ObjectTypePair;

    return-object v0
.end method

.method public push(Lcom/google/sigma_gson/ObjectTypePair;)Lcom/google/sigma_gson/ObjectTypePair;
    .locals 1
    .parameter "obj"

    .prologue
    .line 38
    invoke-static {p1}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 40
    iget-object v0, p0, Lcom/google/sigma_gson/MemoryRefStack;->stack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/ObjectTypePair;

    return-object v0
.end method
