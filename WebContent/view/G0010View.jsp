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
	<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
	<script>
		 function func(myCommand){
		//	 alert("start!:[" + myCommand + "]");
			 document.myForm.process.value=myCommand;
			 document.myForm.submit();
		 }

		function init() {
			if (document.myForm.employeeId.value == null) {
				document.myForm.employeeId.value = "";
			}
			if (document.myForm.employeeFamilyName.value == null) {
				document.myForm.employeeFamilyName.value = "";
			}
			if (document.myForm.employeeFirstName.value == null) {
				document.myForm.employeeFirstName.value = "";
			}
		}
	 </script>
</head>

<body onload="init();">
	<div id="header">
				<ul id="gMenu" class="clearfix">
					  <li><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">�g�b�v</a></li>
					  <li><a>��{���j���[</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">�A�[�e�B�X�g�ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">�D�݈ꗗ</a></li>
					    </ul>
					  </li>
					  <li><a>���D�R���e���c</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">�f��ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�h���}�ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">�b�l�ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�G���ꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">�y�Ȉꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">�W�������ꗗ</a></li>
					    </ul>
					  </li>
					  <li><a>�����E�o��</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">�e���r�ǈꗗ</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
					    </ul>
					  </li>
					  <li><a><% out.print(session.getAttribute("employeeFirstName")); %></a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">���O�A�E�g</a></li>
					    </ul>
					  </li>
				</ul>
	</div>

<%-- ���X�g�̎擾 --%>
		<h1>�Ј��ꗗ</h1>

<%-- ���b�Z�[�W�̕\�� --%>

		<% try{ %>
			<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
			<% if("1".equals(deleteFlag)){ %>
			<h2><% out.print("�폜���������܂����B"); %></h2>
			<% }else if("0".equals(deleteFlag)){ %>
			<h2><% out.print("�폜�����s���܂����B"); %></h2>
			<% } %>
		<% }catch(NullPointerException deleteException){ %>
		<% } %>


		<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
			<h2><% out.print("�o�^���������܂����B"); %></h2>
			<% }else if("0".equals(insertFlag)){ %>
			<h2><% out.print("�o�^�����s���܂����B"); %></h2>
			<% }else if("2".equals(insertFlag)){ %>
			<h2><% out.print("���ɓo�^����Ă��܂��B"); %></h2>
			<% } %>
		<% }catch(NullPointerException insertException){ %>
		<% } %>

		<% try{ %>
			<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
			<h2><% out.print("�X�V���������܂����B"); %></h2>
			<% }else if("0".equals(updateFlag)){ %>
			<h2><% out.print("�X�V�����s���܂����B"); %></h2>
			<% } %>
		<% }catch(NullPointerException updateException){ %>
		<% } %>

<%-- ���X�g�̎擾 --%>

<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String message = (String)request.getAttribute("message");
String updateDisabled = "disabled";
String createDisabled = "disabled";
String disabled = "disabled";%>
<% try{ %>
<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
<% if((employeeList != null) && ("00".equals(employeeAuthority))){%>
	<% disabled = "";%>
<% } %>
<% if(employeeList != null){%>
	<% updateDisabled = "";%>
<% } %>
<% if("00".equals(employeeAuthority)){%>
	<% createDisabled = "";%>
<% } %>
<% }catch(NullPointerException deleteException){ %>
<% } %>
<%if (message == null) {
		message = "";
	}%>

<%-- C�֌�����������𑗂� --%>
		<form method="POST" name=myForm action="<%= request.getContextPath() %>/G0010Control">
			�Ј�ID:
			<input type="text" id="employeeId" name="employeeId" placeholder="�Ј�ID"  style="text-align: left;">
			��:
			<input type="text" id="employeeFamilyName" name="employeeFamilyName" placeholder="��"  style="text-align: left; ">
			<div>
			��:
			<input type="text" id="employeeFirstName" name="employeeFirstName" placeholder="��"  style="text-align: left; ">
			</div>
			<input type="button" value="����" onClick="func('select');" /><br />
			<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp';" <%= createDisabled %>/>
			<input type="button" value="�X�V" onClick="func('update');" <%= updateDisabled %> />
			<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
			<div style="color:red;"><%= message %>

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
							<Td class="r4"><% out.print(employeeList.get(i).get("employeeBirthDate")); %></Td>
						</Tr>
	<% } %>
<% } %>
				</tbody>
			</table>
			<input type="hidden" name="process">
			<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
		</form>
		<div id="footer">
			<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
		</div>
</body>
</html>
