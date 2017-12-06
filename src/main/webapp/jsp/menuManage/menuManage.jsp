<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/bootstrap.css" type="text/css">

<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
div, p, table, th, td {
	list-style:none;
	margin:0; padding:0;
	color:#333; font-size:12px;
	font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
}
#testIframe {margin-left: 10px;}
 </style>
 <style type="text/css">  
    div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}  
    div#rMenu a{  
        cursor: pointer;  
        list-style: none outside none;  
    }  
</style>  
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<title>菜单管理</title>
 <SCRIPT type="text/javascript" >
 // 用于配置ztree属性，方法
	var zTree;
	var demoIframe;
	var setting = {
		view: {
			addHoverDom: false,//鼠标移动到节点上
			removeHoverDom: false,//鼠标移出节点上
			//dblClickExpand: dblClickExpand,//鼠标点击事件
			selectedMulti: false,//禁止复选
			expandSpeed : "normal", //设置 zTree节点展开、折叠时的动画速度或取消动画(三种默认定义："slow", "normal", "fast")或 表示动画时长的毫秒数值(如：1000)   
	        showLine : true //是否显示节点间的连线  
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			onClick: zTreeOnClick ,
			onRightClick : onRightClick
		}
	};
	
	var zNodes =  ${requestScope.ztree};

	//用于初始化树插件
	$(document).ready(function(){
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);//用于加载树插件
		demoIframe = $("#testIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));

	});

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	};

	//单击事件，当点击每一个节点时执行该函数
	function zTreeOnClick(event, treeId, treeNode ) {
	    $("#menuId").val(treeNode.id);//设置当前节点的菜单编码
	    $("#menuName").val(treeNode.name);//设置当前节点的菜单名称
	    $("#upperMenuId").val(treeNode.pId);//设置当前节点的菜单名称
	    $("#upperMenuName").val(treeNode.getParentNode().name);//设置当前节点的菜单名称
	};
	
	//鼠标右键事件
	function onRightClick(event, treeId, treeNode){
		alert(event.clientX+"-"+event.clientY)
		if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {  
	        showRMenu("root", event.clientX, event.clientY);  
	    } else if (treeNode && !treeNode.noR) {  
	        showRMenu("node", event.clientX, event.clientY);  
	    }  
	}
	
	//显示右键菜单  
	function showRMenu(type, x, y) {  
	    $("#rMenu ul").show(); //如果元素被隐藏，则显示出来 
	    alert("123");
	    rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"}); //设置右键菜单的位置、可见  
	    $("body").bind("mousedown", onBodyMouseDown);  
	}  
	//隐藏右键菜单  
	function hideRMenu() {  
	    if (rMenu) rMenu.css({"visibility": "hidden"}); //设置右键菜单不可见  
	    $("body").unbind("mousedown", onBodyMouseDown); //unbind取消绑定的onBodyMouseDown事件 
	}  
	//鼠标按下事件  
	function onBodyMouseDown(event){  
		alert("按下");
	    if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {  
	        rMenu.css({"visibility" : "hidden"});  
	    }  
	}  
	//展开下一级子节点  
	function expand(){  
	    hideRMenu();  
	    var selectNodes = zTree.getSelectedNodes();  
	    zTree.expandNode(selectNodes[0], true, null, null);  
	}  
	//展开所有子节点  
	function expandSon(){  
	    hideRMenu();  
	    var selectNodes = zTree.getSelectedNodes();  
	    zTree.expandNode(selectNodes[0], true, true, null);  
	}  
	//折叠子节点  
	function collapse(){  
	    hideRMenu();  
	    var selectNodes = zTree.getSelectedNodes();  
	  
	    zTree.expandNode(selectNodes[0], false, null, null);  
	}  
	//全部展开  
	function expandAll(){  
	    hideRMenu();  
	    zTree.expandAll(true);  
	}  
	//全部折叠  
	function collapseAll(){  
	    hideRMenu();  
	    zTree.expandAll(false);  
	} 
	
	
	
</SCRIPT>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
		<div id="rMenu">  
		    <a href="#" class="list-group-item" onclick="expand();">展开下一级</a>  
		    <a href="#" class="list-group-item" onclick="expandSon();">展开所有子节点</a>  
		    <a href="#" class="list-group-item" onclick="collapse();">折叠子节点</a>  
		    <a href="#" class="list-group-item" onclick="expandAll();">全部展开</a>  
		    <a href="#" class="list-group-item" onclick="collapseAll();">全部折叠</a>  
		</div> 
			<table>
				<TR>
					<TD width=260px align=left valign=top style="BORDER-RIGHT: #999999 1px dashed">
						<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
					</TD>
				</TR>
			</table>
		</div>
		<div class="col-md-8">
			<form class="form-horizontal">
				<div class="col-md-6">
					<div class="control-group">
						 <label class="control-label" >菜单编码</label>
						<div class="controls">
							<input id="menuId" type="text" readonly="readonly" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="control-group">
						 <label class="control-label" >菜单名称(可修改)</label>
						<div class="controls">
							<input id="menuName" type="text" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="control-group">
						 <label class="control-label" >上级菜单编码</label>
						<div class="controls">
							<input id="upperMenuId" type="text" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="control-group">
						 <label class="control-label" >上级菜单名称</label>
						<div class="controls">
							<input id="upperMenuName" type="text" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="col-md-3">
				</div>
				<div class="col-md-3">
					<div class="control-group">
					<div class="controls">
						 <button type="submit" class="btn">xx</button>
					</div>
				</div>
				</div>
				<div class="col-md-3">
				</div>
				
			</form>
		</div>
	</div>
</div>
</body>
</html>