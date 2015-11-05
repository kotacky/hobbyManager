<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 女優登録</title>
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
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>女優新規登録</h1>

<%--Cへ登録する条件を送る --%>
	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		女優ID:
		<input type="text" name="actressId"  placeholder="女優ID" style="text-align: left;" required>（必須）<br>
		女優名:
		<input type="text" name="actressName"  placeholder="女優名" style="text-align: left;" required>（必須）<br>
		生年月日:
		<input type="text" name="birthDate"  placeholder="生年月日" style="text-align: left;"><br>
		血液型:
		<input type="text" name="bloodType"  placeholder="血液型" style="text-align: left;"><br>
		出身地:
		<input type="text" name="birthPlace"  placeholder="出身地" style="text-align: left;"><br>

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
	List<HashMap<String, String>> columnMagazineList = (List<HashMap<String, String>>)request.getAttribute("columnMagazineList");
String[] check = null;
if (columnMagazineList == null) {
	check = new String[0];
} else {
	check = new String[columnMagazineList.size()];
}
%>

<h2>表紙を飾った雑誌を選んでください。（必須）</h2>

<% if(columnMagazineList != null){ %>

	<% for(int i = 0; i < columnMagazineList.size(); i++){ %>
		<label>
			<input type="checkBox" name="magazineList" value="<%= columnMagazineList.get(i).get("magazineId") %>" required/>
			<%  out.print(columnMagazineList.get(i).get("magazineName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnDramaList = (List<HashMap<String, String>>)request.getAttribute("columnDramaList");
		check = null;
		if (columnDramaList == null) {
			check = new String[0];
		} else {
			check = new String[columnDramaList.size()];
		}
%>

<h2>出演ドラマを選んでください。（必須）</h2>

<% if(columnDramaList != null){ %>

	<% for(int i = 0; i < columnDramaList.size(); i++){ %>
		<label>
			<input type="checkBox" name="dramaList" value="<%= columnDramaList.get(i).get("dramaId") %>" required/>
			<%  out.print(columnDramaList.get(i).get("dramaName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnMovieList = (List<HashMap<String, String>>)request.getAttribute("columnMovieList");
		check = null;
		if (columnMovieList == null) {
			check = new String[0];
		} else {
			check = new String[columnMovieList.size()];
		}
%>

<h2>出演映画を選んでください。（必須）</h2>

<% if(columnMovieList != null){ %>

	<% for(int i = 0; i < columnMovieList.size(); i++){ %>
		<label>
			<input type="checkBox" name="movieList" value="<%= columnMovieList.get(i).get("movieId") %>" required/>
			<%  out.print(columnMovieList.get(i).get("movieName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnCommercialList = (List<HashMap<String, String>>)request.getAttribute("columnCommercialList");
		check = null;
		if (columnCommercialList == null) {
			check = new String[0];
		} else {
			check = new String[columnCommercialList.size()];
		}
%>

<h2>出演ＣＭを選んでください。（必須）</h2>

<% if(columnCommercialList != null){ %>

	<% for(int i = 0; i < columnCommercialList.size(); i++){ %>
		<label>
			<input type="checkBox" name="commercialList" value="<%= columnCommercialList.get(i).get("commercialId") %>" required/>
			<%  out.print(columnCommercialList.get(i).get("commercialName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

		<input type="submit" value="登録">
	</form>
</body>
</html>