<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�Ј��o�^</title>
		<style>
		*{
		text-align : center;
		}
		</style>
	</head>
<body>
<h1>�Ј��V�K�o�^</h1>
<%-- C�֓o�^��������𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
		�Ј�ID:
		<input type="text" name="employeeId" placeholder="�Ј�ID"><br>
		��:
		<input type="text" name="employeeFamilyName" placeholder="��"><br>
		��:
		<input type="text" name="employeeFirstName" placeholder="��"><br>
		���N����:
		<input type="text" name="birthDate" placeholder="���N����"><br>
		<input type=submit value="�o�^" >
	</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
