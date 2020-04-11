<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>创建一个账号</title>
    <style>
        body {
            background-color: #d0e4fe;
            padding: 20px
        }

        label {
            font-family: "Times New Roman";
            font-size: 22px;
            text-align: left;
        }

        input {
            font-family: "Times New Roman";
            font-size: 18px;
            text-align: left; margin-bottom: 10px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath }/user/register" method="post" name="registForm" >
    <table border=1 bgcolor="lightblue" align="center" style="color: sienna; margin-left: 150px ;text-align: left">
        <tr>
            <td>用户：</td>
            <td>
                <input class="textSize" type="text" name="name" value="${name}"/>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <input class="textSize" type="password" maxlength="20" name="password"/>
            </td>
        </tr>
        <tr>
            <td>口令（预计4月可获取）：</td>
            <td>
                <input class="textSize" type="text" maxlength="20" name="command"/>
            </td>
        </tr>
<%--        <tr>--%>
<%--            <td>@mail：</td>--%>
<%--            <td>--%>
<%--                <input class="textSize" type="password" maxlength="20" name="rePassWord"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="注册" onclick="document.forms['registForm'].submit();"/>
            </td>
        </tr>
        </table>
</form>
</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>
