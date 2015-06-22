<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>所属会社一覧</title>
		<style>
			*{
				text-align : center;
			}
		</style>
		<script>
		 function func(MyCommand){
			 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- メッセージの表示 --%>

		<% try{ %>
			<% int insertFlag = Integer.parseInt(request.getParameter("insertFlag")); %>
			<% int updateFlag = Integer.parseInt(request.getParameter("updateFlag")); %>
			<% int deleteFlag = Integer.parseInt(request.getParameter("deletefFlag")); %>

				<% if(insertFlag == 1){ %>
				<H2><% out.print("登録が完了しました。"); %></H2>
				<% }else if(insertFlag == 0){ %>
				<H2><% out.print("登録が失敗しました。"); %></H2>
				<% }else if(updateFlag == 1){%>
				<H2><% out.print("更新が完了しました。"); %></H2>
				<% }else if(updateFlag == 0){ %>
				<H2><% out.print("更新が失敗しました。"); %></H2>
				<% }else if(deleteFlag == 1){ %>
				<H2><% out.print("削除が完了しました。"); %></H2>
				<% }else if(deleteFlag == 0){ %>
				<H2><% out.print("削除が失敗しました。"); %></H2>
				<% } %>
		<% }catch(NumberFormatException e){ %>
		<% } %>

<%-- リストの取得 --%>
<%
//HashMap<String,String> companyList = new HashMap<String,String>();
	//companyList.put("companyId", "301");
	//companyList.put("companyName", "ホリプロ");
	//companyList.put("companyAddress", "東京");
List<HashMap<String,String>> companyList = (List<HashMap<String,String>>)request.getAttribute("CompanyList");
String disabled = "disabled";
if(companyList != null){
     disabled = "";
}
%>
		<h1>所属会社一覧</h1>
		<% //Cへ検索する条件を送る %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0030Control">
			会社ID:
			<input type="text" name="companyId" placeholder="会社ID"  style="text-align: left;"><br>
			会社名:
			<input type="text" name="companyName" placeholder="会社名"  style="text-align: left;"><br>
			会社住所:
			<input type="text" name="companyAdress" placeholder="会社住所"  style="text-align: left;"><br>
			<input type=submit value="検索" onClick="func('select');">
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- テーブルの表示 --%>
<%if(companyList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>選択</Th>
					<Th>所属会社ID</Th>
					<Th>会社名</Th>
					<Th>住所</Th>
				</Tr>
	<% for(int i = 0 ;i<companyList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value=<% companyList.get(i).get("companyId"); %>></Th>
					<Th><%  out.print(companyList.get(i).get("companyId")); %></Th>
					<Th><%  out.print(companyList.get(i).get("companyName")); %></Th>
					<Th><%  out.print(companyList.get(i).get("companyAddress")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- 登録画面への遷移 --%>
		<input type=button value="新規登録" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0031View.jsp';return true">
		<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューへ" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>