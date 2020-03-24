<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>i623blog在此</title>
</head>
<body>
<%--加${pageContext.request.contextPath }开头，网页智能补全上下文，如本地，f12看到html代码是/user开头
，服务器看到html变成了/项目名/user开头，才请求到了正确的资源，/user前面本地接本地服务器，但tomcat默认接服务器/项目名
--%>
<a href="${pageContext.request.contextPath }/user/register"> 注册</a>
<br/>
<a href="${pageContext.request.contextPath }/user/login"> 登录</a>
</body>
</html>

<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
hello，世界
&lt;%&ndash;未注册的用户，请<a href="${pageContext.request.contextPath }/register"> 注册</a>！&ndash;%&gt;
&lt;%&ndash;<br/>&ndash;%&gt;
&lt;%&ndash;已注册的用户，去<a href="${pageContext.request.contextPath }/login"> 登录</a>！&ndash;%&gt;
</body>
</html>--%>
