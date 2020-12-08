<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-27
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
入库日期：<input class="easyui-datetimebox" id="wareDateA"
            data-options="required:true,showSeconds:false" style="width:150px">
状态：<input id="stateC"/>
<a id="queInStorageBut"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-search'">查询</a>

<div id="ruKuXiu" class="easyui-window" title="入库审核"
     style="width:333px;height:168px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-ruby_link',closable:true,closed:true,modal:true,href:'jinHuo/InStorageAudit.jsp'">
</div>

<div id="ruKuDetailXiu" class="easyui-window" title="药品入库"
     style="width:333px;height:399px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-ruby_put',closable:true,closed:true,modal:true,href:'jinHuo/InStorageDetail.jsp'">
</div>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'入库单',split:true" style="width:50%;">
        <div id="auditDiv">
            <a id="auditBut"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-script_edit'">入库审核</a>
        </div>
            <table id="inStorageT"></table>
    </div>
    <div data-options="region:'center',title:'入库单明细'" style="width:50%;">
        <div id="inStrDiv">
            <a id="inStrBut"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-script_save'">药品入库</a>
        </div>
        <table id="inStorageDetailT"></table>
    </div>
</div>
<input id="stateK" hidden="hidden"/><input id="ckId" hidden="hidden"/><input id="preV" hidden="hidden"/>
<script type="text/javascript">
$('#stateC').combobox({
    url:'jinHuo/instJson.json',
    valueField:'state',
    textField:'text',
    editable:false
});
/*->控制层->data数据自动填充 */
$('#inStorageT').datagrid({
    url:'allInStorage.action',
    columns:[[
        {field:'id',title:'入库单编号',width:160},
        {field:'aggregate',title:'核对总金额',width:160},
        {field:'wareDate',title:'入库日期',width:160},
        {field:'state',title:'状态',width:200,formatter: function(value,row,index){
                if (value==2){//（0待入库 or 1拒绝入库 or 2成功入库）
                    return "<span>成功入库</span>";
                } else if(value==1){
                    return "<span>拒绝入库</span>";
                }else {
                    return "<span>待入库</span>";
                }
            }
        }
    ]],
    pagination:true,//分页工具
    pageList:[3,6],
    singleSelect:true,//只能单选
    toolbar:'#auditDiv',
    onSelect:function (rowIndex,rowData) {
        $("#stateK").val(rowData.state);
        $("#ckId").val(rowData.id);
        $('#inStorageDetailT').datagrid({
            url:"queryByRepIdINSD.action",
            queryParams: {
                id:rowData.id
            }
        });
    }
    /*onDblClickCell: function(index,field,value){
       $("#ruKuDetail").window("open");
       alert(index+""+field+""+value);//2 id 4
    }*/

});
$('#inStorageDetailT').datagrid({
    columns:[[
        {field:'id',title:'入库明细编号',width:180},
        {field:'supId',title:'药品名',width:130,formatter: function(value,row,index){
                if (row.sDrug){
                    return row.sDrug.drug.drugNames;
                } else {
                    return value;
                }
            }},
        {field:'repQuantity',title:'应入库数量',width:130},
        {field:'amount',title:'合计金额',width:130},
        {field:'remark',title:'备注',width:200}
    ]],
    //queryParams:menu,
    pagination:true,//分页工具
    pageList:[3,6],
    toolbar:'#inStrDiv',
    singleSelect:true//只能单选
});
$("#queInStorageBut").click(function () {
    var rep={'wareDate':$("#wareDateA").val(),'state':$("#stateC").val()};
    $('#inStorageT').datagrid('load',rep);
    $('#inStorageDetailT').datagrid({
        url:"queryByRepIdINSD.action",
        queryParams: {
            id:-1
        }
    });
});

    $("#auditBut").click(function () {
        var selrows = $("#inStorageT").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if($("#stateK").val()!=2) {
            $("#ruKuXiu").window('open');
        }
    });

    $("#inStrBut").click(function () {
        var selrows = $("#inStorageDetailT").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if($("#stateK").val()==2) {
            $("#ruKuDetailXiu").window('open');
        }
    });
</script>
</body>
</html>
