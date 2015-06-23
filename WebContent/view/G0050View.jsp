<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>好み一覧</title>
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
<%-- リストの取得 --%>
<%
		    //HashMap<String,String> preferenceList = new HashMap<String,String>();
					//preferenceList.put("employeeId","122");
					//preferenceList.put("employeeFamilyname", "金井");
					//preferenceList.put("employeeFirstname", "才");
					//preferenceList.put("actressName","綾瀬はるか");
					//preferenceList.put("contentsName","八重の桜");
List<HashMap<String,String>> preferenceList = (List<HashMap<String,String>>)request.getAttribute("PreferenceList");
String disabled = "disabled";
if(preferenceList != null){
     disabled = "";
}
%>
		<h1>好み一覧</h1>
		<% //Cへ検索する条件を送る %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0050Control">
			社員ID:
			<input type="text" name="employeeId" placeholder="社員ID"  style="text-align: left;"><br>
			姓:
			<input type="text" name="employeeFamilyName" placeholder="姓"  style="text-align: left;"><br>
			名:
			<input type="text" name="employeeFirstName" placeholder="名"  style="text-align: left;"><br>
			<input type=submit value="検索" onClick="func('select');">
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //テーブルの表示%>
<%if(preferenceList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>選択</Th>
					<Th>社員ID</Th>
					<Th>姓</Th>
					<Th>名</Th>
					<Th>女優名</Th>
					<Th>コンテンツ名</Th>
				</Tr>
	<% for(int i = 0 ;i<preferenceList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= preferenceList.get(i).get("employeeId")%>"></Th>
								<% if(i == 0){ %>
									<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
								<% }else if(preferenceList.get(i).get("employeeId") != preferenceList.get(i - 1).get("employeeId")){ %>
									<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
									<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
								<% }else{ %>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
								<% } %>
									<Th><% out.print(preferenceList.get(i).get("contentsName")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- 登録画面への遷移 --%>
		<input type=button value="新規登録" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0051View.jsp';return true">
		<%-- メニュー画面に戻る処理 --%>
		<input type=button value="メニューへ" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>