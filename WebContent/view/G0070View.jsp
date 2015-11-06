<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �b�l�ꗗ</title>
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
			if (document.MyForm.commercialId.value == "null") {
				document.MyForm.commercialId.value = "";
			}
			if (document.MyForm.commercialName.value == "null") {
				document.MyForm.commercialName.value = "";
			}
			if (document.MyForm.sponserName.value == "null") {
				document.MyForm.sponserName.value = "";
			}
		}
	 </script>
</head>

<body onload="init();">
	<div id="header">
		<ul id="gNavi" class="clearfix">
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">�b�l�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">�f��ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�h���}�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�G���ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">�W�������ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">�e���r�ǈꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�b�l�ꗗ</h1>

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

	<% try{ %>
		<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
			<H2><% out.print("�X�V���������܂����B"); %></H2>
			<% }else if("0".equals(updateFlag)){ %>
			<H2><% out.print("�X�V�����s���܂����B"); %></H2>
			<% } %>
		<% }catch(NullPointerException updateException){ %>
		<% } %>


<%-- ���X�g�̎擾 --%>
<%
	//	    HashMap<String,String> commercialList = new HashMap<String,String>();
	//			commercialList.put("commercial_id", "401");
	//			commercialList.put("commercial_name", "���d�̍�");
	//			commercialList.put("summary", "��̓h���}");
List<HashMap<String,String>> commercialList = (List<HashMap<String,String>>)request.getAttribute("commercialList");
//�Y���f�[�^���Ȃ����b�Z�[�W���󂯎��
String message = (String)request.getAttribute("message");
String createDisabled = "disabled";
String disabled = "disabled";%>
<% try{ %>
<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
<% if((commercialList != null) && ("00".equals(employeeAuthority))){%>
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
	<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0070Control">
		�R�}�[�V����ID:
		<input type="text" id="commercialId" name="commercialId" placeholder="�R�}�[�V����ID" style="text-align: left;">
		�b�l��:
		<input type="text" id="commercialName" name="commercialName" placeholder="�b�l��" style="text-align: left; ">
		�L����Ж�:
		<input type="text" id="sponserName" name="sponserName" placeholder="�L����Ж�" style="text-align: left; ">
		<input type="button" value="����" onClick="func('select');" /><br />
		<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0071View.jsp';" <%= createDisabled %> />
		<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
		<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
		<div style="color:red;"><%= message %></div>
		<br style="clear" />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

		<%-- �e�[�u���̕\��--%>
		<table class="brwsr1">
			<thead class="scrollHead">
				<tr>
					<Th class="r0">�I��</Th>
					<Th class="r1">�R�}�[�V����ID</Th>
					<Th class="r2">�b�l��</Th>
					<Th class="r3">�L����Ж�</Th>

				</tr>
			</thead>
			<tbody class="scrollBody">
<% if(commercialList != null){ %>
<% for(int i = 0; i < commercialList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= commercialList.get(i).get("commercialId") %>"></Th>
						<Td class="r1"><% out.print(commercialList.get(i).get("commercialId")); %></Td>
						<Td class="r2"><% out.print(commercialList.get(i).get("commercialName")); %></Td>
						<Td class="r3"><% out.print(commercialList.get(i).get("sponserName")); %></Td>

					</Tr>
<% } %>
<% } %>
			</tbody>
		</table>
		<input type="hidden" name="processDiv">
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</form>
	<div id="footer">
		<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
	</div>
</body>
</html>