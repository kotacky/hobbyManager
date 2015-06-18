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
		HashMap<String,String> actressList = new HashMap<String,String>();
			actressList.put("actressId", "401");
			actressList.put("actressName", "綾瀬 はるか");
			actressList.put("companyName", "ホリプロ");
			actressList.put("contentsName", "八重の桜");
 %>

<% //List<HashMap<String, String>> actressList = (List<HashMap<String, String>>)request.getAttribute("ActressList"); %>

	<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0022Control">
		女優ID:
		<input type="text" name="actress_id" disabled value=<% out.print(actressList./*get(0).*/get("actressId")); %>><br>
		女優名:
		<input type="text" name="actress_name" value=<% out.print(actressList./*get(0).*/get("actressName")); %>><br>
		会社名:
		<input type="text" name="company_name" value=<% out.print(actressList./*get(0).*/get("companyName")); %>><br>
		出演作品:
		<input type="text" name="contents_1" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type="text" name="contents_2" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type="text" name="contents_3" value=<% out.print(actressList./*get(0).*/get("contentsName")); %>><br>
		<input type=submit value="更新">
	</form>
	<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>