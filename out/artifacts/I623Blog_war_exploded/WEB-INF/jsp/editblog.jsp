<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="zh">
<head Set-Cookie: widget_session=abc123; SameSite=None; Secure>
    <meta charset="utf-8"/>
    <title>修改我的文本</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon">
</head>

<body>
<a href="${pageContext.request.contextPath }/blog/tryToMain"> 返回主页</a>
<form name="blogEditForm">
        <div  style="color: sienna; margin-left: 150px ;text-align: left" >
            <label for="title">标题:</label>
            <input type="text" name="title" value="${blog.title}"/>
            <input type="text" name="id" value="${blog.id}" readonly="readonly" />
            <label for="author">作者:</label>
            <input type="text" name="author" value="${blog.author}"/>
        </div>
         <div id="contentMd" autofocus="autofocus">
            <textarea name="content" id="content" style="display:none;" charset=UTF-8>${blog.content}</textarea>
         </div>
</form>

<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/editormd.min.js"></script>

<script type="text/javascript">
    var blogEditor;
    $(function () {
        blogEditor = editormd("contentMd", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${pageContext.request.contextPath }/js/lib/",
            toolbarIcons: function () {
                return ["undo","hr", "watch", "fullscreen", "preview", "|",
                    "bold", "italic", "ucwords", "uppercase", "lowercase", "|",
                    "h1", "h2", "h3", "h4", "h5", "h6", "|",
                    "list-ul", "list-ol",  "datetime",  "submitMd", "index"]
            },

            /*自定义功能一个是发布，一个是list*/
            toolbarIconTexts: {
                submitMd: "<span>提交</span>",
                index: "<span>列表</span>",
            },

            /*给自定义按钮指定回调函数*/
            toolbarHandlers: {
                submitMd: function (cm, icon, cursor, selection) {
                    contentCommit();
                    console.log("日志输出 testIcon =>", this, cm, icon, cursor, selection);
                },
                index: function () {
                    window.location.href = '${pageContext.request.contextPath }/blog/findlist';
                },
            }
            });
        });
        function contentCommit() {
            blogEditForm.method = "post";
            blogEditForm.action = "${pageContext.request.contextPath}/blog/edit";
            blogEditForm.submit();
        }
</script>
</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>