<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>新人DB - 更新画面</title>
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
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

<h1>更新情報入力</h1>
<%
//	ダミー用データ
//	HashMap<String,String> contentsList = new HashMap<String,String>();
//		contentsList.put("contentsId", "601");
//		contentsList.put("contentsName", "八重の桜");
//		contentsList.put("summary", "大河ドラマ");

	%>

	<p><strong>更新する情報を入力してください。</strong></p>

	<%-- リストの取得 --%>

<%
	List<HashMap<String, String>> musicList = (List<HashMap<String, String>>)request.getAttribute("musicList");
%>

<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0122Control">
		楽曲ID:
		<input type="text" name="musicId" readonly value=<% out.print(musicList.get(0).get("musicId")); %> style="text-align: left;" required>（必須）<br>
		楽曲名:
		<input type="text" name="musicName" value=<% out.print(musicList.get(0).get("musicName")); %> style="text-align: left;" required>（必須）<br>
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
		<input type="submit" value="更新">
	</form>
</body>
</html>