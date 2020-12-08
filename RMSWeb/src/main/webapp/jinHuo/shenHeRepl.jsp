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
<form id="queReplenishF" method="post">
    申请日期：<input class="easyui-datetimebox" id="applyDateA"
                data-options="required:true,showSeconds:false" style="width:150px">
    状态：<input id="stateA" name="state">
    <a id="queReplenishBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-zoom'">查看</a>
    <table id="queReplenishTab"></table>
</form>
<div id="queReplenishWin" class="easyui-window" title="进货申请"
     style="width:333px;height:222px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-piechart',closable:true,closed:true,modal:true">
    <form id="xiuReplenBF" enctype="multipart/form-data" method="post">
        <input id="idSHRepl" name="id1" hidden="hidden"/>
        状态：<input id="statSHR" name="state1"/>
        <a id="xiuButRDetail"  href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit'">审核</a>
    </form>
    <script type="text/javascript">
        $('#statSHR').combobox({
            url:'jinHuo/repJson.json',
            valueField:'state',
            textField:'text',
            editable:false
        });
        $("#xiuButRDetail").click(function () {
            $('#xiuReplenBF').form('submit',{
                url:"xiuReplenish.action",
                onSubmit: function(){
                    //如果正确 返回true  往后台提交
                    //不过有错误 返回false  提交终止
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
                    $("#queReplenishWin").window("close");
                    var rep={'applyDate':$("#applyDateA").val(),'state':$("#stateA").val()};
                    $('#queReplenishTab').datagrid('load',rep);
                },error:function (data) {
                    $.messager.show({
                        msg:"审核失误!",
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
    $('#stateA').combobox({
        url:'jinHuo/repJson.json',
        valueField:'state',
        textField:'text',
        editable:false
    });
    $('#queReplenishTab').datagrid({
        url:'allReplenish.action',
        columns:[[
           /* {field:'ck',title:'全选',checkbox:true},*/
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
        pageList:[3,6],
        singleSelect:true,
        onClickRow:function (rowIndex, rowData) {
            //当前的选中的行记录 获取ID
            var selrows = $("#queReplenishTab").datagrid('getSelections');
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
                $("#idSHRepl").val(rowData.id);
                $("#queReplenishWin").window('open');
                $("#queReplenishWin").window('refresh');
            }
        }
    });
    $('#queReplenishBut').click(function () {
        var rep={'applyDate':$("#applyDateA").val(),'state':$("#stateA").val()};
        $('#queReplenishTab').datagrid('reload',rep);
    });
</script>
</body>
</html>
