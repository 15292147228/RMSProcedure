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
<form id="xiuSDrugF" <%--enctype="multipart/form-data"--%> method="post">
    <input id="idSDrugA"  name="id1" class="easyui-validatebox" hidden="hidden"/><br/>
    选择药品：<input name="drugId1" id="drug1"/>
    选择供货商：<input name="supId1" id="sup1"/>
    库存数量：<input  name="num1" id="num1" class="easyui-validatebox"/><br/>
    药品售价：<input  name="combPrice1" id="combPrice1" class="easyui-validatebox"/><br/>
    <a id="xiuButSDrug"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#drug1").combobox({
            url:'queAllDrug.action',
            valueField:'id',
            textField:'drugNames'
        });
        $("#sup1").combobox({
            url:'queAllSupplier.action',
            valueField:'id',
            textField:'supName'
        });
        //当前的选中的行记录 获取ID
        var selrows = $("#SDrugTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueSDrug.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#idSDrugA").val(data.id);
                $("#drug1").combobox('select',data.drugId);
                $("#sup1").combobox('select',data.supId);
                $("#drugId1").val(data.drugId);
                $("#supId1").val(data.supId);
                $("#num1").val(data.num);
                $("#combPrice1").val(data.combPrice);
            }
        });

        $("#xiuButSDrug").click(function () {
            $('#xiuSDrugF').form('submit', {
                url:"xiuSDrug.action",
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
                    $("#SDrugXiuWin").window("close");

                    if(data=="修改成功") {
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
