<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>�V�lDB - �Ј��ꗗ</title>
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
<%-- ���b�Z�[�W�̕\�� --%>

		<% try{ %>
			<% int insertFlag = Integer.parseInt(request.getParameter("insertFlag")); %>
				<% if(insertFlag == 1){ %>
				<H2><% out.print("�X�V���������܂����B"); %></H2>
				<% }else { %>
				<H2><% out.print("�o�^�����s���܂����B"); %></H2>
				<% } %>
			<% int updateFlag = Integer.parseInt(request.getParameter("updateFlag")); %>
				<% if(updateFlag == 1){ %>
				<H2><% out.print("�X�V���������܂����B"); %></H2>
				<% }else { %>
				<H2><% out.print("�X�V�����s���܂����B"); %></H2>
				<% } %>
			<% int deleteFlag = Integer.parseInt(request.getParameter("deletefFlag")); %>
				<% if(deleteFlag == 1){ %>
				<H2><% out.print("�폜���������܂����B"); %></H2>
				<% }else { %>
				<H2><% out.print("�폜�����s���܂����B"); %></H2>
				<% } %>
		<% }catch(NumberFormatException e){ %>
		<% } %>

<%-- ���X�g�̎擾 --%>
<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String disabled = "disabled";
if(employeeList != null){
     disabled = "";
}
%>

		<h1>�Ј��ꗗ</h1>
		<%-- C�֌�����������𑗂� --%>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0010Control">
			�Ј�ID:
			<input type="text" name="employeeId" placeholder="�Ј�ID"  style="text-align: left;"><br>
			��:
			<input type="text" name="employeeFamilyName" placeholder="��"  style="text-align: left; "><br>
			��:
			<input type="text" name="employeeFirstName" placeholder="��"  style="text-align: left; "><br>
			<input type="button" value="����" onClick="func('select');" />
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- �e�[�u���̕\��--%>
<% if(employeeList != null){ %>
			<table width="300" border="1" align="center">
				<Tr>
					<Th>�I��</Th>
					<Th>�Ј�ID</Th>
					<Th>��</Th>
					<Th>��</Th>
					<Th>���N����</Th>
				</Tr>
	<% for(int i = 0; i < employeeList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= employeeList.get(i).get("employeeId") %>"></Th>
					<Th><% out.print(employeeList.get(i).get("employeeId")); %></Th>
					<Th><% out.print(employeeList.get(i).get("employeeFamilyName")); %></Th>
					<Th><% out.print(employeeList.get(i).get("employeeFirstName")); %></Th>
					<Th><% out.print(employeeList.get(i).get("birthDate")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type=button value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp'">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>
