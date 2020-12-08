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
<form id="addWareHouseF" enctype="multipart/form-data" method="post">
    仓库名：<input name="wareName"  class="easyui-validatebox" data-options="required:true"/><br/><br/>
    仓库地址：<input name="wareAddress"   class="easyui-validatebox" data-options="required:true"/><br/><br/>
    储量状态：<input id="state" name="saveState" /><br/><br/>
    <a id="addButWareHouse"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#state").combobox({
            url:'wareH/wh.json',
            valueField:'saveState',
            textField:'state',
            editable:false
        });
        $("#addButWareHouse").click(function () {
            $('#addWareHouseF').form('submit', {
                url:"addWareHouse.action",
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
                    $("#WareHouseAddWin").window("close");
                    if(data=="添加成功") {
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
