<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>コンテンツ一覧</title>
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
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- メッセージの表示 --%>

		<% try{ %>
			<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
			<% if("1".equals(deleteFlag)){ %>
			<H2><% out.print("削除が完了しました。"); %></H2>
			<% }else if("0".equals(deleteFlag)){ %>
			<H2><% out.print("削除が失敗しました。"); %></H2>
			<% } %>
		<% }catch(NullPointerException deleteException){ %>
		<% } %>

<%-- リストの取得 --%>
<%
	//	    HashMap<String,String> contentsList = new HashMap<String,String>();
	//			contentsList.put("contents_id", "401");
	//			contentsList.put("contents_name", "八重の桜");
	//			contentsList.put("summary", "大河ドラマ");
List<HashMap<String,String>> contentsList = (List<HashMap<String,String>>)request.getAttribute("contentsList");
String disabled = "disabled";
if(contentsList != null){
     disabled = "";
}
%>
		<h1>コンテンツ一覧</h1>
		<% //Cへ検索する条件を送る %>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0040Control">
			コンテンツID:
			<input type="text" name="contentsId" placeholder="コンテンツID"  style="text-align: left;"><br>
			コンテンツ名:
			<input type="text" name="contentsName" placeholder="コンテンツ名"  style="text-align: left;"><br>
			放送局:
			<input type="text" name="broadCast" placeholder="放送局"  style="text-align: left;"><br>
			<input type="submit" value="検索" onClick="func('select');">
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
<%
	//String employee_id=request.getParameter("employee_id");
	//String employee_family_name=request.getParameter("employee_family_name");
	//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //テーブルの表示%>
<%if(contentsList != null){ %>
			<table width="400" border="1">
				<Tr>
					<Th>選択</Th>
					<Th>コンテンツID</Th>
					<Th>コンテンツ名</Th>
					<Th>放送局</Th>
				</Tr>
	<% for(int i = 0 ;i<contentsList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value=<%= contentsList.get(i).get("contentsId") %>></Th>
					<Th><%  out.print(contentsList.get(i).get("contentsId")); %></Th>
					<Th><%  out.print(contentsList.get(i).get("contentsName")); %></Th>
					<Th><%  out.print(contentsList.get(i).get("broadCast")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- 登録画面への遷移 --%>
		<input type="button" value="新規登録" onClick="form.action=location.href='../../hobbyManager/view/G0041View.jsp';return true">
		<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';return true">

	<% try{ %>
				<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
					<% if("1".equals(updateFlag)){ %>
						<H2><% out.print("更新が完了しました。"); %></H2>
						<% }else if("0".equals(updateFlag)){ %>
						<H2><% out.print("更新が失敗しました。"); %></H2>
						<% } %>
			<% }catch(NullPointerException updateException){ %>
			<% } %>
	</body>
</html>