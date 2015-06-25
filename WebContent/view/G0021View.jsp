<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>女優登録</title>
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
				<li><a href="G0050View.jsp" title="">好み一覧</a></li>
				<li><a href="G0040View.jsp" title="">コンテンツ一覧</a></li>
				<li><a href="G0020View.jsp" title="">女優一覧</a></li>
				<li><a href="G0030View.jsp" title="">所属会社一覧</a></li>
				<li class="firstItem"><a href="G0010View.jsp" title="">社員一覧</a></li>
			</ul>
		</div>
	<h1>女優新規登録</h1>
<%--Cへ登録する条件を送る --%>

	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		女優ID:
		<input type="text" name="actressId"><br>
		姓・名:
		<input type="text" name="actressName"><br>

<!-- 会社を登録のために選択 -->

<h2>会社を選んでください。</h2>

<%
	List<HashMap<String, String>> columnCompanyList = (List<HashMap<String, String>>)request.getAttribute("columnCompanyList");
%>

<SELECT name="companyId">
	<% for(int i = 0 ;i<columnCompanyList.size(); i++){ %>
	<option value="<%= columnCompanyList.get(i).get("companyId") %>">
	<%  out.print(columnCompanyList.get(i).get("companyName")); %>
	<% } %>
</SELECT>



<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;
		if (columnContentsList == null) {
			check = new String[0];
		} else {
			check = new String[columnContentsList.size()];
		}
%>

<h2>コンテンツを選んでください。</h2>

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