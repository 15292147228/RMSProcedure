<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addDrugF" method="post">
    药品名：<input name="drugNames" data-options="required:true" class="easyui-validatebox"/><br/>
    进货价:<input name="purcost"  class="easyui-numberbox"  data-options="min:0,precision:2"/><br/>
    销售价:<input name="sellPrince" class="easyui-numberbox" data-options="min:0,precision:2"/><br/>
    药品成分：<input name="ingredient" data-options="required:true" class="easyui-validatebox"/><br/>
    药品规格：<input name="specification" data-options="required:true"  class="easyui-validatebox"/><br/>
    药品产地:<input name="place" data-options="required:true" class="easyui-validatebox"/><br/>
    批号:<input name="batchNum" data-options="required:true,validType:'length[6,20]'" class="easyui-validatebox"/><br/>
    备注:<input name="remark" class="easyui-validatebox"/><br/>
    生产日期:<input name="producedDate" data-options="required:true,showSeconds:false" class="easyui-datetimebox"/><br/>
    有效期:<input name="expirationDate" data-options="required:true,showSeconds:false" class="easyui-datetimebox"/><br/>
    说明书:<input name="packageInsert" class="easyui-validatebox"/><br/>
    <a id="addButDrug"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#addButDrug").click(function () {
            $('#addDrugF').form('submit', {
                url:"addDrug.action",
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
                    $("#DrugAddWin").window("close");
                    if(data=="添加成功") {
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
