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
<form id="addRoleF" enctype="multipart/form-data" method="post">
    角色名称：<input name="rname" data-options="required:true" class="easyui-validatebox"/><br/><br/>
    备注：<input name="remark"  class="easyui-validatebox"/><br/><br/>
    <a id="addButRole"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#addButRole").click(function () {
            $('#addRoleF').form('submit', {
                url:"addRole.action",
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
                    $("#RoleAddWin").window("close");
                    if(data=="添加成功") {
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
