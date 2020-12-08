<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-21
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addEmpF" enctype="multipart/form-data" method="post">
    账号：<input  name="accNum" data-options="required:true,validType:'length[4,20]'" class="easyui-validatebox"/><br/>
    密码：<input  name="pwd" type="password" data-options="required:true,validType:'length[6,18]'" class="easyui-validatebox"/><br/>
    员工名称：<input  name="empName" data-options="required:true" class="easyui-validatebox"/><br/>
    员工性别：男<input class="easyui-radiobutton" data-options="checked:true" name="empSex" value="男">&nbsp;&nbsp;女<input class="easyui-radiobutton" name="empSex" value="女"><br/>
    入职日期：<input  name="empBirthday" data-options="editable:false" class="easyui-datebox"/><br/>
    <%--<input  name="empImage" class="easyui-filebox"/>--%><input  name="empImage" value="null" hidden="hidden"/>
    部门:<input  name="department"  id="departSel"/><br/>
    身份证:<input  name="idCard" data-options="required:true,validType:'length[18,20]'" class="easyui-validatebox"/><br/>
    学历：<input  name="eduback" id="eduSel"/><br/>
    联系电话：<input  name="empPhone" data-options="required:true,validType:'length[6,18]'" class="easyui-validatebox"/><br/>
   选择角色：<input name="roleId" id="roles"/><br/>
    <a id="addButEmp"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#roles").combobox({
            url:'queAllRole.action',
            valueField:'id',
            textField:'rname',
            editable:false
        });
        $("#departSel").combobox({
            url:'employee/departSelect.json',
            valueField:'value',
            textField:'depart'
        });
        $("#eduSel").combobox({
            url:'employee/eduSelect.json',
            valueField:'val',
            textField:'edu'
        });
        $("#addButEmp").click(function () {
            $('#addEmpF').form('submit', {
                url:"addEmployee.action",
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
                    $("#EmpAddWin").window("close");
                    if(data=="添加成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'empName':$("#empNames").val(),'department':$("#departments").val(),'eduback':$("#edubacks").val()};
                        $('#EmpTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
