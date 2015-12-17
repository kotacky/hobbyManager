<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �Ј��X�V</title>
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
</head>

<body>
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

<h1>�X�V������</h1>

<%-- ���X�g�̎擾 --%>
<%
	//HashMap<String,String> EmployeeList = new HashMap<String,String>();
		//EmployeeList.put("employeeId", "122");
		//EmployeeList.put("employeeFamilyname", "����");
		//EmployeeList.put("employeeFirstname", "��");
		//EmployeeList.put("birthDate", "19920811");
		//EmployeeList.put("employeeFrom", "�����s");
		//EmployeeList.put("employeeBloodType", "A�^");%>

<%
	List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");
%>

<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>

	<form method="POST" action="<%=request.getContextPath() %>/G0012Control">
		�Ј�ID:
		<input type="text" name="employeeId" readonly value=<% out.print(employeeList.get(0).get("employeeId")); %> required>�i�K�{�j<br>
		��:
		<input type="text" name="employeeFamilyName" value=<% out.print(employeeList.get(0).get("employeeFamilyName")); %> required>�i�K�{�j<br>
		��:
		<input type="text" name="employeeFirstName" value=<% out.print(employeeList.get(0).get("employeeFirstName")); %> required>�i�K�{�j<br>
		���N����:
		<input type="date" name="birthDate" value=<% out.print(employeeList.get(0).get("employeeBirthDate")); %>><br>
		�o�g�n:
		<input type="text" name="employeeFrom" value=<% out.print(employeeList.get(0).get("employeeFrom")); %>><br>
		���t�^:
		<input type="text" name="employeeBloodType" value=<% out.print(employeeList.get(0).get("employeeBloodType")); %>><br>
		����:
		<select name="employeeAuthority">
			<option value="00">00:�Ǘ���
			<option value="01" selected>01:��ʐE
		</select><br>
		�p�X���[�h:
		<input type="password" name="employeePassword" required>�i�K�{�j<br>
		<input type="submit" value="�X�V">
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</form>
</body>
</html>