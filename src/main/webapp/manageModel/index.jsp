<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html>
<head>
<script type="text/javascript">
/* 如果当前窗口不是最上层窗口（比如是在Iframe中），
 * 那么就把自己变为最上层窗口。这可以防止别的网站把你自己的网站放在他的Iframe中，
 从而损害你的利益（因为会误导浏览者）。  
 */
  if (self != window.top) {
    window.top.location.href=self.location.href;
  }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link rel="shortcut icon" href="${ctx}/images/favicon.ico" />
<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
</head>
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="${ctx}/menu/topMenu" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
	<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame src="${ctx}/menu/leftMenuList?upperMenuId=${firstMenu}" id="leftFrame" name="leftFrame" scrolling="No" noresize="noresize"  title="leftFrame" />
		<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="${ctx}/menu/swich"></frame>
		<frame scrolling="auto" noresize="" border="0" name="mainFrame" src="${ctx}/menu/main"></frame>
	</frameset>
	<!--bottom样式-->
	<frame src="${ctx}/menu/bottom" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset><noframes></noframes>
</html>