<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>代码生成平台</title>

    <#import "common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/codemirror/addon/hint/show-hint.css">

</head>
<body class="hold-transition skin-blue layout-top-nav ">
<div class="wrapper">

    <#-- header -->
    <@netCommon.commonHeader />


    <#-- content -->
    <div class="content-wrapper">
        <div class="container">

            <section class="content">

                <div class="row">

                    <#-- left -->
                    <div class2="col-md-9" >

                        <#-- 表结构 -->
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h4 class="pull-left">表结构信息</h4>
                                <button type="button" class="btn btn-default btn-xs pull-right" id="codeGenerate" >生成代码</button>
                            </div>
                            <div class="box-body">
                                <ul class="chart-legend clearfix">
                                    <li>
                                        <small class="text-muted" >
                                            <textarea id="tableSql" placeholder="请输入表结构信息..." >
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `username` varchar(20) NOT NULL COMMENT '用户名称',
  `gmt_created` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据状态 0：失效 1：有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息';
                                            </textarea>
                                        </small>
                                    </li>
                                    <li>
                                        <small class="text-muted">
                                            Author：<input id="author" placeholder="请输入author" value="author">
                                        </small>
                                    </li>
                                    <li>
                                        <small class="text-muted">
                                            Mapper路径：<input id="mapperPath" placeholder="请输入mapper路径" value="com.example.demo.mapper">
                                        </small>
                                    </li>
                                    <li>
                                        <small class="text-muted">
                                            Model路径：<input id="modelPath" placeholder="请输入model路径" value="com.example.demo.model">
                                        </small>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <#-- 生成代码 -->
                        <div class="nav-tabs-custom">
                            <!-- Tabs within a box -->
                            <ul class="nav nav-tabs pull-right">
                                <li class="pull-left header">生成代码</li>

                                <li><a href="#model" data-toggle="tab">Model</a></li>
                                <li><a href="#mybatis" data-toggle="tab">Mybatis</a></li>
                                <li><a href="#dao" data-toggle="tab">Dao</a></li>
                                <li><a href="#service_impl" data-toggle="tab">ServiceImpl</a></li>
                                <li><a href="#service" data-toggle="tab">Service</a></li>
                                <li class="active" ><a href="#controller" data-toggle="tab">Controller</a></li>

                            </ul>
                            <div class="tab-content no-padding">
                                <div class="chart tab-pane active" id="controller">
                                    <div class="box-body">
                                        Controller：<textarea id="controller_ide" ></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="service">
                                    <div class="box-body">
                                        Service：<textarea id="service_ide" ></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="service_impl">
                                    <div class="box-body">
                                        ServiceImpl：<textarea id="service_impl_ide" ></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="dao">
                                    <div class="box-body">
                                        Dao：<textarea id="dao_ide" ></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="mybatis">
                                    <div class="box-body">
                                        Mybatis：<textarea id="mybatis_ide" ></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="model" >
                                    <div class="box-body ">
                                        Model：<textarea id="model_ide" ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </section>


        </div>
    </div>

    <!-- footer -->
    <@netCommon.commonFooter />

</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/plugins/codemirror/lib/codemirror.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/addon/hint/show-hint.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/addon/hint/anyword-hint.js"></script>

<script src="${request.contextPath}/static/plugins/codemirror/addon/display/placeholder.js"></script>

<script src="${request.contextPath}/static/plugins/codemirror/mode/clike/clike.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/mode/sql/sql.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/mode/xml/xml.js"></script>

<script src="${request.contextPath}/static/js/index.js"></script>

</body>
</html>