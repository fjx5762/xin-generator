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
        <result property="status" jdbcType="TINYINT" column="status"/>
        <result property="gmtCreated" jdbcType="TIMESTAMP" column="gmt_created"/>
        <result property="gmtModified" jdbcType="TIMESTAMP" column="gmt_modified"/>
        <result property="createUser" jdbcType="VARCHAR" column="create_user"/>
        <result property="modifyUser" jdbcType="VARCHAR" column="modify_user"/>
    </resultMap>

</mapper>
