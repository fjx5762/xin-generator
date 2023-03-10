import com.wmeimob.common.constants.CommonConstant;
import com.wmeimob.common.context.SysUserContextHolder;
import com.wmeimob.tkmybatis.base.impl.BaseCrudController;
import com.wmeimob.util.JsonResult;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api(tags = {"汽车管理" })
@Slf4j
@RestController
@RequestMapping("/api/${classInfo.className?uncap_first}")
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