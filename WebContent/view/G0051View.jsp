<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>好み登録</title>
</head>
<body>
<H1>好み登録</H1>
<% //Cへ登録する条件を送る %>
<form method="POST" action="<%=request.getContextPath() %>/G0051Control">
社員ID:
<input type="text" name="employee_id"><br>
女優ID:
<input type="text" name="actress_id"><br>
所属会社ID:
<input type="text" name="company_id"><br>
好みID:
<input type="text" name="employee_id"><br>

<input type=submit value="登録">
</form>
<%-- メニュー画面に戻る処理 --%>
<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>