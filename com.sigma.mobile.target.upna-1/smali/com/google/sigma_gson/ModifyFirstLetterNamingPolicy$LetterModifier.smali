.class public final enum Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;
.super Ljava/lang/Enum;
.source "ModifyFirstLetterNamingPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LetterModifier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

.field public static final enum LOWER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

.field public static final enum UPPER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 52
    new-instance v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    const-string v1, "UPPER"

    invoke-direct {v0, v1, v2}, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->UPPER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    .line 53
    new-instance v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    const-string v1, "LOWER"

    invoke-direct {v0, v1, v3}, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->LOWER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    .line 51
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    sget-object v1, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->UPPER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->LOWER:Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->$VALUES:[Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;
    .locals 1
    .parameter "name"

    .prologue
    .line 51
    const-class v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    return-object v0
.end method

.method public static values()[Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->$VALUES:[Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    invoke-virtual {v0}, [Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/sigma_gson/ModifyFirstLetterNamingPolicy$LetterModifier;

    return-object v0
.end method
