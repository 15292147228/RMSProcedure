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
<form id="xiuUserF" method="post">
    <input id="idUSe"  name="id1" class="easyui-validatebox" hidden="hidden"/><br/>
    客户公司名称：<input id="company"  name="company1" class="easyui-validatebox"/><br/>
    客户姓名:<input id="userName" name="userName1" class="easyui-validatebox"/><br/>
    职务:<input id="duty" name="duty1" class="easyui-validatebox"/><br/>
    客户公司地址：<input id="companySite" name="companySite1" class="easyui-validatebox"/><br/>
    联系电话：<input id="userPhone" name="userPhone1" class="easyui-validatebox"/><br/>
    银行账号:<input id="bankAccount" name="bankAccount1" class="easyui-validatebox"/><br/>
    信誉度:<input id="xinYu" name="xinYu1" class="easyui-validatebox"/><br/>
    送货地址:<input id="destination" name="destination1" class="easyui-validatebox"/><br/>
    <a id="xiuButUser"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#UserTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueUser.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#idUSe").val(data.id);
                $("#company").val(data.company);
                $("#userName").val(data.userName);
                $("#duty").val(data.duty);
                $("#companySite").val(data.companySite);
                $("#userPhone").val(data.userPhone);
                $("#bankAccount").val(data.bankAccount);
                $("#xinYu").val(data.xinYu);
                $("#destination").val(data.destination);
            }
        });

        $("#xiuButUser").click(function () {
            $('#xiuUserF').form('submit', {
                url:"xiuUser.action",
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
                    $("#UserXiuWin").window("close");

                    if(data=="修改成功") {
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
