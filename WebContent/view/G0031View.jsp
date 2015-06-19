<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>所属会社登録</title>
			<style>
				*{
					text-align : center;
				}
			</style>
	</head>
<body>
<h1>所属会社登録</h1>
<% //Cへ登録する条件を送る %>
	<form method="POST" action="<%=request.getContextPath() %>/G0031Control">
		所属会社ID:
		<input type="text" name="company_id"><br>
		会社名:
		<input type="text" name="company_name"><br>
		住所:
		<input type="text" name="company_address"><br>
		<input type=submit value="登録">
	</form>
	<%-- メニュー画面に戻る処理 --%>
	<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>