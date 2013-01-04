.class public Lcom/sigma/mobile/calificaciones/RestClient;
.super Ljava/lang/Object;
.source "RestClient.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static connect(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 19
    .parameter "protocol"
    .parameter "host"
    .parameter "port"
    .parameter "uri"
    .parameter "username"
    .parameter "password"
    .parameter "sigdroidVer"
    .parameter "trustAllSSL"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sigma/mobile/system/SGMException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v12, 0x0

    .line 121
    .local v12, result:Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v9

    .line 124
    .local v9, locale:Ljava/util/Locale;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "://"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p3

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "?idioma="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "&pais="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "&av="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-object v15, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "&sv="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "&os=ANDROID"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 131
    .local v13, url:Ljava/lang/String;
    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 132
    .local v3, ctx:Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f06000d

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_0

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f06000d

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, "N"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    :cond_0
    const-string v10, ""

    .line 136
    .local v10, multicliente:Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p7

    invoke-static {v0, v1, v2}, Lcom/sigma/mobile/calificaciones/RestClient;->createHttpClient(Ljava/lang/String;IZ)Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v6

    .line 137
    .local v6, httpclient:Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v14

    new-instance v15, Lorg/apache/http/auth/AuthScope;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v15, v0, v1}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;I)V

    new-instance v16, Lorg/apache/http/auth/UsernamePasswordCredentials;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface/range {v14 .. v16}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 142
    new-instance v7, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v7, v13}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 147
    .local v7, httpget:Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    invoke-virtual {v6, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 150
    .local v11, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    .line 154
    .local v5, entity:Lorg/apache/http/HttpEntity;
    if-eqz v5, :cond_1

    .line 155
    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v8

    .line 156
    .local v8, instream:Ljava/io/InputStream;
    invoke-static {v8}, Lcom/sigma/mobile/calificaciones/RestClient;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v12

    .line 157
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 160
    .end local v8           #instream:Ljava/io/InputStream;
    :cond_1
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v14

    const/16 v15, 0x191

    if-ne v14, v15, :cond_3

    .line 161
    new-instance v14, Lcom/sigma/mobile/system/SGMException;

    const v15, 0x7f060024

    invoke-direct {v14, v15}, Lcom/sigma/mobile/system/SGMException;-><init>(I)V

    throw v14
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 169
    .end local v5           #entity:Lorg/apache/http/HttpEntity;
    .end local v11           #response:Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v4

    .line 170
    .local v4, e:Lorg/apache/http/client/ClientProtocolException;
    const-string v14, "SIGMA"

    const-string v15, ""

    invoke-static {v14, v15, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 171
    new-instance v14, Lcom/sigma/mobile/system/SGMException;

    const v15, 0x7f060027

    invoke-direct {v14, v15}, Lcom/sigma/mobile/system/SGMException;-><init>(I)V

    throw v14

    .line 132
    .end local v4           #e:Lorg/apache/http/client/ClientProtocolException;
    .end local v6           #httpclient:Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7           #httpget:Lorg/apache/http/client/methods/HttpGet;
    .end local v10           #multicliente:Ljava/lang/String;
    :cond_2
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "@"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f06000d

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_0

    .line 165
    .restart local v5       #entity:Lorg/apache/http/HttpEntity;
    .restart local v6       #httpclient:Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v7       #httpget:Lorg/apache/http/client/methods/HttpGet;
    .restart local v10       #multicliente:Ljava/lang/String;
    .restart local v11       #response:Lorg/apache/http/HttpResponse;
    :cond_3
    :try_start_1
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v14

    const/16 v15, 0xc8

    if-eq v14, v15, :cond_4

    .line 166
    const-string v14, "SIGMA"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "HTTP Response:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v14, Lcom/sigma/mobile/system/SGMException;

    const v15, 0x7f060028

    invoke-direct {v14, v15}, Lcom/sigma/mobile/system/SGMException;-><init>(I)V

    throw v14
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 172
    .end local v5           #entity:Lorg/apache/http/HttpEntity;
    .end local v11           #response:Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v4

    .line 173
    .local v4, e:Ljava/io/IOException;
    const-string v14, "SIGMA"

    const-string v15, ""

    invoke-static {v14, v15, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 174
    new-instance v14, Lcom/sigma/mobile/system/SGMException;

    const v15, 0x7f060027

    invoke-direct {v14, v15}, Lcom/sigma/mobile/system/SGMException;-><init>(I)V

    throw v14

    .line 177
    .end local v4           #e:Ljava/io/IOException;
    .restart local v5       #entity:Lorg/apache/http/HttpEntity;
    .restart local v11       #response:Lorg/apache/http/HttpResponse;
    :cond_4
    return-object v12
.end method

.method private static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .parameter "is"

    .prologue
    .line 49
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 50
    .local v2, reader:Ljava/io/BufferedReader;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .local v3, sb:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 54
    .local v1, line:Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 55
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    const-string v4, "SIGMA"

    const-string v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 66
    .end local v0           #e:Ljava/io/IOException;
    :goto_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 61
    :cond_0
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 62
    :catch_1
    move-exception v0

    .line 63
    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "SIGMA"

    const-string v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 62
    :catch_2
    move-exception v0

    .line 63
    const-string v4, "SIGMA"

    const-string v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 60
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 61
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 64
    :goto_2
    throw v4

    .line 62
    :catch_3
    move-exception v0

    .line 63
    .restart local v0       #e:Ljava/io/IOException;
    const-string v5, "SIGMA"

    const-string v6, ""

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method private static createHttpClient(Ljava/lang/String;IZ)Lorg/apache/http/impl/client/DefaultHttpClient;
    .locals 6
    .parameter "protocol"
    .parameter "port"
    .parameter "trustAllSSL"

    .prologue
    .line 71
    if-eqz p2, :cond_0

    const-string v3, "https"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 73
    :cond_0
    new-instance v3, Lcom/sigma/mobile/calificaciones/RestClient$1;

    invoke-direct {v3, p0, p1}, Lcom/sigma/mobile/calificaciones/RestClient$1;-><init>(Ljava/lang/String;I)V

    .line 113
    :goto_0
    return-object v3

    .line 100
    :cond_1
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 101
    .local v1, params:Lorg/apache/http/params/HttpParams;
    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v1, v3}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 102
    const-string v3, "ISO-8859-1"

    invoke-static {v1, v3}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 103
    const/4 v3, 0x1

    invoke-static {v1, v3}, Lorg/apache/http/params/HttpProtocolParams;->setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V

    .line 105
    new-instance v2, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 109
    .local v2, schReg:Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v3, Lorg/apache/http/conn/scheme/Scheme;

    const-string v4, "https"

    new-instance v5, Lcom/sigma/mobile/system/ssl/FakeSocketFactory;

    invoke-direct {v5}, Lcom/sigma/mobile/system/ssl/FakeSocketFactory;-><init>()V

    invoke-direct {v3, v4, v5, p1}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v2, v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 111
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 113
    .local v0, conMgr:Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3, v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    goto :goto_0
.end method
