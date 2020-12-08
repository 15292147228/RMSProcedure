<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="elt" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'选择角色',split:true" style="width:30%;">
        <a id="btnPri" class="easyui-linkbutton" style="margin-left: 279px" data-options="iconCls:'icon-vcard_key'">授权</a>
        <!-- 显示角色列表-->
        <table id="roleTree"></table>
    </div>
    <div data-options="region:'center',title:'绑定权限'" style="width:70%;padding:5px;">
        <!-- 显示菜单树控件 -->
        <ul id="authTree"></ul>
    </div>
</div>
<script type="text/javascript">
    var rid =0;

    $("#roleTree").datagrid({
        url:'queAllRole.action',
        columns:[[
            {field:'id',title:'角色id',width:130},
            {field:'rname',title:'角色名字',width:210}
        ]],
        singleSelect:true,//只能单选
        onClickRow:function (rowIndex, rowData) {
            //alert(rowData.id);  //点击角色  将角色id传给菜单url  获取菜单数据
            rid = rowData.id;
            //刷线菜单的加载
            $('#authTree').tree("reload");
        }
    });

    $("#authTree").tree({
        url:'queByIdMenu.action',
        checkbox:true,
        queryParams:{"rid":rid},
        onBeforeLoad:function (node, param) {//绑定传过去的属性
            param.rid =rid;
        }
    });
    $("#btnPri").click(function () {
        var selrow = $("#roleTree").datagrid('getSelected');
        if(selrow ==null){
            $.messager.alert('消息','请选中一条记录','info');
            return;
        }
        var rid = selrow.id;
        var nodes = $('#authTree').tree('getChecked', ['checked','indeterminate']);
        var midS="";
        for (var i = 0;i<nodes.length;i++){
            midS += nodes[i].id+",";
        }

        $.post("addAndRole.action",{"rid":rid,"auths":midS},function (data) {
            $.messager.show({
                title: '消息将在5秒后关闭..',
                msg: data,
                timeout: 5000,
                showType: 'slide'
            });
        },"text");

    });
</script>

</body>
</html>
