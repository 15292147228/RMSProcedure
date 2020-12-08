<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-25
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
药品名：<input id="sdName" class="easyui-validatebox"/>&nbsp;&nbsp;
<a id="sdnSearch" href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-search'">查询</a>
<a id="insertRDetail"  href="javascript:;" class="easyui-linkbutton" style="margin-left: 200px"
   data-options="iconCls:'icon-20130406125647919_easyicon_net_16'">新增进货申请</a>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'供货商药品表',split:true" style="width:38%;">
        <table id="ghsDrugTab"></table>
    </div>
    <div data-options="region:'center',title:'申请单明细'" style="width:62%;">
        <div id="srl">
            <a id="delReps"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-remove'">删除</a>
            <a id="xiuRepl"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-edit'">修改</a>
            <a id="queRepl"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-zoom'">查看进货申请</a>
            <a id="submitRepl"  href="javascript:;" class="easyui-linkbutton" style="margin-left: 211px"
               data-options="iconCls:'icon-book_go'">提交申请</a>
        </div>
        <!-- 采购单明细 -->
        <table id="repDetailT"></table>
    </div>
</div>
<!-- 隐藏增改窗口 -->
<input id="isHid" hidden="hidden"/><input id="isRid" hidden="hidden"/><input id="isNum" hidden="hidden"/>
<input id="rId" value="${sessionScope.emp.id}" hidden="hidden"/>
<div id="repDetailAddWin" class="easyui-window" title="药品"
     style="width:333px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-pill',closable:true,closed:true,href:'jinHuo/addShenQinMX.jsp',modal:true">
</div>
<div id="repDetailXiuWin" class="easyui-window" title="药品"
     style="width:333px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-pill_error',closable:true,closed:true,href:'jinHuo/xiuShenQinMX.jsp',modal:true">
</div>
<div id="repQueryWin" class="easyui-window" title="查看进货申请"
     style="width:666px;height:566px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-piechart',closable:true,closed:true,href:'jinHuo/queReplenishS.jsp',modal:true">
</div>
<script type="text/javascript">
    $("#queRepl").click(function () {
    $("#repQueryWin").window('open');
    });
    $("#insertRDetail").click(
        function () {
            var params ={
                type:'get',
                url:"addReplenish.action",
                data:{'roleId':$("#rId").val()},
                dataType:"json",
                success:function (data) {
                if (data>0){
                    $.messager.show({
                        msg:"进货申请单正在生成..",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                    $("#isRid").val(data);
                }else {
                    $.messager.show({
                        msg:"添加失败!",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }}};
            $.ajax(params);
        }
    );
    $('#ghsDrugTab').datagrid({
        url:'allSDrug.action',
        columns:[[
           /* {field:'ck',title:'全选',checkbox:true},*/
            {field:'id',title:'供货商药品编号',width:100},
            {field:'supId',title:'供货商',width:90,formatter: function(value,row,index){
                    if (row.sup){
                        return row.sup.supName;
                    }else {
                        return value;
                    }
                }
            },
            {field:'drugId',title:'药品名',width:100,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.drugNames;
                    }else {
                        return value;
                    }
                }
            },
            {field:'num',title:'库存数量',width:90},
            {field:'combPrice',title:'药品售价',width:90}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[6,8,10],
        singleSelect:true,
        onClickRow:function (rowIndex,rowData) {
            if ($("#isRid").val()>0) {
                $("#isHid").val(rowData.id);
                $("#isNum").val(rowData.num);
                $("#repDetailAddWin").window('open');
                $("#repDetailAddWin").window('refresh');
            }
        }
    });
    $("#sdnSearch").click(function () {
        $('#ghsDrugTab').datagrid('load',{'drugNames':$("#sdName").val()});
    });
    /*先查出药品，点击药品弹出框，填写药品数量，到明细单中，一并生成申请单,添加时判断药品id叠加，修改时金额改动*/
    $('#repDetailT').datagrid({
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
           /* {field:'id',title:'申请单明细编号',width:120},*/
            {field:'supId',title:'药品名',width:120,formatter: function(value,row,index){
                    if (row.sDrug){
                        return row.sDrug.drug.drugNames;
                    } else {
                        return value;
                    }
                }
            },
            {field:'repQuantity',title:'进货数量',width:100},
            {field:'amount',title:'合计金额',width:100},
            {field:'remark',title:'备注',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[6,8,10],
        toolbar: "#srl"
    });
    $("#submitRepl").click(function () {
        var params ={
            type:'get',
            url:"ReplPutIn.action",
            data:{'id':$("#isRid").val()},
            dataType:"json",
            success:function (data) {
                if (data==1){
                    $("#isRid").val(0);
                    //刷新后台表格数据 创建数组->json格式
                    $('#repDetailT').datagrid({
                        url:"queryByRepIdRD.action",
                        queryParams: {
                            id:$("#isRid").val()
                        }
                    });
                    $.messager.show({
                        msg:"进货申请单已发送!",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }else {
                    $.messager.show({
                        msg:"发送失败!",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }}};
        $.ajax(params);
    });
    //删除申请明细表中数据
    $("#delReps").click(function () {
        //获取当前的选中的行记录
        var selrows=$("#repDetailT").datagrid('getSelections');
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
                    url: "delReplenishDetail.action",
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
                            $('#repDetailT').datagrid({
                                url:"queryByRepIdRD.action",
                                queryParams: {
                                    id:$("#isRid").val()
                                }
                            });
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
    //进行修改菜单项
    $("#xiuRepl").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#repDetailT").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#repDetailXiuWin").window('open');
        $("#repDetailXiuWin").window('refresh');
    });
</script>
</body>
</html>
