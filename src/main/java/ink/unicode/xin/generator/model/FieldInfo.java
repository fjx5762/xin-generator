package ink.unicode.xin.generator.model;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by fjx on 2020/04/01 00:00
 */
@Getter
@Setter
public class FieldInfo {
    private String columnName;
    private String columnType;
    private String columnUpperType;
    private String fieldName;
    private String fieldClass;
    private String fieldComment;
    private Boolean isPrimaryKey;
}
