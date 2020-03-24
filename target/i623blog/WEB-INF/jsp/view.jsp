<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>浏览</title>
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
<div id="layout">

    <%--
        <div class="btns">
            <button onclick="location.href='html-preview-markdown-to-html-custom-toc-container.jsp';">将 ToC 移到自定义容器层
            </button>
        </div>
    --%>

    <a href="${pageContext.request.contextPath }/blog/edit?">编辑内容：<a/>
        <div id="txtMd-view">
            <textarea style="display:none;" id="content" name="markdown-doc"></textarea>
        </div>
        <%--    <div id="test-editormd-view2">
                <textarea id="append-test" style="display:none;">&gt;</textarea>
            </div>--%>

</div>
<!-- <script src="js/zepto.min.js"></script>
<script>
    var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
</script> -->
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
        var testEditormdView//, testEditormdView2;
        //$.get 发送一个 HTTP GET 请求到页面并取回结果：，成功后执行 function(data,status,xhr)   //xhr - 包含 XMLHttpRequest 对象

        $.get("getBolgForm",
            {"colors": "red"},
            //参数代表了数据库取出的字符串
            function (blogJsonStr) {
                // 1.先将字符串 转换为json对象；{ "name": "John" } //json标准格式字符，
                var blogJson = eval('(' + blogJsonStr + ')');
                var blogId = blogJson.id;
                /*alert(blogJson.title);
                //将JSON对象转化为JSON字符
                var blogJsonStr = JSON.stringify(blogJson);
                alert(blogJsonStr);*/
                //2.jquery遍历json对象
                /*             $.each(blogJson, function (index, value) {
                                 alert(index+'-'+value);
                             });*/
                //md解析html
                testEditormdView = editormd.markdownToHTML("txtMd-view", {
                    //》推论1：左值markdown是固定属性，不申明取当前页面，申明后，取右值.显示在页面上,有值错误，不渲染页面。
                    //》推论2：右值是函数参数，此参数代表从数据库返回值，可以赋值给markdown属性。

                    markdown: "### " + blogJson.title +
                        "\n作者:" + blogJson.author +
                        "\n\n[编辑](${pageContext.request.contextPath }/blog/edit)ID:" + blogJson.id + "" +
                        "\n" + blogJson.content + "",//markdown,//+ "\r\n" + $("#append-test").text(),//注释掉，就不访问数据库内容，用页面自己的md
                    //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                    htmlDecode: "style,script,iframe",  // you can filter tags decode
                    //toc             : false,
                    tocm: true,    // Using [TOCM]
                    //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                    //gfm             : false,
                    //tocDropdown     : true,
                    // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                    emoji: true,
                    taskList: true,
                    tex: true,  // 默认不解析
                    flowChart: true,  // 默认不解析
                    sequenceDiagram: true,  // 默认不解析
                });

                //console.log("返回一个 jQuery 实例 =>", testEditormdView);

                // 获取Markdown源码
                //console.log(testEditormdView.getMarkdown());

                //alert(testEditormdView.getMarkdown());
            });
        /*
                testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                    htmlDecode: "style,script,iframe",  // you can filter tags decode
                    emoji: true,
                    taskList: true,
                    tex: true,  // 默认不解析
                    flowChart: true,  // 默认不解析
                    sequenceDiagram: true,  // 默认不解析
                });*/
    });
</script>


<%--<input id="Button1" type="button" value="Hit Me" οnclick="showData()"/>--%>


</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>