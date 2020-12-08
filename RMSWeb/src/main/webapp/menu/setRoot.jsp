<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-15
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queM">
    菜单名：<input name="text"  class="easyui-validatebox"/>&nbsp;
    菜单地址：<input name="url"  class="easyui-validatebox"/>&nbsp;&nbsp;
    <a id="menuSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="rootTool">
    <a id="menuAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="menuDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="menuXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="menuAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'menu/addMenu.jsp'">
</div>
<div id="menuXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,modal:true,href:'menu/xiuMenu.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="menuTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#menuTab').datagrid({
        url:'allAuthority.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'菜单编号',width:130},
            {field:'text',title:'菜单项',width:150},
            {field:'url',title:'菜单网址',width:300},
            {field:'iconCls',title:'菜单图片',width:160/*,formatter: function(value,row,index){
                    if (value){
                        return "<img src='"+value+"' style='height: 40px;width: 100px'/>";
                    } else {
                        return null;
                    }
                }*/
            },
            {field:'parentid',title:'父菜单编号',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#rootTool'
    });

    //进行添加菜单项
    $("#menuAdd").click(function () {
        $("#menuAddWin").window('open');
        $("#menuAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#menuXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#menuTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#menuXiuWin").window('open');
        $("#menuXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#menuDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#menuTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }

        //确认删除
        $.messager.confirm('确认对话框', '确定要删除这些记录吗？', function(r) {
            if (r) {
                //获取数据->list (json格式)
                var ids = [];
                for (var i = 0; i < selrows.length; i++) {
                    ids[i] = selrows[i].id;
                }

                var params={
                    type:'post',
                    url: "delMenu.action",
                    data:JSON.stringify(ids),
                    dataType:'json',
                    contentType:"application/json",
                    success:function (data) {
                        if (data>=1) {
                            $.messager.show({
                                title: '消息将在5秒后关闭..',
                                msg: '删除'+data+'条数据',
                                timeout: 5000,
                                showType: 'slide'
                            });
                            //刷新后台表格数据 创建数组->json格式
                            var jsonMenu = $("#queM").serializeArray();
                            var menu = {};
                            $.each(jsonMenu, function () {
                                menu[this.name] = this.value;
                            });
                            $('#menuTab').datagrid('load',menu);
                            $('#tree').tree('reload');
                        }
                    },
                    error:function (data) {
                        $.messager.show({
                            title: '消息将在5秒后关闭',
                            msg: '删除失误',
                            timeout: 5000,
                            showType: 'slide'
                        });
                    }
                };
                $.ajax(params);
            }
        });
    });

    //条件查询
    $("#menuSearch").click(function () {
        var jsonMenu = $("#queM").serializeArray();
        var menu = {};
        $.each(jsonMenu, function () {
            menu[this.name] = this.value;
        });
        $('#menuTab').datagrid('load',menu);
    });
</script>
</body>
</html>
