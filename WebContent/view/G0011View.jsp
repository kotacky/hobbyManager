<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>社員登録</title>
		<style>
		*{
		text-align : center;
		}
		</style>
	</head>
<body>
<h1>社員新規登録</h1>
<%-- Cへ登録する条件を送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
		社員ID:
		<input type="text" name="employeeId" placeholder="社員ID"><br>
		姓:
		<input type="text" name="employeeFamilyName" placeholder="姓"><br>
		名:
		<input type="text" name="employeeFirstName" placeholder="名"><br>
		生年月日:
		<input type="text" name="birthDate" placeholder="生年月日"><br>
		<input type=submit value="登録" >
	</form>
<%-- メニュー画面に戻る処理 --%>
<input type=button value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
