<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-23
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queSupplier">
    供货商名：<input id="supNames"  class="easyui-validatebox"/>&nbsp;&nbsp;
    所在地区：<input id="locations"  class="easyui-validatebox"/>&nbsp;&nbsp;
    联系电话：<input id="suPhones"  class="easyui-validatebox"/>&nbsp;&nbsp;
    备注：<input id="remarks"  class="easyui-validatebox"/>&nbsp;&nbsp;

    <a id="SupplierSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="supplierSTool">
    <a id="SupplierAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="SupplierDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="SupplierXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="SupplierAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'supplier/addSupplier.jsp'">
</div>
<div id="SupplierXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,href:'supplier/xiuSupplier.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="SupplierTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#SupplierTab').datagrid({
        url:'allSupplier.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'供货商编号',width:150},
            {field:'supName',title:'供货商名',width:150},
            {field:'location',title:'所在地区',width:300},
            {field:'suPhone',title:'联系电话',width:130},
            {field:'remark',title:'备注',width:300}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#supplierSTool'
    });

    //进行添加菜单项
    $("#SupplierAdd").click(function () {
        $("#SupplierAddWin").window('open');
        $("#SupplierAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#SupplierXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#SupplierTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#SupplierXiuWin").window('open');
        $("#SupplierXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#SupplierDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#SupplierTab").datagrid('getSelections');
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
                    url: "delSupplier.action",
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
                            var menu={'supName':$("#supNames").val(),'location':$("#locations").val(),'suPhone':$("#suPhones").val(),'remark':$("#remarks").val()};
                            $('#SupplierTab').datagrid('load',menu);
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
    $("#SupplierSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'supName':$("#supNames").val(),'location':$("#locations").val(),'suPhone':$("#suPhones").val(),'remark':$("#remarks").val()};
        $('#SupplierTab').datagrid('load',menu);
    });
</script>
</body>
</html>
