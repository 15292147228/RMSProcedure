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
    申请日期：<input class="easyui-datetimebox" id="applyDateN"
                data-options="required:true,showSeconds:false" style="width:150px">
    状态：<input id="stateN"/>
    <a id="queryReplenIBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查看</a>
    <table id="queryReplenITab"></table>
    <script type="text/javascript">
        $('#stateN').combobox({
            url:'jinHuo/repJson.json',
            valueField:'state',
            textField:'text',
            editable:false
        });
        $('#queryReplenITab').datagrid({
            url:'allReplenish.action',
            columns:[[
                {field:'id',title:'进货单编号',width:160},
                {field:'aggregate',title:'进货总金额',width:160},
                {field:'applyDate',title:'进货申请日期',width:160},
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
            pageList:[3,6]
        });
        $('#queryReplenIBut').click(function () {
           var rep={'applyDate':$("#applyDateN").val(),'state':$("#stateN").val()};
            $('#queryReplenITab').datagrid('load',rep);
        });
    </script>
</body>
</html>
