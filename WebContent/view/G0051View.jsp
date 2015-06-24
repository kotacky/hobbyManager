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
	List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");

%>

<SELECT name="employeeId">
	<% for(int i = 0 ;i<employeeList.size(); i++){ %>
	<option value="<%= employeeList.get(i).get("employeeId") %>">
	<%  out.print(employeeList.get(i).get("employeeFamilyName") + employeeList.get(i).get("employeeFirstName")); %>
	<% } %>
</SELECT>

<%
	List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("actressList");

%>

<SELECT name="actressId">
	<% for(int i = 0 ;i<actressList.size(); i++){ %>
	<option value="<%= actressList.get(i).get("actressId") %>">
	<%  out.print(actressList.get(i).get("actressName")); %>
	<% } %>
</SELECT>

<%-- チェックボックスにリストを入れて表示 --%>

<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;

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