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
		HashMap<String,String> actressList = new HashMap<String,String>();
			actressList.put("actressId", "401");
			actressList.put("actressName", "���� �͂邩");
			actressList.put("companyName", "�z���v��");
			actressList.put("contentsName", "���d�̍�");
 %>

<% //List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("ActressList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0022Control">
		���DID:
		<input type="text" name="actress_id" disabled value=<% out.print(actressList./*get(0).*/get("actressId")); %>><br>
		���D��:
		<input type="text" name="actress_name" value=<% out.print(actressList./*get(0).*/get("actressName")); %>><br>
		��Ж�:
		<input type="text" name="company_name" value=<% out.print(actressList./*get(0).*/get("companyName")); %>><br>
		�o����i:
		<input type="text" name="contents_1" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type="text" name="contents_2" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type="text" name="contents_3" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type=submit value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>