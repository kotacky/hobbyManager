<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�D�ݓo�^</title>
</head>
<body>
<h1>�D�ݓo�^</h1>
<% //C�֓o�^��������𑗂� %>
<form method="POST"name="Myform" action="<%=request.getContextPath() %>/G0051Control">
	�Ј�ID:
	<input type="text" name="employeeId"><br>
	���DID:
	<input type="text" name="actressId"><br>

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

<%-- �`�F�b�N�{�b�N�X�Ƀ��X�g�����ĕ\�� --%>

<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;
	if (columnContentsList == null) {
		pul = new String[0];
	} else {
		pul = new String[columnContentsList.size()];
	}
%>

<% if(columnContentsList != null){ %>
	<% for(int i = 0; i < columnContentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columnContentsList.get(i).get("contentsId") %>" />
		<%  out.print(columnContentsList.get(i).get("contentsName")); %>
	<% } %>
<% } %>

<input type="submit" value="�o�^">
</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
<input type="button" value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>