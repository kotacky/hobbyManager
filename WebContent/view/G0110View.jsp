<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>


	<meta charset="Windows-31J">
	<title>�V�lDB - �A�[�e�B�X�g�ꗗ</title>
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
		 function func(myCommand){
		//	 alert("start!:[" + myCommand + "]");
			 document.myForm.process.value=myCommand;
			 document.myForm.submit();
		 }

		function init() {
			if (document.myForm.artistId.value == null) {
				document.myForm.artistId.value = "";
			}
			if (document.myForm.artistName.value == null) {
				document.myForm.artistName.value = "";
			}
			if (document.myForm.companyName.value == null) {
				document.myForm.companyName.value = "";
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

	<h1>�A�[�e�B�X�g�ꗗ</h1>

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
List<HashMap<String,String>> artistList = (List<HashMap<String,String>>)request.getAttribute("artistList");
//�Y���f�[�^���Ȃ����b�Z�[�W���󂯎��
String message = (String)request.getAttribute("message");
String createDisabled = "disabled";
String disabled = "disabled";%>
	<% try{ %>
	<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
	<% if((artistList != null) && ("00".equals(employeeAuthority))){%>
		<% disabled = "";%>
	<% } %>
	<% if("00".equals(employeeAuthority)){%>
		<% createDisabled = "";%>
	<% } %>
	<% }catch(NullPointerException deleteException){ %>
	<% } %>
	<%if (message == null) {
		message = "";
	}%>


<% //C�֌�����������𑗂� %>
	<form method="POST" name="myForm" action="<%= request.getContextPath() %>/G0110Control">

		�A�[�e�B�X�gID:
		<input type="text" id="artstId" name="artistId" placeholder="�A�[�e�B�X�gID"  style="text-align: left;">
		�A�[�e�B�X�g��:
		<input type="text" id="artistName" name="artistName" placeholder="�A�[�e�B�X�g��" style="text-align: left; "><br>
		�������:
		<input type="text" id="companyName" name="companyName" placeholder="�������" style="text-align: left; ">
		<input type="button" value="����" onClick="func('select');" /><br />
		<input type="button" value="�V�K�o�^" onClick="func('insert');" <%= createDisabled %> />
		<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
		<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
		<div style="color:red;"><%= message %></div>

		<%-- �e�[�u���̕\��--%>
		<table class="brwsr1">
			<thead class="scrollHead">
				<tr>
					<Th class="r0">�I��</Th>
					<Th class="r1">�A�[�e�B�X�gID</Th>
					<Th class="r2">�A�[�e�B�X�g��</Th>
					<Th class="r3">�������</Th>
				</tr>
			</thead>
			<tbody class="scrollBody">
<% if(artistList != null){ %>
<% for(int i = 0; i < artistList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= artistList.get(i).get("artistId") %>"></Th>
						<Td class="r1"><% out.print(artistList.get(i).get("artistId")); %></Td>
						<Td class="r2"><% out.print(artistList.get(i).get("artistName")); %></Td>
						<Td class="r3"><% out.print(artistList.get(i).get("companyName")); %></Td>
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