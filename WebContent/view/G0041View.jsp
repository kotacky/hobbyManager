<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>VlDB - Go^</title>
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

	<h1>Go^</h1>

	<p><strong>GÉÖ·éîñðo^µÄº³¢B</strong></p>

	<% //CÖo^·éððé %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		GID:
		<input type="text" name="magazineId" placeholder="04XX" style="text-align:left;" required>iK{j<br>
		G¼:
		<input type="text" name="magazineName" placeholder="G¼" style="text-align:left;" required>iK{j<br>
		oÅÐ:
		<input type="text" name="publisherName" placeholder="oÅÐ" style="text-align:left;"><br>
		<input type="submit" value="o^">
		</form>
	<input type="button" value="Gê" onClick="form.action=location.href='../../hobbyManager/view/G0040View.jsp'">
	<input type="button" value="Dê"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
