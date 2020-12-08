<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-31
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
选择时间：<input id="inDateNum" name="inDate"/>
<a id="byNumQueBill"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-zoom'">查询账单</a>
<div>
    支出金额：￥<span id="ip">0.00</span><br/>
    公司收入：￥<span id="sp">0.00</span><br/>
</div>
<a id="isSellBut"  href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-script_code_red'">查看药品销售记录</a>
<a id="isInStorageBut"  href="javascript:;" class="easyui-linkbutton" style="margin-left: 211px"
   data-options="iconCls:'icon-script_code'">查看药品入库记录</a>
<%--隐藏销售和进货窗口--%>
<div id="isSellWin" class="easyui-window" title="销售记录"
     style="width:777px;height:555px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-plugin_go',closable:true,closed:true,modal:true">
    销售时间：<input id="thisSellDate"/>
    <a id="bySellDateOS"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查询账单</a>
    <table id="thisSellTab"></table>
    <script type="text/javascript">
        $("#bySellDateOS").click(function () {
            $('#thisSellTab').datagrid({
                url:"queTimeSell.action",
                queryParams:{'num':$("#thisSellDate").val()}
            });
        });
        $('#thisSellTab').datagrid({
            columns:[[
                {field:'id',title:'销售单号',width:130},
                {field:'userId',title:'客户名',width:100,formatter: function(value,row,index){
                        if (row.user){
                            return row.user.userName;
                        }else {
                            return value;
                        }
                    }},
                {field:'aggregate',title:'总金额',width:130},
                {field:'sellDate',title:'销售日期',width:200},
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
            pageList:[6,8],
            singleSelect:true//只能单选
        });
        $('#thisSellDate').combobox({
            url:'xiaoShou/selectNum.json',
            valueField:'num',
            textField:'text',
            editable:false
        });
    </script>
</div>
<div id="isInStorageWin" class="easyui-window" title="入库记录"
     style="width:777px;height:555px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-plugin_edit',closable:true,closed:true,modal:true">
    销售时间：<input id="thisIStorageDate"/>
    <a id="byIStorageQ"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查询账单</a>
    <table id="thisIStorageTab"></table>
    <script type="text/javascript">
        $("#byIStorageQ").click(function () {
            $('#thisIStorageTab').datagrid({
                url:"queStorageS.action",
                queryParams:{'num':$("#thisIStorageDate").val()}
            });
        });
        $('#thisIStorageTab').datagrid({
            columns:[[
                {field:'id',title:'入库单编号',width:160},
                {field:'aggregate',title:'总金额',width:160},
                {field:'wareDate',title:'入库日期',width:200},
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
            pageList:[6,8],
            singleSelect:true//只能单选
        });
        $('#thisIStorageDate').combobox({
            url:'xiaoShou/selectNum.json',
            valueField:'num',
            textField:'text',
            editable:false
        });
    </script>
</div>
<script type="text/javascript">
    $("#isSellBut").click(function () {
    $("#isSellWin").window("open");
    });
    $("#isInStorageBut").click(function () {
    $("#isInStorageWin").window("open");
    });
    $('#byNumQueBill').click(function () {
        $.ajax({
            type:'get',
            url:'queMoneySell.action',
            data:{'num':$("#inDateNum").val()},
            dataType:'json',
            success:function (data) {
               $("#sp").text(data);
            }
        });
        $.ajax({
            type:'get',
            url:'queMoneyS.action',
            data:{'num':$("#inDateNum").val()},
            dataType:'json',
            success:function (data) {
                $("#ip").text(data);
            }
        });
    });
    $('#inDateNum').combobox({
        url:'xiaoShou/selectNum.json',
        valueField:'num',
        textField:'text',
        editable:false
    });
</script>
</body>
</html>
