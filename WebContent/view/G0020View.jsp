<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>���D�ꗗ</title>
		<meta name="keywords" content="�L�[���[�h" />
		<meta name="description" content="�T�C�g�̐���" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
		<script>
			 function func(MyCommand){
	//		 alert("start!:[" + MyCommand + "]");
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
//HashMap<String,String> actressList = new HashMap<String,String>();
	//actressList.put("actressId", "201");
	//actressList.put("actressName", "���� �͂邩");
	//actressList.put("companyName", "�z���v��");
	//actressList.put("companyAddress", "����");
List<HashMap<String,String>> actressList = (List<HashMap<String,String>>)request.getAttribute("actressList");
String disabled = "disabled";
if(actressList != null){
     disabled = "";
}
%>

		<h1>���D�ꗗ</h1>
		<%-- C�֌�����������𑗂� --%>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0020Control">
			���DID:
			<input type="text" name="actressId" placeholder="���DID"  style="text-align: left;"><br>
			���D��:
			<input type="text" name="actressName" placeholder="���D��"  style="text-align: left;"><br>
			<input type="submit" value="����" onClick="func('select');">
			<input type="button" value="�V�K�o�^" onClick="func('insert');" />
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- �e�[�u���̕\�� --%>
<%if(actressList != null){ %>
			<table width="400" border="1">
				<Tr>
					<Th>�I��</Th>
					<Th>���DID</Th>
					<Th>���D��</Th>
					<Th>������Ж�</Th>
					<%-- <Th>��ЏZ��</Th> --%>
				</Tr>
	<% for(int i = 0 ;i<actressList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value=<%= actressList.get(i).get("actressId") %>></Th>
					<Th><%  out.print(actressList.get(i).get("actressId")); %></Th>
					<Th><%  out.print(actressList.get(i).get("actressName")); %></Th>
					<Th><%  out.print(actressList.get(i).get("companyName")); %></Th>
					<%-- <Th><%  out.print(actressList.get(i).get("companyAddress")); %></Th> --%>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- �o�^��ʂւ̑J�� --%>
				<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">

	<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
				<H2><% out.print("�o�^���������܂����B"); %></H2>
				<% }else if("0".equals(insertFlag)){ %>
				<H2><% out.print("�o�^�����s���܂����B"); %></H2>
				<% } %>
		<% }catch(NullPointerException insertException){ %>
			<% try{ %>
				<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
					<% if("1".equals(updateFlag)){ %>
						<H2><% out.print("�X�V���������܂����B"); %></H2>
						<% }else if("0".equals(updateFlag)){ %>
						<H2><% out.print("�X�V�����s���܂����B"); %></H2>
						<% } %>
			<% }catch(NullPointerException updateException){ %>
			<% } %>
		<% } %>
	</body>
</html>