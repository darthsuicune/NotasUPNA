.class Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;
.super Ljava/lang/Object;
.source "ExpandableListAdapter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/sigma/restful/msg/Calificacion;",
        ">;"
    }
.end annotation


# instance fields
.field comparador:Ljava/text/Collator;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;->comparador:Ljava/text/Collator;

    .line 208
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;->comparador:Ljava/text/Collator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/Collator;->setStrength(I)V

    .line 209
    return-void
.end method


# virtual methods
.method public compare(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Calificacion;)I
    .locals 3
    .parameter "calA"
    .parameter "calB"

    .prologue
    .line 212
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;->comparador:Ljava/text/Collator;

    invoke-virtual {p1}, Lcom/sigma/restful/msg/Calificacion;->getAsignatura()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/sigma/restful/msg/Calificacion;->getAsignatura()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 203
    check-cast p1, Lcom/sigma/restful/msg/Calificacion;

    .end local p1
    check-cast p2, Lcom/sigma/restful/msg/Calificacion;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;->compare(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Calificacion;)I

    move-result v0

    return v0
.end method
