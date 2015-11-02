<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J" />
		<title>新人DB - Login</title>
		<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
		<script>
		 function func(MyCommand){
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }

		function init() {
			if (document.MyForm.employeeId.value == "null") {
				document.MyForm.employeeId.value = "";
			}
			if (document.MyForm.employeePassword.value == "null") {
				document.MyForm.employeePassword.value = "";
			}
		}
		 </script>
	 </head>

	<body onload="init();">
		<div id="wrapper">
			<div id="headerBg" class="clearfix">
				<div id="header">
					<h1>2015年度新人研修<br />好きな女優を管理してみよう</h1>
					<ul id="gNavi" class="clearfix">
					<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0000Control">
						社員ID:
						<input type="text" id="employeeId" name="employeeId" placeholder="社員ID"  style="text-align: left;">
						パスワード:
						<input type="password" id="employeePassword" name="employeePassword" placeholder="パスワード" style="text-align: left; ">
						<input type="button" value="ログイン" onClick="func('login');"/>
						<input type="hidden" name="employeeAuthority">
						<input type="hidden" name="processDiv">
					</form>
					<div style = "color:RED;">
					<% try{ %>
					<% String loginFlag = request.getAttribute("loginFlag").toString(); %>
					<% if("0".equals(loginFlag)){ %>
					<% String message = (String)request.getAttribute("message");%>
					<%= message %>
					<% }%>
					<% }catch(NullPointerException deleteException){ %>
					<% } %>
					</div>
					</ul>

				</div>
			</div>
			<div id="mainImgBox">
				<img src="<%= request.getContextPath() %>/view/img/mainimg.jpg" alt="TOP画像" />
			</div>
			<div id="footer">
				<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
