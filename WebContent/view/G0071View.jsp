<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>VlDB - blo^</title>
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
            <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">®ê</a></li>
            <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">Ðõê</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">Wê</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">erÇê</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>blo^</h1>

<!-- bZ[W\¦  -->


	<p><strong>blÉÖ·éîñðo^µÄº³¢B</strong></p>

	<% //CÖo^·éððé %>
	<form method="POST" action="<%=request.getContextPath() %>/G0071Control">
		R}[VID:
		<input type="text" name="commercialId" placeholder="R}[VID" style="text-align:left;" required>iK{j<br>
		bl¼:
		<input type="text" name="commercialName" placeholder="bl¼" style="text-align:left;" required>iK{j<br>
		LïÐ¼:
		<input type="text" name="sponserName" placeholder="LïÐ¼" style="text-align:left;"><br>
		<input type="submit" value="o^">
		</form>
	<input type="button" value="blê" onClick="form.action=location.href='../../hobbyManager/view/G0070View.jsp'">
	<input type="button" value="Dê"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
