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
		//HashMap<String,String> EmployeeList = new HashMap<String,String>();
			//EmployeeList.put("employeeId", "122");
			//EmployeeList.put("employeeFamilyname", "����");
			//EmployeeList.put("employeeFirstname", "��");
			//EmployeeList.put("birthDate", "19920811");
 	%>

<% List<HashMap<String, String>> EmployeeList = (List<HashMap<String, String>>)request.getAttribute("EmployeeList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0012Control">
		�Ј�ID:
		<input type="text" name="employeeId" readonly value=<% out.print(EmployeeList.get(0).get("employeeId")); %>><br>
		��:
		<input type="text" name="employeeFamilyName" value=<% out.print(EmployeeList.get(0).get("employeeFamilyname")); %>><br>
		��:
		<input type="text" name="employeeFirstName" value=<% out.print(EmployeeList.get(0).get("employeeFirstname")); %>><br>
		���N����:
		<input type="text" name="birthDate" value=<% out.print(EmployeeList.get(0).get("birthDate")); %>><br>
		<input type=submit value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>