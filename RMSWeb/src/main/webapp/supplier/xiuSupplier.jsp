<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-23
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="xiuSupplierF" method="post">
    <input id="idSupL"  name="id1" class="easyui-validatebox" hidden="hidden"/><br/><br/>
    供货商名：<input id="supName"  name="supName1"  class="easyui-validatebox"/><br/><br/>
    所在地区：<input id="location" name="location1"  class="easyui-validatebox"/><br/><br/>
    联系电话：<input id="suPhone"  name="suPhone1"  class="easyui-validatebox"/><br/><br/>
    备注：<input id="remarkS" name="remark1"  class="easyui-validatebox"/><br/>
    <a id="xiuButSupplier"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">修改</a>
</form>

<script type="text/javascript">
    $(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#SupplierTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeQueSupplier.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#idSupL").val(data.id);
                $("#supName").val(data.supName);
                $("#location").val(data.location);
                $("#suPhone").val(data.suPhone);
                $("#remarkS").val(data.remark);
            }
        });

        $("#xiuButSupplier").click(function () {
            $('#xiuSupplierF').form('submit', {
                url:"xiuSupplier.action",
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
                    $("#SupplierXiuWin").window("close");

                    if(data=="修改成功") {
                        //刷新后台表格数据 创建数组->json格式
                        var menu={'supName':$("#supNames").val(),'location':$("#locations").val(),'suPhone':$("#suPhones").val(),'remark':$("#remarks").val()};
                        $('#SupplierTab').datagrid('load',menu);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
