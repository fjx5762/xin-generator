/**
 * @author ${classInfo.createBy}
 * @since ${.now?string('yyyy.MM.dd')}
*/
public interface ${classInfo.className}Service {

<#if classInfo.needServiceExtends?exists && classInfo.needServiceExtends>
    CommonResult save(${classInfo.className} ${classInfo.className?uncap_first});

    CommonResult remove(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    CommonResult update(${classInfo.className} ${classInfo.className?uncap_first});

    ${classInfo.className} getById(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
</#if>

}