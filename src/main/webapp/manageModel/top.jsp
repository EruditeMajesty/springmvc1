<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>顶部</title>
<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function fncGoSubMenu(topMenuId) {
		parent.leftFrame.location.href = "${ctx}/menu/leftMenuList?upperMenuId=" + topMenuId; 
		/* showFirstLevelMenu(topMenuId);  */
	}
</script>
</head>
<!-- 
 禁止鼠标右键：oncontextmenu="return false"；

禁止选择：onselectstart="return false"；

禁止拖放：ondragstart="return false"；

禁止拷贝：oncopy=document.selection.empty() 。

禁止复制：oncopy = "return false"；

禁止保存：<noscript><iframe src="*.htm"></iframe></noscript>，放在head里面。

禁止粘贴：<input type=text onpaste="return false">

禁止剪贴：oncut = "return false"；

关闭输入法：<input style="ime-mode:disabled">
 -->
<body onselectstart="return false" oncontextmenu=return(false) style="overflow-x:hidden;">
<!--禁止网页另存为-->
<noscript><iframe scr="*.htm"></iframe></noscript>
<!--禁止网页另存为-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"><img src="${ctx}/images/main/logo.jpg" width="74" height="64"></td>
    <td align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="bottom" id="header-name">XX管理系统</td>
        <td align="right" valign="top" id="header-right">
        	<a href="index.jsp" target="topFrame" onFocus="this.blur()" class="admin-out">注销</a>
            <a href="index.jsp" target="top" onFocus="this.blur()" class="admin-home">管理首页</a>
        	<a href="index.jsp" target="index.jsp" onFocus="this.blur()" class="admin-index">网站首页</a>       	
            <span>
<%-- <!-- 日历 -->
<SCRIPT type=text/javascript src="${ctx}/js/clock.js"></SCRIPT>
<SCRIPT type=text/javascript>showcal();</SCRIPT> --%>
            </span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="bottom">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top" id="header-admin">管理系统</td>
        <td align="left" valign="bottom" id="header-menu">
        
       	<c:forEach items="${topMenuList}" var="menuList" varStatus="menuListStatus">
		<%-- <c:out value="${menuListStatus.current}"/> 当前对象
		<c:out value="${menuListStatus.index}"/> 此次迭代的索引
		<c:out value="${menuListStatus.count}"/> 已经迭代的数量
		<c:out value="${menuListStatus.first}"/> 是否是第一个迭代对象
		<c:out value="${menuListStatus.last}"/> 是否是最后一个迭代对象 --%>
      		  <a href="#" onclick="fncGoSubMenu('${menuList.menuId}')" onFocus="this.blur()" id="${menuList.menuId}">${menuList.menuName}</a>  
		</c:forEach>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>