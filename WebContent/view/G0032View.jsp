
<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
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
	<h1>�X�V������</h1>
	<div id="header">
			<ul id="gNavi" class="clearfix">
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			</ul>
		</div>
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
		<input type="submit" value="�X�V">
	</form>
	<%-- ���j���[��ʂɖ߂鏈�� --%>
		<input type="button" value="���j���[�w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>