.class Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;
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
.field result:J


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Calificacion;)I
    .locals 6
    .parameter "calA"
    .parameter "calB"

    .prologue
    const-wide/16 v4, 0x0

    .line 219
    invoke-virtual {p2}, Lcom/sigma/restful/msg/Calificacion;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/sigma/restful/msg/Calificacion;->getTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;->result:J

    .line 220
    iget-wide v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;->result:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_0

    .line 221
    const/4 v0, -0x1

    .line 225
    :goto_0
    return v0

    .line 222
    :cond_0
    iget-wide v0, p0, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;->result:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_1

    .line 223
    const/4 v0, 0x1

    goto :goto_0

    .line 225
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 216
    check-cast p1, Lcom/sigma/restful/msg/Calificacion;

    .end local p1
    check-cast p2, Lcom/sigma/restful/msg/Calificacion;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;->compare(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Calificacion;)I

    move-result v0

    return v0
.end method
