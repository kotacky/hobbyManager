<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>®ïÐo^</title>
			<style>
				*{
					text-align : center;
				}
			</style>
	</head>
<body>
<h1>®ïÐo^</h1>
<% //CÖo^·éððé %>
	<form method="POST" action="<%=request.getContextPath() %>/G0031Control">
		®ïÐID:
		<input type="text" name="company_id"><br>
		ïÐ¼:
		<input type="text" name="company_name"><br>
		Z:
		<input type="text" name="company_address"><br>
		<input type=submit value="o^">
	</form>
	<%-- j[æÊÉßé --%>
	<input type=button value="ßé" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>