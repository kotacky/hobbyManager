<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>������Јꗗ</title>
		<style>
			*{
				text-align : center;
			}
		</style>
		<script>
		 function func(MyCommand){
			 alert("start!:[" + MyCommand + "]");
			 document.MyForm.process.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- ���X�g�̎擾 --%>
<%
HashMap<String,String> companyList = new HashMap<String,String>();
	companyList.put("companyId", "301");
	companyList.put("companyName", "�z���v��");
	companyList.put("companyAddress", "����");
//List<HashMap<String,String>> companyList = (List<HashMap<String,String>>)request.getAttribute("CompanyList");
String disabled = "disabled";
if(companyList != null){
     disabled = "";
}
%>
		<h1>������Јꗗ</h1>
		<% //C�֌�����������𑗂� %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0030Control">
			�������ID:
			<input type="text" name="company_id" placeholder="���ID"  style="text-align: left;"><br>
			��Ж�:
			<input type="text" name="company_name" placeholder="��Ж�"  style="text-align: left;"><br>
			<input type=submit value="����" onClick="func('select');">
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- �e�[�u���̕\�� --%>
<%if(companyList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>�I��</Th>
					<Th>�������ID</Th>
					<Th>��Ж�</Th>
					<Th>�Z��</Th>
				</Tr>
	<% for(int i = 0 ;i<companyList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="id" value=<% companyList./*get(i).*/get("company_id"); %>></Th>
					<Th><%  out.print(companyList./*get(i).*/get("companyId")); %></Th>
					<Th><%  out.print(companyList./*get(i).*/get("companyName")); %></Th>
					<Th><%  out.print(companyList./*get(i).*/get("companyAddress")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="process">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type=button value="�V�K�o�^" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0031View.jsp';return true">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[��" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>