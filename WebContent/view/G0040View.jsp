<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �G���ꗗ</title>
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
			if (document.MyForm.magazineId.value == null) {
				document.MyForm.magazineId.value = "";
			}
			if (document.MyForm.magazineName.value == null) {
				document.MyForm.magazineName.value = "";
			}
			if (document.MyForm.publisherName.value == null) {
				document.MyForm.publisherName.value = "";
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
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">�y�Ȉꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">�A�[�e�B�X�g�ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�G���ꗗ</h1>

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
			<% }else if("2".equals(insertFlag)){ %>
			<H2><% out.print("���ɓo�^����Ă��܂��B"); %></H2>
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
	//	    HashMap<String,String> contentsList = new HashMap<String,String>();
	//			contentsList.put("contents_id", "401");
	//			contentsList.put("contents_name", "���d�̍�");
	//			contentsList.put("summary", "��̓h���}");
List<HashMap<String,String>> magazineList = (List<HashMap<String,String>>)request.getAttribute("magazineList");
//�Y���f�[�^���Ȃ����b�Z�[�W���󂯎��
String message = (String)request.getAttribute("message");
String createDisabled = "disabled";
String disabled = "disabled";%>
	<% try{ %>
	<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
	<% if((magazineList != null) && ("00".equals(employeeAuthority))){%>
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
	<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0040Control">
		�G��ID:
		<input type="text" id="magazineId" name="magazineId" placeholder="�G��ID" style="text-align: left;">
		�G����:
		<input type="text" id="magazineName" name="magazineName" placeholder="�G����" style="text-align: left; ">
		�o�Ŏ�:
		<input type="text" id="publisherName" name="publisherName" placeholder="�o�Ŏ�" style="text-align: left; ">
		<input type="button" value="����" onClick="func('select');" /><br />
		<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0041View.jsp';" <%= createDisabled %> />
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
					<Th class="r1">�G��ID</Th>
					<Th class="r2">�G����</Th>
					<Th class="r3">�o�Ŏ�</Th>

				</tr>
			</thead>
			<tbody class="scrollBody">
<% if(magazineList != null){ %>
<% for(int i = 0; i < magazineList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= magazineList.get(i).get("magazineId") %>"></Th>
						<Td class="r1"><% out.print(magazineList.get(i).get("magazineId")); %></Td>
						<Td class="r2"><% out.print(magazineList.get(i).get("magazineName")); %></Td>
						<Td class="r3"><% out.print(magazineList.get(i).get("publisherName")); %></Td>

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