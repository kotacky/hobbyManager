<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�D�݈ꗗ</title>
		<style>
			*{
				text-align : center;
			}
		</style>
		<script>
		 function func(MyCommand){
			 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- ���X�g�̎擾 --%>
<%
		    //HashMap<String,String> preferenceList = new HashMap<String,String>();
					//preferenceList.put("employeeId","122");
					//preferenceList.put("employeeFamilyname", "����");
					//preferenceList.put("employeeFirstname", "��");
					//preferenceList.put("actressName","�����͂邩");
					//preferenceList.put("contentsName","���d�̍�");
List<HashMap<String,String>> preferenceList = (List<HashMap<String,String>>)request.getAttribute("PreferenceList");
String disabled = "disabled";
if(preferenceList != null){
     disabled = "";
}
%>
		<h1>�D�݈ꗗ</h1>
		<% //C�֌�����������𑗂� %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0050Control">
			�Ј�ID:
			<input type="text" name="employeeId" placeholder="�Ј�ID"  style="text-align: left;"><br>
			��:
			<input type="text" name="employeeFamilyName" placeholder="��"  style="text-align: left;"><br>
			��:
			<input type="text" name="employeeFirstName" placeholder="��"  style="text-align: left;"><br>
			<input type=submit value="����" onClick="func('select');">
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //�e�[�u���̕\��%>
<%if(preferenceList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>�I��</Th>
					<Th>�Ј�ID</Th>
					<Th>��</Th>
					<Th>��</Th>
					<Th>���D��</Th>
					<Th>�R���e���c��</Th>
				</Tr>
	<% for(int i = 0 ;i<preferenceList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= preferenceList.get(i).get("employeeId")%>"></Th>
								<% if(i == 0){ %>
									<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
								<% }else if(preferenceList.get(i).get("employeeId") != preferenceList.get(i - 1).get("employeeId")){ %>
									<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
								<% }else{ %>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
								<% } %>
									<Th><% out.print(preferenceList.get(i).get("contentsName")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type=button value="�V�K�o�^" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0051View.jsp';return true">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[��" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>