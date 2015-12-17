<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
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
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>
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

<% List<HashMap<String, String>> dramaList = (List<HashMap<String, String>>)request.getAttribute("dramaList"); %>

<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0052Control">
		ドラマID:
		<input type="text" name="dramaId" readonly value=<% out.print(dramaList.get(0).get("dramaId")); %> required>（必須）<br>
		ドラマ名:
		<input type="text" name="dramaName" value=<% out.print(dramaList.get(0).get("dramaName")); %> required>（必須）<br>
		放送クール:
		<input type="text" name="broadcastCool" value=<% out.print(dramaList.get(0).get("broadcastCool")); %>><br>
		放送局:
		<input type="text" name="television" value=<% out.print(dramaList.get(0).get("television")); %>><br>
		ジャンル:
		<input type="text" name="genre" value=<% out.print(dramaList.get(0).get("genre")); %>><br>
		<input type="submit" value="更新">
	</form>
</body>
</html>