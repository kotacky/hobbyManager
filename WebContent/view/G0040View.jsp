<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>�R���e���c�ꗗ</title>
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
		    HashMap<String,String> contentsList = new HashMap<String,String>();
				contentsList.put("contents_id", "401");
				contentsList.put("contents_name", "���d�̍�");
				contentsList.put("summary", "��̓h���}");
//List<HashMap<String,String>> contentsList = (List<HashMap<String,String>>)request.getAttribute("ContentsList");
String disabled = "disabled";
if(contentsList != null){
     disabled = "";
}
%>
		<h1>�R���e���c�ꗗ</h1>
		<% //C�֌�����������𑗂� %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0040Control">
			�R���e���cID:
			<input type="text" name="contents_id" placeholder="�R���e���cID"  style="text-align: left;"><br>
			�R���e���c��:
			<input type="text" name="contents_name" placeholder="�R���e���c��"  style="text-align: left;"><br>
			�T�v:
			<input type="text" name="summary" placeholder="�T�v"  style="text-align: left;"><br>
			<input type=submit value="����" onClick="func('select');">
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //�e�[�u���̕\��%>
<%if(contentsList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>�I��</Th>
					<Th>�R���e���cID</Th>
					<Th>�R���e���c��</Th>
					<Th>�T�v</Th>
				</Tr>
	<% for(int i = 0 ;i<contentsList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="id" value=<% contentsList./*get(i).*/get("contents_id"); %>></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("contents_id")); %></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("contents_name")); %></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("summary")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="process">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type=button value="�V�K�o�^" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0041View.jsp';return true">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[��" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>