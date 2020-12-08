<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-23
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    仓库名：<input id="wareName" class="easyui-validatebox"/>&nbsp;&nbsp;
    药品名：<input id="dnsW" class="easyui-validatebox"/>&nbsp;&nbsp;
    入库日期：<input id="wareDate3" class="easyui-datetimebox"/>&nbsp;&nbsp;
    药品编码：<input id="drugCode3" class="easyui-validatebox"/>&nbsp;&nbsp;
    <a id="RepertorySearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
<br>

<div id="repWHTool">
    <a id="RepertoryAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="RepertoryDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="RepertoryXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="RepertoryAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'wareH/addRepertory.jsp'">
</div>
<div id="RepertoryXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-edit',closable:true,closed:true,modal:true,href:'wareH/xiuRepertory.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="RepertoryTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#RepertoryTab').datagrid({
        url:'allRepertory.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'库存编号',width:130},
            {field:'drugId',title:'药品名',width:150,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.drugNames;
                    }else {
                        return value;
                    }
                }
            },
            {field:'wareDate',title:'入库日期',width:100},
            {field:'saveNum',title:'存量',width:100},
            {field:'wareId',title:'仓库名',width:150,formatter: function(value,row,index){
                    if (row.wh){
                        return row.wh.wareName;
                    }else {
                        return value;
                    }
                }
            },
            {field:'drugCode',title:'药品编码',width:130},
            {field:'allSave',title:'最大存量',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#repWHTool'
    });

    //进行添加菜单项
    $("#RepertoryAdd").click(function () {
        $("#RepertoryAddWin").window('open');
        $("#RepertoryAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#RepertoryXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#RepertoryTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#RepertoryXiuWin").window('open');
        $("#RepertoryXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#RepertoryDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#RepertoryTab").datagrid('getSelections');
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
                    url: "delRepertory.action",
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
                            var menu={'wareName':$("#wareName").val(),'drugNames':$("#dnsW").val(),'wareDate':$("#wareDate3").val(),'drugCode':$("#drugCode3").val()};
                            $('#RepertoryTab').datagrid('load',menu);
                        }else {
                            $.messager.show({
                                title: '消息将在5秒后关闭',
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
    $("#RepertorySearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'wareName':$("#wareName").val(),'drugNames':$("#dnsW").val(),'wareDate':$("#wareDate3").val(),'drugCode':$("#drugCode3").val()};
        $('#RepertoryTab').datagrid('load',menu);
    });
</script>
</body>
</html>
