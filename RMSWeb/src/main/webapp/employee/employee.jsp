<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-21
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="queEmp">
    职员姓名：<input id="empNames"  class="easyui-validatebox"/>&nbsp;&nbsp;
    部门：<input id="departments"  class="easyui-validatebox"/>&nbsp;&nbsp;
    学历：<input id="edubacks"  class="easyui-validatebox"/>&nbsp;&nbsp;

    <a id="EmpSearch" href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-search'">查询</a>
</form>
<br>

<div id="empTool">
    <a id="EmpAdd" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a id="EmpDel" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a id="EmpXiu" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">修改</a>
</div>
<!-- 隐藏增改窗口 -->
<div id="EmpAddWin" class="easyui-window" title="新增菜单"
     style="width:366px;height:400px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-add',closable:true,closed:true,modal:true,href:'employee/addEmp.jsp'">
</div>
<div id="EmpXiuWin" class="easyui-window" title="修改菜单"
     style="width:366px;height:400px;padding:10px;background:#fafafa;text-align: center"
     data-options="iconCls:'icon-update',closable:true,closed:true,modal:true,href:'employee/xiuEmp.jsp'">
</div>
<!-- 菜单表 data数据自动填充 -->
<table id="EmpTab"></table>

<script type="text/javascript">
    /*->控制层->data数据自动填充 */
    $('#EmpTab').datagrid({
        url:'allEmployee.action',
        columns:[[
            {field:'ck',title:'全选',checkbox:true},
            {field:'empName',title:'职员姓名',width:150},
            {field:'empSex',title:'性别',width:60},
            /*{field:'empImage',title:'工作照',width:130,formatter: function(value,row,index){
                    if (value){
                        return "<img src='"+value+"' style='height: 40px;width: 100px'/>";
                    } else {
                        return null;
                    }
                }
            },*/
            {field:'department',title:'部门',width:130},
            {field:'idCard',title:'身份证号',width:200},
            {field:'eduback',title:'学历',width:130},
            {field:'empBirthday',title:'入职日期',width:70},
            {field:'empPhone',title:'联系电话',width:130}
        ]],
        //queryParams:menu,
        pagination:true,//分页工具
        pageList:[3,6],
        toolbar:'#empTool'
    });

    //进行添加菜单项
    $("#EmpAdd").click(function () {
        $("#EmpAddWin").window('open');
        $("#EmpAddWin").window('refresh');
    });
    //进行修改菜单项
    $("#EmpXiu").click(function () {
        //当前的选中的行记录 获取ID
        var selrows = $("#EmpTab").datagrid('getSelections');
        //选中行了吗？？
        if(selrows.length==0){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        if(selrows.length>1){
            $.messager.alert('消息','只能选中一条记录','info');
            return;
        }
        $("#EmpXiuWin").window('open');
        $("#EmpXiuWin").window('refresh');
    });

    //进行批量删除菜单项
    $("#EmpDel").click(function () {
        //获取当前的选中的行记录
        var selrows  =$("#EmpTab").datagrid('getSelections');
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
                    url: "delEmployee.action",
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
                            var menu={'empName':$("#empNames").val(),'department':$("#departments").val(),'eduback':$("#edubacks").val()};
                            $('#EmpTab').datagrid('load',menu);
                        }else {
                            $.messager.show({
                                title: '消息将在5秒后关闭',
                                msg: '删除失败!',
                                timeout: 5000,
                                showType: 'slide'
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

    //条件查询
    $("#EmpSearch").click(function () {
        var menu={'empName':$("#empNames").val(),'department':$("#departments").val(),'eduback':$("#edubacks").val()};
        $('#EmpTab').datagrid('load',menu);
    });
</script>
</body>
</html>
