<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>好み登録</title>
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

<p><strong>好きなコンテンツを選んで下さい。</strong></p>

<%-- チェックボックスにリストを入れて表示 --%>

<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList");
	String[] check = null;
		if (columnContentsList == null) {
			check = new String[0];
		} else {
			check = new String[columnContentsList.size()];
		}
%>

<% if(columnContentsList != null){ %>

	<% for(int i = 0; i < columnContentsList.size(); i++){ %>
		<label>
		<input type="checkBox" name="contentsList" value="<%= columnContentsList.get(i).get("contentsId") %>" />
		<%  out.print(columnContentsList.get(i).get("contentsName")); %>
		</label>

	<% } %>
<% } %><br style="clear:both;">
	<input type="submit" value="登録"  />
</form>
<%-- メニュー画面に戻る処理 --%>
	<input type="button" value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>