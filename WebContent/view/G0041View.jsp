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
	<H1>�R���e���c�o�^</H1>
	<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		�R���e���cID:
		<input type="text" name="contents__id"><br>
		�R���e���c��:
		<input type="text" name="contents_name"><br>
		�T�v:
		<input type="text" name="summary"><br>
		<input type=submit value="�o�^">
		</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type=button value="�߂�"           onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type=button value="�R���e���c�ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0030View.jsp'">
	<input type=button value="���D�ꗗ"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
