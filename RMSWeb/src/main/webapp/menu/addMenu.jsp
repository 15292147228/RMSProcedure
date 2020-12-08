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
<form id="addMenuF" enctype="multipart/form-data" method="post">
    菜单项：<input id="text" name="text2" class="easyui-validatebox"/><br/>
    菜单地址：<input id="url" name="url2" class="easyui-validatebox"/><br/>
    图片：<input id="iconCls" name="iconCls2" class="easyui-validatebox"/><br/>
    状态:<input id="menuStateA" name="state2"  style="width:200px;"/><br/>
    绑定父选项列:<input id="parentIdA" name="parentid2" style="width:200px;"/><br/>
    <a id="addButMenu"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">增添</a>
</form>

<script type="text/javascript">
    $(function () {
        $("#menuStateA").combobox({
            url:'menu/package.json',
            valueField:'state',
            textField:'text',
            onSelect:function(param) {
                if (param.state=="closed"){
                    $("#parentIdA").combobox({readonly:true});
                    $("#parentIdA").combobox('setValue',0);
                }else {
                    $("#parentIdA").combobox({readonly:false});
                }
            },
            editable:false
        });
        $("#parentIdA").combobox({
            url:'allParentAuth.action',
            valueField:'id',
            textField:'text',
            editable:false
        });
        $("#addButMenu").click(function () {
            $('#addMenuF').form('submit', {
                url:"addMenu.action",
                onSubmit: function(){
                    //如果正确 返回true  往后台提交
                    //不过有错误 返回false  提交终止
                    return $(this).form("validate");
                },

                success:function(data) {
                    var das=eval('('+data+')');
                    $.messager.show({
                        msg:das.mess,
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                    //关闭添加窗口
                    $("#menuAddWin").window("close");
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
