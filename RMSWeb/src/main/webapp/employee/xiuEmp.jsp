<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-21
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuEmpF" <%--enctype="multipart/form-data"--%> method="post">
    <input id="Eid"  name="id1" class="easyui-validatebox" hidden="hidden"/><br/>
    员工名称：<input id="empName"  name="empName1" class="easyui-validatebox"/><br/>
    员工性别：男<input class="easyui-radiobutton" data-options="checked:true" name="empSex1" value="男">&nbsp;&nbsp;
    女<input class="easyui-radiobutton" name="empSex1" value="女"><br/>
   <%--<input  name="empImage1" class="easyui-filebox"/>--%><input id="empImage"  name="empImage1" value="null" hidden="hidden"/>
    部门:<input id="departmentE"  name="department1"/><br/>
    身份证:<input id="idCard" name="idCard1" class="easyui-validatebox"/><br/>
    学历：<input id="edubackE"  name="eduback1"/><br/>
    联系电话：<input id="empPhone"  name="empPhone1" class="easyui-validatebox"/><br/>
    选择角色：<input name="roleId1" id="roleS"/><br/>
    <a id="xiuButEmp"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#roleS").combobox({
            url:'queAllRole.action',
            valueField:'id',
            textField:'rname',
            editable:false
        });
        $("#departmentE").combobox({
            url:'employee/departSelect.json',
            valueField:'value',
            textField:'depart'
        });
        $("#edubackE").combobox({
            url:'employee/eduSelect.json',
            valueField:'val',
            textField:'edu'
        });
        //当前的选中的行记录 获取ID
        var selrows = $("#EmpTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueEmp.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                //Employee{id=2, accNum='dandan', pwd='333333', empName='张小三',
                // empSex='女', empBirthday=Wed Sep 30 00:00:00 CST 2020,
                // empImage='regression.jsp', department='销售', idCard='430224235654251', eduback='高中', empPhone='15333665215', roleId=3}
            $("#Eid").val(data.id);
                $("#empName").val(data.empName);
                $("#departmentE").combobox('select',data.department);
                $("#idCard").val(data.idCard);
               /* $("#empImage").val(data.empImage);*/
                $("#edubackE").combobox('select',data.eduback);
                $("#empPhone").val(data.empPhone);
                $("#roleS").combobox('select',data.roleId);
            }
        });

        $("#xiuButEmp").click(function () {
            $('#xiuEmpF').form('submit', {
                url:"xiuEmployee.action",
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
                    $("#EmpXiuWin").window("close");

                    if(data=="修改成功") {
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
