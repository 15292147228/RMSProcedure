<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    仓库名：<input id="wareN"  class="easyui-validatebox"/>&nbsp;&nbsp;
    仓库地址：<input id="wareA"  class="easyui-validatebox"/>&nbsp;&nbsp;
    储量状态：<input id="saveS" />&nbsp;&nbsp;

    <a id="WareHouseSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
<br>

<div id="wareHTool">
    <a id="WareHouseAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="WareHouseDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="WareHouseXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
    <a id="WandRepertory" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查看库存信息</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="WareHouseAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:399px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'wareH/addWareHouse.jsp'">
</div>
<div id="WareHouseXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:399px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,modal:true,href:'wareH/xiuWareHouse.jsp'">
</div>
<div id="WandRepertoryWin" class="easyui-window" title="库存信息"
     style="width:777px;height:555px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-zoom',closable:true,closed:true,modal:true,href:'wareH/setRepertory.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="WareHouseTab"></table>

<script type="text/javascript">
    $("#WandRepertory").click(function () {
    $("#WandRepertoryWin").window("open");
        $("#WandRepertoryWin").window("refresh");
    });
    $("#saveS").combobox({
        url:'wareH/wh.json',
        valueField:'saveState',
        textField:'state',
        editable:false
    });
    /*->控制层->data数据自动填充 */
    $('#WareHouseTab').datagrid({
        url:'allWareHouse.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'wareName',title:'仓库名',width:160},
            {field:'wareAddress',title:'仓库地址',width:300},
            {field:'saveState',title:'储量状态',width:160,formatter: function(value,row,index){
                    if (value==0){
                        return "<span>可存</span>";
                    } else {
                        return "<span>已满</span>";
                    }
                }
            }
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#wareHTool'
    });

    //进行添加菜单项
    $("#WareHouseAdd").click(function () {
        $("#WareHouseAddWin").window('open');
        $("#WareHouseAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#WareHouseXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#WareHouseTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#WareHouseXiuWin").window('open');
        $("#WareHouseXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#WareHouseDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#WareHouseTab").datagrid('getSelections');
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
                    url: "delWareHouse.action",
                    data:JSON.stringify(ids),
                    dataType:'json',
                    contentType:"application/json",
                    success:function (data) {
                        if (data>=1) {
                            $.messager.show({
                                title: '消息将在5秒后关闭..',
                                msg: '删除'+data+'条数据!',
                                timeout: 5000,
                                showType: 'slide'
                            });
                            //刷新后台表格数据 创建数组->json格式
                            var menu={'wareName':$("#wareN").val(),'wareAddress':$("#wareA").val(),'saveState':$("#saveS").val()};
                            $('#WareHouseTab').datagrid('load',menu);
                        }else {
                            $.messager.show({
                                title: '消息将在5秒后关闭',
                                msg: '删除失败!',
                                timeout: 5000,
                                showType: 'slide'
                            });
                        }
                    }
                };
                $.ajax(params);
            }
        });
    });

    //条件查询
    $("#WareHouseSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'wareName':$("#wareN").val(),'wareAddress':$("#wareA").val(),'saveState':$("#saveS").val()};
        $('#WareHouseTab').datagrid('load',menu);
    });
</script>
</body>
</html>
