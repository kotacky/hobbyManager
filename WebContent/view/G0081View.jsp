<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>VlDB - DÝo^</title>
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>DÝo^</h1>

<% //CÖo^·éððé %>
	<form method="POST"name="MyForm" action="<%=request.getContextPath() %>/G0081Control">

<!-- D¼ðo^Ì½ßÉIð -->
		Ðõ¼:
	<%
		List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");

	%>

	<SELECT name="employeeId">
		<% for(int i = 0 ;i<employeeList.size(); i++){ %>
		<option value="<%= employeeList.get(i).get("employeeId") %>">
		<%  out.print(employeeList.get(i).get("employeeFamilyName") + employeeList.get(i).get("employeeFirstName")); %>
		<% } %>
	</SELECT><br>

		D¼:
	<%
		List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("actressList");

	%>

	<SELECT name="actressId">
		<% for(int i = 0 ;i<actressList.size(); i++){ %>
		<option value="<%= actressList.get(i).get("actressId") %>">
		<%  out.print(actressList.get(i).get("actressName")); %>
		<% } %>
	</SELECT><br>



		<input type="submit" value="o^"  />
	</form>
</body>
</html>