<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>提交成功</title>
    <link rel="stylesheet" href="../../css/style.css"/>
    <link rel="stylesheet" href="../../js/editormd.preview.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<%--<a href="/blog/edit?">编辑内容：<a/>--%>
<div id="layout">
    <div id="blogdoc">
            <textarea style="display:none;" id="content" name="markdown-doc" value="${
            blog.title +blog.author +blog.id + blogJson.content}"></textarea>
    </div>
</div>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/lib/marked.min.js"></script>
<script src="../../js/lib/prettify.min.js"></script>

<script src="../../js/lib/raphael.min.js"></script>
<script src="../../js/lib/underscore.min.js"></script>
<script src="../../js/lib/sequence-diagram.min.js"></script>
<script src="../../js/lib/flowchart.min.js"></script>
<script src="../../js/lib/jquery.flowchart.min.js"></script>
<script src="../../js/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        var testEditormdView
        $.get("getBolgForm",
            function (blogJsonStr) {

                testEditormdView = editormd.markdownToHTML("blogdoc", {
                    //markdown是属性，可不申明，申明后可以被参数赋值

                    htmlDecode: "style,script,iframe",  // you can filter tags decode

                    tocm: true,    // Using [TOCM]

                    emoji: true,
                    taskList: true,
                    tex: true,  // 默认不解析
                    flowChart: true,  // 默认不解析
                    sequenceDiagram: true,  // 默认不解析
                });
            });

    });
</script>
<%--<--%>
</body>
</html>