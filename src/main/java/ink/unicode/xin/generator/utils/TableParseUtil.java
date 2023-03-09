package ink.unicode.xin.generator.utils;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import ink.unicode.xin.generator.exception.CodeGenerateException;
import ink.unicode.xin.generator.model.ClassInfo;
import ink.unicode.xin.generator.model.FieldInfo;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.*;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Created by fjx on 2020/04/01 00:00
 */
public class TableParseUtil {

    /**
     * 解析建表SQL生成代码（model-dao-xml）
     *
     * @param tableSql
     * @return
     */
    public static ClassInfo processTableIntoClassInfo(String tableSql) throws IOException {

        // 获取表名
        String tableName = null;
        Matcher tableNameMatcher = Pattern.compile("(table|TABLE)\\s*(.*)\\(").matcher(tableSql);
        if (tableNameMatcher.find()) {
            String tableNameTemp = tableNameMatcher.group(2);
            if (tableNameTemp.contains("`")) {
                Matcher tableNameTempMatcher = Pattern.compile("\\`(\\b.*)\\`")
                        .matcher(tableNameTemp);
                if (tableNameTempMatcher.find()) {
                    tableName = tableNameTempMatcher.group(1);
                }
            }
        }
        if (Objects.isNull(tableName)) {
            throw new CodeGenerateException("表结构解析失败<tableName>");
        }

        // 获取表注释
        String classComment = "";
        Matcher classCommentMatcher = Pattern.compile("(.*)\\)*(COMMENT |COMMENT=|COMMENT = |comment |comment=|coment = )(.*)$").matcher(tableSql);
        if (classCommentMatcher.find()) {
            String group = classCommentMatcher.group(3);
            if (group.contains("'")) {
                Matcher tableNameTempMatcher = Pattern.compile("\\'(.*)\\'")
                        .matcher(group);
                if (tableNameTempMatcher.find()) {
                    classComment = tableNameTempMatcher.group(1);
                }
            }
        }

        // 主键
        List<String> primaryKeyList = Lists.newArrayList();
        Matcher primaryKeyMatcher = Pattern.compile("(primary key|PRIMARY KEY).*\\((.*)\\)").matcher(tableSql);
        if (primaryKeyMatcher.find()) {
            // 有可能多个主键
            List<String> primaryKeys = Splitter.on(",").splitToList(primaryKeyMatcher.group(2));
            for (String primaryKey : primaryKeys) {
                Matcher matcher = Pattern.compile("\\`(\\b.*)\\`").matcher(primaryKey);
                if (matcher.find()) {
                    primaryKeyList.add(matcher.group(1));
                }
            }
        }

        if (primaryKeyList.isEmpty()) {
            throw new CodeGenerateException("表结构解析失败<请配置主键>");
        }

        // 字段
        List<FieldInfo> fieldList = Lists.newArrayList();
        Matcher fieldListMatcher = Pattern.compile("\\(([\\s\\S]*)\\)").matcher(tableSql);
        if (fieldListMatcher.find()) {
            List<String> fieldInfoSqlList = Splitter.on(",\n").omitEmptyStrings().splitToList(fieldListMatcher.group(1));
            for (String fieldInfoSql : fieldInfoSqlList) {
                FieldInfo fieldInfo = new FieldInfo();
                // 字段
//                Matcher fieldMatcher = Pattern.compile("\\`(.*)\\`\\s*()").matcher(fieldInfoSql);
                Matcher fieldMatcher = Pattern.compile("\\`(.*)\\`\\s*(TINYINT|SMALLINT|MEDIUMINT|INTEGER|BIGINT|INT|FLOAT|DOUBLE|DECIMAL|TIMESTAMP|DATETIME|TIME|DATE|YEAR|VARBINARY|BINARY|BIT|TINYBLOB|LONGBLOB|MEDIUMBLOB|BLOB|VARCHAR|CHAR|LONGTEXT|MEDIUMTEXT|TEXT|JSON|" +
                        "tinyint|smallint|mediumint|integer|bigint|int|float|double|decimal|timestamp|datetime|time|date|year|varbinary|binary|bit|tinyblob|longblob|mediumblob|blob|varchar|char|longtext|mediumtext|text|json)").matcher(fieldInfoSql);
                if (fieldMatcher.find()) {
                    fieldInfo.setColumnName(fieldMatcher.group(1));
                    fieldInfo.setFieldName(StringUtils.lowerCaseFirst(StringUtils.underlineToCamelCase(fieldInfo.getColumnName())));
                    fieldInfo.setColumnType(fieldMatcher.group(2));

                    String fieldClass = "";
                    String columnType = fieldInfo.getColumnType().toLowerCase();

                    switch (columnType) {
                        // 数字
                        case "tinyint":
                            fieldClass = Integer.class.getSimpleName();
                            fieldInfo.setColumnUpperType("TINYINT");
                            break;
                        case "smallint":
                            fieldClass = Integer.class.getSimpleName();
                            fieldInfo.setColumnUpperType("SMALLINT");
                            break;
                        case "mediumint":
                        case "int":
                        case "integer":
                            fieldClass = Integer.class.getSimpleName();
                            fieldInfo.setColumnUpperType("INTEGER");
                            break;
                        case "bigint":
                            fieldClass = Long.class.getSimpleName();
                            fieldInfo.setColumnUpperType("BIGINT");
                            break;

                        // 近似数字
                        case "float":
                            fieldClass = Float.class.getSimpleName();
                            fieldInfo.setColumnUpperType("FLOAT");
                            break;
                        case "double":
                            fieldClass = Double.class.getSimpleName();
                            fieldInfo.setColumnUpperType("DOUBLE");
                            break;
                        case "decimal":
                            fieldClass = BigDecimal.class.getSimpleName();
                            fieldInfo.setColumnUpperType("DECIMAL");
                            break;

                        // 日期
                        case "date":
                            fieldClass = LocalDate.class.getSimpleName();
                            fieldInfo.setColumnUpperType("DATE");
                            break;
                        case "time":
                            fieldClass = LocalTime.class.getSimpleName();
                            fieldInfo.setColumnUpperType("TIME");
                            break;
                        case "datetime":
                            fieldClass = LocalDateTime.class.getSimpleName();
                            fieldInfo.setColumnUpperType("TIMESTAMP");
                            break;
                        case "timestamp":
                            fieldClass = Instant.class.getSimpleName();
                            fieldInfo.setColumnUpperType("TIMESTAMP");
                            break;
                        case "year":
                            fieldClass = Year.class.getSimpleName();
                            fieldInfo.setColumnUpperType("DATE");
                            break;

                        // 二进制
                        case "bit":
                            fieldClass = "byte[]";
                            fieldInfo.setColumnUpperType("BIT");
                            break;
                        case "binary":
                            fieldClass = "byte[]";
                            fieldInfo.setColumnUpperType("BINARY");
                            break;
                        case "varbinary":
                            fieldClass = "byte[]";
                            fieldInfo.setColumnUpperType("VARBINARY");
                            break;
                        case "tinyblob":
                        case "blob":
                        case "mediumblob":
                        case "longblob":
                            fieldClass = "byte[]";
                            fieldInfo.setColumnUpperType("BLOB");
                            break;

                        // 字符串
                        case "char":
                            fieldClass = String.class.getSimpleName();
                            fieldInfo.setColumnUpperType("CHAR");
                            break;
                        case "varchar":
                        case "text":
                        case "mediumtext":
                        case "longtext":
                        case "json":
                            fieldClass = String.class.getSimpleName();
                            fieldInfo.setColumnUpperType("VARCHAR");
                            break;
                        default:
                            throw new CodeGenerateException("表结构解析失败<fieldType> : " + fieldInfo.getColumnName());
                    }
                    fieldInfo.setFieldClass(fieldClass);
                }
                // 注释
                Matcher fieldCommentMatcher = Pattern.compile("(comment|COMMENT)\\s* \\'(.*)\\'").matcher(fieldInfoSql);
                if (fieldCommentMatcher.find()) {
                    String fieldComment = fieldCommentMatcher.group(2);
                    fieldInfo.setFieldComment(Objects.nonNull(fieldCommentMatcher.group(2)) ? fieldComment : "");
                } else {
                    fieldInfo.setFieldComment("");
                }
                if (Objects.nonNull(fieldInfo.getColumnName())) {
                    fieldList.add(fieldInfo);
                }
            }
        }

        if (fieldList.isEmpty()) {
            throw new CodeGenerateException("表结构解析失败<无字段>");
        }

        // 设置主键
        for (FieldInfo fieldInfo : fieldList) {
            fieldInfo.setIsPrimaryKey(primaryKeyList.contains(fieldInfo.getColumnName()));
        }

        ClassInfo codeJavaInfo = new ClassInfo();
        codeJavaInfo.setTableName(tableName);
        codeJavaInfo.setClassName(StringUtils.upperCaseFirst(StringUtils.underlineToCamelCase(tableName)));
        codeJavaInfo.setClassComment(classComment);
        codeJavaInfo.setFieldList(fieldList);
        codeJavaInfo.setSerialVersionUID(String.valueOf(System.currentTimeMillis()));
        codeJavaInfo.setPrimaryKeyFieldList(fieldList.stream().filter(FieldInfo::getIsPrimaryKey).collect(Collectors.toList()));
        codeJavaInfo.setIsMultiplePrimaryKey(codeJavaInfo.getPrimaryKeyFieldList().size() > 1);

        return codeJavaInfo;
    }
}
