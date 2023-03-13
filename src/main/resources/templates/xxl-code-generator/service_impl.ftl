import com.wmeimob.common.constants.CommonConstant;
import com.wmeimob.common.context.SysUserContextHolder;
import com.wmeimob.common.exception.BusinessException;
import com.wmeimob.common.util.AssertUtil;
import com.wmeimob.tkmybatis.base.impl.BaseCrudService;
import com.wmeimob.util.BeanCopierUtil;
import com.wmeimob.util.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tk.mybatis.mapper.entity.Example;

import java.util.*;


@Slf4j
@Service
@RequiredArgsConstructor
public class ${classInfo.className}ServiceImpl extends BaseCrudService<Long, ${classInfo.className}, ${classInfo.className}Mapper> implements ${classInfo.className}Service {

    @Override
    public List<${classInfo.className}> page(${classInfo.className}QueryParam param) {
        PageHelper.startPage(param.getPageNum(), param.getPageSize());
        Example e = new Example(${classInfo.className}.class);
        Example.Criteria c = e.createCriteria();
        c.andEqualTo("status", 1);
        e.orderBy("sort").desc();
        return mapper.selectByExample(e);
    }

    @Override
    public ${classInfo.className} detail(Long id) {
        ${classInfo.className} ${classInfo.className?uncap_first} = mapper.selectByPrimaryKey(id);
        AssertUtil.notNull(${classInfo.className?uncap_first});
        return ${classInfo.className?uncap_first};
    }

    @Override
    public ${classInfo.className} add(${classInfo.className}AddParam param) {
        ${classInfo.className} ${classInfo.className?uncap_first} = BeanCopierUtil.copy(param, ${classInfo.className}.class);
        SysUserContextHolder.fillCreate(${classInfo.className?uncap_first});
        AssertUtil.successLine(mapper.insertSelective(${classInfo.className?uncap_first}));
        return ${classInfo.className?uncap_first};
    }

    @Override
    public ${classInfo.className} upd(${classInfo.className}UpdParam param) {
        ${classInfo.className} ${classInfo.className?uncap_first} = Optional.ofNullable(this.selectByPrimaryKey(param.getId())).orElseThrow(() -> BusinessException.getInstance("当前更新数据不存在"));
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.fieldName != 'id'>
        ${classInfo.className?uncap_first}.set${fieldItem.fieldName?cap_first}(param.get${fieldItem.fieldName?cap_first}());
        </#if>
    </#list>
</#if>

        SysUserContextHolder.fillUpdate(${classInfo.className?uncap_first});
        AssertUtil.successLine(mapper.updateByPrimaryKeySelective(${classInfo.className?uncap_first}));
        return ${classInfo.className?uncap_first};
    }

    @Override
    public void del(Long id) {
        ${classInfo.className} ${classInfo.className?uncap_first} = Optional.ofNullable(this.selectByPrimaryKey(id)).orElseThrow(() -> BusinessException.getInstance("当前删除数据不存在"));
        SysUserContextHolder.fillUpdate(${classInfo.className?uncap_first});
        ${classInfo.className?uncap_first}.setStatus(CommonConstant.STATUS_FALSE);
        AssertUtil.successLine(mapper.updateByPrimaryKeySelective(${classInfo.className?uncap_first}));
    }



}