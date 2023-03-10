package ink.unicode.xin.generator.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Created by fjx on 2020/04/01 00:00
 */
@Getter
@Setter
public class ClassInfo {

    private String tableName;
    private String className;
    private String classComment;
    private String serialVersionUID;
    private String createBy;
    private String entityPath;
    private String paramPath;
    private String mapperPath;
    private String servicePath;
    private String serviceImplPath;
    private Boolean isMultiplePrimaryKey;
    private Boolean isExtendsBaseMapper;
    private Boolean needControllerExtends;
    private Boolean needServiceExtends;
    private String primaryKeyClass;
    private List<FieldInfo> fieldList;
    private List<FieldInfo> primaryKeyFieldList;

}
