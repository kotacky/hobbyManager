<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �D�ݓo�^</title>
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
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
		</ul>
	</div>

	<h1>�D�ݓo�^</h1>

<% //C�֓o�^��������𑗂� %>
	<form method="POST"name="MyForm" action="<%=request.getContextPath() %>/G0051Control">

<!-- ���D����o�^�̂��߂ɑI�� -->
		�Ј���:
	<%
		List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");

	%>

	<SELECT name="employeeId">
		<% for(int i = 0 ;i<employeeList.size(); i++){ %>
		<option value="<%= employeeList.get(i).get("employeeId") %>">
		<%  out.print(employeeList.get(i).get("employeeFamilyName") + employeeList.get(i).get("employeeFirstName")); %>
		<% } %>
	</SELECT><br>

		���D��:
	<%
		List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("actressList");

	%>

	<SELECT name="actressId">
		<% for(int i = 0 ;i<actressList.size(); i++){ %>
		<option value="<%= actressList.get(i).get("actressId") %>">
		<%  out.print(actressList.get(i).get("actressName")); %>
		<% } %>
	</SELECT><br>



		<input type="submit" value="�o�^"  />
	</form>
</body>
</html>