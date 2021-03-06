<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ page import = "jp.co.wiss1.model.G0000Model" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J" />
		<title>新人DB - TOP</title>
		<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/viw/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
	</head>

	<body>
		<div id="wrapper">
			<div id="header">
				<h1>2015年度新人研修<br />好きな女優を管理してみよう</h1>
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
			<div id="mainImgBox">
				<img src="<%= request.getContextPath() %>/view/img/mainimg.jpg" alt="TOP画像" />
			</div>
			<% int loginFlag = G0000Model.getLogin("employeeId", "hashedPassword"); %>


			<div id="footer">
				<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
			</div>
		</div>
	<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</body>
</html>
