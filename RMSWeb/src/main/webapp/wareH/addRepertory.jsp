<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-24
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addRepertoryF" enctype="multipart/form-data" method="post">
    选择药品：<input name="drugId" id="drugS"/><br/>
    入库日期：<input  name="wareDate" data-options="editable:true" class="easyui-datetimebox"/><br/><br/>
    存量:<input  name="saveNum" class="easyui-validatebox" data-options="required:true"/><br/><br/>
    选择仓库：<input name="wareId" id="wareS"/><br/><br/>
    药品编码：<input  name="drugCode" class="easyui-validatebox"/><br/><br/>
    最大存量：<input  name="allSave" class="easyui-validatebox" data-options="required:true"/><br/>
    <a id="addButRepertory"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#drugS").combobox({
            url:'queAllDrug.action',
            valueField:'id',
            textField:'drugNames',
            required:true,
            editable:false
        });
        $("#wareS").combobox({
            url:'queAllWareHouse.action',
            valueField:'id',
            textField:'wareName',
            required:true,
            editable:false
        });
        $("#addButRepertory").click(function () {
            $('#addRepertoryF').form('submit', {
                url:"addRepertory.action",
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
                    $("#RepertoryAddWin").window("close");
                    if(data=="添加成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'wareName':$("#wareName").val(),'drugNames':$("#dnsW").val(),'wareDate':$("#wareDate3").val(),'drugCode':$("#drugCode3").val()};
                        $('#RepertoryTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
