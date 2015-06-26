<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 好み登録</title>
	<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
</head>
<body>
	<div id="header">
		<ul id="gNavi" class="clearfix">
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">好み一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">コンテンツ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
		</ul>
	</div>

	<h1>好み登録</h1>

<% //Cへ登録する条件を送る %>
	<form method="POST"name="MyForm" action="<%=request.getContextPath() %>/G0051Control">

<!-- 女優名を登録のために選択 -->
		社員名:
	<%
		List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");

	%>

	<SELECT name="employeeId">
		<% for(int i = 0 ;i<employeeList.size(); i++){ %>
		<option value="<%= employeeList.get(i).get("employeeId") %>">
		<%  out.print(employeeList.get(i).get("employeeFamilyName") + employeeList.get(i).get("employeeFirstName")); %>
		<% } %>
	</SELECT><br>

		女優名:
	<%
		List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("actressList");

	%>

	<SELECT name="actressId">
		<% for(int i = 0 ;i<actressList.size(); i++){ %>
		<option value="<%= actressList.get(i).get("actressId") %>">
		<%  out.print(actressList.get(i).get("actressName")); %>
		<% } %>
	</SELECT><br>



		<input type="submit" value="登録"  />
	</form>
</body>
</html>