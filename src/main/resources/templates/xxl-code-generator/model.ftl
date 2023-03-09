<#if classInfo.isMultiplePrimaryKey?exists && classInfo.isMultiplePrimaryKey>
<#--多主键-->
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
<#--主键实体-->

/**
 * @author ${classInfo.createBy}
 * @since ${.now?string('yyyy.MM.dd')}
*/
@Getter
@Setter
public class ${classInfo.className}Key implements Serializable {
    private static final long serialVersionUID = ${classInfo.serialVersionUID}0L;

<#if classInfo.primaryKeyFieldList?exists && classInfo.primaryKeyFieldList?size gt 0>
    <#list classInfo.primaryKeyFieldList as primaryKeyFieldItem >
    /**
    * ${primaryKeyFieldItem.fieldComment}
    */
    private ${primaryKeyFieldItem.fieldClass} ${primaryKeyFieldItem.fieldName};

    </#list>
</#if>
}


-------------------------------------------------------------------------------------------------------


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
import lombok.Getter;
import lombok.Setter;
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
<#--继承主键实体-->

/**
 * @author ${classInfo.createBy}
 * @since ${.now?string('yyyy.MM.dd')}
*/
@Getter
@Setter
public class ${classInfo.className} extends ${classInfo.className}Key implements Serializable {
    private static final long serialVersionUID = ${classInfo.serialVersionUID}L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    <#if fieldItem.isPrimaryKey?exists && !fieldItem.isPrimaryKey>
    /**
    * ${fieldItem.fieldComment}
    */
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#if>
    </#list>
</#if>
}

<#else>
<#--单主键-->
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
import lombok.Getter;
import lombok.Setter;
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

/**
 * @author ${classInfo.createBy}
 * @since ${.now?string('yyyy.MM.dd')}
*/
@Getter
@Setter
public class ${classInfo.className} implements Serializable {
    private static final long serialVersionUID = ${classInfo.serialVersionUID}L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    /**
    * ${fieldItem.fieldComment}
    */
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#list>
</#if>
}
</#if>

