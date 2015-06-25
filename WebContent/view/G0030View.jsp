<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>所属会社一覧</title>
		<meta name="keywords" content="キーワード" />
		<meta name="description" content="サイトの説明" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
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
//HashMap<String,String> companyList = new HashMap<String,String>();
	//companyList.put("companyId", "301");
	//companyList.put("companyName", "ホリプロ");
	//companyList.put("companyAddress", "東京");
List<HashMap<String,String>> companyList = (List<HashMap<String,String>>)request.getAttribute("companyList");
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
			<input type="text" name="companyAddress" placeholder="会社住所"  style="text-align: left;"><br>
			<input type="submit" value="検索" onClick="func('select');">
			<input type="button" value="新規登録" onClick="form.action=location.href='../../hobbyManager/view/G0031View.jsp';">
			<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<%-- テーブルの表示 --%>
<%if(companyList != null){ %>
			<table width="400" border="1">
				<Tr>
					<Th>選択</Th>
					<Th>所属会社ID</Th>
					<Th>会社名</Th>
					<Th>住所</Th>
				</Tr>
	<% for(int i = 0 ;i<companyList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= companyList.get(i).get("companyId") %>"></Th>
					<Th><%  out.print(companyList.get(i).get("companyId")); %></Th>
					<Th><%  out.print(companyList.get(i).get("companyName")); %></Th>
					<Th><%  out.print(companyList.get(i).get("companyAddress")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>
		<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューへ" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">

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