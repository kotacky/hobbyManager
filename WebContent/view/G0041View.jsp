<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�R���e���c�o�^</title>
		<style>
				*{
					text-align : center;
				}
		</style>
	</head>
<body>
	<h1>�R���e���c�o�^</h1>

	<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		�R���e���cID:
		<input type="text" name="contentsId" placeholder="ID" style="text-align:left;"><br>
		�R���e���c��:
		<input type="text" name="contentsName" placeholder="�R���e���c��" style="text-align:left;"><br>
		�T�v:
		<input type="text" name="summary" placeholder="�T�v" style="text-align:left;"><br>
		<input type=submit value="�o�^">
		</form>

	<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type=button value="���j���[�ɖ߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type=button value="�R���e���c�ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0040View.jsp'">
	<input type=button value="���D�ꗗ"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
