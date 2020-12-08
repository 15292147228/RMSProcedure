<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-25
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuRDetailF" method="post">
    <input name="id1" id="id1" hidden="hidden"/>
    <input name="supId1" id="supId1" hidden="hidden"/>
    进货数量：<input name="repQuantity1" id="repQuantity1" class="easyui-numberspinner" style="width:80px;"
                required="required"><br/>
    备注：<input  name="remark1" id="remark1" class="easyui-validatebox"/><br/>

    <a id="xiuButRDetail"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</form>
<script type="text/javascript">
    $("#repQuantity1").numberspinner({min:1,onChange:function (newValue,oldValue){
            if(newValue>$("#isNum").val()){
                $("#repQuantity1").numberspinner({value:$("#isNum").val()});
            }
            if(oldValue>$("#isNum").val()){
                $("#repQuantity1").numberspinner({value:$("#isNum").val()});
            }
        }});
    //当前的选中的行记录 获取ID
    var selrows = $("#repDetailT").datagrid('getSelections');
    var id=selrows[0].id;
    //根据ID获取数据
    $.ajax({
        type:'get',
        url:'xiuBeforeQueReplenishDetail.action',
        data:{'id':id},
        dataType:'json',
        success:function (data) {
            $("#id1").val(data.id);
            $("#supId1").val(data.supId);
            $("#repQuantity1").numberspinner('setValue',data.repQuantity);
            $("#remark1").val(data.remark);
        }
    });

    $("#xiuButRDetail").click(function () {
        $('#xiuRDetailF').form('submit',{
            url:"xiuReplenishDetail.action",
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
                $("#repDetailXiuWin").window("close");
                //刷新后台表格数据 创建数组->json格式
                $('#repDetailT').datagrid({
                    url:"queryByRepIdRD.action",
                    queryParams: {
                        id:$("#isRid").val()
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
