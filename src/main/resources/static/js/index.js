$(function () {

    /**
     * 初始化 table sql
     */
    let tableSqlIDE;
    let mapperPathIDE;
    let modelPathIDE;
    let authorIDE;

    function initTableSql() {
        tableSqlIDE = CodeMirror.fromTextArea(document.getElementById("tableSql"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-sql",
            lineWrapping: false,
            readOnly: false,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        tableSqlIDE.setSize('auto', 'auto');

        authorIDE = CodeMirror.fromTextArea(document.getElementById("author"), {
            lineNumbers: true,
            mode: "text/html",
            lineWrapping: false,
            readOnly: false,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        authorIDE.setSize('auto', 'auto');

        mapperPathIDE = CodeMirror.fromTextArea(document.getElementById("mapperPath"), {
            lineNumbers: true,
            mode: "text/html",
            lineWrapping: false,
            readOnly: false,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        mapperPathIDE.setSize('auto', 'auto');

        modelPathIDE = CodeMirror.fromTextArea(document.getElementById("modelPath"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/html",
            lineWrapping: true,
            readOnly: false,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        modelPathIDE.setSize('auto', 'auto');
    }

    initTableSql();

    /**
     * 初始化 code area
     */
    let controller_ide;
    let service_ide;
    let service_impl_ide;
    let dao_ide;
    let mybatis_ide;
    let model_ide;

    function initCodeArea() {

        // controller_ide
        controller_ide = CodeMirror.fromTextArea(document.getElementById("controller_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        controller_ide.setSize('auto', 'auto');

        // service_ide
        service_ide = CodeMirror.fromTextArea(document.getElementById("service_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        service_ide.setSize('auto', 'auto');

        // service_impl_ide
        service_impl_ide = CodeMirror.fromTextArea(document.getElementById("service_impl_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        service_impl_ide.setSize('auto', 'auto');

        // dao_ide
        dao_ide = CodeMirror.fromTextArea(document.getElementById("dao_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        dao_ide.setSize('auto', 'auto');

        // mybatis_ide
        mybatis_ide = CodeMirror.fromTextArea(document.getElementById("mybatis_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/html",
            lineWrapping: true,
            readOnly: true
        });
        mybatis_ide.setSize('auto', 'auto');

        // model_ide
        model_ide = CodeMirror.fromTextArea(document.getElementById("model_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        model_ide.setSize('auto', 'auto');
    }

    initCodeArea();

    /**
     * 生成代码
     */
    $('#codeGenerate').click(function () {

        let tableSql = tableSqlIDE.getValue();
        let author = authorIDE.getValue();
        let mapperPath = mapperPathIDE.getValue();
        let modelPath = modelPathIDE.getValue();

        $.ajax({
            type: 'POST',
            url: base_url + "/codeGenerate",
            data: {
                "tableSql": tableSql,
                "author": author,
                "mapperPath": mapperPath,
                "modelPath": modelPath
            },
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    layer.open({
                        icon: '1',
                        content: "代码生成成功",
                        end: function (layero, index) {

                            controller_ide.setValue(data.data.controller_code);
                            controller_ide.setSize('auto', 'auto');

                            service_ide.setValue(data.data.service_code);
                            service_ide.setSize('auto', 'auto');

                            service_impl_ide.setValue(data.data.service_impl_code);
                            service_impl_ide.setSize('auto', 'auto');

                            dao_ide.setValue(data.data.dao_code);
                            dao_ide.setSize('auto', 'auto');

                            mybatis_ide.setValue(data.data.mybatis_code);
                            mybatis_ide.setSize('auto', 'auto');

                            model_ide.setValue(data.data.model_code);
                            model_ide.setSize('auto', 'auto');

                        }
                    });
                } else {
                    layer.open({
                        icon: '2',
                        content: (data.msg || '代码生成失败')
                    });
                }
            }
        });

    });

});