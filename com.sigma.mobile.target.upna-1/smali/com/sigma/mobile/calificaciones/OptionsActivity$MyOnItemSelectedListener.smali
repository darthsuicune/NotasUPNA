.class public Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;
.super Ljava/lang/Object;
.source "OptionsActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sigma/mobile/calificaciones/OptionsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyOnItemSelectedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;


# direct methods
.method public constructor <init>(Lcom/sigma/mobile/calificaciones/OptionsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 79
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter "view"
    .parameter "pos"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v5, 0x1

    .line 87
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    #getter for: Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont2:I
    invoke-static {v1}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$000(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    #getter for: Lcom/sigma/mobile/calificaciones/OptionsActivity;->cont1:I
    invoke-static {v2}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$100(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 88
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    invoke-static {v1}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$008(Lcom/sigma/mobile/calificaciones/OptionsActivity;)I

    .line 100
    :goto_0
    return-void

    .line 90
    :cond_0
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    #getter for: Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;
    invoke-static {v1}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$200(Lcom/sigma/mobile/calificaciones/OptionsActivity;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, p3

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, s:[Ljava/lang/String;
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    const-string v2, "sigdroid_app_lang"

    iget-object v3, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    #getter for: Lcom/sigma/mobile/calificaciones/OptionsActivity;->idiomas:[Ljava/lang/String;
    invoke-static {v3}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$200(Lcom/sigma/mobile/calificaciones/OptionsActivity;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, p3

    invoke-virtual {v1, v2, v3}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->storeSharedPreference(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 94
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    #getter for: Lcom/sigma/mobile/calificaciones/OptionsActivity;->self:Landroid/app/Activity;
    invoke-static {v1}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$300(Lcom/sigma/mobile/calificaciones/OptionsActivity;)Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f06002a

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 97
    :cond_1
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    new-instance v2, Ljava/util/Locale;

    const/4 v3, 0x0

    aget-object v3, v0, v3

    aget-object v4, v0, v5

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    #calls: Lcom/sigma/mobile/calificaciones/OptionsActivity;->setLanguage(Ljava/util/Locale;)Z
    invoke-static {v1, v2}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->access$400(Lcom/sigma/mobile/calificaciones/OptionsActivity;Ljava/util/Locale;)Z

    .line 98
    iget-object v1, p0, Lcom/sigma/mobile/calificaciones/OptionsActivity$MyOnItemSelectedListener;->this$0:Lcom/sigma/mobile/calificaciones/OptionsActivity;

    invoke-virtual {v1, v5}, Lcom/sigma/mobile/calificaciones/OptionsActivity;->setResult(I)V

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
