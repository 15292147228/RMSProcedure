<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queUser">
    药品名称：<input id="drugNameS"  class="easyui-validatebox"/>&nbsp;&nbsp;
    进价：<input id="purcostS"  class="easyui-validatebox"/>&nbsp;&nbsp;
    销售价：<input id="sellPrinceS"  class="easyui-validatebox"/>&nbsp;&nbsp;

    <a id="DrugSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="drugSTool">
    <a id="DrugAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="DrugDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="DrugXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="DrugAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:450px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'drug/addDrug.jsp'">
</div>
<div id="DrugXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:450px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,href:'drug/xiuDrug.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="DrugTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#DrugTab').datagrid({
        url:'allDrug.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'drugNames',title:'药品名',width:130},
            {field:'purcost',title:'进货价',width:100},
            {field:'sellPrince',title:'销售价',width:100},
            {field:'ingredient',title:'药品成分',width:200},
            {field:'specification',title:'药品规格',width:130},
            {field:'place',title:'药品产地',width:200},
            {field:'batchNum',title:'批号',width:130},
            {field:'remark',title:'备注',width:130},
            {field:'producedDate',title:'生产日期',width:200},
            {field:'expirationDate',title:'有效期',width:200},
            {field:'packageInsert',title:'说明书',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#drugSTool'
    });

    //进行添加菜单项
    $("#DrugAdd").click(function () {
        $("#DrugAddWin").window('open');
        $("#DrugAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#DrugXiu").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#DrugTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#DrugXiuWin").window('open');
        $("#DrugXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#DrugDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#DrugTab").datagrid('getSelections');
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
                    url: "delDrug.action",
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
                            var menu={'drugName':$("#drugNameS").val(),'purcost':$("#purcostS").val(),'sellPrince':$("#sellPrinceS").val()};
                            $('#DrugTab').datagrid('load',menu);
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
    $("#DrugSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'drugNames':$("#drugNameS").val(),'purcost':$("#purcostS").val(),'sellPrince':$("#sellPrinceS").val()};
        $('#DrugTab').datagrid('load',menu);
    });
</script>
</body>
</html>
