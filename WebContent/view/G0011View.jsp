<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>VlDB - Ðõo^</title>
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
				<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">DÝê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">Dê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">blê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">fæê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">h}ê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">Gê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">®ïÐê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">Ðõê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">Wê</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">erÇê</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">yÈê</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">A[eBXgê</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
			</ul>
		</div>

	<h1>ÐõVKo^</h1>


<%-- CÖo^·éððé --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control">
		ÐõID:
		<input type="text" name="employeeId" placeholder="0000" required>iK{j<br>
		©:
		<input type="text" name="employeeFamilyName" placeholder="©" required>iK{j<br>
		¼:
		<input type="text" name="employeeFirstName" placeholder="¼" required>iK{j<br>
		¶Nú:
		<input type="date" name="birthDate" ><br>
		ogn:
		<input type="text" name="employeeFrom" placeholder="§"><br>
		t^:
		<input type="text" name="employeeBloodType" placeholder="~~^"><br>
		 À:
		<select name="employeeAuthority">
			<option value="00">00:ÇÒ
			<option value="01" selected>01:êÊE
		</select><br>
		pX[h:
		<input type="password" name="employeePassword" placeholder="pX[h" required>iK{j<br>
		<input type="submit" value="o^" >
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</form>
</body>
</html>
