<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>�X�V���</title>
		<style>
			*{
			text-align : center;
			}
		</style>
	</head>

	<body>
	<H1>�X�V������</H1>
	<%-- ���X�g�̎擾 --%>
	<%
		HashMap<String,String> contentsList = new HashMap<String,String>();
			contentsList.put("contentsId", "601");
			contentsList.put("contentsName", "���d�̍�");
			contentsList.put("summary", "��̓h���}");
 	%>

<% 	//List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("ContentsList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0042Control">
		�R���e���cID:
		<input type="text" name="contents_id" disabled value=<% out.print(contentsList./*get(0).*/get("contentsId")); %>><br>
		�R���e���c��:
		<input type="text" name=contents_name value=<% out.print(contentsList./*get(0).*/get("contentsName")); %>><br>
		�T�v:
		<input type="text" name="summary" value=<% out.print(contentsList./*get(0).*/get("summary")); %>><br>
		<input type=submit value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>