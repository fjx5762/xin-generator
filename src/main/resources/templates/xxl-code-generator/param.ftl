<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.fieldClass == "LocalDateTime"><#assign importLocalDateTime = true /></#if>
        <#if fieldItem.fieldClass == "LocalDate"><#assign importLocalDate = true /></#if>
        <#if fieldItem.fieldClass == "LocalTime"><#assign importLocalTime = true /></#if>
        <#if fieldItem.fieldClass == "BigDecimal"><#assign importBigDecimal = true /></#if>
        <#if fieldItem.fieldClass == "Instant"><#assign importInstant = true /></#if>
        <#if fieldItem.fieldClass == "Year"><#assign importYear = true /></#if>
    </#list>
</#if>
import com.wmeimob.util.BaseDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
<#if importLocalDateTime?? && importLocalDateTime>
import java.time.LocalDateTime;
</#if>
<#if importLocalDate?? && importLocalDate>
import java.time.LocalDate;
</#if>
<#if importLocalTime?? && importLocalTime>
import java.time.LocalTime;
</#if>
<#if importInstant?? && importInstant>
import java.time.Instant;
</#if>
<#if importYear?? && importYear>
import java.time.Year;
</#if>
<#if importBigDecimal?? && importBigDecimal>
import java.math.BigDecimal;
</#if>

@Data
public class ${classInfo.className}QueryParam extends BaseDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName != 'id'>
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#if>
    </#list>
    </#if>
    @ApiModelProperty("关键字查询条件")
    private String queryParam;
}


----------------------------------------------------------------------------------------------



import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
<#if importLocalDateTime?? && importLocalDateTime>
    import java.time.LocalDateTime;
</#if>
<#if importLocalDate?? && importLocalDate>
    import java.time.LocalDate;
</#if>
<#if importLocalTime?? && importLocalTime>
    import java.time.LocalTime;
</#if>
<#if importInstant?? && importInstant>
    import java.time.Instant;
</#if>
<#if importYear?? && importYear>
    import java.time.Year;
</#if>
<#if importBigDecimal?? && importBigDecimal>
    import java.math.BigDecimal;
</#if>

@Data
public class ${classInfo.className}AddParam implements Serializable {

    private static final long serialVersionUID = 1L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName != 'id'>
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#if>
    </#list>
</#if>

}


----------------------------------------------------------------------------------------------



import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
<#if importLocalDateTime?? && importLocalDateTime>
    import java.time.LocalDateTime;
</#if>
<#if importLocalDate?? && importLocalDate>
    import java.time.LocalDate;
</#if>
<#if importLocalTime?? && importLocalTime>
    import java.time.LocalTime;
</#if>
<#if importInstant?? && importInstant>
    import java.time.Instant;
</#if>
<#if importYear?? && importYear>
    import java.time.Year;
</#if>
<#if importBigDecimal?? && importBigDecimal>
    import java.math.BigDecimal;
</#if>

@Data
public class ${classInfo.className}UpdParam implements Serializable {

    private static final long serialVersionUID = 1L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    @ApiModelProperty("主键ID")
    @NotNull(message = "主键ID不能为空")
    private Long id;

    <#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName != 'id'>
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};
    </#if>
    </#list>
</#if>

}