<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>������Гo�^</title>
			<style>
				*{
					text-align : center;
				}
			</style>
	</head>
<body>
<h1>������Гo�^</h1>
<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0031Control">
		�������ID:
		<input type="text" name="company_id"><br>
		��Ж�:
		<input type="text" name="company_name"><br>
		�Z��:
		<input type="text" name="company_address"><br>
		<input type=submit value="�o�^">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>