<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>女優登録</title>
				<style>
			*{
				text-align : center;
			}
		</style>
	</head>
<body>
	<h1>女優新規登録</h1>
<%--Cへ登録する条件を送る --%>

	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0020Control">
		女優ID:
		<input type="text" name="actressId"><br>
		姓・名:
		<input type="text" name="actressName"><br>

<!-- 会社を登録のために選択 -->

<%
	List<HashMap<String, String>> columncompanyList = (List<HashMap<String, String>>)request.getAttribute("columncompanyList");%>


<SELECT NAME="lang">
<option>
<% for(int i = 0 ;i<columncompanyList.size(); i++){ %>
<option value="<%= columncompanyList.get(i).get("companyName") %>">
<% } %>


</SELECT>



<br><br><br>
コンテンツ


<!-- コンテンツを登録のために3つ選択 -->

<p>選択肢から3つ選択してください。<br />
コンテンツは登録から新しく登録することが出来ます</p>

<%


	List<HashMap<String, String>> columncontentsList = (List<HashMap<String, String>>)request.getAttribute("columncontentsList");
	String[] check = null;
		if (columncontentsList == null) {
			check = new String[0];
		} else {
			check = new String[columncontentsList.size()];
		}
%>

<% if(columncontentsList != null){ %>

	<% for(int i = 0; i < columncontentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columncontentsList.get(i).get("contentsId") %>" />
		<%  out.print(columncontentsList.get(i).get("contentesName")); %>

	<% } %>
<% } %>

		<input type=submit value="登録">
	</form>


<!-- メニュー画面に戻る処理 -->
		<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>
