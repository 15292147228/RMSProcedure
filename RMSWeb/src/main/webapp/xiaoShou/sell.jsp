<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-21
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
申请日期：<input class="easyui-datetimebox" id="sellDateL"
            data-options="required:true,showSeconds:false" style="width:150px">
状态：<input id="stateL" />
<a id="queSellBut"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-zoom'">查询</a>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'出货申请',split:true" style="width:38%;">
        <%--    <a id="" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-vcard_key'">添加</a>--%>
        <!-- 采购单列表-->
        <table id="sellTab"></table>
    </div>
    <div data-options="region:'center',title:'申请单明细'" style="width:62%;">
        <!-- 采购单明细 -->
        <table id="sellDetailT"></table>
    </div>
</div>
<script type="text/javascript">
    $("#queSellBut").click(function () {
        $('#sellTab').datagrid('load',{'sellDate':$("#sellDateL").val(),'state':$("#stateL").val()});
        $('#sellDetailT').datagrid({url:"queryBySellIdINSellD.action",queryParams:{'id':0}});
    });
    $('#stateL').combobox({
        url:'xiaoShou/sell.json',
        valueField:'state',
        textField:'text',
        editable:false
    });
    $('#sellTab').datagrid({
        url:"allSell.action",
        columns:[[
            {field:'id',title:'销售单号',width:90},
            {field:'userId',title:'客户名',width:90,formatter: function(value,row,index){
                    if (row.userS){
                        return row.userS.userName;
                    }else {
                        return value;
                    }
                }},
            {field:'aggregate',title:'总金额',width:100},
            {field:'sellDate',title:'销售日期',width:100},
            {field:'state',title:'状态',width:160,formatter: function(value,row,index){
                    if (value==2){
                        return "<span>出货</span>";
                    } else if (value==1){
                        return "<span>缺货</span>";
                    }else {
                        return "<span>待审查</span>";
                    }
                }
            }
        ]],
        pagination:true,//分页工具
        pageList:[3,6],
        singleSelect:true,//只能单选
        onSelect:function (rowIndex,rowData) {
            $('#sellDetailT').datagrid({url:"queryBySellIdINSellD.action",queryParams:{'id':rowData.id}});
        }
    });
    $('#sellDetailT').datagrid({
        columns:[[
            {field:'id',title:'申请单明细编号',width:90},
            {field:'reperId',title:'药品名',width:100,formatter: function(value,row,index){
                    if (row.rep){
                        return row.rep.drug.drugNames;
                    }else {
                        return value;
                    }
                }},
            {field:'count',title:'采购数量',width:90},
            {field:'amount',title:'合计金额',width:90},
            {field:'remark',title:'备注',width:80}
        ]],
        singleSelect:true,//只能单选
        pagination:true,//分页工具
        pageList:[3,6]
    });
</script>
</body>
</html>
