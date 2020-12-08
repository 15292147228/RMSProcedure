<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-27
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="auditF" method="post">
    <input id="idC" name="id2" hidden="hidden"/>
<input name="roleId2" hidden="hidden" value="${sessionScope.id}"/>
状态：<input id="stateD" name="state2"/>
<a id="isAudit"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-search'">审核</a>
</form>
<script type="text/javascript">
    $("#stateD").combobox({
        url:'jinHuo/instJson.json',
        valueField:'state',
        textField:'text',
        editable:false
    });
    $("#isAudit").click(function () {
        var selrows = $("#inStorageT").datagrid('getSelections');
        var id=selrows[0].id;
        $("#idC").val(id);
        $('#auditF').form('submit', {
            url:"xiuInStorage.action",
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
                $("#ruKuXiu").window("close");
                    //刷新后台表格数据 创建数组->json格式
                    var rep={'wareDate':$("#wareDateA").val(),'state':$("#stateC").val()};
                    $('#inStorageT').datagrid('load',rep);
                $('#inStorageDetailT').datagrid({
                    url:"queryByRepIdINSD.action",
                    queryParams: {
                        id:-1
                    }
                });
            },error:function () {
                $.messager.show({
                    msg:"修改失败!",
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
