
<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>�X�V���</title>
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
	<H1>�X�V������</H1>
	<%-- ���X�g�̎擾 --%>
	<%
		//HashMap<String,String> companyList = new HashMap<String,String>();
			//companyList.put("companyId", "201");
			//companyList.put("companyName", "�z���v��");
			//companyList.put("companyAddress", "����");
	%>

<% List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList"); %>

	<%-- ���X�g����f�[�^���擾���A�ҏW���s���A�X�V����f�[�^�𑗂� --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0032Control">
		�������ID:
		<input type="text" name="companyId" readonly value=<% out.print(companyList.get(0).get("companyId")); %>><br>
		��Ж�:
		<input type="text" name="companyName" value=<% out.print(companyList.get(0).get("companyName")); %>><br>
		�Z��:
		<input type="text" name="companyAddress" value=<% out.print(companyList.get(0).get("companyAddress")); %>><br>
		<input type=submit value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type=button value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>