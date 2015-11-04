<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 社員更新</title>
	<meta name="keywords" content="キーワード" />
	<meta name="description" content="サイトの説明" />
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
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
			</ul>
		</div>

<h1>更新情報入力</h1>

<%-- リストの取得 --%>
<%
	//HashMap<String,String> EmployeeList = new HashMap<String,String>();
		//EmployeeList.put("employeeId", "122");
		//EmployeeList.put("employeeFamilyname", "金井");
		//EmployeeList.put("employeeFirstname", "才");
		//EmployeeList.put("birthDate", "19920811");
		//EmployeeList.put("employeeFrom", "東京都");
		//EmployeeList.put("employeeBloodType", "A型");%>

<%
	List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");
%>

<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>

	<form method="POST" action="<%=request.getContextPath() %>/G0012Control">
		社員ID:
		<input type="text" name="employeeId" readonly value=<% out.print(employeeList.get(0).get("employeeId")); %>><br>
		姓:
		<input type="text" name="employeeFamilyName" value=<% out.print(employeeList.get(0).get("employeeFamilyName")); %>><br>
		名:
		<input type="text" name="employeeFirstName" value=<% out.print(employeeList.get(0).get("employeeFirstName")); %>><br>
		生年月日:
		<input type="text" name="birthDate" value=<% out.print(employeeList.get(0).get("employeeBirthDate")); %>><br>
		出身地:
		<input type="text" name="employeeFrom" value=<% out.print(employeeList.get(0).get("employeeFrom")); %>><br>
		血液型:
		<input type="text" name="employeeBloodType" value=<% out.print(employeeList.get(0).get("employeeBloodType")); %>><br>
		権限:
		<input type="text" name="employeeAuthority" value=<% out.print(employeeList.get(0).get("employeeAuthority")); %>><br>
		パスワード:
		<input type="password" name="employeePassword" value=<% out.print(employeeList.get(0).get("employeePassword")); %>><br>
		<input type="submit" value="更新">
	</form>
</body>
</html>