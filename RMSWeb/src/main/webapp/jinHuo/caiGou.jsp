<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-17
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
申请日期：<input class="easyui-datetimebox" id="buyDateA"
            data-options="required:true,showSeconds:false" style="width:150px">
状态：<input id="stateG" />
<a id="quePurchaseBut"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-search'">查询</a>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'采购单',split:true" style="width:50%;">
    <%--    <a id="" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-vcard_key'">添加</a>--%>
        <!-- 采购单列表-->
        <table id="purchTab"></table>
    </div>
    <div data-options="region:'center',title:'采购单明细'" style="width:50%;">
        <!-- 采购单明细 -->
        <table id="purchDetailT"></table>
    </div>
</div>
    <script type="text/javascript">
        $('#stateG').combobox({
            url:'jinHuo/purJson.json',
            valueField:'state',
            textField:'text',
            editable:false
        });
        /*->控制层->data数据自动填充 */
        $('#purchTab').datagrid({
            url:"allPurchase.action",
            columns:[[
              /*  {field:'ck',title:'全选',checkbox:true},*/
                {field:'id',title:'采购单号',width:150},
                {field:'aggregate',title:'预计总金额',width:150},
                {field:'buyDate',title:'采购单生成日期',width:160},
                {field:'state',title:'状态',width:170,formatter: function(value,row,index){
                        if (value==2){//（0待购置 or 1未置齐 or 2购置完毕）
                            return "<span>购置完毕</span>";
                        } else if(value==1){
                            return "<span>未置齐</span>";
                        }else {
                            return "<span>待购置</span>";
                        }
                    }
                }
            ]],
            //queryParams:menu,
            pagination:true,//分页工具
            pageList:[3,6],
            singleSelect:true,//只能单选
            onSelect:function (rowIndex,rowData) {
                $('#purchDetailT').datagrid({
                    url:"queryByRepIdPD.action",
                    queryParams: {
                        id:rowData.id
                    }
                });
            }
        });
        $('#purchDetailT').datagrid({
            columns:[[
                {field:'supId',title:'药品名',width:180,formatter: function(value,row,index){
                        if (row.sDrug){
                            return row.sDrug.drug.drugNames;
                        } else {
                            return value;
                        }
                    }},
                {field:'repQuantity',title:'采购数量',width:160},
                {field:'amount',title:'合计金额',width:160},
                {field:'remark',title:'备注',width:200}
            ]],
            //queryParams:menu,
            pagination:true,//分页工具
            pageList:[3,6]
        });
        $("#quePurchaseBut").click(function () {
            var rep={'buyDate':$("#buyDateA").val(),'state':$("#stateG").val()};
            $('#purchTab').datagrid('load',rep);
            $('#purchDetailT').datagrid({
                url:"queryByRepIdPD.action",
                queryParams: {
                    id:0
                }
            });
        });
    </script>
</body>
</html>
