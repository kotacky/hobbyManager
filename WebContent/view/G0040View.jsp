<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�R���e���c�ꗗ</title>
		<meta name="keywords" content="�L�[���[�h" />
		<meta name="description" content="�T�C�g�̐���" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="./css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
		<script>
		 function func(MyCommand){
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- ���b�Z�[�W�̕\�� --%>

		<% try{ %>
			<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
			<% if("1".equals(deleteFlag)){ %>
			<H2><% out.print("�폜���������܂����B"); %></H2>
			<% }else if("0".equals(deleteFlag)){ %>
			<H2><% out.print("�폜�����s���܂����B"); %></H2>
			<% } %>
		<% }catch(NullPointerException deleteException){ %>
		<% } %>

<%-- ���X�g�̎擾 --%>
<%
	//	    HashMap<String,String> contentsList = new HashMap<String,String>();
	//			contentsList.put("contents_id", "401");
	//			contentsList.put("contents_name", "���d�̍�");
	//			contentsList.put("summary", "��̓h���}");
List<HashMap<String,String>> contentsList = (List<HashMap<String,String>>)request.getAttribute("contentsList");
String disabled = "disabled";
if(contentsList != null){
     disabled = "";
}
%>
		<h1>�R���e���c�ꗗ</h1>
		<% //C�֌�����������𑗂� %>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0040Control">
			�R���e���cID:
			<input type="text" name="contentsId" placeholder="�R���e���cID"  style="text-align: left;"><br>
			�R���e���c��:
			<input type="text" name="contentsName" placeholder="�R���e���c��"  style="text-align: left;"><br>
			������:
			<input type="text" name="broadCast" placeholder="������"  style="text-align: left;"><br>
			<input type="submit" value="����" onClick="func('select');">
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
<%
	//String employee_id=request.getParameter("employee_id");
	//String employee_family_name=request.getParameter("employee_family_name");
	//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //�e�[�u���̕\��%>
<%if(contentsList != null){ %>
			<table width="400" border="1">
				<Tr>
					<Th>�I��</Th>
					<Th>�R���e���cID</Th>
					<Th>�R���e���c��</Th>
					<Th>������</Th>
				</Tr>
	<% for(int i = 0 ;i<contentsList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value=<%= contentsList.get(i).get("contentsId") %>></Th>
					<Th><%  out.print(contentsList.get(i).get("contentsId")); %></Th>
					<Th><%  out.print(contentsList.get(i).get("contentsName")); %></Th>
					<Th><%  out.print(contentsList.get(i).get("broadCast")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
		<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0041View.jsp';return true">
		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';return true">

	<% try{ %>
				<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
					<% if("1".equals(updateFlag)){ %>
						<H2><% out.print("�X�V���������܂����B"); %></H2>
						<% }else if("0".equals(updateFlag)){ %>
						<H2><% out.print("�X�V�����s���܂����B"); %></H2>
						<% } %>
			<% }catch(NullPointerException updateException){ %>
			<% } %>
	</body>
</html>