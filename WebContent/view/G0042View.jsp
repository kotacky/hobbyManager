<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�X�V���</title>
		<style>
			*{
			text-align : center;
			}
		</style>
	</head>

	<body>
	<h1>�X�V������</h1>
	<%
	//	�_�~�[�p�f�[�^
	//	HashMap<String,String> contentsList = new HashMap<String,String>();
	//		contentsList.put("contentsId", "601");
	//		contentsList.put("contentsName", "���d�̍�");
	//		contentsList.put("summary", "��̓h���}");

 	%>

 	<p><strong>�X�V���������͂��Ă��������B</strong></p>

 	<%-- ���X�g�̎擾 --%>

<% List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0042Control">
		�R���e���cID:
		<input type="text" name="contentsId" readonly value=<% out.print(contentsList.get(0).get("contentsId")); %>><br>
		�R���e���c��:
		<input type="text" name=contentsName value=<% out.print(contentsList.get(0).get("contentsName")); %>><br>
		������:
		<input type="text" name="broadCast" value=<% out.print(contentsList.get(0).get("broadCast")); %>><br>
		<input type="submit" value="�X�V">
	</form>

	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type="button" value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>