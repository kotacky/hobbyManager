
<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>更新画面</title>
		<style>
			*{
			text-align : center;
			}
		</style>
	</head>

	<body>
	<H1>更新情報入力</H1>
	<%-- リストの取得 --%>
	<%
		//HashMap<String,String> companyList = new HashMap<String,String>();
			//companyList.put("companyId", "201");
			//companyList.put("companyName", "ホリプロ");
			//companyList.put("companyAddress", "東京");
	%>

<% List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList"); %>

	<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0032Control">
		所属会社ID:
		<input type="text" name="companyId" readonly value=<% out.print(companyList.get(0).get("companyId")); %>><br>
		会社名:
		<input type="text" name="companyName" value=<% out.print(companyList.get(0).get("companyName")); %>><br>
		住所:
		<input type="text" name="companyAddress" value=<% out.print(companyList.get(0).get("companyAddress")); %>><br>
		<input type=submit value="更新">
	</form>
	<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>