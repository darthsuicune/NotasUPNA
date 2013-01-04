.class public Lcom/sigma/mobile/system/ssl/AllowAllSSL;
.super Ljava/lang/Object;
.source "AllowAllSSL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;
    }
.end annotation


# static fields
.field private static done:Z

.field private static trustManagers:[Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-boolean v0, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->done:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method public static allowAllSSL()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    .line 22
    sget-boolean v2, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->done:Z

    if-eqz v2, :cond_0

    .line 53
    .local v0, context:Ljavax/net/ssl/SSLContext;
    :goto_0
    return-void

    .line 25
    .end local v0           #context:Ljavax/net/ssl/SSLContext;
    :cond_0
    sput-boolean v3, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->done:Z

    .line 27
    new-instance v2, Lcom/sigma/mobile/system/ssl/AllowAllSSL$1;

    invoke-direct {v2}, Lcom/sigma/mobile/system/ssl/AllowAllSSL$1;-><init>()V

    invoke-static {v2}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 34
    const/4 v0, 0x0

    .line 36
    .restart local v0       #context:Ljavax/net/ssl/SSLContext;
    sget-object v2, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->trustManagers:[Ljavax/net/ssl/TrustManager;

    if-nez v2, :cond_1

    .line 37
    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;

    invoke-direct {v4}, Lcom/sigma/mobile/system/ssl/AllowAllSSL$_FakeX509TrustManager;-><init>()V

    aput-object v4, v2, v3

    sput-object v2, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->trustManagers:[Ljavax/net/ssl/TrustManager;

    .line 42
    :cond_1
    :try_start_0
    const-string v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 43
    const/4 v2, 0x0

    sget-object v3, Lcom/sigma/mobile/system/ssl/AllowAllSSL;->trustManagers:[Ljavax/net/ssl/TrustManager;

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, v2, v3, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_1

    .line 52
    :goto_1
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-static {v2}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto :goto_0

    .line 44
    :catch_0
    move-exception v1

    .line 46
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    const-string v2, "allowAllSSL"

    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 47
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 49
    .local v1, e:Ljava/security/KeyManagementException;
    const-string v2, "allowAllSSL"

    invoke-virtual {v1}, Ljava/security/KeyManagementException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
