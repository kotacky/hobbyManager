<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>VlBD - Ðõo^</title>
	<meta name="keywords" content="L[[h" />
	<meta name="description" content="TCgÌà¾" />
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
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">DÝê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">Dê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">Recê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">®ïÐê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">Ðõê</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
			</ul>
		</div>

	<h1>ÐõVKo^</h1>

<%-- CÖo^·éððé --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
		ÐõID:
		<input type="text" name="employeeId" placeholder="ÐõID"><br>
		©:
		<input type="text" name="employeeFamilyName" placeholder="©"><br>
		¼:
		<input type="text" name="employeeFirstName" placeholder="¼"><br>
		¶Nú:
		<input type="text" name="birthDate" placeholder="¶Nú"><br>
		<input type="submit" value="o^" >
	</form>
</body>
</html>
