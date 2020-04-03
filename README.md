# xin-generator
java code generator

支持多主键，自定义路径，自定义创建人，继承BaseMapper等。

通过以下进行配置

            // 创建人
            classInfo.setCreateBy("fjx");
            // mapper路径
            classInfo.setMapperPath("ink.unicode.boot.generator.mapper");
            // 实体路径
            classInfo.setEntityPath("ink.unicode.boot.generator.entity");
            // mapper基类
            classInfo.setIsExtendsBaseMapper(false);
            // 继承service
            classInfo.setNeedServiceExtends(true);
            // 继承controller
            classInfo.setNeedControllerExtends(true);

优势
1）采用druid.sql优化语句 
2）采用Lombok代码整洁

该项目参考引用了 https://github.com/xuxueli/xxl-code-generator.git 
