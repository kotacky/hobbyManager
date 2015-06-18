<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>社員登録</title>
<style>
*{
text-align : center;
}
</style>
</head>
<body>
<H1>社員新規登録</H1>
<%-- Cへ登録する条件を送る --%>
<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
社員ID:
<input type="text" name="employeeId"><br>
姓:
<input type="text" name="employeeFamilyName"><br>
名:
<input type="text" name="employeeFirstName"><br>
生年月日:
<input type="text" name="birthDate"><br>
<input type=submit value="登録" >
</form>
<%-- メニュー画面に戻る処理 --%>
<input type=button value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
