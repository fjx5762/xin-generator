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

</mapper>
