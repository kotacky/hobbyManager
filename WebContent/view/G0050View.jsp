<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�V�lBD - �D�݈ꗗ</title>
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
	<div id="header">
			<ul id="gNavi" class="clearfix">
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			</ul>
		</div>
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


		<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
				<H2><% out.print("�o�^���������܂����B"); %></H2>
				<% }else if("0".equals(insertFlag)){ %>
				<H2><% out.print("�o�^�����s���܂����B"); %></H2>
				<% } %>
		<% }catch(NullPointerException insertException){ %>
		<% } %>

<%-- ���X�g�̎擾 --%>
<%
		    //HashMap<String,String> preferenceList = new HashMap<String,String>();
					//preferenceList.put("employeeId","122");
					//preferenceList.put("employeeFamilyname", "����");
					//preferenceList.put("employeeFirstname", "��");
					//preferenceList.put("actressName","�����͂邩");
					//preferenceList.put("contentsName","���d�̍�");
		List<HashMap<String,String>> preferenceList = (List<HashMap<String,String>>)request.getAttribute("preferenceList");
		String disabled = "disabled";
		if(preferenceList != null){
		     disabled = "";
		}
%>
		<h1>�D�݈ꗗ</h1>
		<% //C�֌�����������𑗂� %>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0050Control">
			�Ј�ID:
			<input type="text" name="employeeId" placeholder="�Ј�ID"  style="text-align: left;"><br>
			��:
			<input type="text" name="employeeFamilyName" placeholder="��"  style="text-align: left;"><br>
			��:
			<input type="text" name="employeeFirstName" placeholder="��"  style="text-align: left;"><br>
			<input type="submit" value="����" onClick="func('select');">
			<input type="button" value="�V�K�o�^" onClick="func('insert');" />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />

<%
	//String employee_id=request.getParameter("employee_id");
	//String employee_family_name=request.getParameter("employee_family_name");
	//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //�e�[�u���̕\�� %>
<% if(preferenceList != null){ %>
			<table width="600" border="1">
				<Tr>
					<Th>�I��</Th>
					<Th>�Ј�ID</Th>
					<Th>��</Th>
					<Th>��</Th>
					<Th>���D��</Th>
					<Th>�o����i</Th>
				</Tr>
	<% for(int i = 0 ;i<preferenceList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= preferenceList.get(i).get("employeeId")%>"></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("contentsName")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';return true">
</body>
</html>