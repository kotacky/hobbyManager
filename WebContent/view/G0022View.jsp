<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>新人DB - 女優更新</title>
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
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">好み一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">コンテンツ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>更新情報入力</h1>
<%-- リストの取得 --%>
<%
	//HashMap<String,String> actressList = new HashMap<String,String>();
		//actressList.put("actressId", "401");
		//actressList.put("actressName", "綾瀬 はるか");
		//actressList.put("companyName", "ホリプロ");
		//actressList.put("contentsName", "八重の桜");
%>

<%
	List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("actressList");
%>


<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0022Control">
		女優ID:
		<input type="text" name="actressId" readonly value=<% out.print(actressList.get(0).get("actressId")); %> style="text-align: left;"><br>
		女優名:
		<input type="text" name="actressName" value=<% out.print(actressList.get(0).get("actressName")); %> style="text-align: left;"><br>
		<h2>会社を選んでください。</h2>
	<%
		List<HashMap<String, String>> columnCompanyList = (List<HashMap<String, String>>)request.getAttribute("columnCompanyList");
	%>
		<SELECT name="companyId">
			<% for(int i = 0 ;i<columnCompanyList.size(); i++){ %>
				<option value="<%= columnCompanyList.get(i).get("companyId") %>">
				<%  out.print(columnCompanyList.get(i).get("companyName")); %>
			<% } %>
		</SELECT>

	<h2>出演作品を選んでください。</h2>
	<%
		List<HashMap<String, String>> columnContentsList = (List<HashMap<String, String>>)request.getAttribute("columnContentsList");
		String[] check = null;
			if (columnContentsList == null) {
				check = new String[0];
			} else {
				check = new String[columnContentsList.size()];
			}
	%>

	<% if(columnContentsList != null){ %>

	<% for(int i = 0; i < columnContentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= columnContentsList.get(i).get("contentsId") %>" />
		<%  out.print(columnContentsList.get(i).get("contentsName")); %>

	<% } %>
	<% } %>

	<br>

		<input type="submit" value="更新">
	</form>
</body>
</html>