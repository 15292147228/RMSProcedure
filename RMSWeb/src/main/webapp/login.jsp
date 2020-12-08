<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-15
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
    <style type="text/css">
        *{margin: 0px;padding: 0px}
        #beijing{background-image: url("img/loginBack.jpg");
            height: 600px;
            width: 1200px;
            position: absolute;
            left: 80px;}
        a{text-decoration: none;}
        #denglu{position: absolute;bottom: 200px;left: 86px;opacity:0.7; }
        table tr td{text-align: center;height: 50px;}
        #dd{text-align: left;}
        #login{border: none;border-radius: 5px;}
        #users{position: relative;top: 11px;left: 7px;}
        #pwd{position: relative;top: 11px;left: 7px;}
        #eye{
            position: relative;
            left: 150px;
            top: 113px;
        }
        .ipt{
            /*border-radius: 15px;*/
            border-color: deepskyblue;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
</head>
<body>
<div id="beijing">
    <div id="denglu">

        <table bgcolor="white"
               style="border-radius: 5px">

            <tr><td style="border-bottom:1px solid lightgray;" id="dd">
                <font size="4" color="#1e90ff">系统登陆</font>
                <img src="img/password_eye.gif" id="eye"/></td></tr>

            <tr><td><img src="img/username.png" height="31px" width="70px" id="users"/>
                <input id="accNum" class="ipt" type="text" placeholder="请输入账号..." style="height: 30px; width:180px"/></td></tr>

            <tr><td><img src="img/password.gif" height="30px" width="70px" id="pwd">
                <input id="password" class="ipt" type="password" placeholder="请输入密码..." maxlength="16" style="height: 30px; width:180px;"/></td></tr>

            <tr><td>
                <input type="button" id="login" value="登陆" style="width: 200px;height: 30px;
                background-color: dodgerblue"/>
            </td></tr>
            <tr><td>
                <a href="#"><font size="1" color="#1e90ff">注册用户</font></a>&nbsp;&nbsp;&nbsp;
                <a href="#"><font size="1" color="#1e90ff">忘记密码?</font></a>
            </td></tr>
        </table>
    </div>
</div>
    <script type="text/javascript">
        $("#login").click(function () {
            $.ajax({
                type:'get',
                url:'empLogin.action',
                data:{'acc':$("#accNum").val(),'pwd':$("#password").val()},
                dataType:'text',
                success:function (data) {
                   if(data=="1") {
                       location.href = "index.jsp";
                   }else {
                       alert(data);
                   }
                },
                error:function (data) {
                    alert(data);
                }
            });
        });
    </script>
</body>
</html>
