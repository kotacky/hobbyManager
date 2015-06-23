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
	<h1>更新情報入力</h1>

	<%-- リストの取得 --%>
	<%
		//HashMap<String,String> EmployeeList = new HashMap<String,String>();
			//EmployeeList.put("employeeId", "122");
			//EmployeeList.put("employeeFamilyname", "金井");
			//EmployeeList.put("employeeFirstname", "才");
			//EmployeeList.put("birthDate", "19920811");
 	%>

<% List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList"); %>

<%-- ラジオボタンが押されていなかった場合 --%>
	<% try{ %>
	<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>

		社員ID:
		<input type="text" name="employeeId" readonly value=<% out.print(employeeList.get(0).get("employeeId")); %>><br>
		姓:
		<input type="text" name="employeeFamilyName" value=<% out.print(employeeList.get(0).get("employeeFamilyName")); %>><br>
		名:
		<input type="text" name="employeeFirstName" value=<% out.print(employeeList.get(0).get("employeeFirstName")); %>><br>
		生年月日:
		<input type="text" name="birthDate" value=<% out.print(employeeList.get(0).get("birthDate")); %>><br>
		<input type="submit" value="更新">
	>

	<% }catch(IndexOutOfBoundsException e){ %>
		<h2>ラジオボタンの選択が行われなかったためエラーが発生しました。</h2>
		<h2>メニュー画面へ戻ってください。</h2>

	<% } %>
	


	<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューヘ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	</body>
</html>