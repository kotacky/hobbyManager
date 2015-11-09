<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - ������Јꗗ</title>
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

	 function init() {
			if (document.MyForm.companyId.value == null) {
				document.MyForm.companyId.value = "";
			}
			if (document.MyForm.companyName.value == null) {
				document.MyForm.companyName.value = "";
			}
			if (document.MyForm.companyAddress.value == null) {
				document.MyForm.companyAddress.value = "";
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
	//HashMap<String,String> companyList = new HashMap<String,String>();
		//companyList.put("companyId", "301");
		//companyList.put("companyName", "�z���v��");
		//companyList.put("companyAddress", "����");
	List<HashMap<String,String>> companyList = (List<HashMap<String,String>>)request.getAttribute("companyList");
	//�Y���f�[�^���Ȃ����b�Z�[�W���󂯎��
	String message = (String)request.getAttribute("message");
	String createDisabled = "disabled";
	String disabled = "disabled";%>
	<% try{ %>
	<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
	<% if((companyList != null) && ("00".equals(employeeAuthority))){%>
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
	<h1>������Јꗗ</h1>
	<% //C�֌�����������𑗂� %>
	<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0030Control">
		���ID:
		<input type="text" id="companyId" name="companyId" placeholder="���ID"  style="text-align: left;">
		��Ж�:
		<input type="text" id="companyName" name="companyName" placeholder="��Ж�"  style="text-align: left;">
		��ЏZ��:
		<input type="text" id="companyAddress" name="companyAddress" placeholder="��ЏZ��"  style="text-align: left;">
		<input type="submit" value="����" onClick="func('select');"><br />
		<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0031View.jsp';" <%= createDisabled %> />
		<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
		<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
		<%-- �Y�����Ȃ��ꍇ�̃��b�Z�[�W��\�� --%>
		<div style="color:red;"><%= message %></div>
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
						<Th class="r1">���ID</Th>
						<Th class="r2">��Ж�</Th>
						<Th class="r3">�Z��</Th>
					</tr>
				</thead>
				<tbody class="scrollBody">
<% if(companyList != null){ %>
	<% for(int i = 0; i < companyList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= companyList.get(i).get("companyId") %>"></Th>
						<Td class="r1"><% out.print(companyList.get(i).get("companyId")); %></Td>
						<Td class="r2"><% out.print(companyList.get(i).get("companyName")); %></Td>
						<Td class="r3"><a href="javascript:;" onclick="window.open('http://maps.google.co.jp/maps?q='+encodeURI('<% out.print(companyList.get(i).get("companyAddress")); %>'));return false;"><% out.print(companyList.get(i).get("companyAddress")); %></a></Td>
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