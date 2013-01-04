.class public Lcom/sigma/mobile/calificaciones/AboutDialog;
.super Lcom/sigma/mobile/core/BaseDialog;
.source "AboutDialog.java"


# static fields
.field private static final TAG:Ljava/lang/String; = ""


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/sigma/mobile/core/BaseDialog;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/16 v6, 0xf

    .line 25
    invoke-super {p0, p1}, Lcom/sigma/mobile/core/BaseDialog;->onCreate(Landroid/os/Bundle;)V

    .line 27
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/Window;->requestFeature(I)Z

    .line 28
    const/high16 v3, 0x7f03

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/AboutDialog;->setContentView(I)V

    .line 33
    :try_start_0
    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v0, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .local v0, appVer:Ljava/lang/String;
    :goto_0
    const v3, 0x7f090002

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    const v3, 0x7f090005

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 43
    .local v2, tv:Landroid/widget/TextView;
    invoke-static {v2, v6}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 44
    const v3, 0x7f090006

    invoke-virtual {p0, v3}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .end local v2           #tv:Landroid/widget/TextView;
    check-cast v2, Landroid/widget/TextView;

    .line 45
    .restart local v2       #tv:Landroid/widget/TextView;
    invoke-static {v2, v6}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 46
    return-void

    .line 34
    .end local v0           #appVer:Ljava/lang/String;
    .end local v2           #tv:Landroid/widget/TextView;
    :catch_0
    move-exception v1

    .line 35
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v0, ""

    .line 36
    .restart local v0       #appVer:Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method protected updateLanguage()V
    .locals 2

    .prologue
    .line 51
    const v0, 0x7f090001

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f060013

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 52
    const v0, 0x7f090003

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f06003e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 53
    const v0, 0x7f090004

    invoke-virtual {p0, v0}, Lcom/sigma/mobile/calificaciones/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f06003f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 54
    return-void
.end method
