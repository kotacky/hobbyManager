<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 雑誌一覧更新画面</title>
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
		<ul id="gMenu" class="clearfix">
		  <li><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">トップ</a></li>
		  <li><a>基本メニュー</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
		    </ul>
		  </li>
		  <li><a>女優コンテンツ</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
		    </ul>
		  </li>
		  <li><a>所属・出演</a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
		      <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
		    </ul>
		  </li>
		  <li><a><% out.print(session.getAttribute("employeeFirstName")); %></a>
		    <ul>
		      <li><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
		    </ul>
		  </li>
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

<% List<HashMap<String, String>> magazineList = (List<HashMap<String, String>>)request.getAttribute("magazineList"); %>

<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0042Control">
		雑誌ID:
		<input type="text" name="magazineId" readonly value=<% out.print(magazineList.get(0).get("magazineId")); %> required>（必須）<br>
		雑誌名:
		<input type="text" name="magazineName" value=<% out.print(magazineList.get(0).get("magazineName")); %> required>（必須）<br>
		出版社:
		<input type="text" name="publisherName" value=<% out.print(magazineList.get(0).get("publisherName")); %>><br>
		<input type="submit" value="更新">
	</form>
</body>
</html>