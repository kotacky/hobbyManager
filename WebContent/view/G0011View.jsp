<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �Ј��o�^</title>
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">���O�A�E�g</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">�W�������ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">�e���r�ǈꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">�y�Ȉꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">�A�[�e�B�X�g�ꗗ</a></li>

		</ul>
	</div>

	<h1>�Ј��V�K�o�^</h1>


<%-- C�֓o�^��������𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
		�Ј�ID:
		<input type="text" name="employeeId" placeholder="0000" required>�i�K�{�j<br>
		��:
		<input type="text" name="employeeFamilyName" placeholder="��" required>�i�K�{�j<br>
		��:
		<input type="text" name="employeeFirstName" placeholder="��" required>�i�K�{�j<br>
		���N����:
		<input type="date" name="birthDate" ><br>
		�o�g�n:
		<input type="text" name="employeeFrom" placeholder="������"><br>
		���t�^:
		<input type="text" name="employeeBloodType" placeholder="�~�~�^"><br>
		����:
		<select name="employeeAuthority">
			<option value="00">00:�Ǘ���
			<option value="01" selected>01:��ʐE
		</select><br>
		�p�X���[�h:
		<input type="password" name="employeePassword" placeholder="�p�X���[�h" required>�i�K�{�j<br>
		<input type="submit" value="�o�^" >
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
		<input type="button" value="�߂�" onClick="history.go(-1)">
	</form>
</body>
</html>
