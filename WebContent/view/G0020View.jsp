<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>���D�ꗗ</title>
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
//HashMap<String,String> actressList = new HashMap<String,String>();
	//actressList.put("actressId", "201");
	//actressList.put("actressName", "���� �͂邩");
	//actressList.put("companyName", "�z���v��");
	//actressList.put("companyAddress", "����");
List<HashMap<String,String>> actressList = (List<HashMap<String,String>>)request.getAttribute("ActressList");
String disabled = "disabled";
if(actressList != null){
     disabled = "";
}
%>

		<h1>���D�ꗗ</h1>
		<%-- C�֌�����������𑗂� --%>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0020Control">
			���DID:
			<input type="text" name="actressId" placeholder="���DID"  style="text-align: left;"><br>
			���D��:
			<input type="text" name="actressName" placeholder="���D��"  style="text-align: left;"><br>
			<input type=submit value="����" onClick="func('select');">
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- �e�[�u���̕\�� --%>
<%if(actressList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>�I��</Th>
					<Th>���DID</Th>
					<Th>���D��</Th>
					<Th>������Ж�</Th>
					<Th>��ЏZ��</Th>
				</Tr>
	<% for(int i = 0 ;i<actressList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="id" value=<% actressList.get(i).get("actressId"); %>></Th>
					<Th><%  out.print(actressList.get(i).get("actressId")); %></Th>
					<Th><%  out.print(actressList.get(i).get("actressName")); %></Th>
					<Th><%  out.print(actressList.get(i).get("companyName")); %></Th>
					<Th><%  out.print(actressList.get(i).get("companyAddress")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="process">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type=button value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0021View.jsp'">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>