<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-27
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="ruKuSF" method="post">
    <input id="idInSD" name="idE" hidden="hidden"/>
    仓库：<input id="wareIdE" name="wareId3"/>
    <a id="isRuKuBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">入库</a>
</form>
<script type="text/javascript">
    $("#wareIdE").combobox({
        url:'queAllWareHouse.action',
        valueField:'id',
        textField:'wareName',
        editable:false
    });
    $("#isRuKuBut").click(function () {
        var selrows = $("#inStorageDetailT").datagrid('getSelections');
        var id=selrows[0].id;
        $("#idInSD").val(id);
        $('#ruKuSF').form('submit', {
            url:"xiuInStorageDetail.action",
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
                $("#ruKuDetailXiu").window("close");
                //刷新后台表格数据 创建数组->json格式
                var rep={'id':$("#ckId").val()};
                $('#inStorageDetailT').datagrid('load',rep);

            },error:function () {
                $.messager.show({
                    msg:"修改失败！",
                    title:'消息将在5秒后关闭..',
                    timeout:5000,
                    showType:'slide'
                });
            }
        });
    });
</script>
</body>
</html>
