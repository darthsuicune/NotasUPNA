.class public Lcom/sigma/mobile/App;
.super Landroid/app/Application;
.source "App.java"


# static fields
.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/sigma/mobile/App;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 21
    sput-object p0, Lcom/sigma/mobile/App;->mContext:Landroid/content/Context;

    .line 22
    return-void
.end method
