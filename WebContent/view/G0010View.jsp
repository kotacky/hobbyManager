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
	<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
	<script>
		 function func(myCommand){
		//	 alert("start!:[" + myCommand + "]");
			 document.myForm.process.value=myCommand;
			 document.myForm.submit();
		 }

		function init() {
			if (document.myForm.employeeId.value == null) {
				document.myForm.employeeId.value = "";
			}
			if (document.myForm.employeeFamilyName.value == null) {
				document.myForm.employeeFamilyName.value = "";
			}
			if (document.myForm.employeeFirstName.value == null) {
				document.myForm.employeeFirstName.value = "";
			}
		}
	 </script>
</head>

<body onload="init();">
	<div id="header">
				<ul id="gMenu" class="clearfix">
					  <li><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">トップ</a></li>
					  <li><a>基本メニュー</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
					    </ul>
					  </li>
					  <li><a>女優コンテンツ</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
					    </ul>
					  </li>
					  <li><a>所属・出演</a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
					      <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
					    </ul>
					  </li>
					  <li><a><% out.print(session.getAttribute("employeeFirstName")); %></a>
					    <ul>
					      <li><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
					    </ul>
					  </li>
				</ul>
	</div>

<%-- リストの取得 --%>
		<h1>社員一覧</h1>

<%-- メッセージの表示 --%>

		<% try{ %>
			<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
			<% if("1".equals(deleteFlag)){ %>
			<h2><% out.print("削除が完了しました。"); %></h2>
			<% }else if("0".equals(deleteFlag)){ %>
			<h2><% out.print("削除が失敗しました。"); %></h2>
			<% } %>
		<% }catch(NullPointerException deleteException){ %>
		<% } %>


		<% try{ %>
			<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
			<% if("1".equals(insertFlag)){ %>
			<h2><% out.print("登録が完了しました。"); %></h2>
			<% }else if("0".equals(insertFlag)){ %>
			<h2><% out.print("登録が失敗しました。"); %></h2>
			<% }else if("2".equals(insertFlag)){ %>
			<h2><% out.print("既に登録されています。"); %></h2>
			<% } %>
		<% }catch(NullPointerException insertException){ %>
		<% } %>

		<% try{ %>
			<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
			<h2><% out.print("更新が完了しました。"); %></h2>
			<% }else if("0".equals(updateFlag)){ %>
			<h2><% out.print("更新が失敗しました。"); %></h2>
			<% } %>
		<% }catch(NullPointerException updateException){ %>
		<% } %>

<%-- リストの取得 --%>

<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String message = (String)request.getAttribute("message");
String updateDisabled = "disabled";
String createDisabled = "disabled";
String disabled = "disabled";%>
<% try{ %>
<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
<% if((employeeList != null) && ("00".equals(employeeAuthority))){%>
	<% disabled = "";%>
<% } %>
<% if(employeeList != null){%>
	<% updateDisabled = "";%>
<% } %>
<% if("00".equals(employeeAuthority)){%>
	<% createDisabled = "";%>
<% } %>
<% }catch(NullPointerException deleteException){ %>
<% } %>
<%if (message == null) {
		message = "";
	}%>

<%-- Cへ検索する条件を送る --%>
		<form method="POST" name=myForm action="<%= request.getContextPath() %>/G0010Control">
			社員ID:
			<input type="text" id="employeeId" name="employeeId" placeholder="社員ID"  style="text-align: left;">
			姓:
			<input type="text" id="employeeFamilyName" name="employeeFamilyName" placeholder="姓"  style="text-align: left; ">
			<div>
			名:
			<input type="text" id="employeeFirstName" name="employeeFirstName" placeholder="名"  style="text-align: left; ">
			</div>
			<input type="button" value="検索" onClick="func('select');" /><br />
			<input type="button" value="新規登録" onClick="form.action=location.href='../../hobbyManager/view/G0011View.jsp';" <%= createDisabled %>/>
			<input type="button" value="更新" onClick="func('update');" <%= updateDisabled %> />
			<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
			<div style="color:red;"><%= message %>

			<%-- テーブルの表示--%>
			<table class="brwsr1">
				<thead class="scrollHead">
					<tr>
						<Th class="r0">選択</Th>
						<Th class="r1">社員ID</Th>
						<Th class="r2">姓</Th>
						<Th class="r3">名</Th>
						<Th class="r4">生年月日</Th>
					</tr>
				</thead>
				<tbody class="scrollBody">
<% if(employeeList != null){ %>
	<% for(int i = 0; i < employeeList.size(); i++){ %>
						<Tr>
							<Th class="r0"><input type="radio" name="radioButton" value="<%= employeeList.get(i).get("employeeId") %>"></Th>
							<Td class="r1"><% out.print(employeeList.get(i).get("employeeId")); %></Td>
							<Td class="r2"><% out.print(employeeList.get(i).get("employeeFamilyName")); %></Td>
							<Td class="r3"><% out.print(employeeList.get(i).get("employeeFirstName")); %></Td>
							<Td class="r4"><% out.print(employeeList.get(i).get("employeeBirthDate")); %></Td>
						</Tr>
	<% } %>
<% } %>
				</tbody>
			</table>
			<input type="hidden" name="process">
			<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
		</form>
		<div id="footer">
			<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
		</div>
</body>
</html>
