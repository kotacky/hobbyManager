<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>コンテンツ一覧</title>
		<style>
			*{
				text-align : center;
			}
		</style>
		<script>
		 function func(MyCommand){
			 alert("start!:[" + MyCommand + "]");
			 document.MyForm.process.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- リストの取得 --%>
<%
		    HashMap<String,String> contentsList = new HashMap<String,String>();
				contentsList.put("contents_id", "401");
				contentsList.put("contents_name", "八重の桜");
				contentsList.put("summary", "大河ドラマ");
//List<HashMap<String,String>> contentsList = (List<HashMap<String,String>>)request.getAttribute("ContentsList");
String disabled = "disabled";
if(contentsList != null){
     disabled = "";
}
%>
		<h1>コンテンツ一覧</h1>
		<% //Cへ検索する条件を送る %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0040Control">
			コンテンツID:
			<input type="text" name="contents_id" placeholder="コンテンツID"  style="text-align: left;"><br>
			コンテンツ名:
			<input type="text" name="contents_name" placeholder="コンテンツ名"  style="text-align: left;"><br>
			概要:
			<input type="text" name="summary" placeholder="概要"  style="text-align: left;"><br>
			<input type=submit value="検索" onClick="func('select');">
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //テーブルの表示%>
<%if(contentsList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>選択</Th>
					<Th>コンテンツID</Th>
					<Th>コンテンツ名</Th>
					<Th>概要</Th>
				</Tr>
	<% for(int i = 0 ;i<contentsList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="id" value=<% contentsList./*get(i).*/get("contents_id"); %>></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("contents_id")); %></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("contents_name")); %></Th>
					<Th><%  out.print(contentsList./*get(i).*/get("summary")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="process">
		</form>

		<%-- 登録画面への遷移 --%>
		<input type=button value="新規登録" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0041View.jsp';return true">
		<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューへ" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>