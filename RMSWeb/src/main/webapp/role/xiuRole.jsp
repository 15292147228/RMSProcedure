<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuRoleF" <%--enctype="multipart/form-data"--%> method="post">
    <input id="Rid"  name="id1" class="easyui-validatebox" hidden="hidden"/>
    角色名称：<input id="rname" name="rname1"  class="easyui-validatebox"/><br/><br/>
    备注：<input id="remark" name="remark1" class="easyui-validatebox"/><br/><br/>
    <a id="xiuButRole"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#RoleTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueRole.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#Rid").val(data.id);
                //刷新后台表格数据 创建数组->json格式
                $("#rname").val(data.rname);
                $("#remark").val(data.remark);
            }
        });

        $("#xiuButRole").click(function () {
            $('#xiuRoleF').form('submit', {
                url:"xiuRole.action",
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
                    $("#RoleXiuWin").window("close");

                    if(data=="修改成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'rname':$("#rnames").val(),'remark':$("#remarks").val()};
                        $('#RoleTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
