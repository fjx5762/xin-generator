import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*  ${classInfo.classComment}
*  Created by ${classInfo.createBy} on ${.now?string('yyyy/MM/dd HH:mm')}
*/
@Slf4j
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

    @Autowired
    private ${classInfo.className}Mapper ${classInfo.className?uncap_first}Mapper;
<#if classInfo.needServiceExtends?exists && classInfo.needServiceExtends>
    @Override
    public CommonResult save(${classInfo.className} ${classInfo.className?uncap_first}) {
        ${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});
        return CommonResult;
    }

    @Override
    public CommonResult remove(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>) {
        ${classInfo.className?uncap_first}Mapper.deleteByPrimaryKey(<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
        return CommonResult;
    }

    @Override
    public CommonResult update(${classInfo.className} ${classInfo.className?uncap_first}) {
        ${classInfo.className?uncap_first}Mapper.updateByPrimaryKey(${classInfo.className?uncap_first});
        return CommonResult;
    }

    @Override
    public ${classInfo.className} getById(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>) {
        return ${classInfo.className?uncap_first}Mapper.selectByPrimaryKey(<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
    }
</#if>


}