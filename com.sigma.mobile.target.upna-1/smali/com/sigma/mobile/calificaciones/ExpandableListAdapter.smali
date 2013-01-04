.class public Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;
.super Landroid/widget/BaseExpandableListAdapter;
.source "ExpandableListAdapter.java"


# instance fields
.field private children:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/sigma/restful/msg/Calificacion;",
            ">;>;"
        }
    .end annotation
.end field

.field public compNombreCal:Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;

.field public compNovedadCal:Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;

.field private context:Landroid/content/Context;

.field df:Ljava/text/DateFormat;

.field private groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/sigma/restful/msg/Expediente;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .parameter "context"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/sigma/restful/msg/Expediente;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/sigma/restful/msg/Calificacion;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p2, groups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/sigma/restful/msg/Expediente;>;"
    .local p3, children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;>;"
    invoke-direct {p0}, Landroid/widget/BaseExpandableListAdapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    .line 36
    iput-object p2, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    .line 37
    iput-object p3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    .line 38
    invoke-static {p1}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->df:Ljava/text/DateFormat;

    .line 40
    return-void
.end method


# virtual methods
.method public addItem(Lcom/sigma/restful/msg/Calificacion;Lcom/sigma/restful/msg/Expediente;)V
    .locals 3
    .parameter "calificacion"
    .parameter "group"

    .prologue
    .line 43
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 44
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 47
    .local v0, index:I
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v2, v0, 0x1

    if-ge v1, v2, :cond_1

    .line 48
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_1
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public getChild(II)Ljava/lang/Object;
    .locals 1
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    .line 54
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getChildId(II)J
    .locals 2
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    .line 58
    int-to-long v0, p2

    return-wide v0
.end method

.method public getChildView(IIZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .parameter "groupPosition"
    .parameter "childPosition"
    .parameter "isLastChild"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->getChild(II)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sigma/restful/msg/Calificacion;

    .line 66
    .local v0, calificacion:Lcom/sigma/restful/msg/Calificacion;
    if-nez p4, :cond_0

    .line 67
    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const-string v8, "layout_inflater"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 69
    .local v4, infalInflater:Landroid/view/LayoutInflater;
    const v7, 0x7f030001

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p4

    .line 72
    .end local v4           #infalInflater:Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p4, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 74
    const v7, 0x7f090009

    invoke-virtual {p4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 75
    .local v6, tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getAsignatura()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    const v7, 0x7f09000a

    invoke-virtual {p4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #tv:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 77
    .restart local v6       #tv:Landroid/widget/TextView;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v9, 0x7f060014

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getConvocatoria()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    const v7, 0x7f090007

    invoke-virtual {p4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 84
    .local v1, childLayout:Landroid/widget/LinearLayout;
    const v7, 0x7f09000b

    invoke-virtual {p4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #tv:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 85
    .restart local v6       #tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isProvisional()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 86
    const v7, 0x7f020006

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 88
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v9, 0x7f060036

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, content:Ljava/lang/String;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getFechaRevision()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_2

    .line 90
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "dd/MM/yyyy"

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getFechaRevision()J

    move-result-wide v9

    invoke-static {v8, v9, v10}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getHoraRevision()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 96
    :goto_0
    new-instance v5, Landroid/text/SpannableString;

    invoke-direct {v5, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 97
    .local v5, span:Landroid/text/SpannableString;
    new-instance v7, Landroid/text/style/UnderlineSpan;

    invoke-direct {v7}, Landroid/text/style/UnderlineSpan;-><init>()V

    const/4 v8, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v5, v7, v8, v9, v10}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 98
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .end local v2           #content:Ljava/lang/String;
    .end local v5           #span:Landroid/text/SpannableString;
    :goto_1
    const v7, 0x7f09000c

    invoke-virtual {p4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #tv:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 109
    .restart local v6       #tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getCodCalificacion()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isSuperada()Z

    move-result v7

    if-nez v7, :cond_5

    .line 111
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->isPresentaExamen()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 112
    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020015

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 126
    :cond_1
    :goto_2
    return-object p4

    .line 93
    .restart local v2       #content:Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f060046

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 100
    .end local v2           #content:Ljava/lang/String;
    :cond_3
    const v7, 0x7f020003

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 101
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v9, 0x7f060037

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "dd/MM/yyyy"

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Calificacion;->getTime()J

    move-result-wide v9

    invoke-static {v8, v9, v10}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 115
    :cond_4
    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020016

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v8, 0x7f06000c

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, hideCodigoCalificacionSinExamen:Ljava/lang/String;
    const-string v7, "true"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 119
    const-string v7, "*"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 123
    .end local v3           #hideCodigoCalificacionSinExamen:Ljava/lang/String;
    :cond_5
    iget-object v7, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020017

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2
.end method

.method public getChildrenCount(I)I
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 130
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 132
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGroup(I)Ljava/lang/Object;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 136
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getGroupCount()I
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getGroupId(I)J
    .locals 2
    .parameter "groupPosition"

    .prologue
    .line 144
    int-to-long v0, p1

    return-wide v0
.end method

.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "groupPosition"
    .parameter "isExpanded"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 149
    invoke-virtual {p0, p1}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->getGroup(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sigma/restful/msg/Expediente;

    .line 150
    .local v0, group:Lcom/sigma/restful/msg/Expediente;
    if-nez p3, :cond_0

    .line 151
    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const-string v4, "layout_inflater"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 153
    .local v1, infalInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f030003

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p3

    .line 155
    .end local v1           #infalInflater:Landroid/view/LayoutInflater;
    :cond_0
    const v3, 0x7f09002c

    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 156
    .local v2, tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Expediente;->getEstudioDescripcion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    const v3, 0x7f09002d

    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .end local v2           #tv:Landroid/widget/TextView;
    check-cast v2, Landroid/widget/TextView;

    .line 158
    .restart local v2       #tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/sigma/restful/msg/Expediente;->getPlanDescripcion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    const v3, 0x7f09002e

    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .end local v2           #tv:Landroid/widget/TextView;
    check-cast v2, Landroid/widget/TextView;

    .line 161
    .restart local v2       #tv:Landroid/widget/TextView;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v5, 0x7f06002d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->context:Landroid/content/Context;

    const v5, 0x7f06002e

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Expediente;->getCreditosTotalesPlan()F

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/sigma/restful/msg/Expediente;->getCreditosSuperados()F

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    return-object p3
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 170
    const/4 v0, 0x1

    return v0
.end method

.method public isChildSelectable(II)Z
    .locals 1
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    .line 174
    const/4 v0, 0x1

    return v0
.end method

.method public ordenarPorNombre()V
    .locals 4

    .prologue
    .line 191
    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 193
    .local v0, e:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 194
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 195
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 196
    .local v2, tmp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;"
    new-instance v3, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;

    invoke-direct {v3}, Lcom/sigma/mobile/calificaciones/ComparatorPorNombreCalificacions;-><init>()V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 197
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->notifyDataSetChanged()V

    .line 193
    .end local v2           #tmp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    :cond_1
    return-void
.end method

.method public ordenarPorNovedad()V
    .locals 4

    .prologue
    .line 178
    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->children:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 180
    .local v0, e:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 181
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 182
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 183
    .local v2, tmp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;"
    new-instance v3, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;

    invoke-direct {v3}, Lcom/sigma/mobile/calificaciones/ComparatorPorNovedadCalificacions;-><init>()V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 184
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/ExpandableListAdapter;->notifyDataSetChanged()V

    .line 180
    .end local v2           #tmp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/sigma/restful/msg/Calificacion;>;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 188
    :cond_1
    return-void
.end method
