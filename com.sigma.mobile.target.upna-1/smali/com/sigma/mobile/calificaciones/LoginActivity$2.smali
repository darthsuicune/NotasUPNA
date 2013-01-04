.class Lcom/sigma/mobile/calificaciones/LoginActivity$2;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sigma/mobile/calificaciones/LoginActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sigma/mobile/calificaciones/LoginActivity;


# direct methods
.method constructor <init>(Lcom/sigma/mobile/calificaciones/LoginActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 387
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/LoginActivity$2;->this$0:Lcom/sigma/mobile/calificaciones/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 392
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/LoginActivity$2;->this$0:Lcom/sigma/mobile/calificaciones/LoginActivity;

    const/4 v1, 0x0

    #calls: Lcom/sigma/mobile/calificaciones/LoginActivity;->continuar(Z)V
    invoke-static {v0, v1}, Lcom/sigma/mobile/calificaciones/LoginActivity;->access$100(Lcom/sigma/mobile/calificaciones/LoginActivity;Z)V

    .line 393
    return-void
.end method
