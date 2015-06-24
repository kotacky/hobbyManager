<%@ page contentType="text/html; charset=Windows-31J" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J" />
		<title></title>
		<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
	</head>

	<body>
		<div id="wrapper">
			<div id="headerBg" class="clearfix">
				<div id="header">
					<h1>2015年度新人研修<br />好きな女優を管理してみよう</h1>
					<ul id="gNavi" class="clearfix">
						<li><a href="G0050View.jsp" title="">好み一覧</a></li>
						<li><a href="G0040View.jsp" title="">コンテンツ一覧</a></li>
						<li><a href="G0020View.jsp" title="">女優一覧</a></li>
						<li><a href="G0030View.jsp" title="">所属会社一覧</a></li>
						<li class="firstItem"><a href="G0010View.jsp" title="">社員一覧</a></li>
					</ul>
				</div>
			</div>
			<div id="mainImgBox">
				<img src="./img/mainimg.jpg" alt="" />
			</div>
			<div id="footer">
				<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
