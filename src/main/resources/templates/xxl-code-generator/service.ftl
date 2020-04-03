/**
*  ${classInfo.classComment}
*  Created by ${classInfo.createBy} on ${.now?string('yyyy/MM/dd HH:mm')}
*/
public interface ${classInfo.className}Service {
<#if classInfo.needServiceExtends?exists && classInfo.needServiceExtends>
    public CommonResult save(${classInfo.className} ${classInfo.className?uncap_first});

    public CommonResult remove(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    public CommonResult update(${classInfo.className} ${classInfo.className?uncap_first});

    public ${classInfo.className} getById(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
</#if>

}