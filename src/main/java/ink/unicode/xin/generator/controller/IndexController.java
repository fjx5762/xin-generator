package ink.unicode.xin.generator.controller;

import com.alibaba.druid.sql.SQLUtils;
import com.google.common.collect.ImmutableMap;
import ink.unicode.xin.generator.model.ClassInfo;
import ink.unicode.xin.generator.model.ReturnT;
import ink.unicode.xin.generator.service.FreemarkerService;
import ink.unicode.xin.generator.utils.CodeGeneratorTool;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by fjx on 2020/04/01 00:00
 */
@Slf4j
@Controller
public class IndexController {

    @Resource
    private FreemarkerService freemarkerService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/codeGenerate")
    @ResponseBody
    public ReturnT<Map<String, String>> codeGenerate(String tableSql, String author, String mapperPath, String poPath) {
        if (StringUtils.isBlank(tableSql)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, "表结构信息不可为空");
        }
        if (StringUtils.isBlank(author)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, "Author不可为空");
        }
        if (StringUtils.isBlank(mapperPath)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, "MapperPath不可为空");
        }
        if (StringUtils.isBlank(poPath)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, "PoPath不可为空");
        }
        try {
            // 优化SQL
            String tableSqlFormat = SQLUtils.formatMySql(tableSql, SQLUtils.DEFAULT_LCASE_FORMAT_OPTION);
            log.info("-------sql格式化--------" + "\n" + tableSqlFormat);

            // 解析表结构
            ClassInfo classInfo = CodeGeneratorTool.processTableIntoClassInfo(tableSqlFormat);
            classInfo.setCreateBy(author);
            classInfo.setMapperPath(mapperPath);
            classInfo.setEntityPath(poPath);
            classInfo.setPrimaryKeyClass(classInfo.getIsMultiplePrimaryKey() ?
                    classInfo.getClassName() + "Key" : classInfo.getPrimaryKeyFieldList().get(0).getFieldClass());
            // mapper基类
            classInfo.setIsExtendsBaseMapper(false);
            // 继承service
            classInfo.setNeedServiceExtends(true);
            // 继承controller
            classInfo.setNeedControllerExtends(true);

            // 构建参数
            Map<String, Object> params = ImmutableMap.<String, Object>builder()
                    .put("classInfo", classInfo).build();

            // 返回值
            Map<String, String> result = ImmutableMap.<String, String>builder()
                    .put("controller_code", freemarkerService.processString("xxl-code-generator/controller.ftl", params))
                    .put("service_code", freemarkerService.processString("xxl-code-generator/service.ftl", params))
                    .put("service_impl_code", freemarkerService.processString("xxl-code-generator/service_impl.ftl", params))
                    .put("dao_code", freemarkerService.processString("xxl-code-generator/dao.ftl", params))
                    .put("mybatis_code", freemarkerService.processString("xxl-code-generator/mybatis.ftl", params))
                    .put("model_code", freemarkerService.processString("xxl-code-generator/model.ftl", params))
                    .put("format_sql", tableSqlFormat).build();

            // 计算,生成代码行数
            log.info("生成代码行数：{}", result.values().stream().mapToInt(s -> StringUtils.countMatches(s, "\n")).sum());

            return new ReturnT<>(result);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new ReturnT<>(ReturnT.FAIL_CODE, e.getMessage());
        }
    }

}
