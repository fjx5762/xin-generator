<#if classInfo.isExtendsBaseMapper?exists && classInfo.isExtendsBaseMapper>

import ${classInfo.mapperPath}.BaseMapper;

/**
* @author ${classInfo.createBy}
* @since ${.now?string('yyyy/MM/dd')}
*/
public interface ${classInfo.className}Mapper extends BaseMapper<${classInfo.className}, ${classInfo.primaryKeyClass}> {


}
<#else>
import org.apache.ibatis.annotations.Mapper;

/**
* @author ${classInfo.createBy}
* @since ${.now?string('yyyy/MM/dd')}
*/
public interface ${classInfo.className}Mapper {

    /**
    * 根据key查询
    */
    ${classInfo.className} selectByPrimaryKey(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    /**
    * 删除
    */
    int deleteByPrimaryKey(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    /**
    * 新增
    */
    int insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 动态新增
    */
    int insertSelective(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 更新
    */
    int updateByPrimaryKey(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 动态更新
    */
    int updateByPrimaryKeySelective(${classInfo.className} ${classInfo.className?uncap_first});


}
</#if>