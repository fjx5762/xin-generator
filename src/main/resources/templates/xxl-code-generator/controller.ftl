import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
import java.util.Map;


/**
*  ${classInfo.classComment}
*  Created by ${classInfo.createBy} on ${.now?string('yyyy/MM/dd HH:mm')}
*/
@Slf4j
@RestController("/${classInfo.className?uncap_first}")
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;
<#if classInfo.needControllerExtends?exists && classInfo.needControllerExtends>
    /**
    * 新增
    */
    @PostMapping("/insert")
    public CommonResult insert(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.save(${classInfo.className?uncap_first});
    }

    /**
    * 删除
    */
    @DeleteMapping("/delete")
    public CommonResult delete(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>){
        return ${classInfo.className?uncap_first}Service.remove(<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
    }

    /**
    * 更新
    */
    @PutMapping("/update")
    public CommonResult update(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
    }

    /**
    * 查询
    */
    @GetMapping("/load")
    public CommonResult load(${classInfo.primaryKeyClass} <#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>){
        return ${classInfo.className?uncap_first}Service.getById(<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>${classInfo.primaryKeyClass?uncap_first}<#else>${classInfo.primaryKeyFieldList[0].columnName?uncap_first}</#if>);
    }
</#if>

}