.class Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->showDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;


# direct methods
.method constructor <init>(Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;)V
    .locals 0
    .parameter

    .prologue
    .line 362
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask$1;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 364
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask$1;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sigma/mobile/calificaciones/MainActivity$CargaDiferidaTask;->cancel(Z)Z

    .line 365
    return-void
.end method
