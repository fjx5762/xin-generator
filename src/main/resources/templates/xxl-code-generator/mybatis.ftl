<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${classInfo.mapperPath}.${classInfo.className}Mapper">
    <resultMap id="BaseResultMap" type="${classInfo.entityPath}.${classInfo.className}">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.isPrimaryKey?exists && fieldItem.isPrimaryKey>
        <id column="${fieldItem.columnName}" jdbcType="${fieldItem.columnUpperType}" property="${fieldItem.fieldName}"/>
        <#else>
        <result column="${fieldItem.columnName}" jdbcType="${fieldItem.columnUpperType}" property="${fieldItem.fieldName}"/>
        </#if>
        </#list>
        </#if>
    </resultMap>

    <sql id="Base_Column_List">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >`${fieldItem.columnName}`<#if fieldItem_has_next>, </#if></#list>
        </#if>
    </sql>

    <select id="selectByPrimaryKey" parameterType="<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.entityPath}.</#if>${classInfo.primaryKeyClass}" resultMap="BaseResultMap">
        select <include refid="Base_Column_List"/>
        from ${classInfo.tableName}
        <#if classInfo.primaryKeyFieldList?exists && classInfo.primaryKeyFieldList?size gt 0>where <#list classInfo.primaryKeyFieldList as primaryKeyFieldItem >`${primaryKeyFieldItem.columnName}` = ${r"#{"}${primaryKeyFieldItem.fieldName}, jdbcType=${primaryKeyFieldItem.columnUpperType}${r"}"} <#if primaryKeyFieldItem_has_next> and </#if></#list></#if>
    </select>

    <delete id="deleteByPrimaryKey" parameterType="<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.entityPath}.</#if>${classInfo.primaryKeyClass}">
        delete from ${classInfo.tableName}
        <#if classInfo.primaryKeyFieldList?exists && classInfo.primaryKeyFieldList?size gt 0>
        where <#list classInfo.primaryKeyFieldList as primaryKeyFieldItem >`${primaryKeyFieldItem.columnName}` = ${r"#{"}${primaryKeyFieldItem.fieldName}, jdbcType=${primaryKeyFieldItem.columnUpperType}${r"}"} <#if primaryKeyFieldItem_has_next> and </#if></#list>
        </#if>
    </delete>

    <insert id="insert" parameterType="${classInfo.entityPath}.${classInfo.className}">
        insert into ${classInfo.tableName} (
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem > `${fieldItem.columnName}`<#if fieldItem_has_next>,</#if></#list>
        </#if>
        )
        values(
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem > ${r"#{"}${fieldItem.fieldName}, jdbcType=${fieldItem.columnUpperType}${r"}"}<#if fieldItem_has_next>,</#if> </#list>
        </#if>
        )
    </insert>

    <insert id="insertSelective" parameterType="${classInfo.entityPath}.${classInfo.className}">
        insert into ${classInfo.tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
            <if test="${fieldItem.fieldName} != null">
                `${fieldItem.columnName}`<#if fieldItem_has_next>,</#if>
            </if>
            </#list>
            </#if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
            <if test="${fieldItem.fieldName} != null">
                ${r"#{"}${fieldItem.fieldName}, jdbcType=${fieldItem.columnUpperType}${r"}"}<#if fieldItem_has_next>,</#if>
            </if>
            </#list>
            </#if>
        </trim>
    </insert>

    <update id="updateByPrimaryKey" parameterType="${classInfo.entityPath}.${classInfo.className}">
        update ${classInfo.tableName}
        set <#list classInfo.fieldList as fieldItem >
            <#if !fieldItem.isPrimaryKey>`${fieldItem.columnName}` = ${r"#{"}${fieldItem.fieldName}, jdbcType=${fieldItem.columnUpperType}${r"}"}<#if fieldItem_has_next>,</#if></#if></#list>
        <#if classInfo.primaryKeyFieldList?exists && classInfo.primaryKeyFieldList?size gt 0>
        where <#list classInfo.primaryKeyFieldList as primaryKeyFieldItem >`${primaryKeyFieldItem.columnName}` = ${r"#{"}${primaryKeyFieldItem.fieldName}, jdbcType=${primaryKeyFieldItem.columnUpperType}${r"}"} <#if primaryKeyFieldItem_has_next> and </#if></#list>
        </#if>
    </update>

    <update id="updateByPrimaryKeySelective" parameterType="${classInfo.entityPath}.${classInfo.className}">
        update ${classInfo.tableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
            <#if !fieldItem.isPrimaryKey>
            <if test="${fieldItem.fieldName} != null">
                `${fieldItem.columnName}` = ${r"#{"}${fieldItem.fieldName}, jdbcType=${fieldItem.columnUpperType}${r"}"},
            </if>
            </#if>
            </#list>
        </set>
        <#if classInfo.primaryKeyFieldList?exists && classInfo.primaryKeyFieldList?size gt 0>
        where <#list classInfo.primaryKeyFieldList as primaryKeyFieldItem >`${primaryKeyFieldItem.columnName}` = ${r"#{"}${primaryKeyFieldItem.fieldName}, jdbcType=${primaryKeyFieldItem.columnUpperType}${r"}"} <#if primaryKeyFieldItem_has_next> and </#if></#list>
        </#if>
    </update>


</mapper>
