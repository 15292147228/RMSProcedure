<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-24
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuRepertoryF" <%--enctype="multipart/form-data"--%> method="post">
    <input id="idRepY"  name="id1" class="easyui-validatebox" hidden="hidden"/>
    选择药品：<input name="drugId1" id="drugV"/><br/>
    存量:<input id="saveNum1" name="saveNum1" class="easyui-validatebox"/><br/>
    选择仓库：<input name="wareId1" id="wareV"/><br/>
    药品编码：<input id="drugCode1" name="drugCode1" class="easyui-validatebox"/><br/>
    最大存量：<input id="allSave1" name="allSave1" class="easyui-validatebox"/><br/>
    <a id="xiuButRepertory"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#drugV").combobox({
            url:'queAllDrug.action',
            valueField:'id',
            textField:'drugNames',
            editable:false
        });
        $("#wareV").combobox({
            url:'queAllWareHouse.action',
            valueField:'id',
            textField:'wareName',
            editable:false
        });
        //当前的选中的行记录 获取ID
        var selrows = $("#RepertoryTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueRepertory.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#idRepY").val(data.id);
                $("#drugV").combobox('select',data.drugId);
               /* $("#wareDate1").datebox('setValue',data.wareDate);*/
                $("#wareV").combobox('select',data.wareId);
                $("#saveNum1").val(data.saveNum);
                $("#drugCode1").val(data.drugCode);
                $("#allSave1").val(data.allSave);
            }
        });

        $("#xiuButRepertory").click(function () {
            $('#xiuRepertoryF').form('submit', {
                url:"xiuRepertory.action",
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
                    $("#RepertoryXiuWin").window("close");

                    if(data=="修改成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'wareName':$("#wareName").val(),'drugNames':$("#dnsW").val(),'wareDate':$("#wareDate3").val(),'drugCode':$("#drugCode3").val()};
                        $('#RepertoryTab').datagrid('load',menu);
                    }else {
                        $.messager.show({
                            msg: "修改失败!",
                            title: '消息将在5秒后关闭..',
                            timeout: 5000,
                            showType: 'slide'
                        });
                    }
                }
            });
        });
    });
</script>
</body>
</html>
