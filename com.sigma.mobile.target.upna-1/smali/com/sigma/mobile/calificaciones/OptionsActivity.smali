.class public Lcom/sigma/mobile/calificaciones/OptionsActivity;
.super Lcom/sigma/mobile/core/BaseActivity;
.source "OptionsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;
    }
.end annotation


# static fields
.field public static final ACTIVITY_ID:I = 0x2

.field public static final RESULT_LANG_CHANGED:I = 0x1


# instance fields
.field private cont1:I

.field private cont2:I

.field private idiomas:[Ljava/lang/String;

.field private self:Landroid/app/Activity;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Lcom/sigma/mobile/core/BaseActivity;-><init>()V

    .line 25
    iput v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont1:I

    .line 26
    iput v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont2:I

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont2:I

    return v0
.end method

.method static synthetic access$008(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 18
    iget v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont2:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont2:I

    return v0
.end method

.method static synthetic access$100(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont1:I

    return v0
.end method

.method static synthetic access$200(Lcom/sigma/mobile/calificaciones/OptionsActivity;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/sigma/mobile/calificaciones/OptionsActivity;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->self:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/sigma/mobile/calificaciones/OptionsActivity;Ljava/util/Locale;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->setLanguage(Ljava/util/Locale;)Z

    move-result v0

    return v0
.end method

.method private mostrarDatos()V
    .locals 11

    .prologue
    const v10, 0x7f060012

    const v9, 0x7f060011

    const v8, 0x7f060010

    const v7, 0x7f06000f

    .line 49
    const v5, 0x7f06000a

    invoke-virtual {p0, v5}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ";"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    .line 51
    const v5, 0x7f090038

    invoke-virtual {p0, v5}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 53
    .local v0, Idioma:Landroid/widget/Spinner;
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 54
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v5, 0x1090008

    invoke-direct {v1, p0, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 55
    .local v1, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    const v5, 0x1090009

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 58
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    array-length v5, v5

    if-ge v2, v5, :cond_4

    .line 59
    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    aget-object v5, v5, v2

    const-string v6, "es_ES"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0, v7}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 58
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 60
    :cond_1
    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    aget-object v5, v5, v2

    const-string v6, "ca_ES"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 61
    :cond_2
    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    aget-object v5, v5, v2

    const-string v6, "eu_ES"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {p0, v9}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 62
    :cond_3
    iget-object v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;

    aget-object v5, v5, v2

    const-string v6, "en_GB"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0, v10}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 66
    :cond_4
    const-string v5, "sigdroid_app_lang"

    const v6, 0x7f06000b

    invoke-virtual {p0, v6}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->retrieveSharedPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, idDef:Ljava/lang/String;
    const/4 v4, 0x0

    .line 68
    .local v4, spinnerPos:I
    const-string v5, "es_ES"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {p0, v7}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v4

    .line 72
    :cond_5
    :goto_2
    invoke-virtual {v0, v4}, Landroid/widget/Spinner;->setSelection(I)V

    .line 74
    new-instance v5, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;

    invoke-direct {v5, p0}, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;-><init>(Lcom/sigma/mobile/calificaciones/OptionsActivity;)V

    invoke-virtual {v0, v5}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 75
    const/4 v5, 0x1

    iput v5, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont1:I

    .line 76
    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 77
    return-void

    .line 69
    :cond_6
    const-string v5, "ca_ES"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {p0, v8}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v4

    goto :goto_2

    .line 70
    :cond_7
    const-string v5, "eu_ES"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-virtual {p0, v9}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v4

    goto :goto_2

    .line 71
    :cond_8
    const-string v5, "en_GB"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {p0, v10}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v4

    goto :goto_2
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 33
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    const v0, 0x7f030006

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->setContentView(I)V

    .line 36
    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->mostrarDatos()V

    .line 37
    iput-object p0, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity;->self:Landroid/app/Activity;

    .line 38
    return-void
.end method

.method protected updateLanguage()V
    .locals 3

    .prologue
    const v2, 0x7f06003c

    .line 43
    const v0, 0x7f090036

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060030

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 44
    const v0, 0x7f090037

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 45
    const v0, 0x7f090038

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {p0, v2}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    .line 46
    return-void
.end method
