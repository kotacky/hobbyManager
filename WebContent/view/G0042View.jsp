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
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

<h1>�X�V������</h1>
<%
//	�_�~�[�p�f�[�^
//	HashMap<String,String> contentsList = new HashMap<String,String>();
//		contentsList.put("contentsId", "601");
//		contentsList.put("contentsName", "���d�̍�");
//		contentsList.put("summary", "��̓h���}");

	%>

	<p><strong>�X�V���������͂��Ă��������B</strong></p>

	<%-- ���X�g�̎擾 --%>

<% List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList"); %>

<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0042Control">
		�R���e���cID:
		<input type="text" name="contentsId" readonly value=<% out.print(contentsList.get(0).get("contentsId")); %>><br>
		�R���e���c��:
		<input type="text" name=contentsName value=<% out.print(contentsList.get(0).get("contentsName")); %>><br>
		������:
		<input type="text" name="broadCast" value=<% out.print(contentsList.get(0).get("broadCast")); %>><br>
		<input type="submit" value="�X�V">
	</form>
</body>
</html>