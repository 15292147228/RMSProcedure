<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-22
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queUser">
    客户姓名：<input id="userNameS"  class="easyui-validatebox"/>&nbsp;&nbsp;
    公司：<input id="companyS"  class="easyui-validatebox"/>&nbsp;&nbsp;
    <a id="UserSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="userTool">
    <a id="UserAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="UserDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="UserXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="UserAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:399px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'user/addUser.jsp'">
</div>
<div id="UserXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:399px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-edit',closable:true,closed:true,href:'user/xiuUser.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="UserTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#UserTab').datagrid({
        url:'allUser.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'id',title:'用户编号',width:130},
            {field:'company',title:'客户公司名称',width:130},
            {field:'userName',title:'用户姓名',width:130},
            {field:'duty',title:'职务',width:130},
            {field:'companySite',title:'客户公司地址',width:300},
            {field:'userPhone',title:'电话',width:130},
            {field:'bankAccount',title:'银行账号',width:130},
            {field:'xinYu',title:'信誉度',width:130,formatter: function(value,row,index){
                    if (value){
                        return value+"%";
                    } else {
                        return value;
                    }
                }
            },
            {field:'destination',title:'送货地址',width:300}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#userTool'
    });

    //进行添加菜单项
    $("#UserAdd").click(function () {
        $("#UserAddWin").window('open');
        $("#UserAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#UserXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#UserTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#UserXiuWin").window('open');
        $("#UserXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#UserDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#UserTab").datagrid('getSelections');
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
                    url: "delUser.action",
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
                            var menu={'userName':$("#userNameS").val(),'company':$("#companyS").val(),'xinYu':$("#xinYuS").val()};
                            $('#UserTab').datagrid('load',menu);
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

    //条件查询
    $("#UserSearch").click(function () {
        //刷新后台表格数据 创建数组->json格式
        var menu={'userName':$("#userNameS").val(),'company':$("#companyS").val(),'xinYu':$("#xinYuS").val()};
        $('#UserTab').datagrid('load',menu);
    });
</script>
</body>
</html>
