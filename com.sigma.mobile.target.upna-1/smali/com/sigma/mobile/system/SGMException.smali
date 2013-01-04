.class public Lcom/sigma/mobile/system/SGMException;
.super Ljava/lang/Exception;
.source "SGMException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field idMsgError:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "idMsgError"

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 18
    iput p1, p0, Lcom/sigma/mobile/system/SGMException;->idMsgError:I

    .line 19
    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0
    .parameter "idMsgError"
    .parameter "e"

    .prologue
    .line 22
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 23
    iput p1, p0, Lcom/sigma/mobile/system/SGMException;->idMsgError:I

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method


# virtual methods
.method public getIdMsgError()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/sigma/mobile/system/SGMException;->idMsgError:I

    return v0
.end method
