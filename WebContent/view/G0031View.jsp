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
<%-- ���b�Z�[�W�̕\�� --%>
	<% try{ %>
		<% int insertFlag = Integer.parseInt(request.getParameter("insertFlag")); %>
			<% if(insertFlag == 1){ %>
			<H2><% out.print("�o�^���������܂����B"); %></H2>
			<% }else{ %>
			<H2><% out.print("�o�^�Ɏ��s���܂����B"); %></H2>
			<% } %>
	<% }catch(NumberFormatException e){ %>
	<% } %>
<h1>������Гo�^</h1>
<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0031Control">
		�������ID:
		<input type="text" name="companyId" placeholder="�������ID"><br>
		��Ж�:
		<input type="text" name="companyName" placeholder="��Ж�"><br>
		�Z��:
		<input type="text" name="companyAddress" placeholder="�Z��"><br>
		<input type=submit value="�o�^">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type=button value="���j���["     onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type=button value="�����ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0030View.jsp'">
	<input type=button value="���D�ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>