<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-24
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queSDrug">
    供货商：<input  id="supNameS" class="easyui-validatebox"/><br/>
    药品名：<input  id="drugNameS" class="easyui-validatebox"/><br/>
    <a id="SDrugSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="myTool">
    <a id="SDrugAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="SDrugDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="SDrugXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="SDrugAddWin" class="easyui-window" title="新增菜单"
     style="width:500px;height:450px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'addSDrug.jsp'">
</div>
<div id="SDrugXiuWin" class="easyui-window" title="修改菜单"
     style="width:500px;height:450px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-update',closable:true,closed:true,href:'xiuSDrug.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="SDrugTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#SDrugTab').datagrid({
        url:'allSDrug.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'供货商药品编号',width:130},
            {field:'supId',title:'供货商',width:150,formatter: function(value,row,index){
                    if (row.sup){
                        return row.sup.supName;
                    }else {
                        return value;
                    }
                }
            },
            {field:'drugId',title:'药品名',width:150,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.drugNames;
                    }else {
                        return value;
                    }
                }
            },
            {field:'num',title:'库存数量',width:130},
            {field:'combPrice',title:'药品售价',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6,9,12,15],
        toolbar:'#myTool'
    });

    //进行添加菜单项
    $("#SDrugAdd").click(function () {
        $("#SDrugAddWin").window('open');
        $("#SDrugAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#SDrugXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#SDrugTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#SDrugXiuWin").window('open');
        $("#SDrugXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#SDrugDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#SDrugTab").datagrid('getSelections');
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
                    url: "delSDrug.action",
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
                            var menu={'supName':$("#supNameS").val(),'drugNames':$("#drugNameS").val()};
                            $('#SDrugTab').datagrid('load',menu);
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
    $("#SDrugSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'supName':$("#supNameS").val(),'drugNames':$("#drugNameS").val()};
        $('#SDrugTab').datagrid('load',menu);
    });
</script>
</body>
</html>
