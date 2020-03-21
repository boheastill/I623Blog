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

    </style>
</head>
${listBlogs}
<c:forEach items="${listBlogs}" var="blog">
    <div id="layout">
        <div class="fa-align-center">
            <label for="title">标题:</label>
            <input id="title" type="text" value="${blog}" readonly/>

            <label for="author">作者:</label>
            <input id="author" type="text" value="${blog.author}" readonly/>

            <label for="content">正文:</label>
            <textarea id="content">${blog.content}</textarea>
        </div>
    </div>
</c:forEach>

<c:forEach var="i" begin="1" end="5">
Item <c:out value="${i}"/>
    </c:forEach>

    </body>
</html>