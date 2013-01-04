.class final Lcom/sigma/mobile/calificaciones/RestClient$1;
.super Lorg/apache/http/impl/client/DefaultHttpClient;
.source "RestClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sigma/mobile/calificaciones/RestClient;->createHttpClient(Ljava/lang/String;IZ)Lorg/apache/http/impl/client/DefaultHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$port:I

.field final synthetic val$protocol:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 73
    iput-object p1, p0, Lcom/sigma/mobile/calificaciones/RestClient$1;->val$protocol:Ljava/lang/String;

    iput p2, p0, Lcom/sigma/mobile/calificaciones/RestClient$1;->val$port:I

    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    return-void
.end method

.method private newSslSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .locals 5

    .prologue
    .line 86
    :try_start_0
    const-string v3, "BKS"

    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v2

    .line 87
    .local v2, trusted:Ljava/security/KeyStore;
    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f040001

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 89
    .local v1, in:Ljava/io/InputStream;
    :try_start_1
    const-string v3, ""

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 93
    new-instance v3, Lorg/apache/http/conn/ssl/SSLSocketFactory;

    invoke-direct {v3, v2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    return-object v3

    .line 91
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 94
    .end local v1           #in:Ljava/io/InputStream;
    .end local v2           #trusted:Ljava/security/KeyStore;
    :catch_0
    move-exception v0

    .line 95
    .local v0, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method


# virtual methods
.method protected createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .locals 5

    .prologue
    .line 76
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 77
    .local v0, registry:Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v1, Lorg/apache/http/conn/scheme/Scheme;

    const-string v2, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v3

    const/16 v4, 0x50

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v1}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 78
    const-string v1, "https"

    iget-object v2, p0, Lcom/sigma/mobile/calificaciones/RestClient$1;->val$protocol:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    new-instance v1, Lorg/apache/http/conn/scheme/Scheme;

    const-string v2, "https"

    invoke-direct {p0}, Lcom/sigma/mobile/calificaciones/RestClient$1;->newSslSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v3

    iget v4, p0, Lcom/sigma/mobile/calificaciones/RestClient$1;->val$port:I

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v1}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 81
    :cond_0
    new-instance v1, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-virtual {p0}, Lcom/sigma/mobile/calificaciones/RestClient$1;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    return-object v1
.end method
