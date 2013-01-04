.class public Lcom/sigma/mobile/calificaciones/Controlador;
.super Ljava/lang/Object;
.source "Controlador.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static parseResultados(Ljava/lang/String;)Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .locals 6
    .parameter "jsonString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sigma/mobile/system/SGMException;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v4, Lcom/google/sigma_gson/GsonBuilder;

    invoke-direct {v4}, Lcom/google/sigma_gson/GsonBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/google/sigma_gson/GsonBuilder;->create()Lcom/google/sigma_gson/Gson;

    move-result-object v2

    .line 54
    .local v2, gson:Lcom/google/sigma_gson/Gson;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .local v3, jsonObject:Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/sigma/restful/msg/RespuestaCalificaciones;

    invoke-virtual {v2, v4, v5}, Lcom/google/sigma_gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sigma/restful/msg/RespuestaCalificaciones;

    .line 56
    .local v1, exps:Lcom/sigma/restful/msg/RespuestaCalificaciones;
    invoke-virtual {v1}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getError()I

    move-result v4

    if-gez v4, :cond_0

    .line 57
    new-instance v4, Lcom/sigma/mobile/system/SGMException;

    invoke-virtual {v1}, Lcom/sigma/restful/msg/RespuestaCalificaciones;->getMsgError()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/sigma/mobile/system/SGMException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v1           #exps:Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .end local v3           #jsonObject:Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 60
    .local v0, e:Lorg/json/JSONException;
    const-string v4, "SIGMA"

    const-string v5, "JSON"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    new-instance v4, Lcom/sigma/mobile/system/SGMException;

    const v5, 0x7f060029

    invoke-direct {v4, v5, v0}, Lcom/sigma/mobile/system/SGMException;-><init>(ILjava/lang/Throwable;)V

    throw v4

    .line 64
    .end local v0           #e:Lorg/json/JSONException;
    .restart local v1       #exps:Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .restart local v3       #jsonObject:Lorg/json/JSONObject;
    :cond_0
    return-object v1
.end method

.method public static recuperarDatos(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sigma/restful/msg/RespuestaCalificaciones;
    .locals 10
    .parameter "username"
    .parameter "password"
    .parameter "appVer"
    .parameter "isDemo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sigma/mobile/system/SGMException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 25
    .local v8, app:Landroid/content/Context;
    if-nez p3, :cond_0

    .line 26
    const/high16 v0, 0x7f06

    invoke-virtual {v8, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f060001

    invoke-virtual {v8, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f060002

    invoke-virtual {v8, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f060003

    invoke-virtual {v8, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "true"

    const v5, 0x7f060007

    invoke-virtual {v8, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v7}, Lcom/sigma/mobile/calificaciones/RestClient;->connect(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    .line 41
    .local v9, jsonString:Ljava/lang/String;
    :goto_0
    invoke-static {v9}, Lcom/sigma/mobile/calificaciones/Controlador;->parseResultados(Ljava/lang/String;)Lcom/sigma/restful/msg/RespuestaCalificaciones;

    move-result-object v0

    return-object v0

    .line 38
    .end local v9           #jsonString:Ljava/lang/String;
    :cond_0
    invoke-static {}, Lcom/sigma/mobile/App;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f06000e

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #jsonString:Ljava/lang/String;
    goto :goto_0
.end method
