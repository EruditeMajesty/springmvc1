<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>XX管理系统菜单</title>
<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(${ctx}/images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<div id="left-top">
	<div><img src="${ctx}/images/main/member.gif" width="44" height="44" /></div>
    <span>用户：${user.id}<br>角色：${user.userName}</span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
   		<c:forEach items="${LeftMenuList2}" var="menuList2" varStatus="menuListStatus2">
   			<div class="collapsed">
        		<span>${menuList2.menuName}</span>
        			<c:forEach items="${LeftMenuList3}" var="menuList3" varStatus="menuListStatus3">
        				 <c:if test="${menuList3.upperMenuId == menuList2.menuId}">
        					<a href="${menuList3.menuLocation}" target="mainFrame" onFocus="this.blur()">${menuList3.menuName}</a>
        				</c:if> 
					</c:forEach>
        	</div>
		</c:forEach>
    </div>
</body>
</html>