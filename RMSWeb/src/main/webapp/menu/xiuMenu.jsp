<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-11
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form id="xiuMenuF" <%--enctype="multipart/form-data"--%> method="post">
        <input id="menuId" name="menuId" class="easyui-validatebox" hidden="hidden"/><br/>
        菜单项：<input id="text1" name="text1" class="easyui-validatebox"/><br/>
        菜单地址：<input id="url1" name="url1" class="easyui-validatebox"/><br/>
        图片：<input id="iconCls1" name="iconCls1" class="easyui-validatebox"/><br/>
        状态:<input id="menuStateB" name="state1"  style="width:200px;"/><br/>
        绑定父选项列:<input id="parentIdB" name="parentid1" style="width:200px;"/><br/>
        <a id="xiuButMenu"  href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-add'">修改</a>
    </form>

    <script type="text/javascript">
        $(function () {
            $("#menuStateB").combobox({
                url:'menu/package.json',
                valueField:'state',
                textField:'text',
                onSelect:function(param) {
                    if (param.state=="closed"){
                        $("#parentIdB").combobox({readonly:true});
                        $("#parentIdB").combobox('setValue',0);
                    }else {
                        $("#parentIdB").combobox({readonly:false});
                    }
                },
                editable:false
            });
            $("#parentIdB").combobox({
                url:'allParentAuth.action',
                valueField:'id',
                textField:'text',
                editable:false
            });
        //当前的选中的行记录 获取ID
        var selrows = $("#menuTab").datagrid('getSelections');
        var id=selrows[0].id;

        //根据ID获取数据
        $.ajax({
            type:'get',
            url:'xiuBeforeMenu.action',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#menuId").val(data.id);
            $("#text1").val(data.text);
                $("#url1").val(data.url);
                $("#iconCls1").val(data.iconCls);
                $("#menuStateB").combobox('select',data.state);
                $("#parentIdB").combobox('select',data.parentid);
            }
        });

        $("#xiuButMenu").click(function () {
            $('#xiuMenuF').form('submit', {
                url:"xiuMenu.action",
                onSubmit: function(){
                    //如果正确 返回true  往后台提交
                    //不过有错误 返回false  提交终止
                    return $(this).form("validate");
                },

                success:function(data) {
                    var das=eval('('+data+')');
                    $.messager.show({
                        title:das.mess,
                        msg:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                    //关闭添加窗口
                    $("#menuXiuWin").window("close");

                    if(das.code==1) {
                        //刷新后台表格数据 创建数组->json格式
                        var jsonMenu = $("#queM").serializeArray();
                        var menu = {};
                        $.each(jsonMenu, function () {
                            menu[this.name] = this.value;
                        });
                        $('#menuTab').datagrid('load', menu);
                        $('#tree').tree('reload');
                    }
                }
                });
        });
        });
    </script>
</body>
</html>
