<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
    <%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�D�ݓo�^</title>
</head>
<body>
<H1>�D�ݓo�^</H1>
<% //C�֓o�^��������𑗂� %>
<form method="POST"name="Myform" action="<%=request.getContextPath() %>/G0051Control">
�Ј�ID:
<input type="text" name="employeeId"><br>
���DID:
<input type="text" name="actressId"><br>
���D���F

<!-- ���D����o�^�̂��߂ɑI�� -->

<%
	List<HashMap<String, String>> conpanyList = (List<HashMap<String, String>>)request.getAttribute("conpanyList");
	String[] pul = null;
	if (conpanyList == null) {
		pul = new String[0];
	} else {
		pul = new String[conpanyList.size()];
	}
%>

<SELECT NAME="lang">
<option>
	<% for(int i = 0 ;i<conpanyList.size(); i++){ %>
		<option value="<%= conpanyList.get(i).get("conpanyId") %>">
		<% out.println(conpanyList.get(i).get("conpanyName")); %>
	<% } %>
</option>


</SELECT>




�D��ID:
<input type="text" name="employee_id"><br>

<input type=submit value="�o�^">
</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>