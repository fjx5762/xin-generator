package ink.unicode.xin.generator.utils;

import ink.unicode.xin.generator.model.ClassInfo;

import java.io.IOException;

/**
 * Created by fjx on 2020/04/01 00:00
 */
public class CodeGeneratorTool {
    /**
     * process Table Into ClassInfo
     */
    public static ClassInfo processTableIntoClassInfo(String tableSql) throws IOException {
        return TableParseUtil.processTableIntoClassInfo(tableSql);
    }
}
