<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>Ðõo^</title>
		<meta name="keywords" content="L[[h" />
		<meta name="description" content="TCgÌà¾" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="./css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
	</head>
<body>
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
		<input type=submit value="o^" >
	</form>
<%-- j[æÊÉßé --%>
<input type=button value="j[w" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
