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

        body {
            background-color: #d0e4fe;
        }

        label {
            font-family: "Times New Roman";
            font-size: 20px;
        }

    </style>
</head>
<body>
<a href="${pageContext.request.contextPath }/blog/tryToMain"> 返回主页<a />

<%--    <label for="title">title:</label>--%>
<%--    <input id="title" type="text" value="${blog.title}"/>--%>

<%--    <label for="author">author:</label>--%>
<%--    <input id="author" type="text" value="${blog.author}"/>--%>

<div id="layout">

    <div class="fa-align-center">
        <h2>
            标题：${blog.title}</h2>
        <br><br>
        <h3>作者：${blog.author}</h3>
        <br></div>
    <div id="blogdoc">
        <textarea style="display:none;" id="content" name="markdown-doc">${blog.content}</textarea>
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
        testEditormdView = editormd.markdownToHTML("blogdoc", {
            //markdown属性，可不申明，申明后可以被参数赋值
            // markdowm
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            tocm: true,    // Using [TOCM]
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true,  // 默认不解析
        });


    });
</script>

</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>