<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�h���}�E�f��o�^</title>
</head>
<body>
<H1>�h���}�E�f��o�^</H1>
<% //C�֓o�^��������𑗂� %>
<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
�h���}�E�f��ID:
<input type="text" name="contents__id"><br>
��i��:
<input type="text" name="contents_name"><br>
�h���}�E�f����:
<input type="text" name="summary"><br>
<input type=submit value="�o�^">
</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
