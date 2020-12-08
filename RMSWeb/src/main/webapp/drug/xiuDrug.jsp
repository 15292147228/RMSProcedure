<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuDrugF" method="post">
    <input id="idDrug"  name="id1" class="easyui-validatebox" hidden="hidden"/><br/>
    药品名：<input id="drugNames"  name="drugNames1" class="easyui-validatebox"/><br/>
    进货价:<input id="purcost" name="purcost1" class="easyui-numberbox"  data-options="min:0,precision:2"/><br/>
    销售价:<input id="sellPrince" name="sellPrince1" class="easyui-numberbox"  data-options="min:0,precision:2"/><br/>
    药品成分：<input id="ingredient" name="ingredient1"  class="easyui-validatebox"/><br/>
    药品规格：<input id="specification" name="specification1" class="easyui-validatebox"/><br/>
    药品产地:<input id="place" name="place1" class="easyui-validatebox"/><br/>
    批号:<input id="batchNum" name="batchNum1" class="easyui-validatebox"/><br/>
    备注:<input id="remark" name="remark1" class="easyui-validatebox"/><br/>
    生产日期:<input id="producedDate" name="producedDate1" class="easyui-datetimebox"/><br/>
    有效期:<input id="expirationDate" name="expirationDate1" class="easyui-datetimebox"/><br/>
    说明书:<input id="packageInsert" name="packageInsert1" class="easyui-validatebox"/><br/>
    <a id="xiuButDrug"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#DrugTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueDrug.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#idDrug").val(data.id);
                $("#drugNames").val(data.drugNames);
                $("#purcost").numberbox('setValue',data.purcost);
                $("#sellPrince").numberbox('setValue',data.sellPrince);
                $("#ingredient").val(data.ingredient);
                $("#specification").val(data.specification);
                $("#place").val(data.place);
                $("#batchNum").val(data.batchNum);
                $("#remark").val(data.remark);
                $("#producedDate").datetimebox('setValue',data.producedDate);
                $("#expirationDate").datetimebox('setValue',data.expirationDate);
                $("#packageInsert").val(data.packageInsert);
            }
        });

        $("#xiuButDrug").click(function () {
            $('#xiuDrugF').form('submit', {
                url:"xiuDrug.action",
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
                    $("#DrugXiuWin").window("close");

                    if(data=="修改成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'drugNames':$("#drugNameS").val(),'purcost':$("#purcostS").val(),'sellPrince':$("#sellPrinceS").val()};
                        $('#DrugTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
