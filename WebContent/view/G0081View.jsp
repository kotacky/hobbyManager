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
		<ul id="gMenu" class="clearfix">
		  <li><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">トップ</a></li>
		  <li><a>基本メニュー</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
		    </ul>
		  </li>
		  <li><a>女優コンテンツ</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
		    </ul>
		  </li>
		  <li><a>所属・出演</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
		    </ul>
		  </li>
		  <li><a><% out.print(session.getAttribute("employeeFirstName")); %></a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
		    </ul>
		  </li>
		</ul>
	</div>

	<h1>好み登録</h1>

<% //Cへ登録する条件を送る %>
	<form method="POST"name="myForm" action="<%=request.getContextPath() %>/G0081Control">

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