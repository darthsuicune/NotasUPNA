.class final Lcom/google/sigma_gson/TypeInfoFactory;
.super Ljava/lang/Object;
.source "TypeInfoFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method private static extractRealTypes([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/reflect/Type;
    .locals 3
    .parameter "actualTypeArguments"
    .parameter "parentType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 157
    .local p2, rawParentClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/google/sigma_gson/Preconditions;->checkNotNull(Ljava/lang/Object;)V

    .line 159
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/reflect/Type;

    .line 160
    .local v1, retTypes:[Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 161
    aget-object v2, p0, v0

    invoke-static {v2, p1, p2}, Lcom/google/sigma_gson/TypeInfoFactory;->getActualType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v2

    aput-object v2, v1, v0

    .line 160
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 163
    :cond_0
    return-object v1
.end method

.method private static extractTypeForHierarchy(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;
    .locals 9
    .parameter "parentType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .local p1, typeToEvaluate:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v5, 0x0

    .line 118
    const/4 v4, 0x0

    .line 119
    .local v4, rawParentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    instance-of v7, p0, Ljava/lang/Class;

    if-eqz v7, :cond_1

    move-object v4, p0

    .line 120
    check-cast v4, Ljava/lang/Class;

    .line 128
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v6

    .line 129
    .local v6, superClass:Ljava/lang/reflect/Type;
    instance-of v7, v6, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_3

    move-object v7, v6

    check-cast v7, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v7}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v8

    if-ne v7, v8, :cond_3

    move-object v7, v6

    .line 132
    check-cast v7, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v7}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v1

    .line 134
    .local v1, classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    invoke-static {v1, p1}, Lcom/google/sigma_gson/TypeInfoFactory;->getIndex([Ljava/lang/reflect/TypeVariable;Ljava/lang/reflect/TypeVariable;)I

    move-result v2

    .line 136
    .local v2, indexOfActualTypeArgument:I
    const/4 v0, 0x0

    .line 137
    .local v0, actualTypeArguments:[Ljava/lang/reflect/Type;
    instance-of v7, p0, Ljava/lang/Class;

    if-eqz v7, :cond_2

    .line 138
    check-cast v6, Ljava/lang/reflect/ParameterizedType;

    .end local v6           #superClass:Ljava/lang/reflect/Type;
    invoke-interface {v6}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 145
    .end local p0
    :goto_1
    aget-object v5, v0, v2

    .line 152
    .end local v0           #actualTypeArguments:[Ljava/lang/reflect/Type;
    .end local v1           #classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    .end local v2           #indexOfActualTypeArgument:I
    :cond_0
    :goto_2
    return-object v5

    .line 121
    .restart local p0
    :cond_1
    instance-of v7, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_0

    move-object v3, p0

    .line 122
    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    .line 123
    .local v3, parentTypeAsPT:Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v4

    .end local v4           #rawParentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    check-cast v4, Ljava/lang/Class;

    .line 124
    .restart local v4       #rawParentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    goto :goto_0

    .line 139
    .end local v3           #parentTypeAsPT:Ljava/lang/reflect/ParameterizedType;
    .restart local v0       #actualTypeArguments:[Ljava/lang/reflect/Type;
    .restart local v1       #classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    .restart local v2       #indexOfActualTypeArgument:I
    .restart local v6       #superClass:Ljava/lang/reflect/Type;
    :cond_2
    instance-of v7, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_0

    .line 140
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    goto :goto_1

    .line 148
    .end local v0           #actualTypeArguments:[Ljava/lang/reflect/Type;
    .end local v1           #classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    .end local v2           #indexOfActualTypeArgument:I
    .restart local p0
    :cond_3
    const/4 v5, 0x0

    .line 149
    .local v5, searchedType:Ljava/lang/reflect/Type;
    if-eqz v6, :cond_0

    .line 150
    invoke-static {v6, p1}, Lcom/google/sigma_gson/TypeInfoFactory;->extractTypeForHierarchy(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v5

    goto :goto_2
.end method

.method private static getActualType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 17
    .parameter "typeToEvaluate"
    .parameter "parentType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 60
    .local p2, rawParentClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/Class;

    if-eqz v14, :cond_0

    .line 110
    .end local p0
    :goto_0
    return-object p0

    .line 62
    .restart local p0
    :cond_0
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v14, :cond_1

    move-object/from16 v5, p0

    .line 63
    check-cast v5, Ljava/lang/reflect/ParameterizedType;

    .line 64
    .local v5, castedType:Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v5}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v11

    .line 65
    .local v11, owner:Ljava/lang/reflect/Type;
    invoke-interface {v5}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v14

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v14, v0, v1}, Lcom/google/sigma_gson/TypeInfoFactory;->extractRealTypes([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 67
    .local v4, actualTypeParameters:[Ljava/lang/reflect/Type;
    invoke-interface {v5}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v12

    .line 68
    .local v12, rawType:Ljava/lang/reflect/Type;
    new-instance p0, Lcom/google/sigma_gson/ParameterizedTypeImpl;

    .end local p0
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v4, v11}, Lcom/google/sigma_gson/ParameterizedTypeImpl;-><init>(Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    goto :goto_0

    .line 69
    .end local v4           #actualTypeParameters:[Ljava/lang/reflect/Type;
    .end local v5           #castedType:Ljava/lang/reflect/ParameterizedType;
    .end local v11           #owner:Ljava/lang/reflect/Type;
    .end local v12           #rawType:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_1
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v14, :cond_4

    move-object/from16 v5, p0

    .line 70
    check-cast v5, Ljava/lang/reflect/GenericArrayType;

    .line 71
    .local v5, castedType:Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v5}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v7

    .line 72
    .local v7, componentType:Ljava/lang/reflect/Type;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v7, v0, v1}, Lcom/google/sigma_gson/TypeInfoFactory;->getActualType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 73
    .local v2, actualType:Ljava/lang/reflect/Type;
    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    move-object/from16 p0, v5

    .line 74
    goto :goto_0

    .line 76
    :cond_2
    instance-of v14, v2, Ljava/lang/Class;

    if-eqz v14, :cond_3

    invoke-static {v2}, Lcom/google/sigma_gson/TypeUtils;->toRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v14

    invoke-static {v14}, Lcom/google/sigma_gson/TypeUtils;->wrapWithArray(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v14

    :goto_1
    move-object/from16 p0, v14

    goto :goto_0

    :cond_3
    new-instance v14, Lcom/google/sigma_gson/GenericArrayTypeImpl;

    invoke-direct {v14, v2}, Lcom/google/sigma_gson/GenericArrayTypeImpl;-><init>(Ljava/lang/reflect/Type;)V

    goto :goto_1

    .line 79
    .end local v2           #actualType:Ljava/lang/reflect/Type;
    .end local v5           #castedType:Ljava/lang/reflect/GenericArrayType;
    .end local v7           #componentType:Ljava/lang/reflect/Type;
    :cond_4
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/reflect/TypeVariable;

    if-eqz v14, :cond_9

    .line 80
    move-object/from16 v0, p1

    instance-of v14, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v14, :cond_5

    move-object/from16 v8, p0

    .line 87
    check-cast v8, Ljava/lang/reflect/TypeVariable;

    .line 88
    .local v8, fieldTypeVariable:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v6

    .local v6, classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    move-object/from16 v10, p1

    .line 89
    check-cast v10, Ljava/lang/reflect/ParameterizedType;

    .line 90
    .local v10, objParameterizedType:Ljava/lang/reflect/ParameterizedType;
    invoke-static {v6, v8}, Lcom/google/sigma_gson/TypeInfoFactory;->getIndex([Ljava/lang/reflect/TypeVariable;Ljava/lang/reflect/TypeVariable;)I

    move-result v9

    .line 91
    .local v9, indexOfActualTypeArgument:I
    invoke-interface {v10}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 92
    .local v3, actualTypeArguments:[Ljava/lang/reflect/Type;
    aget-object p0, v3, v9

    goto :goto_0

    .line 93
    .end local v3           #actualTypeArguments:[Ljava/lang/reflect/Type;
    .end local v6           #classTypeVariables:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    .end local v8           #fieldTypeVariable:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    .end local v9           #indexOfActualTypeArgument:I
    .end local v10           #objParameterizedType:Ljava/lang/reflect/ParameterizedType;
    :cond_5
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/reflect/TypeVariable;

    if-eqz v14, :cond_8

    .line 94
    const/4 v13, 0x0

    .local v13, theSearchedType:Ljava/lang/reflect/Type;
    :cond_6
    move-object/from16 v14, p0

    .line 97
    check-cast v14, Ljava/lang/reflect/TypeVariable;

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lcom/google/sigma_gson/TypeInfoFactory;->extractTypeForHierarchy(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v13

    .line 98
    if-eqz v13, :cond_7

    instance-of v14, v13, Ljava/lang/reflect/TypeVariable;

    if-nez v14, :cond_6

    .line 100
    :cond_7
    if-eqz v13, :cond_8

    move-object/from16 p0, v13

    .line 101
    goto/16 :goto_0

    .line 105
    .end local v13           #theSearchedType:Ljava/lang/reflect/Type;
    :cond_8
    new-instance v14, Ljava/lang/UnsupportedOperationException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Expecting parameterized type, got "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".\n Are you missing the use of TypeToken idiom?\n See "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "http://sites.google.com/site/gson/gson-user-guide#TOC-Serializing-and-Deserializing-Gener"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 108
    :cond_9
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/lang/reflect/WildcardType;

    if-eqz v14, :cond_a

    move-object/from16 v5, p0

    .line 109
    check-cast v5, Ljava/lang/reflect/WildcardType;

    .line 110
    .local v5, castedType:Ljava/lang/reflect/WildcardType;
    invoke-interface {v5}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v14

    const/4 v15, 0x0

    aget-object v14, v14, v15

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v14, v0, v1}, Lcom/google/sigma_gson/TypeInfoFactory;->getActualType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object p0

    goto/16 :goto_0

    .line 112
    .end local v5           #castedType:Ljava/lang/reflect/WildcardType;
    :cond_a
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Type \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\' is not a Class, "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "ParameterizedType, GenericArrayType or TypeVariable. Can\'t extract type."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14
.end method

.method private static getIndex([Ljava/lang/reflect/TypeVariable;Ljava/lang/reflect/TypeVariable;)I
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, types:[Ljava/lang/reflect/TypeVariable;,"[Ljava/lang/reflect/TypeVariable<*>;"
    .local p1, type:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 168
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 169
    return v0

    .line 167
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 172
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "How can the type variable not be present in the class declaration!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getTypeInfoForArray(Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/TypeInfoArray;
    .locals 1
    .parameter "type"

    .prologue
    .line 39
    invoke-static {p0}, Lcom/google/sigma_gson/TypeUtils;->isArray(Ljava/lang/reflect/Type;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/sigma_gson/Preconditions;->checkArgument(Z)V

    .line 40
    new-instance v0, Lcom/google/sigma_gson/TypeInfoArray;

    invoke-direct {v0, p0}, Lcom/google/sigma_gson/TypeInfoArray;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method public static getTypeInfoForField(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;)Lcom/google/sigma_gson/TypeInfo;
    .locals 4
    .parameter "f"
    .parameter "typeDefiningF"

    .prologue
    .line 52
    invoke-static {p1}, Lcom/google/sigma_gson/TypeUtils;->toRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    .line 53
    .local v1, classDefiningF:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 54
    .local v2, type:Ljava/lang/reflect/Type;
    invoke-static {v2, p1, v1}, Lcom/google/sigma_gson/TypeInfoFactory;->getActualType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 55
    .local v0, actualType:Ljava/lang/reflect/Type;
    new-instance v3, Lcom/google/sigma_gson/TypeInfo;

    invoke-direct {v3, v0}, Lcom/google/sigma_gson/TypeInfo;-><init>(Ljava/lang/reflect/Type;)V

    return-object v3
.end method
