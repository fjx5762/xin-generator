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
import com.wmeimob.core.bean.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;
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

@Table(name = "${classInfo.tableName}")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class ${classInfo.className} extends BaseEntity<Long> implements Serializable {

    private static final long serialVersionUID = ${classInfo.serialVersionUID}L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName != 'id'>
    @Column(name = "${fieldItem.columnName}")
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#if>
    </#list>
</#if>
}