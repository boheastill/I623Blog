<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="zh">
<head Set-Cookie: widget_session=abc123; SameSite=None; Secure>

    <meta charset="utf-8"/>
    <title>编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon">
</head>
<body>
<a href="${pageContext.request.contextPath }/blog/tryToMain"> 返回主页</a>

<!--在外层定义一个form，用来取值和提交表单-->
<form name="blogEditForm">
    标题: <input type="text" name="title" value="${blog.title}"/><br/>
    作者: <input type="text" name="author" value="${blog.author}"/><br/>
    <%--    E-mail: <input type="email" name="email" autocomplete="off" /><br />--%>
    <%--    <input type="submit" />--%>
    <div id="test-editormd" autofocus="autofocus">
        <!--该区域内容为md文本内容，非html内容-->
        <textarea name="content" id="content" style="display:none;" charset=UTF-8>${blog.content}</textarea>
    </div>

</form>
</body>

<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>