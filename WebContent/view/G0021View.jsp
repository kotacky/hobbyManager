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
	List<HashMap<String, String>> columnCompanyList = (List<HashMap<String, String>>)request.getAttribute("columnCompanyList");%>


<SELECT NAME="lang">
<option>
<% for(int i = 0 ;i<columnCompanyList.size(); i++){ %>
<option value="<%= columnCompanyList.get(i).get("companyName") %>">
<% } %>


</SELECT>



<br><br><br>
コンテンツ


<!-- コンテンツを登録のために3つ選択 -->

<p>選択肢から3つ選択してください。<br />
コンテンツは登録から新しく登録することが出来ます</p>

<%


	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;
		if (columnContentsList == null) {
			check = new String[0];
		} else {
			check = new String[columnContentsList.size()];
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


<!-- メニュー画面に戻る処理 -->
		<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>
