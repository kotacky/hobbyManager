<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="Windows-31J">
		<title>�V�lDB - �e���r�ǈꗗ</title>
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
			function func(myCommand){
				<!--document + form name -->
				document.myForm.process.value=myCommand;
				document.myForm.submit();
		}
		function init() {
			if (document.myForm.televisionId.value == null) {
				document.myForm.televisionId.value = "";
			}
			if (document.myForm.televisionName.value == null) {
				document.myForm.televisionName.value = "";
			}
			if (document.myForm.televisionAddress.value == null) {
				document.myForm.televisionAddress.value = "";
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

		<h1>�e���r�ǈꗗ</h1>


	<%-- ���X�g�̎擾 --%>
<%
		List<HashMap<String,String>> televisionList = (List<HashMap<String,String>>)request.getAttribute("televisionList");
		String createDisabled = "disabled";
		String disabled = "disabled";
		String message = (String)request.getAttribute("message");%>
		<% try{ %>
		<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
		<% if((televisionList != null) && ("00".equals(employeeAuthority))){%>
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


		<form method="POST" name="myForm" action="<%= request.getContextPath() %>/G0100Control">
			<div>
			<br>
				�e���r��ID:
				<input type="text" id ="televisionId" name="televisionId" placeholder="�e���r��ID"  style="text-align: left;" />
				�e���r�ǖ�:
				<input type="text" id="televisionName" name="televisionName" placeholder="�e���r�ǖ�"  style="text-align: left;"/><br>
				�e���r�ǏZ��:
				<input type="text" id="televisionAddress" name="televisionAddress" placeholder="�e���r�ǏZ��"  style="text-align: left;"/>

				<input type="submit" value="����" onClick="func('select');"><br />
				<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0101View.jsp';" <%= createDisabled %> />
				<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
				<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
				<%-- �Y�����Ȃ��ꍇ�̃��b�Z�[�W��\�� --%>
				<div style="color:red;"><%= message %></div>
			</div>

			<%-- �e�[�u���̕\��--%>
			<table class="brwsr1">
				<thead class="scrollHead">
					<tr>
						<Th class="r0">�I��</Th>
						<Th class="r1">�e���r��ID</Th>
						<Th class="r2">�e���r�ǖ�</Th>
						<Th class="r3">�Z��</Th>
					</tr>
				</thead>
				<tbody class="scrollBody">

			<%--televisionList���󂶂�Ȃ����list�����[�v����list�\�� --%>
			<% if(televisionList != null){ %>
				<% for(int i = 0; i < televisionList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= televisionList.get(i).get("televisionId") %>"></Th>
						<Td class="r1"><% out.print(televisionList.get(i).get("televisionId")); %></Td>
						<Td class="r2"><% out.print(televisionList.get(i).get("televisionName")); %></Td>
						<Td class="r3"><a href="javascript:;" onclick="window.open('http://maps.google.co.jp/maps?q='+encodeURI('<% out.print(televisionList.get(i).get("televisionAddress")); %>'));return false;"><% out.print(televisionList.get(i).get("televisionAddress")); %></a></Td>
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