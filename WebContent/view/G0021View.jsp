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

	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0020Control">
		���DID:
		<input type="text" name="actressId"><br>
		���E��:
		<input type="text" name="actressName"><br>

<!-- ��Ђ�o�^�̂��߂ɑI�� -->

<%
	List<HashMap<String, String>> columncompanyList = (List<HashMap<String, String>>)request.getAttribute("columncompanyList");%>


<SELECT NAME="lang">
<option>
<% for(int i = 0 ;i<columncompanyList.size(); i++){ %>
<option value="<%= columncompanyList.get(i).get("companyName") %>">
<% } %>


</SELECT>



<br><br><br>
�R���e���c


<!-- �R���e���c��o�^�̂��߂�3�I�� -->

<p>�I��������3�I�����Ă��������B<br />
�R���e���c�͓o�^����V�����o�^���邱�Ƃ��o���܂�</p>

<%


	List<HashMap<String, String>> columncontentsList = (List<HashMap<String, String>>)request.getAttribute("columncontentsList");
	String[] check = null;
		if (columncontentsList == null) {
			check = new String[0];
		} else {
			check = new String[columncontentsList.size()];
		}
%>

<% if(columncontentsList != null){ %>

	<% for(int i = 0; i < columncontentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columncontentsList.get(i).get("contentsId") %>" />
		<%  out.print(columncontentsList.get(i).get("contentesName")); %>

	<% } %>
<% } %>

		<input type=submit value="�o�^">
	</form>


<!-- ���j���[��ʂɖ߂鏈�� -->
		<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>
