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

		<script language="JavaScript">

			// �`�F�b�N�{�b�N�X�Ɏg�p���Ă��閼�O
			chn = new Array("ch1","ch2","ch3","ch4","ch5","ch6");
			 chc = 3; // �`�F�b�N�ł��鐔

			// �`�F�b�N�{�b�N�X�Ƀ`�F�b�N�ł��鐔�𐧌�����
			function chBx(cn){
			   cnt = 0;
			   for(i=0; i<chn.length; i++) {
			     if(document.Myform.elements[chn[i]].checked) cnt++;
			   }

			   if(cnt > chc) {
			     alert("�`�F�b�N�ł��鍀�ڂ�" + chc + "�܂łł�");
			     document.Myform.elements[cn].checked = false;
				   }
				}
		</script>
	</head>
<body>
	<h1>���D�V�K�o�^</h1>
<%--C�֓o�^��������𑗂� --%>

<% List<HashMap<String, String>> conpanyList = (List<HashMap<String, String>>)request.getAttribute("conpanyList"); %>
<% String[] sel = new String[conpanyList.size()]; %>

	<form method="Post" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		���DID:
		<input type="text" name="actress_id"><br>
		���E��:
		<input type="text" name="actress_family_name"><br>

<!-- ��Ђ�o�^�̂��߂ɑI�� -->

<SELECT NAME="lang" SIZE="3" MULTIPLE="true">
	<option>
	<% for(int i = 0 ;i<companyList.size(); i++){ %>
	<option value="<%=companyList.get(i).get("companyList") %>">
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

		<% } %>
<% } %>

<% if(conpanyList != null){ %>
	<% for(int i = 0; i < conpanyList.size(); i++){ %>
		<input type="checkbox" name="conpanyList" value="<% out.print(conpanyList.get(i).get("conpanyId")); %>" onClick="chbx('ch1	')" />

	<% } %>
<% } %>

<input type=submit value="�o�^">
	</form>


<!-- ���j���[��ʂɖ߂鏈�� -->
		<input type=button value="�߂�" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>

