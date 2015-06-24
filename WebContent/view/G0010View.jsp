<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>新人DB - 社員一覧</title>
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
			<input type="button" value="新規登録" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp'" />
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- テーブルの表示--%>
<% if(employeeList != null){ %>
			<table width="350" border="1">
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

		<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">

		<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
				<H2><% out.print("登録が完了しました。"); %></H2>
				<% }else if("0".equals(insertFlag)){ %>
				<H2><% out.print("登録が失敗しました。"); %></H2>
				<% } %>
		<% }catch(NullPointerException insertException){ %>
			<% try{ %>
				<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
					<% if("1".equals(updateFlag)){ %>
						<H2><% out.print("更新が完了しました。"); %></H2>
						<% }else if("0".equals(updateFlag)){ %>
						<H2><% out.print("更新が失敗しました。"); %></H2>
						<% } %>
			<% }catch(NullPointerException updateException){ %>
			<% } %>
		<% } %>
	</body>
</html>
