<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>好み登録</title>
</head>
<body>
<h1>好み登録</h1>
<% //Cへ登録する条件を送る %>
<form method="POST"name="Myform" action="<%=request.getContextPath() %>/G0051Control">
	社員ID:
	<input type="text" name="employeeId"><br>
	女優ID:
	<input type="text" name="actressId"><br>

<!-- 女優名を登録のために選択 -->

<%
	List<HashMap<String, String>> conpanyList = (List<HashMap<String, String>>)request.getAttribute("conpanyList");
	String[] pul = null;
	if (conpanyList == null) {
		pul = new String[0];
	} else {
		pul = new String[conpanyList.size()];
	}
%>

<SELECT NAME="lang">
	<option>
		<% for(int i = 0 ;i<conpanyList.size(); i++){ %>
			<option value="<%= conpanyList.get(i).get("conpanyId") %>">
			<% out.println(conpanyList.get(i).get("conpanyName")); %>
		<% } %>
	</option>
</SELECT>

<%-- チェックボックスにリストを入れて表示 --%>

<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;
	if (columnContentsList == null) {
		pul = new String[0];
	} else {
		pul = new String[columnContentsList.size()];
	}
%>

<% if(columnContentsList != null){ %>
	<% for(int i = 0; i < columnContentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columnContentsList.get(i).get("contentsId") %>" />
		<%  out.print(columnContentsList.get(i).get("contentsName")); %>
	<% } %>
<% } %>

<input type="submit" value="登録">
</form>
<%-- メニュー画面に戻る処理 --%>
<input type="button" value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>