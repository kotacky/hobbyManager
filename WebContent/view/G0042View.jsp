<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
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
	//	ダミー用データ
	//	HashMap<String,String> contentsList = new HashMap<String,String>();
	//		contentsList.put("contentsId", "601");
	//		contentsList.put("contentsName", "八重の桜");
	//		contentsList.put("summary", "大河ドラマ");

 	%>

<% List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList"); %>

	<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0042Control">
		コンテンツID:
		<input type="text" name="contentsId" readonly value=<% out.print(contentsList.get(0).get("contentsId")); %>><br>
		コンテンツ名:
		<input type="text" name=contentsName value=<% out.print(contentsList.get(0).get("contentsName")); %>><br>
		概要:
		<input type="text" name="summary" value=<% out.print(contentsList.get(0).get("summary")); %>><br>
		<input type=submit value="更新">
	</form>

	<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>