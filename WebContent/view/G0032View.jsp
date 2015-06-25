
<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>更新画面</title>
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
	<h1>更新情報入力</h1>
	<div id="header">
			<ul id="gNavi" class="clearfix">
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">好み一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">コンテンツ一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
			</ul>
		</div>
	<%-- リストの取得 --%>
	<%
		//HashMap<String,String> companyList = new HashMap<String,String>();
			//companyList.put("companyId", "201");
			//companyList.put("companyName", "ホリプロ");
			//companyList.put("companyAddress", "東京");
	%>

<% List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList"); %>

	<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0032Control">
		所属会社ID:
		<input type="text" name="companyId" readonly value=<% out.print(companyList.get(0).get("companyId")); %>><br>
		会社名:
		<input type="text" name="companyName" value=<% out.print(companyList.get(0).get("companyName")); %>><br>
		住所:
		<input type="text" name="companyAddress" value=<% out.print(companyList.get(0).get("companyAddress")); %>><br>
		<input type="submit" value="更新">
	</form>
	<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>