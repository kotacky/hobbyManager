<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>DÝo^</title>
</head>
<body>
<H1>DÝo^</H1>
<% //CÖo^·éððé %>
<form method="POST" action="<%=request.getContextPath() %>/G0051Control">
ÐõID:
<input type="text" name="employee_id"><br>
DID:
<input type="text" name="actress_id"><br>
®ïÐID:
<input type="text" name="company_id"><br>
DÝID:
<input type="text" name="employee_id"><br>

<input type=submit value="o^">
</form>
<%-- j[æÊÉßé --%>
<input type=button value="ßé" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>