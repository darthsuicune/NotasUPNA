.class Lcom/sigma/mobile/calificaciones/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sigma/mobile/calificaciones/MainActivity;->errorDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sigma/mobile/calificaciones/MainActivity;


# direct methods
.method constructor <init>(Lcom/sigma/mobile/calificaciones/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 315
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$2;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 317
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 318
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$2;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity;

    #calls: Lcom/sigma/mobile/calificaciones/MainActivity;->gotoLogin()V
    invoke-static {v0}, Lcom/sigma/mobile/calificaciones/MainActivity;->access$000(Lcom/sigma/mobile/calificaciones/MainActivity;)V

    .line 319
    return-void
.end method
