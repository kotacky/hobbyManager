<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>新人DB - 社員一覧</title>
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
<%-- メッセージの表示 --%>

		<% try{ %>
			<% int insertFlag = Integer.parseInt(request.getParameter("insertFlag")); %>
				<% if(insertFlag == 1){ %>
				<H2><% out.print("更新が完了しました。"); %></H2>
				<% }else { %>
				<H2><% out.print("登録が失敗しました。"); %></H2>
				<% } %>
			<% int updateFlag = Integer.parseInt(request.getParameter("updateFlag")); %>
				<% if(updateFlag == 1){ %>
				<H2><% out.print("更新が完了しました。"); %></H2>
				<% }else { %>
				<H2><% out.print("更新が失敗しました。"); %></H2>
				<% } %>
			<% int deleteFlag = Integer.parseInt(request.getParameter("deletefFlag")); %>
				<% if(deleteFlag == 1){ %>
				<H2><% out.print("削除が完了しました。"); %></H2>
				<% }else { %>
				<H2><% out.print("削除が失敗しました。"); %></H2>
				<% } %>
		<% }catch(NumberFormatException e){ %>
		<% } %>

<%-- リストの取得 --%>
<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String disabled = "disabled";
if(employeeList != null){
     disabled = "";
}
%>

		<h1>社員一覧</h1>
		<%-- Cへ検索する条件を送る --%>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0010Control">
			社員ID:
			<input type="text" name="employeeId" placeholder="社員ID"  style="text-align: left;"><br>
			姓:
			<input type="text" name="employeeFamilyName" placeholder="姓"  style="text-align: left; "><br>
			名:
			<input type="text" name="employeeFirstName" placeholder="名"  style="text-align: left; "><br>
			<input type="button" value="検索" onClick="func('select');" />
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- テーブルの表示--%>
<% if(employeeList != null){ %>
			<table width="300" border="1" align="center">
				<Tr>
					<Th>選択</Th>
					<Th>社員ID</Th>
					<Th>姓</Th>
					<Th>名</Th>
					<Th>生年月日</Th>
				</Tr>
	<% for(int i = 0; i < employeeList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= employeeList.get(i).get("employeeId") %>"></Th>
					<Th><% out.print(employeeList.get(i).get("employeeId")); %></Th>
					<Th><% out.print(employeeList.get(i).get("employeeFamilyName")); %></Th>
					<Th><% out.print(employeeList.get(i).get("employeeFirstName")); %></Th>
					<Th><% out.print(employeeList.get(i).get("birthDate")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- 登録画面への遷移 --%>
		<input type=button value="新規登録" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp'">
		<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>
