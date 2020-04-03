<#if classInfo.isExtendsBaseMapper?exists && classInfo.isExtendsBaseMapper>
import org.apache.ibatis.annotations.Mapper;
import ${classInfo.mapperPath}.BaseMapper;

/**
*  ${classInfo.classComment}
*  Created by ${classInfo.createBy} on ${.now?string('yyyy/MM/dd HH:mm')}
*/
@Mapper
public interface ${classInfo.className}Mapper extends BaseMapper<${classInfo.className}, ${classInfo.primaryKeyClass}> {


}
<#else>
import org.apache.ibatis.annotations.Mapper;

/**
*  ${classInfo.classComment}
*  Created by ${classInfo.createBy} on ${.now?string('yyyy/MM/dd HH:mm')}
*/
@Mapper
public interface ${classInfo.className}Mapper {

    /**
    * 根据key加载
    */
    public ${classInfo.className} selectByPrimaryKey(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    /**
    * 删除
    */
    public int deleteByPrimaryKey(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);

    /**
    * 新增
    */
    public int insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 动态新增
    */
    public int insertSelective(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 更新
    */
    public int updateByPrimaryKey(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 动态更新
    */
    public int updateByPrimaryKeySelective(${classInfo.className} ${classInfo.className?uncap_first});


}
</#if>