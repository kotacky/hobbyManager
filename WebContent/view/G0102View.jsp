
<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �X�V���</title>
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�X�V������</h1>

<%-- ���X�g�̎擾 --%>

<% List<HashMap<String, String>> televisionList = (List<HashMap<String, String>>)request.getAttribute("televisionList"); %>

<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0102Control">
		�e���r��ID:
		<input type="text" name="televisionId" readonly value=<% out.print(televisionList.get(0).get("televisionId")); %> style="text-align:left;" required>�i�K�{�j<br>
		�e���r�ǖ�:
		<input type="text" name="televisionName" value=<% out.print(televisionList.get(0).get("televisionName")); %> style="text-align:left;" required>�i�K�{�j<br>
		�Z��:
		<input type="text" name="televisionAddress" value=<% out.print(televisionList.get(0).get("televisionAddress")); %> style="text-align:left;"><br>
		<input type="submit" value="�X�V">
	</form>
</body>
</html>