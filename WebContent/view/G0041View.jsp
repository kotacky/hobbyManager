<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>コンテンツ登録</title>
		<style>
				*{
					text-align : center;
				}
		</style>
	</head>
<body>
	<h1>コンテンツ登録</h1>

	<% //Cへ登録する条件を送る %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		コンテンツID:
		<input type="text" name="contentsId" placeholder="ID" style="text-align:left;"><br>
		コンテンツ名:
		<input type="text" name="contentsName" placeholder="コンテンツ名" style="text-align:left;"><br>
		概要:
		<input type="text" name="summary" placeholder="概要" style="text-align:left;"><br>
		<input type=submit value="登録">
		</form>

	<%-- メニュー画面に戻る処理 --%>
	<input type=button value="メニューに戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type=button value="コンテンツ一覧" onClick="form.action=location.href='../../hobbyManager/view/G0040View.jsp'">
	<input type=button value="女優一覧"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
