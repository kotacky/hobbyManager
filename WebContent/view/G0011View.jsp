<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>Ðõo^</title>
<style>
*{
text-align : center;
}
</style>
</head>
<body>
<H1>ÐõVKo^</H1>
<%-- CÖo^·éððé --%>
<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
ÐõID:
<input type="text" name="employeeId"><br>
©:
<input type="text" name="employeeFamilyName"><br>
¼:
<input type="text" name="employeeFirstName"><br>
¶Nú:
<input type="text" name="birthDate"><br>
<input type=submit value="o^" >
</form>
<%-- j[æÊÉßé --%>
<input type=button value="j[w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
