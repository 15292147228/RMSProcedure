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
<form id="xiuOFDetailF" method="post">
    <input name="idH" id="idH" hidden="hidden"/>
    <input name="perIdH" id="perIdH" hidden="hidden"/>
    进货数量：<input name="countH" id="countH" class="easyui-numberspinner" style="width:80px;"
                required="required"><br/>
    备注：<input  name="remarkH" id="remarkH" class="easyui-validatebox"/><br/>

    <a id="xiuButOFDetail"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</form>
<script type="text/javascript">
    $("#countH").numberspinner({min:1,onChange:function (newValue,oldValue){
            if(newValue>$("#isNum").val()){
                $("#countH").numberspinner({value:$("#isNum").val()});
            }
            if(oldValue>$("#isNum").val()){
                $("#countH").numberspinner({value:$("#isNum").val()});
            }
        }});
    //当前的选中的行记录 获取ID
    var selrows = $("#OFormDetailT").datagrid('getSelections');
    var id=selrows[0].id;
    //根据ID获取数据
    $.ajax({
        type:'get',
        url:'xiuBeforeQueOfDetail.action',
        data:{'id':id},
        dataType:'json',
        success:function (data) {
            $("#idH").val(data.id);
            $("#perIdH").val(data.reperId);
            $("#countH").numberspinner('setValue',data.count);
            $("#remarkH").val(data.remark);
        }
    });

    $("#xiuButOFDetail").click(function () {
        $('#xiuOFDetailF').form('submit',{
            url:"xiuOfDetail.action",
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
                $("#OfDetailXiuWin").window("close");
                //刷新后台表格数据 创建数组->json格式
                $('#OFormDetailT').datagrid({
                    url:"queryByRepIdOFD.action",
                    queryParams: {
                        id:$("#isFid").val()
                    }
                });
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
