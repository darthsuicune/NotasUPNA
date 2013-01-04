.class Lcom/sigma/mobile/calificaciones/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sigma/mobile/calificaciones/MainActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 61
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/MainActivity$1;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 1
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "arg3"
    .parameter "arg4"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/sigma/mobile/calificaciones/MainActivity$1;->this$0:Lcom/sigma/mobile/calificaciones/MainActivity;

    invoke-virtual {v0, p2}, Lcom/sigma/mobile/calificaciones/MainActivity;->onClick(Landroid/view/View;)V

    .line 65
    const/4 v0, 0x0

    return v0
.end method
