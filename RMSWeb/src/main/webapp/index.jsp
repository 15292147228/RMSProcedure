<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-08-13
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- jquery的js文件 -->
    <script type="text/javascript" src="js/jquery.min.js"></script>

    <!-- easyui的js文件 -->
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>

    <!-- 本地中文字符js文件 -->
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>

    <!-- easyUI默认的样式 -->
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css"/>

    <!-- 扩展图标的样式-->
    <link rel="stylesheet" href="themes/IconExtension.css"/>

    <!-- easyUI内置图标样式 -->
    <link rel="stylesheet" type="text/css" href="themes/icon.css"/>
</head>
<body>
<div id="cc" class="easyui-layout" data-options="fit:true" style="width:600px;height:400px;">
    <div data-options="region:'north',split:true,maxHeight:'120px'" style="height:120px;">
        <h2>药品管理系统</h2>
        <p>欢迎&nbsp;[${sessionScope.emp.role.rname}]${sessionScope.emp.empName}&nbsp;登陆</p>
    </div>
    <div data-options="region:'west',title:'菜单栏',split:true" style="width:160px;">
        <ul id="tree"></ul>
    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">

        <div id="tt" class="easyui-tabs" data-options="fit:true" style="padding: 10px">

            <div title="Tab1" data-options="closable:true,title:'导航页'" style="padding:20px;display:none;background-size: cover;background-image: url('img/bg.jpg');">
                您好 ${sessionScope.emp.role.rname}!
            </div>

        </div>

    </div>
</div>
<script type="text/javascript">
    //加载菜单tree数据
    $("#tree").tree({
        url:'queByIdAuthority.action',
        animate:true,
        onClick:function (node) {
            //带地址的节点点击  才会往下运行
            var url=node.attributes.url;
            if(url==undefined||url==""){
                return;
            }
            //检测table标签是否存在
            if ($("#tt").tabs('exists',node.text)){
                $("#tt").tabs('select',node.text);
            }else {
                $("#tt").tabs('add',{
                    title:node.text,
                    selected:true,
                    href:node.attributes.url,
                    iconCls:node.iconCls,
                    closable:true
                });
            }
        }
    });

</script>
</body>
</html>
