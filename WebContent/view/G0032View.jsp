
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
		HashMap<String,String> companyList = new HashMap<String,String>();
			companyList.put("companyId", "201");
			companyList.put("companyName", "�z���v��");
			companyList.put("companyAddress", "����");
	%>

<% //List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("CompanyList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0032Control">
		�������ID:
		<input type="text" name="company_id" disabled value=<% out.print(companyList./*get(0).*/get("companyId")); %>><br>
		��Ж�:
		<input type="text" name="company_name" value=<% out.print(companyList./*get(0).*/get("companyName")); %>><br>
		�Z��:
		<input type="text" name="company_address" value=<% out.print(companyList./*get(0).*/get("companyAddress")); %>><br>
		<input type=submit value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>