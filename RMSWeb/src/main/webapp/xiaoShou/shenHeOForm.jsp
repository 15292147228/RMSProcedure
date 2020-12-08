<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-26
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queOrderForm" method="post">
    申请日期：<input class="easyui-datetimebox" id="ofDateH"
                data-options="required:true,showSeconds:false" style="width:150px">
    状态：<input id="stateH" name="stateH"/>
    <a id="queOFormBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查看</a>
    <table id="queOFormTab"></table>
</form>
<div id="xiuSOFWin" class="easyui-window" title="进货申请"
     style="width:333px;height:222px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-piechart',closable:true,closed:true,modal:true">
    <form id="xiuSOF" enctype="multipart/form-data" method="post">
        <input id="idU" name="idU" hidden="hidden"/>
        状态：<input id="stateU" name="stateU"/>
        <a id="xiuButOForm"  href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit'">审核</a>
    </form>
    <script type="text/javascript">
        $('#stateU').combobox({
            url:'xiaoShou/orderForm.json',
            valueField:'state',
            textField:'text',
            editable:false
        });
        $("#xiuButOForm").click(function () {
            $('#xiuSOF').form('submit',{
                url:"xiuOrderForm.action",
                onSubmit: function(){
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
                    $("#xiuSOFWin").window("close");
                    var rep={'ofDate':$("#ofDateH").val(),'state':$("#stateH").val()};
                    $('#queOFormTab').datagrid('load',rep);
                },error:function (data) {
                    $.messager.show({
                        msg:data,
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }
            });
        });
    </script>
</div>
<script type="text/javascript">
    $('#stateH').combobox({
        url:'xiaoShou/orderForm.json',
        valueField:'state',
        textField:'text',
        editable:false
    });
    $('#queOFormTab').datagrid({
        url:'allOrderForm.action',
        columns:[[
            {field:'id',title:'出货单编号',width:160},
            {field:'userId',title:'客户',width:160,formatter: function(value,row,index){
                    if (row.user){
                        return row.user.userName;
                    }else {
                        return value;
                    }
                }},
            {field:'aggregate',title:'出货总金额',width:160},
            {field:'ofDate',title:'出货申请日期',width:160},
            {field:'state',title:'状态',width:160,formatter: function(value,row,index){
                    if (value==2){
                        return "<span>已批准</span>";
                    } else if (value==1){
                        return "<span>作废</span>";
                    }else {
                        return "<span>待审核</span>";
                    }
                }
            }
        ]],
        pagination:true,//分页工具
        pageList:[3,6],
        singleSelect:true,
        onClickRow:function (rowIndex, rowData) {
            //当前的选中的行记录 获取ID
            var selrows = $("#queOFormTab").datagrid('getSelections');
            //选中行了吗？？
            if(selrows.length==0){
                $.messager.alert('消息','请选中一条记录','info');
                return;
            }
            if(selrows.length>1){
                $.messager.alert('消息','只能选中一条记录','info');
                return;
            }
            if (rowData.state!=2) {
                $("#idU").val(rowData.id);
                $("#xiuSOFWin").window('open');
                $("#xiuSOFWin").window('refresh');
            }
        }
    });
    $('#queOFormBut').click(function () {
        var rep={'ofDate':$("#ofDateH").val(),'state':$("#stateH").val()};
        $('#queOFormTab').datagrid('load',rep);
    });
</script>
</body>
</html>
