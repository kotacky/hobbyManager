<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>���D�o�^</title>
		<link rel="stylesheet" href="view.css">
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

<%
	List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList");
	String[] sel = null;
	if (companyList == null) {
		sel = new String[0];
	} else {
		sel = new String[companyList.size()];
	}
%>

<SELECT NAME="lang">
<option>
<% for(int i = 0 ;i<companyList.size(); i++){ %>
<option value="<%= companyList.get(i).get("companyList") %>">
<% } %>
<option value="sel1">�z���v��
<option value="sel2">�t�H�X�^�[
<option value="sel3">Sweet Power
<option value="sel4">FLaMme
<option value="sel5">���c���o
<option value="sel6">�z���v��
<option value="sel7">���v���G���^�[�e�C�����g
<option value="sel8">�X�^�[�_�X�g�v�����[�V����
<option value="sel9">�I�X�J�[

</SELECT>

<input type="hidden" name="hidden1">

<br><br><br>
�R���e���c


<!-- �R���e���c��o�^�̂��߂�3�I�� -->

<p>�I��������3�I�����Ă��������B<br />
�R���e���c�͓o�^����V�����o�^���邱�Ƃ��o���܂�</p>

<%
//�_�~�[�̃f�[�^
//HashMap<String,String> actressList = new HashMap<String,String>();
	//actressList.put("actressId", "201");
	//actressList.put("actressName", "���� �͂邩");
	//actressList.put("companyName", "�z���v��");
	//actressList.put("companyAddress", "����");

	List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList");
	String[] check = null;
		if (contentsList == null) {
			check = new String[0];
		} else {
			check = new String[contentsList.size()];
		}
%>

<% if(contentsList != null){ %>

	<% for(int i = 0; i < contentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= contentsList.get(i).get("contentsId") %>" />
		<%  out.print(contentsList.get(i).get("contentesName")); %>

	<% } %>
<% } %>

		<input type=submit value="�o�^">
	</form>


<!-- ���j���[��ʂɖ߂鏈�� -->
		<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>

<!-- �R�~�b�g�e�X�g�@�z�΁@�ЎR -->