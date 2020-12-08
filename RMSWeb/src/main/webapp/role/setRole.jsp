<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queRole">
    角色名称：<input id="rnames" class="easyui-validatebox"/>&nbsp;&nbsp;
    备注：<input id="remarks"  class="easyui-validatebox"/>&nbsp;&nbsp;

    <a id="RoleSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="roleTool">
    <a id="RoleAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="RoleDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="RoleXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="RoleAddWin" class="easyui-window" title="新增菜单"
     style="width:333px;height:199px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'role/addRole.jsp'">
</div>
<div id="RoleXiuWin" class="easyui-window" title="修改菜单"
     style="width:333px;height:199px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,modal:true,href:'role/xiuRole.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="RoleTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#RoleTab').datagrid({
        url:'queryVoRole.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'rname',title:'角色名称',width:190},
            {field:'remark',title:'备注',width:300}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#roleTool'
    });

    //进行添加菜单项
    $("#RoleAdd").click(function () {
        $("#RoleAddWin").window('open');
        $("#RoleAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#RoleXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#RoleTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#RoleXiuWin").window('open');
        $("#RoleXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#RoleDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#RoleTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        //确认删除
        $.messager.confirm('确认对话框', '确定要删除这些记录吗？', function(r) {
            if (r) {
                //获取数据->list (json格式)
                var params={
                    type:'get',
                    url: "delRole.action",
                    data:{'id':selrows[0].id},
                    dataType:'json',
                    success:function (data) {
                        if (data>=1) {
                            $.messager.show({
                                title: '消息将在5秒后关闭..',
                                msg: '删除成功!',
                                timeout: 5000,
                                showType: 'slide'
                            });
                            //刷新后台表格数据 创建数组->json格式
                            var menu={'rname':$("#rnames").val(),'remark':$("#remarks").val()};
                            $('#RoleTab').datagrid('load',menu);
                        }else {
                            $.messager.show({
                                title: '消息将在5秒后关闭..',
                                msg: '删除失败!',
                                timeout: 5000,
                                showType: 'slide'
                            });
                        }
                    },
                    error:function (data) {
                        $.messager.show({
                            title: '消息将在5秒后关闭',
                            msg: '删除失误!',
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
    $("#RoleSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'rname':$("#rnames").val(),'remark':$("#remarks").val()};
        $('#RoleTab').datagrid('load',menu);
    });
</script>
</body>
</html>
