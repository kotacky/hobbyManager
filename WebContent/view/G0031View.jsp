<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>所属会社登録</title>
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
<%-- メッセージの表示 --%>
	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("登録が完了しました。"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("登録が失敗しました。"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>
<h1>所属会社登録</h1>
<% //Cへ登録する条件を送る %>
	<form method="POST" action="<%=request.getContextPath() %>/G0031Control">
		所属会社ID:
		<input type="text" name="companyId" placeholder="所属会社ID"><br>
		会社名:
		<input type="text" name="companyName" placeholder="会社名"><br>
		住所:
		<input type="text" name="companyAddress" placeholder="住所"><br>
		<input type=submit value="登録">
	</form>
	<%-- メニュー画面に戻る処理 --%>
	<input type=button value="メニュー"     onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type=button value="所属一覧" onClick="form.action=location.href='../../hobbyManager/view/G0030View.jsp'">
	<input type=button value="女優一覧" onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>