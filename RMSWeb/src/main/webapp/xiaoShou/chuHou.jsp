<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-21
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
药品名：<input id="sdNameH" class="easyui-validatebox"/>&nbsp;&nbsp;
<a id="sdnSearchH" href="javascript:;" class="easyui-linkbutton"
   data-options="iconCls:'icon-search'">查询</a>
<a id="inOFH"  href="javascript:;" class="easyui-linkbutton" style="margin-left: 200px"
   data-options="iconCls:'icon-20130406125647919_easyicon_net_16'">新增出货申请单</a>

<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'出货申请',split:true" style="width:50%;">
        <table id="RepsTab"></table>
    </div>
    <div data-options="region:'center',title:'申请单明细'" style="width:50%;">
        <div id="chm">
            <a id="delOfs"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-remove'">删除</a>
            <a id="xiuOfD"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-edit'">修改</a>
            <a id="queOF"  href="javascript:;" class="easyui-linkbutton"
               data-options="iconCls:'icon-zoom'">查看进货申请</a>
            <a id="submitOF"  href="javascript:;" class="easyui-linkbutton" style="margin-left: 211px"
               data-options="iconCls:'icon-book_go'">提交申请</a>
        </div>
        <table id="OFormDetailT"></table>
    </div>
</div>
<input id="isReid" hidden="hidden"/><input id="isFid" hidden="hidden"/><input id="isSum" hidden="hidden"/>
<input id="roId" value="${sessionScope.emp.id}" hidden="hidden"/>
<div id="OfDetailAddWin" class="easyui-window" title="药品"
     style="width:333px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-pill',closable:true,closed:true,href:'xiaoShou/addChuHou.jsp',modal:true">
</div>
<div id="OfDetailXiuWin" class="easyui-window" title="药品"
     style="width:333px;height:333px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-pill_error',closable:true,closed:true,href:'xiaoShou/xiuChuHou.jsp',modal:true">
</div>
<div id="OFQueryWin" class="easyui-window" title="查看出货申请"
     style="width:666px;height:566px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-piechart',closable:true,closed:true,href:'xiaoShou/queOrderFormS.jsp',modal:true">
</div>
<div id="OrderFoWin" class="easyui-window" title="出货申请单"
     style="width:333px;height:266px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-server_chart',closable:true,closed:true,modal:true">
    选择客户：<input id="userIS"/><br/><br/>
    <a id="addUserIdBut"  href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-server_link'">生成出货申请单</a>
    <script type="text/javascript">
        $('#userIS').combobox({
            url:'queAllUser.action',
            valueField:'id',
            textField:'userName',
            editable:false
        });
        $("#addUserIdBut").click(function () {
            var params ={
                type:'get',
                url:"addOrderForm.action",
                data:{'userId':$("#userIS").val(),'roleId':$("#roId").val()},
                //data:{'roleId':$("#roId").val()},
                dataType:"json",
                success:function (data) {
                    if (data>0){
                        $.messager.show({
                            msg:"进货申请单正在生成..",
                            title:'消息将在5秒后关闭..',
                            timeout:5000,
                            showType:'slide'
                        });
                        $("#isFid").val(data);
                        $("#OrderFoWin").window('close');
                    }else {
                        $.messager.show({
                            msg:"添加失败！",
                            title:'消息将在5秒后关闭..',
                            timeout:5000,
                            showType:'slide'
                        });
                    }}};
            $.ajax(params);
        });
    </script>
</div>
<script type="text/javascript">
    $("#queOF").click(function () {
        $("#OFQueryWin").window('open');
    });
    $("#inOFH").click(
       function () {
           $("#OrderFoWin").window('open');
           $("#OrderFoWin").window('refresh');
       }
    );
    $('#RepsTab').datagrid({
        url:'allRepertory.action',
        columns:[[
            {field:'drugId',title:'药品名',width:130,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.drugNames;
                    }else {
                        return value;
                    }
                }
            },
            {field:'sellPrince',title:'售价',width:130,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.sellPrince;
                    }else {
                        return value;
                    }
                }
            },
            {field:'specification',title:'药品规格',width:130,formatter: function(value,row,index){
                    if (row.drug){
                        return row.drug.specification;
                    }else {
                        return value;
                    }
                }
            },
            {field:'saveNum',title:'库存数量',width:100},
            {field:'drugCode',title:'药品编码',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[6,8,10],
        singleSelect:true,//只能单选
        onSelect:function (rowIndex,rowData) {
            if ($("#isFid").val()>0) {
                $("#isReid").val(rowData.id);
                $("#isSum").val(rowData.saveNum);
                $("#OfDetailAddWin").window('open');
                $("#OfDetailAddWin").window('refresh');
            }
        }
    });
    $("#sdnSearchH").click(function () {
        $('#RepsTab').datagrid('load',{'drugNames':$("#sdNameH").val()});
    });

    $('#OFormDetailT').datagrid({
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'申请单明细编号',width:90},
            {field:'reperId',title:'药品名',width:100,formatter: function(value,row,index){
                    if (row.rep){
                        return row.rep.drug.drugNames;
                    }else {
                        return value;
                    }
                }
            },
            {field:'count',title:'采购数量',width:90},
            {field:'amount',title:'合计金额',width:90},
            {field:'remark',title:'备注',width:80}
        ]],
        pagination:true,//分页工具
        pageList:[6,8,10],
        toolbar: "#chm"
    });

    $("#submitOF").click(function () {
        var params ={
            type:'get',
            url:"OFPutIn.action",
            data:{'id':$("#isFid").val()},
            dataType:"json",
            success:function (data) {
                if (data==1){
                    $("#isFid").val(0);
                    //刷新后台表格数据 创建数组->json格式
                    $('#OFormDetailT').datagrid({
                        url:"queryByRepIdOFD.action",
                        queryParams: {
                            id:$("#isFid").val()
                        }
                    });
                    $.messager.show({
                        msg:"出货申请单已发送!",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }else {
                    $.messager.show({
                        msg:"发送失败！",
                        title:'消息将在5秒后关闭..',
                        timeout:5000,
                        showType:'slide'
                    });
                }}};
        $.ajax(params);
    });

    $("#delOfs").click(function () {
        //获取当前的选中的行记录
        var selrows=$("#OFormDetailT").datagrid('getSelections');
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
                    url: "delOfDetail.action",
                    data:JSON.stringify(ids),
                    dataType:'json',
                    contentType:"application/json",
                    success:function (data) {
                        if (data>=1) {
                            $.messager.show({
                                title: '消息将在5秒后关闭..',
                                msg: '删除'+data+'条数据',
                                timeout: 5000,
                                showType: 'slide'
                            });
                            //刷新后台表格数据 创建数组->json格式
                            $('#OFormDetailT').datagrid({
                                url:"queryByRepIdOFD.action",
                                queryParams: {
                                    id:$("#isFid").val()
                                }
                            });
                        }
                    },
                    error:function (data) {
                        $.messager.show({
                            title: '消息将在5秒后关闭',
                            msg: '删除失误',
                            timeout: 5000,
                            showType: 'slide'
                        });
                    }
                };
                $.ajax(params);
            }
        });
    });

    $("#xiuOfD").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#OFormDetailT").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#OfDetailXiuWin").window('open');
        $("#OfDetailXiuWin").window('refresh');
    });
</script>
</body>
</html>
