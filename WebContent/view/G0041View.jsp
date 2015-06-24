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

	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("登録が完了しました。"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("登録が失敗しました。"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>

	<h1>コンテンツ登録</h1>

	<p><strong>コンテンツに関する情報を登録して下さい。</strong></p>

	<% //Cへ登録する条件を送る %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		コンテンツID:
		<input type="text" name="contentsId" placeholder="ID" style="text-align:left;"><br>
		コンテンツ名:
		<input type="text" name="contentsName" placeholder="コンテンツ名" style="text-align:left;"><br>
		放送局:
		<input type="text" name="broadCast" placeholder="放送局" style="text-align:left;"><br>
		<input type="submit" value="登録">
		</form>

	<%-- メニュー画面に戻る処理 --%>
	<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type="button" value="コンテンツ一覧" onClick="form.action=location.href='../../hobbyManager/view/G0040View.jsp'">
	<input type="button" value="女優一覧"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
