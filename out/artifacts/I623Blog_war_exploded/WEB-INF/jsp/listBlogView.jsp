<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

        body {
            background-color: #d0e4fe;
        }

        label {
            font-family: "Times New Roman";
            font-size: 20px;
        }
        div{

            font-family: "Times New Roman";
            font-size: 22px;
            text-align:left;
            padding: 40px
        }

    </style>
</head>
<a href="${pageContext.request.contextPath }/blog/tryToMain"> 返回主页<a />
<c:forEach items="${listBlogs}" var="blog">
    <div id="layout">
        <div class="fa-align-center">
          <%--  <label for="title">标题:</label>
            <input id="title" type="text" value="${blog.title}" readonly/>

            <label for="author">作者:</label>
            <input id="author" type="text" value="${blog.author}" readonly/>

            <label for="content">正文:</label>
            <textarea id="content">${blog.content}</textarea>--%>

             <p>标题:${blog.title}<br>
              <a href="${pageContext.request.contextPath }/blog/preEdit?id=${blog.id}" >编辑</a>
             <br>作者:${blog.author}<br>id:${blog.id}<br>正文:${blog.content}</p>
        </div>
    </div>
</c:forEach>
<form>

    <a href="${pageContext.request.contextPath }/blog/findlist">下一页</a>
    <a href="${pageContext.request.contextPath }/blog/findlist">上一页</a>
    当前页:
    <label for="author"></label>
    <input id="author" type="text" value="${blog.author}" readonly/>

    <label for="content">正文:</label>
    <textarea id="content">${blog.content}</textarea>--%>
</form>
    <foot>
        <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
    </foot>
</html>