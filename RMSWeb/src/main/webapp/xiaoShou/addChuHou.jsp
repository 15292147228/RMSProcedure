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
<form id="addOFDetailF" enctype="multipart/form-data" method="post">
    <input name="oformId" id="oformIS" hidden="hidden"/>
    <input name="reperId" id="reperIS"  hidden="hidden"/>
    出货数量：<input id="countS" name="count" class="easyui-numberspinner" style="width:80px;"
                required="required"><br/>
    备注：<input  name="remark" class="easyui-validatebox"/><br/>

    <a id="addButOFDetail"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加到申请单</a>
</form>
<script type="text/javascript">
   $("#countS").numberspinner({min:1,onChange:function (newValue,oldValue){
       if(newValue>$("#isSum").val()){
           $("#countS").numberspinner({value:$("#isSum").val()});
         }
           if(oldValue>$("#isSum").val()){
               $("#countS").numberspinner({value:$("#isSum").val()});
           }
   }});
    $("#addButOFDetail").click(function () {
        $("#reperIS").val($("#isReid").val());
        $("#oformIS").val($("#isFid").val());
        $('#addOFDetailF').form('submit',{
            url:"addOfDetail.action",
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
                $("#OfDetailAddWin").window("close");
                    //刷新后台表格数据 创建数组->json格式
                $('#OFormDetailT').datagrid({
                    url:"queryByRepIdOFD.action",
                    queryParams: {
                        id:$("#isFid").val()
                    }
                });
            },error:function () {
                $.messager.show({
                    title:"入单失败！",
                    msg:'消息将在5秒后关闭..',
                    timeout:5000,
                    showType:'slide'
                });
            }
        });
    });
</script>
</body>
</html>
