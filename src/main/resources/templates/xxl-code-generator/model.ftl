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
        <#if fieldItem.fieldClass == "LocalDateTime"><#assign importDdate = true /></#if>
    </#list>
</#if>
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
<#if importDdate?? && importDdate>
import java.time.LocalDateTime;
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
        <#if fieldItem.fieldClass == "LocalDateTime"><#assign importDdate = true /></#if>
    </#list>
</#if>
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
<#if importDdate?? && importDdate>
import java.time.LocalDateTime;
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

