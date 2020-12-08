<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-26
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    申请日期：<input class="easyui-datetimebox" id="ofDateO"
                data-options="required:true,showSeconds:false" style="width:150px">
    状态：<input id="stateO"/>
    <a id="queStateOrderFBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查看</a>
    <table id="queStateOrderFTab"></table>
    <script type="text/javascript">
        $('#stateO').combobox({
            url:'xiaoShou/orderForm.json',
            valueField:'state',
            textField:'text',
            editable:false
        });
        $('#queStateOrderFTab').datagrid({
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
            pageList:[6,8,10]
        });
        $('#queStateOrderFBut').click(function () {
           var rep={'ofDate':$("#ofDateO").val(),'state':$("#stateO").val()};
            $('#queStateOrderFTab').datagrid('load',rep);
        });
    </script>
</body>
</html>
