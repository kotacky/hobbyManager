<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�D�ݓo�^</title>
</head>
<body>
<H1>�D�ݓo�^</H1>
<% //C�֓o�^��������𑗂� %>
<form method="POST" action="<%=request.getContextPath() %>/G0051Control">
�Ј�ID:
<input type="text" name="employee_id"><br>
���DID:
<input type="text" name="actress_id"><br>
�������ID:
<input type="text" name="company_id"><br>
�D��ID:
<input type="text" name="employee_id"><br>

<input type=submit value="�o�^">
</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>