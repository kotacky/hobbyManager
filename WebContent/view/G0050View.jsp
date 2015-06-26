<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>新人BD - 好み一覧</title>
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
	<div id="header">
			<ul id="gNavi" class="clearfix">
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">好み一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">コンテンツ一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
			</ul>
		</div>
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


		<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
				<H2><% out.print("登録が完了しました。"); %></H2>
				<% }else if("0".equals(insertFlag)){ %>
				<H2><% out.print("登録が失敗しました。"); %></H2>
				<% } %>
		<% }catch(NullPointerException insertException){ %>
		<% } %>

<%-- リストの取得 --%>
<%
		    //HashMap<String,String> preferenceList = new HashMap<String,String>();
					//preferenceList.put("employeeId","122");
					//preferenceList.put("employeeFamilyname", "金井");
					//preferenceList.put("employeeFirstname", "才");
					//preferenceList.put("actressName","綾瀬はるか");
					//preferenceList.put("contentsName","八重の桜");
		List<HashMap<String,String>> preferenceList = (List<HashMap<String,String>>)request.getAttribute("preferenceList");
		String disabled = "disabled";
		if(preferenceList != null){
		     disabled = "";
		}
%>
		<h1>好み一覧</h1>
		<% //Cへ検索する条件を送る %>
		<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0050Control">
			社員ID:
			<input type="text" name="employeeId" placeholder="社員ID"  style="text-align: left;"><br>
			姓:
			<input type="text" name="employeeFamilyName" placeholder="姓"  style="text-align: left;"><br>
			名:
			<input type="text" name="employeeFirstName" placeholder="名"  style="text-align: left;"><br>
			<input type="submit" value="検索" onClick="func('select');">
			<input type="button" value="新規登録" onClick="func('insert');" />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />

<%
	//String employee_id=request.getParameter("employee_id");
	//String employee_family_name=request.getParameter("employee_family_name");
	//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //テーブルの表示 %>
<% if(preferenceList != null){ %>
			<table width="600" border="1">
				<Tr>
					<Th>選択</Th>
					<Th>社員ID</Th>
					<Th>姓</Th>
					<Th>名</Th>
					<Th>女優名</Th>
					<Th>出演作品</Th>
				</Tr>
	<% for(int i = 0 ;i<preferenceList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="radioButton" value="<%= preferenceList.get(i).get("employeeId")%>"></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeId")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeFamilyName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("employeeFirstName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("actressName")); %></Th>
					<Th><% out.print(preferenceList.get(i).get("contentsName")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="processDiv">
		</form>

		<%-- メニュー画面に戻る処理 --%>
		<input type="button" value="メニューへ" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';return true">
</body>
</html>