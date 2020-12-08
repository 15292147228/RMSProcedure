<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-24
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addSDrugF" enctype="multipart/form-data" method="post">
    选择药品：<input name="drugId" id="drugs"/>
    选择供货商：<input name="supId" id="sups"/>
    库存数量：<input  name="num" class="easyui-validatebox"/><br/>
    药品售价：<input  name="combPrice" class="easyui-validatebox"/><br/>
    <a id="addButSDrug"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#drugs").combobox({
            url:'queAllDrug.action',
            valueField:'id',
            textField:'drugNames'
        });
        $("#sups").combobox({
            url:'queAllSupplier.action',
            valueField:'id',
            textField:'supName'
        });
        $("#addButSDrug").click(function () {
            $('#addSDrugF').form('submit', {
                url:"addSDrug.action",
                onSubmit: function(){
                    //如果正确 返回true  往后台提交
                    //不过有错误 返回false  提交终止
                    return $(this).form("validate");
                },

                success:function(data) {
                    $.messager.show({
                        title:data,
                        msg:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                    //关闭添加窗口
                    $("#SDrugAddWin").window("close");
                    if(data=="添加成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'supName':$("#supNameS").val(),'drugNames':$("#drugNameS").val()};
                        $('#SDrugTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
