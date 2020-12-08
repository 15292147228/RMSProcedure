<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-23
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuWareHouseF" <%--enctype="multipart/form-data"--%> method="post">
    <input id="idWHouse"  name="id1" class="easyui-validatebox" hidden="hidden"/>
    仓库名：<input name="wareName1" id="wareName1"   class="easyui-validatebox"/><br/><br/>
    仓库地址：<input name="wareAddress1" id="wareAddress" class="easyui-validatebox"/><br/><br/>
    储量状态：<input name="saveState1" id="saveState" /><br/><br/>
    <a id="xiuButWareHouse"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#saveState").combobox({
            url:'wareH/wh.json',
            valueField:'saveState',
            textField:'state',
            editable:false
        });
        //当前的选中的行记录 获取ID
        var selrows = $("#WareHouseTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueWareHouse.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
            $("#idWHouse").val(data.id);
            $("#wareName1").val(data.wareName);
            $("#wareAddress").val(data.wareAddress);
            $("#saveState").combobox('select',data.saveState);
            }
        });

        $("#xiuButWareHouse").click(function () {
            $('#xiuWareHouseF').form('submit', {
                url:"xiuWareHouse.action",
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
                    $("#WareHouseXiuWin").window("close");

                    if(data=="修改成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'wareName':$("#wareN").val(),'wareAddress':$("#wareA").val(),'saveState':$("#saveS").val()};
                        $('#WareHouseTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
