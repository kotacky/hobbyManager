<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �Ј��ꗗ</title>
	<meta name="keywords" content="�L�[���[�h" />
	<meta name="description" content="�T�C�g�̐���" />
	<meta http-equiv="Content-Language" content="ja" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="imagetoolbar" content="no" />
	<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
	<script>
		 function func(MyCommand){
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }

		function init() {
			if (document.MyForm.employeeId.value == "null") {
				document.MyForm.employeeId.value = "";
			}
			if (document.MyForm.employeeFamilyName.value == "null") {
				document.MyForm.employeeFamilyName.value = "";
			}
			if (document.MyForm.employeeFirstName.value == "null") {
				document.MyForm.employeeFirstName.value = "";
			}
		}
	 </script>
</head>

<body onload="init();">
	<div id="header">
		<ul id="gNavi" class="clearfix">
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

<%-- ���X�g�̎擾 --%>
		<h1>�Ј��ꗗ</h1>

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

<%-- ���X�g�̎擾 --%>

<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String disabled = "disabled";
if(employeeList != null){
     disabled = "";
}
%>
<%-- C�֌�����������𑗂� --%>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0010Control">
			�Ј�ID:
			<input type="text" id="employeeId" name="employeeId" placeholder="�Ј�ID" value="<%= request.getParameter("employeeId") %>" style="text-align: left;">
			��:
			<input type="text" id="employeeFamilyName" name="employeeFamilyName" placeholder="��" value="<%= request.getParameter("employeeFamilyName") %>" style="text-align: left; ">
			��:
			<input type="text" id="employeeFirstName" name="employeeFirstName" placeholder="��" value="<%= request.getParameter("employeeFirstName") %>" style="text-align: left; ">
			<input type="button" value="����" onClick="func('select');" /><br />
			<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp'" />
			<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
			<br style="clear" />

			<%-- �e�[�u���̕\��--%>
			<table class="brwsr1">
				<thead class="scrollHead">
					<tr>
						<Th class="r0">�I��</Th>
						<Th class="r1">�Ј�ID</Th>
						<Th class="r2">��</Th>
						<Th class="r3">��</Th>
						<Th class="r4">���N����</Th>
					</tr>
				</thead>
				<tbody class="scrollBody">
<% if(employeeList != null){ %>
	<% for(int i = 0; i < employeeList.size(); i++){ %>
						<Tr>
							<Th class="r0"><input type="radio" name="radioButton" value="<%= employeeList.get(i).get("employeeId") %>"></Th>
							<Td class="r1"><% out.print(employeeList.get(i).get("employeeId")); %></Td>
							<Td class="r2"><% out.print(employeeList.get(i).get("employeeFamilyName")); %></Td>
							<Td class="r3"><% out.print(employeeList.get(i).get("employeeFirstName")); %></Td>
							<Td class="r4"><% out.print(employeeList.get(i).get("birthDate")); %></Td>
						</Tr>
	<% } %>
<% } %>
				</tbody>
			</table>
			<input type="hidden" name="processDiv">
		</form>
		<div id="footer">
			<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
		</div>
</body>
</html>
