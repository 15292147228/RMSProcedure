<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addUserF" method="post">
    客户公司名称：<input  name="company" class="easyui-validatebox"/><br/>
    客户姓名:<input  name="userName" class="easyui-validatebox"/><br/>
    职务:<input  name="duty" class="easyui-validatebox"/><br/>
    客户公司地址：<input  name="companySite" class="easyui-validatebox"/><br/>
    联系电话：<input  name="userPhone" class="easyui-validatebox"/><br/>
    银行账号:<input  name="bankAccount" class="easyui-validatebox"/><br/>
    信誉度:<input  name="xinYu" class="easyui-validatebox"/><br/>
    送货地址:<input  name="destination" class="easyui-validatebox"/><br/>
    <a id="addButUser"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#addButUser").click(function () {
            $('#addUserF').form('submit', {
                url:"addUser.action",
                onSubmit: function(){
                    //如果正确 返回true  往后台提交
                    //不过有错误 返回false  提交终止
                    return $(this).form("validate");
                },

                success:function(data) {
                    $.messager.show({
                        msg:data,
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                    //关闭添加窗口
                    $("#UserAddWin").window("close");
                    if(data=="添加成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'userName':$("#userNameS").val(),'company':$("#companyS").val(),'xinYu':$("#xinYuS").val()};
                        $('#UserTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
