<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-25
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addRDetailF" enctype="multipart/form-data" method="post">
    <input name="repId" id="repIS" hidden="hidden"/>
    <input name="supId" id="supIS"  hidden="hidden"/>
    进货数量：<input id="numS" name="repQuantity" class="easyui-numberspinner" style="width:80px;"
                required="required"><br/>
    备注：<input  name="remark" class="easyui-validatebox"/><br/>

    <a id="addButRDetail"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加到申请单</a>
</form>
<script type="text/javascript">
   $("#supIS").val($("#isHid").val());
   $("#repIS").val($("#isRid").val());
   $("#numS").numberspinner({min:1,onChange:function (newValue,oldValue){
       if(newValue>$("#isNum").val()){
           $("#numS").numberspinner({value:$("#isNum").val()});
         }
           if(oldValue>$("#isNum").val()){
               $("#numS").numberspinner({value:$("#isNum").val()});
           }
   }});
    $("#addButRDetail").click(function () {
        $('#addRDetailF').form('submit',{
            url:"addReplenishDetail.action",
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
                $("#repDetailAddWin").window("close");
                    //刷新后台表格数据 创建数组->json格式
                $('#repDetailT').datagrid({
                    url:"queryByRepIdRD.action",
                    queryParams: {
                        id:$("#isRid").val()
                    }
                });
            },error:function () {
                $.messager.show({
                    msg:"入单失败!",
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
