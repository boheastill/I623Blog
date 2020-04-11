<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用账号登录</title>
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
<form action="${pageContext.request.contextPath }/user/login" method="post">
    <table style="color: sienna; margin-left: 150px ;text-align: left">

        <tr>
            <td  style="color: orange;" >
                ${messageError}
            </td>
        </tr>
        <tr>
            <td>用户：</td>
            <td>
                <input type="text" name="name" class="textSize" value="${user.name}">
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <input type="password" name="password" class="textsize">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="image" value="提交" onclick="gogo()">
                <input type="image" value="取消" onclick="cancel()">
            </td>
        </tr>
    </table>

</form>
</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>