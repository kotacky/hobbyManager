<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>���D�o�^</title>
				<style>
			*{
				text-align : center;
			}
		</style>
	</head>
<body>
	<h1>���D�V�K�o�^</h1>
<%--C�֓o�^��������𑗂� --%>

	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		���DID:
		<input type="text" name="actressId"><br>
		���E��:
		<input type="text" name="actressName"><br>

<!-- ��Ђ�o�^�̂��߂ɑI�� -->

<h2>��Ђ�I��ł��������B</h2>

<%
	List<HashMap<String, String>> columnCompanyList = (List<HashMap<String, String>>)request.getAttribute("columnCompanyList");
%>

<SELECT name="companyId">
	<% for(int i = 0 ;i<columnCompanyList.size(); i++){ %>
	<option value="<%= columnCompanyList.get(i).get("companyId") %>">
	<%  out.print(columnCompanyList.get(i).get("companyName")); %>
	<% } %>
</SELECT>



<%
	List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
	String[] check = null;
		if (columnContentsList == null) {
			check = new String[0];
		} else {
			check = new String[columnContentsList.size()];
		}
%>

<h2>�R���e���c��I��ł��������B</h2>

<% if(columnContentsList != null){ %>

	<% for(int i = 0; i < columnContentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columnContentsList.get(i).get("contentsId") %>" />
		<%  out.print(columnContentsList.get(i).get("contentsName")); %>

	<% } %>
<% } %>

		<input type="submit" value="�o�^">
	</form>


<!-- ���j���[��ʂɖ߂鏈�� -->
		<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>
