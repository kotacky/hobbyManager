<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 楽曲登録</title>
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>

		</ul>
	</div>

	<h1>楽曲新規登録</h1>

<%--Cへ登録する条件を送る --%>
	<form method="POST" name="myForm" action="<%=request.getContextPath() %>/G0121Control">
		楽曲ID:
		<input type="text" name="musicId"  placeholder="11XX" style="text-align: left;" required>（必須）<br>
		楽曲名:
		<input type="text" name="musicName"  placeholder="楽曲名" style="text-align: left;" required>（必須）<br>

<!-- 会社を登録のために選択 -->
<h2>アーティストを選んでください。</h2>

<%
	List<HashMap<String, String>> columnArtistList = (List<HashMap<String, String>>)request.getAttribute("columnArtistList");
%>

<SELECT name="artistId">
	<% for(int i = 0 ;i<columnArtistList.size(); i++){ %>
	<option value="<%= columnArtistList.get(i).get("artistId") %>">
	<%  out.print(columnArtistList.get(i).get("artistName")); %>
	<% } %>
</SELECT>
		<input type="submit" value="登録">
	</form>
</body>
</html>