<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>女優一覧</title>
		<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="./css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="./css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
		<script>
			 function func(MyCommand){
	//		 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- リストの取得 --%>
<%
//HashMap<String,String> actressList = new HashMap<String,String>();
	//actressList.put("actressId", "201");
	//actressList.put("actressName", "綾瀬 はるか");
	//actressList.put("companyName", "ホリプロ");
	//actressList.put("companyAddress", "東京");
List<HashMap<String,String>> actressList = (List<HashMap<String,String>>)request.getAttribute("actressList");
String disabled = "disabled";
if(actressList != null){
     disabled = "";
}
%>

		<h1>女優一覧</h1>
		<%-- Cへ検索する条件を送る --%>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0020Control">
			女優ID:
			<input type="text" name="actressId" placeholder="女優ID"  style="text-align: left;"><br>
			女優名:
			<input type="text" name="actressName" placeholder="女優名"  style="text-align: left;"><br>
			<input type="submit" value="検索" onClick="func('select');">
			<input type="button" value="新規登録" onClick="func('insert');" />
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- テーブルの表示 --%>
<%if(actressList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>選択</Th>
					<Th>女優ID</Th>
					<Th>女優名</Th>
					<Th>所属会社名</Th>
					<%-- <Th>会社住所</Th> --%>
				</Tr>
	<% for(int i = 0 ;i<actressList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value=<%= actressList.get(i).get("actressId") %>></Th>
					<Th><%  out.print(actressList.get(i).get("actressId")); %></Th>
					<Th><%  out.print(actressList.get(i).get("actressName")); %></Th>
					<Th><%  out.print(actressList.get(i).get("companyName")); %></Th>
					<%-- <Th><%  out.print(actressList.get(i).get("companyAddress")); %></Th> --%>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- 登録画面への遷移 --%>
				<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>