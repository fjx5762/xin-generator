# xin-generator
java code generator 代码生成 

支持多主键，自定义路径，自定义创建人，继承BaseMapper等。

通过以下进行配置

```java
// 创建人
classInfo.setCreateBy(author);
// mapper路径
classInfo.setMapperPath(mapperPath);
// 实体路径
classInfo.setEntityPath(poPath);
// mapper基类
classInfo.setIsExtendsBaseMapper(false);
// 继承service
classInfo.setNeedServiceExtends(true);
// 继承controller
classInfo.setNeedControllerExtends(true);
```

优势

1. 采用druid.sql优化语句 
2. 采用Lombok代码整洁

mapper实现六个方法

1. selectByPrimaryKey
2. deleteByPrimaryKey
3. insert
4. insertSelective
5. updateByPrimaryKey
6. updateByPrimaryKeySelective


参考地址 https://github.com/xuxueli/xxl-code-generator.git 

在线访问 https://code.metalion.tech/
