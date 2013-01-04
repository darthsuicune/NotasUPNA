.class public Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;
.super Ljava/lang/Object;
.source "AllowAllSSL.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sigma/mobile/system/ssl/AllowAllSSL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "_FakeX509TrustManager"
.end annotation


# static fields
.field private static final _AcceptedIssuers:[Ljava/security/cert/X509Certificate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    sput-object v0, Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;->_AcceptedIssuers:[Ljava/security/cert/X509Certificate;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 63
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 67
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 78
    sget-object v0, Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;->_AcceptedIssuers:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public isClientTrusted([Ljava/security/cert/X509Certificate;)Z
    .locals 1
    .parameter "chain"

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public isServerTrusted([Ljava/security/cert/X509Certificate;)Z
    .locals 1
    .parameter "chain"

    .prologue
    .line 74
    const/4 v0, 0x1

    return v0
.end method
